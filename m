From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Dec 2014 00:24:08 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-download: verify the hashes from the
	download wrapper
In-Reply-To: <cover.1417475935.git.yann.morin.1998@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
Message-ID: <eb25ccfd009955fcd6be60822a8c22985aca199d.1417475935.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of repeating the check in our download rules, delegate the check
of the hashes to the download wrapper.

This needs three different changes:

  - add a new argument to the download wrapper, that is the full path to
    the hash file; if the hash file does not exist, that does not change
    the current behaviour, as the existence of the hash file is done by
    the check-hash script;

  - add a third argument to the check-hash script, to be the basename of
    the file to check; this is required because we no longer check the
    final file with the finale filename, but anintermediate file with a
    temporary filename;

  - do the actual cal to the check-hash script form within the download
    wrapper.

This further paves the way to doing pre-download checks of the hashes
for the locally cached files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-download.mk     | 28 +++++++++++-----------------
 support/download/check-hash | 14 ++++++++------
 support/download/wrapper    | 11 ++++++++++-
 3 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f6ceadb..c10430f 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -58,17 +58,6 @@ domainseparator = $(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
-# Helper for checking a tarball's checksum
-# If the hash does not match, remove the incorrect file
-# $(1): the path to the file with the hashes
-# $(2): the full path to the file to check
-define VERIFY_HASH
-	if ! support/download/check-hash $(1) $(2) $(if $(QUIET),>/dev/null); then \
-		rm -f $(2); \
-		exit 1; \
-	fi
-endef
-
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
@@ -96,6 +85,7 @@ endef
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) support/download/wrapper git \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(PKGDIR)/$($(PKG)_NAME).hash \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -115,6 +105,7 @@ endef
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) support/download/wrapper bzr \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(PKGDIR)/$($(PKG)_NAME).hash \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -131,6 +122,7 @@ endef
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) support/download/wrapper cvs \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(PKGDIR)/$($(PKG)_NAME).hash \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_RAWNAME) \
@@ -149,6 +141,7 @@ endef
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) support/download/wrapper svn \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(PKGDIR)/$($(PKG)_NAME).hash \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -168,8 +161,8 @@ endef
 define DOWNLOAD_SCP
 	$(EXTRA_ENV) support/download/wrapper scp \
 		$(DL_DIR)/$(2) \
-		'$(call stripurischeme,$(call qstrip,$(1)))' && \
-	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
+		$(PKGDIR)/$($(PKG)_NAME).hash \
+		'$(call stripurischeme,$(call qstrip,$(1)))'
 endef
 
 define SOURCE_CHECK_SCP
@@ -184,6 +177,7 @@ endef
 define DOWNLOAD_HG
 	$(EXTRA_ENV) support/download/wrapper hg \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(PKGDIR)/$($(PKG)_NAME).hash \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -203,8 +197,8 @@ endef
 define DOWNLOAD_WGET
 	$(EXTRA_ENV) support/download/wrapper wget \
 		$(DL_DIR)/$(2) \
-		'$(call qstrip,$(1))' && \
-	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
+		$(PKGDIR)/$($(PKG)_NAME).hash \
+		'$(call qstrip,$(1))'
 endef
 
 define SOURCE_CHECK_WGET
@@ -218,8 +212,8 @@ endef
 define DOWNLOAD_LOCALFILES
 	$(EXTRA_ENV) support/download/wrapper cp \
 		$(DL_DIR)/$(2) \
-		$(call stripurischeme,$(call qstrip,$(1))) && \
-	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
+		$(PKGDIR)/$($(PKG)_NAME).hash \
+		$(call stripurischeme,$(call qstrip,$(1)))
 endef
 
 define SOURCE_CHECK_LOCALFILES
diff --git a/support/download/check-hash b/support/download/check-hash
index 13e361a..b41a87e 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -5,9 +5,11 @@ set -e
 # Call it with:
 #   $1: the path of the file containing all the the expected hashes
 #   $2: the full path to the file to check
+#   $3: the basename of the file to check
 
 h_file="${1}"
 file="${2}"
+base="${3}"
 
 # Does the hash-file exist?
 if [ ! -f "${h_file}" ]; then
@@ -30,7 +32,7 @@ check_one_hash() {
         sha224|sha256|sha384|sha512)    ;;
         *) # Unknown hash, exit with error
             printf "ERROR: unknown hash '%s' for '%s'\n"  \
-                   "${_h}" "${_file##*/}" >&2
+                   "${_h}" "${base}" >&2
             exit 1
             ;;
     esac
@@ -38,11 +40,11 @@ check_one_hash() {
     # Do the hashes match?
     _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
     if [ "${_hash}" = "${_known}" ]; then
-        printf "%s: OK (%s: %s)\n" "${_file##*/}" "${_h}" "${_hash}"
+        printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
         return 0
     fi
 
-    printf "ERROR: %s has wrong %s hash:\n" "${_file##*/}" "${_h}" >&2
+    printf "ERROR: %s has wrong %s hash:\n" "${base}" "${_h}" >&2
     printf "ERROR: expected: %s\n" "${_known}" >&2
     printf "ERROR: got     : %s\n" "${_hash}" >&2
     printf "ERROR: Incomplete download, or man-in-the-middle (MITM) attack\n" >&2
@@ -59,7 +61,7 @@ while read t h f; do
             continue
             ;;
         *)
-            if [ "${f}" = "${file##*/}" ]; then
+            if [ "${f}" = "${base}" ]; then
                 check_one_hash "${t}" "${h}" "${file}"
                 : $((nb_checks++))
             fi
@@ -69,9 +71,9 @@ done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
     if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
-        printf "ERROR: No hash found for %s\n" "${file}" >&2
+        printf "ERROR: No hash found for %s\n" "${base}" >&2
         exit 1
     else
-        printf "WARNING: No hash found for %s\n" "${file}" >&2
+        printf "WARNING: No hash found for %s\n" "${base}" >&2
     fi
 fi
diff --git a/support/download/wrapper b/support/download/wrapper
index e3ab3a1..2f0f016 100755
--- a/support/download/wrapper
+++ b/support/download/wrapper
@@ -8,6 +8,7 @@
 # Call it with:
 #   $1: name of the helper (eg. cvs, git, cp...)
 #   $2: full path to the file in which to save the download
+#   $3: full path to the hash file
 #   $*: additional arguments to the helper in $1
 # Environment:
 #   BUILD_DIR: the path to Buildroot's build dir
@@ -26,7 +27,8 @@ set -e
 
 helper="${1}"
 output="${2}"
-shift 2
+hfile="${3}"
+shift 3
 
 # If the output file already exists, do not download it again
 if [ -e "${output}" ]; then
@@ -60,6 +62,13 @@ fi
 # cd back to free the temp-dir, so we can remove it later
 cd "${OLDPWD}"
 
+# Check if the downloaded file is sane, and matches the stored hashes
+# for that file
+if ! support/download/check-hash "${hfile}" "${tmpf}" "${output##*/}"; then
+    rm -rf "${tmpd}"
+    exit 1
+fi
+
 # tmp_output is in the same directory as the final output, so we can
 # later move it atomically.
 tmp_output="$( mktemp "${output}.XXXXXX" )"
-- 
1.9.1
