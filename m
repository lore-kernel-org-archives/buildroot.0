From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 14:58:39 +0100
Subject: [Buildroot] [PATCH v7 3/4] support/download: silence svn if it is a
	silent build
In-Reply-To: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419947920-22047-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If it is a silent build (make -s -> QUIET=-q) silence the svn download
helper using "svn -q" just like others download helpers, e.g. wget.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---

Notes:
    v7:
     - use "backend_quiet" instead of "quiet" in the dl-wrapper
    v6:
      - Use QUIET instead of BR_QUIET
    v5:
      - Use getopts
    
    v4:
      - Instead of changing the "SVN" variable pass the "-q" option to the
        download helper (Thomas P.)
    v3:
      - Add this patch

 support/download/dl-wrapper |  8 ++++++--
 support/download/svn        | 20 ++++++++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 337fc48..e9002fb 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,7 +21,7 @@ set -e
 
 main() {
     local OPT OPTARG
-    local backend output hfile quiet
+    local backend output hfile quiet backend_quiet
 
     # Parse our options; anything after '--' is for the backend
     while getopts :hb:o:H:q OPT; do
@@ -48,6 +48,10 @@ main() {
         error "no hash-file specified, use -H\n"
     fi
 
+    if [ "${backend}" == "svn" ]; then
+	backend_quiet=${quiet}
+    fi
+
     # If the output file already exists, do not download it again
     if [ -e "${output}" ]; then
         if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
@@ -76,7 +80,7 @@ main() {
     # If the backend fails, we can just remove the temporary directory to
     # remove all the cruft it may have left behind. Then we just exit in
     # error too.
-    if ! "${OLDPWD}/support/download/${backend}" "${tmpf}" "${@}"; then
+    if ! "${OLDPWD}/support/download/${backend}" ${backend_quiet} "${tmpf}" "${@}"; then
         rm -rf "${tmpd}"
         exit 1
     fi
diff --git a/support/download/svn b/support/download/svn
index a960f7d..4873219 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -4,7 +4,10 @@
 set -e
 
 # Download helper for svn, to be called from the download wrapper script
-# Expected arguments:
+#
+# Optional arguments:
+#   "-q": quiet flag
+# Required arguments:
 #   $1: output file
 #   $2: svn repo
 #   $3: svn revision
@@ -12,11 +15,24 @@ set -e
 # And this environment:
 #   SVN      : the svn command to call
 
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
 rev="${3}"
 basename="${4}"
 
-${SVN} export "${repo}@${rev}" "${basename}"
+${SVN} ${quiet} export "${repo}@${rev}" "${basename}"
 
 tar czf "${output}" "${basename}"
-- 
2.1.0
