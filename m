From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 12:41:06 +0100
Subject: [Buildroot] [PATCH v6 2/3] support/download: silence svn if it is a
	silent build
In-Reply-To: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419939667-27095-3-git-send-email-fabio.porcedda@gmail.com>
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
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper | 11 ++++++++---
 support/download/svn        | 17 ++++++++++++++++-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ba72fc1..88d1437 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -147,6 +147,7 @@ define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index cced8f6..7cd8606 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,15 +21,16 @@ set -e
 
 main() {
     local OPT OPTARG
-    local backend output hfile
+    local backend output hfile quiet
 
     # Parse our options; anything after '--' is for the backend
-    while getopts :hb:o:H: OPT; do
+    while getopts :hb:o:H:q OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         b)  backend="${OPTARG}";;
         o)  output="${OPTARG}";;
         H)  hfile="${OPTARG}";;
+        q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
@@ -47,6 +48,10 @@ main() {
         error "no hash-file specified, use -H\n"
     fi
 
+    if [ "${backend}" != "svn" ]; then
+	quiet=
+    fi
+
     # If the output file already exists, do not download it again
     if [ -e "${output}" ]; then
         if support/download/check-hash "${hfile}" "${output}" "${output##*/}"; then
@@ -75,7 +80,7 @@ main() {
     # If the backend fails, we can just remove the temporary directory to
     # remove all the cruft it may have left behind. Then we just exit in
     # error too.
-    if ! "${OLDPWD}/support/download/${backend}" "${tmpf}" "${@}"; then
+    if ! "${OLDPWD}/support/download/${backend}" ${quiet} "${tmpf}" "${@}"; then
         rm -rf "${tmpd}"
         exit 1
     fi
diff --git a/support/download/svn b/support/download/svn
index a960f7d..90470dd 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -4,6 +4,8 @@
 set -e
 
 # Download helper for svn, to be called from the download wrapper script
+# Optional arguments:
+#   "-q": quiet flag
 # Expected arguments:
 #   $1: output file
 #   $2: svn repo
@@ -12,11 +14,24 @@ set -e
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
