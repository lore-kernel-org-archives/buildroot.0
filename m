From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:23 +0100
Subject: [Buildroot] [PATCH 08/11] support/download: implement source-check
 in git backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-9-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The implementation is the same as originally was present.
It suffers from the disadvantage that an invalid revision on a valid URL
will not be detected.

However, git does not seem to allow a good way to remotely check the
validity of a revision, without cloning the repository.

For source-check, we don't want to do such download which can be large.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/git | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/support/download/git b/support/download/git
index 17ca04eb98..54f3494c61 100755
--- a/support/download/git
+++ b/support/download/git
@@ -7,6 +7,7 @@ set -E
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the changeset exists in the remote repository
 #   -r          Clone and archive sub-modules.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
@@ -48,6 +49,7 @@ recurse=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
+    C)  checkonly=1;;
     r)  recurse=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -61,6 +63,20 @@ done
 
 shift $((OPTIND-1)) # Get rid of our options
 
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_git() {
+    eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
+}
+
+if [ -n "${checkonly}" ]; then
+    # TODO this check only checks that the remote repository exists, not that
+    # it actually contains the requested revision. And for checkonly, we want
+    # to avoid creating a clone first.
+    _git ls-remote --heads "${@}" "'${uri}'" > /dev/null
+    exit ${?}
+fi
+
 # Create and cd into the directory that will contain the local git cache
 git_cache="${dl_dir}/git"
 mkdir -p "${git_cache}"
@@ -69,12 +85,6 @@ pushd "${git_cache}" >/dev/null
 # Any error now should try to recover
 trap _on_error ERR
 
-# Caller needs to single-quote its arguments to prevent them from
-# being expanded a second time (in case there are spaces in them)
-_git() {
-    eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
-}
-
 # Create a warning file, that the user should not use the git cache.
 # It's ours. Our precious.
 cat <<-_EOF_ >"${dl_dir}/git.readme"
-- 
2.18.1
