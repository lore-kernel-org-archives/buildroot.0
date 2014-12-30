From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 14:58:40 +0100
Subject: [Buildroot] [PATCH v7 4/4] support/download: silence git if it is a
	silent build
In-Reply-To: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419947920-22047-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If it is a silent build (make -s -> QUIET=-q) silence the git download
helper using "git clone -q" just like others download helpers,
e.g. wget.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    Notes:
    v7:
     - Use "backend_quiet" instead of "quiet" in the dl-wrapper
    v6:
     - Use QUIET instead of BR_QUIET
    v5:
     - Use getopts
    v3:
     - Add this patch

 support/download/dl-wrapper |  2 +-
 support/download/git        | 30 +++++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index e9002fb..5850a1d 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -48,7 +48,7 @@ main() {
         error "no hash-file specified, use -H\n"
     fi
 
-    if [ "${backend}" == "svn" ]; then
+    if [ "${backend}" == "git" -o "${backend}" == "svn" ]; then
 	backend_quiet=${quiet}
     fi
 
diff --git a/support/download/git b/support/download/git
index 5d36ca4..f068c63 100755
--- a/support/download/git
+++ b/support/download/git
@@ -4,7 +4,10 @@
 set -e
 
 # Download helper for git, to be called from the download wrapper script
-# Expected arguments:
+#
+# Optional arguments:
+#   "-q": quiet flag
+# Required arguments:
 #   $1: output file
 #   $2: git repo
 #   $3: git cset
@@ -12,6 +15,19 @@ set -e
 # And this environment:
 #   GIT      : the git command to call
 
+quiet=
+while getopts "q" opt; do
+    case $opt in
+	q)
+	    quiet=-q
+	    ;;
+	\?)
+	    exit 1
+	    ;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 repo="${2}"
 cset="${3}"
@@ -21,16 +37,20 @@ basename="${4}"
 # than a full clone.
 git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
-    printf "Doing shallow clone\n"
-    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
+    if [ -z "${quiet}" ]; then
+	printf "Doing shallow clone\n";
+    fi
+    if ${GIT} clone ${quiet} --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
     fi
 fi
 if [ ${git_done} -eq 0 ]; then
-    printf "Doing full clone\n"
-    ${GIT} clone --bare "${repo}" "${basename}"
+    if [ -z "${quiet}" ]; then
+	printf "Doing full clone\n";
+    fi
+    ${GIT} clone ${quiet} --bare "${repo}" "${basename}"
 fi
 
 GIT_DIR="${basename}" \
-- 
2.1.0
