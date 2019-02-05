From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 21:24:33 +0100
Subject: [Buildroot] [TO-BE-TESTED] support/download/hg: implement
 repository cache
Message-ID: <20190205202433.25292-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Similar to the git download helper, implement a repository cache for
Mercurial repositories.

The code is mostly guided by the implementation for git, with certain parts
copied almost verbatim.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/hg | 81 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 3 deletions(-)

Note: this patch only got limited testing so far and needs to be tested further.
But I already wanted to send it out for feedback and for those of you that want
to help test it.


diff --git a/support/download/hg b/support/download/hg
index efb515fca5..bb5cc87969 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
-set -e
+set -E
 
 # Download helper for hg, to be called from the download wrapper script
 #
@@ -10,11 +10,39 @@ set -e
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
+#   -d DLDIR    Download directory path.
 #   -n NAME     Use basename NAME.
 #
 # Environment:
 #   HG       : the hg command to call
 
+# Save our path and options in case we need to call ourselves again
+myname="${0}"
+declare -a OPTS=("${@}")
+
+# This function is called when an error occurs. Its job is to attempt a clone
+# from scratch (only once!) in case the hg tree is borked, or in case an
+# unexpected and unsupported situation arises with uncommitted stuff (e.g. if
+# the user manually mucked around in the hg cache).
+# Note that this function would also be triggered by connection errors during
+# the clone/pull.
+_on_error() {
+    local ret=${?}
+
+    printf "Detected a possibly corrupted hg cache.\n" >&2
+    if ${BR_HG_BACKEND_FIRST_FAULT:-false}; then
+        printf "This is the second time in a row; bailing out\n" >&2
+        exit ${ret}
+    fi
+    export BR_HG_BACKEND_FIRST_FAULT=true
+
+    printf "Removing it and starting afresh.\n" >&2
+
+    rm -rf "${hg_cache}"
+
+    exec "${myname}" "${OPTS[@]}" || exit ${ret}
+}
+
 verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
@@ -22,6 +50,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
+    d)  dl_dir="${OPTARG}";;
     n)  basename="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
@@ -36,8 +65,54 @@ _hg() {
     eval ${HG} "${@}"
 }
 
-_hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
+# Create and cd into the directory that will contain the local hg cache
+hg_cache="${dl_dir}/hg"
+mkdir -p "${hg_cache}"
+
+# Any error now should try to recover
+trap _on_error ERR
+
+# Create a warning file, that the user should not use the hg cache.
+# It's ours. Our precious.
+cat <<-_EOF_ >"${dl_dir}/hg.readme"
+	IMPORTANT NOTE!
+
+	The hg tree located in this directory is for the exclusive use
+	by Buildroot, which uses it as a local cache to reduce bandwidth
+	usage.
+
+	Buildroot *will* trash any changes in that tree whenever it needs
+	to use it. Buildroot may even remove it in case it detects the
+	repository may have been damaged or corrupted.
+
+	Do *not* work in that directory; your changes will eventually get
+	lost. Do *not* even use it as a remote, or as the source for new
+	worktrees; your commits will eventually get lost.
+_EOF_
+
+if ! [ -d "${hg_cache}/.hg" ]; then
+    # While it would be possible to create an empty repo and use pull
+    # subsequently, we intentionally use clone the first time as it could be
+    # faster than pull thanks to clonebundles, if enabled on the server.
+    printf "Cloning repository from '${uri}' into '${hg_cache}'\n"
+    _hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${hg_cache}'"
+else
+    printf "Pulling repository from '${uri}' into '${hg_cache}'\n"
+    _hg pull ${verbose} "${@}" --repository "'${hg_cache}'" "'${uri}'"
+fi
+
+# Check that the changeset does exist. If it does not, re-cloning from
+# scratch won't help, so we don't want to trash the repository for a
+# missing commit. We just exit without going through the ERR trap.
+if ! _hg identify --repository "'${hg_cache}'" --rev "'${cset}'" >/dev/null 2>&1; then
+    printf "Commit '%s' does not exist in this repository\n." "${cset}"
+    exit 1
+fi
+
+# Make sure that there is no working directory. This will clear any user
+# temptation to work in this directory.
+_hg update --repository "'${hg_cache}'" null >/dev/null 2>&1
 
-_hg archive ${verbose} --repository "'${basename}'" --type tgz \
+_hg archive ${verbose} --repository "'${hg_cache}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
             - >"${output}"
-- 
2.19.2
