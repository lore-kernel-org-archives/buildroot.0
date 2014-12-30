From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 12:41:07 +0100
Subject: [Buildroot] [PATCH v6 3/3] support/download: silence git if it is a
	silent build
In-Reply-To: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419939667-27095-4-git-send-email-fabio.porcedda@gmail.com>
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
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  2 +-
 support/download/git        | 27 +++++++++++++++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 88d1437..37cf4b6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -88,6 +88,7 @@ define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 7cd8606..e84a757 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -48,7 +48,7 @@ main() {
         error "no hash-file specified, use -H\n"
     fi
 
-    if [ "${backend}" != "svn" ]; then
+    if [ ! \( "${backend}" == "git" -o "${backend}" == "svn" \) ]; then
 	quiet=
     fi
 
diff --git a/support/download/git b/support/download/git
index 5d36ca4..b6ebfdc 100755
--- a/support/download/git
+++ b/support/download/git
@@ -4,6 +4,8 @@
 set -e
 
 # Download helper for git, to be called from the download wrapper script
+# Optional arguments:
+#   "-q": quiet flag
 # Expected arguments:
 #   $1: output file
 #   $2: git repo
@@ -12,6 +14,19 @@ set -e
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
@@ -21,16 +36,20 @@ basename="${4}"
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
