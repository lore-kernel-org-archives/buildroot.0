From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:52:53 +0200
Subject: [Buildroot] [git commit] download: git: introduce cache feature
Message-ID: <20180402155911.5342D82541@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d938bcb524987f3e4a56fc311692ba9127417d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now we keep the git clone that we download and generates our tarball
from there.
The main goal here is that if you change the version of a package (say
Linux), instead of cloning all over again, you will simply 'git fetch'
from the repo the missing objects, then generates the tarball again.

This should speed the 'source' part of the build significantly.

The drawback is that the DL_DIR will grow much larger; but time is more
important than disk space nowadays.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 65 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/support/download/git b/support/download/git
index 58a2c6ad9d..58dbcd211c 100755
--- a/support/download/git
+++ b/support/download/git
@@ -25,6 +25,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
+    d)  dl_dir="${OPTARG}";;
     n)  basename="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
@@ -39,29 +40,41 @@ _git() {
     eval ${GIT} "${@}"
 }
 
-# Try a shallow clone, since it is faster than a full clone - but that only
-# works if the version is a ref (tag or branch). Before trying to do a shallow
-# clone we check if ${cset} is in the list provided by git ls-remote. If not
-# we fall back on a full clone.
+# We want to check if a cache of the git clone of this repo already exists.
+git_cache="${dl_dir}/git"
+
+# If the cache directory doesn't exists, init a new repo, which will be
+# fetch'ed later.
+if [ ! -d "${git_cache}" ]; then
+    _git init "'${git_cache}'"
+    _git -C "'${git_cache}'" remote add origin "'${uri}'"
+fi
+
+pushd "${git_cache}" >/dev/null
+
+_git remote set-url origin "'${uri}'"
+
+# Try to fetch with limited depth, since it is faster than a full clone - but
+# that only works if the version is a ref (tag or branch). Before trying to do
+# a shallow clone we check if ${cset} is in the list provided by git ls-remote.
+# If not we fallback to a full fetch.
 #
-# Messages for the type of clone used are provided to ease debugging in case of
-# problems
+# Messages for the type of clone used are provided to ease debugging in
+# case of problems
 git_done=0
-if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
-    printf "Doing shallow clone\n"
-    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${basename}'"; then
+if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
+    printf "Doing a shallow fetch\n"
+    if _git fetch "${@}" --depth 1 origin "'${cset}'"; then
         git_done=1
     else
-        printf "Shallow clone failed, falling back to doing a full clone\n"
+        printf "Shallow fetch failed, falling back to fetching all refs\n"
     fi
 fi
 if [ ${git_done} -eq 0 ]; then
-    printf "Doing full clone\n"
-    _git clone ${verbose} "${@}" "'${uri}'" "'${basename}'"
+    printf "Fetching all references\n"
+    _git fetch origin -t
 fi
 
-pushd "${basename}" >/dev/null
-
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
 # the cset the user passed us is such a special ref or a tag or a sha1
@@ -86,20 +99,24 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# We do not want the .git dir; we keep other .git files, in case they
-# are the only files in their directory.
+# Generate the archive, sort with the C locale so that it is reproducible.
+# We do not want the .git dir; we keep other .git files, in case they are the
+# only files in their directory.
 # The .git dir would generate non reproducible tarballs as it depends on
 # the state of the remote server. It also would generate large tarballs
 # (gigabytes for some linux trees) when a full clone took place.
-rm -rf .git
+find . -not -type d \
+	-and -not -path "./.git/*" >"${output}.list"
+LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
-popd >/dev/null
-
-# Generate the archive, sort with the C locale so that it is reproducible
-find "${basename}" -not -type d >"${basename}.list"
-LC_ALL=C sort <"${basename}.list" >"${basename}.list.sorted"
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
-         -T "${basename}.list.sorted" >"${output}.tar"
+tar cf - --transform="s/^\.$/${basename}/" \
+	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
+         -T "${output}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
+
+rm -f "${output}.list"
+rm -f "${output}.list.sorted"
+
+popd >/dev/null
