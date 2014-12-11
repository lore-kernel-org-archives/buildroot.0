From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 19:24:47 +0100
Subject: [Buildroot] [PATCH 3/4 v4] pkg-download: verify the hashes from the
	download wrapper
In-Reply-To: <cover.1418322200.git.yann.morin.1998@free.fr>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
Message-ID: <d0dd46117de298b684c5fc90f5e4efe0d160d3b7.1418322200.git.yann.morin.1998@free.fr>
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
    the current behaviour, as the existence of the hash file is checked
    for in the check-hash script;

  - add a third argument to the check-hash script, to be the basename of
    the file to check; this is required because we no longer check the
    final file with the final filename, but an intermediate file with a
    temporary filename;

  - do the actual call to the check-hash script from within the download
    wrapper.

This further paves the way to doing pre-download checks of the hashes
for the locally cached files.

Note: this patch removes the check for hashes for already downloaded
files, since the wrapper script exits early. The behaviour to check
localy cached files will be restored and enhanced in the following
patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-download.mk     | 28 +++++++++++-----------------
 support/download/check-hash | 14 ++++++++------
 support/download/dl-wrapper | 22 +++++++++++++++++++---
 3 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c021e92..ba72fc1 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -60,17 +60,6 @@ domainseparator = $(if $(1),$(1),/)
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
@@ -98,6 +87,7 @@ endef
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -118,6 +108,7 @@ endef
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -135,6 +126,7 @@ endef
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
@@ -154,6 +146,7 @@ endef
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -174,9 +167,9 @@ endef
 define DOWNLOAD_SCP
 	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
 		-o $(DL_DIR)/$(2) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
-		'$(call stripurischeme,$(call qstrip,$(1)))' && \
-	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
+		'$(call stripurischeme,$(call qstrip,$(1)))'
 endef
 
 define SOURCE_CHECK_SCP
@@ -191,6 +184,7 @@ endef
 define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -211,9 +205,9 @@ endef
 define DOWNLOAD_WGET
 	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
 		-o $(DL_DIR)/$(2) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
-		'$(call qstrip,$(1))' && \
-	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
+		'$(call qstrip,$(1))'
 endef
 
 define SOURCE_CHECK_WGET
@@ -227,9 +221,9 @@ endef
 define DOWNLOAD_LOCALFILES
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
 		-o $(DL_DIR)/$(2) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
-		$(call stripurischeme,$(call qstrip,$(1))) && \
-	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
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
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 8713424..fdb49db 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -8,6 +8,7 @@
 # Call it with:
 #   -b BACKEND  name of the backend (eg. cvs, git, cp...)
 #   -o FILE     full path to the file in which to save the download
+#   -H FILE     full path to the hash file
 #   --          everything after '--' are options for the backend
 # Environment:
 #   BUILD_DIR: the path to Buildroot's build dir
@@ -26,15 +27,16 @@ set -e
 
 main() {
     local OPT OPTARG
-    local backend output
+    local backend output hfile
 
     # Parse our options; anythong after '--' is for the backend
     # Sop we only care to -b (backend) and -o (output file)
-    while getopts :hb:o: OPT; do
+    while getopts :hb:o:H: OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         b)  backend="${OPTARG}";;
         o)  output="${OPTARG}";;
+        H)  hfile="${OPTARG}";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
@@ -48,6 +50,9 @@ main() {
     if [ -z "${output}" ]; then
         error "no output specified, use -o\n"
     fi
+    if [ -z "${hfile}" ]; then
+        error "no hash-file specified, use -H\n"
+    fi
 
     # If the output file already exists, do not download it again
     if [ -e "${output}" ]; then
@@ -81,6 +86,13 @@ main() {
     # cd back to free the temp-dir, so we can remove it later
     cd "${OLDPWD}"
 
+    # Check if the downloaded file is sane, and matches the stored hashes
+    # for that file
+    if ! support/download/check-hash "${hfile}" "${tmpf}" "${output##*/}"; then
+        rm -rf "${tmpd}"
+        exit 1
+    fi
+
     # tmp_output is in the same directory as the final output, so we can
     # later move it atomically.
     tmp_output="$( mktemp "${output}.XXXXXX" )"
@@ -147,7 +159,7 @@ DESCRIPTION
             bzr     Bazaar
             cp      local files via simple copy
             cvs     Concurrent Versions System
-            git     git
+            git     Git
             hg      Mercurial
             scp     remote files via Secure copy
             svn     Subversion
@@ -156,6 +168,10 @@ DESCRIPTION
     -o FILE
         Store the downloaded archive in FILE.
 
+    -H FILE
+        Use FILE to read hashes from, and check them against the downloaded
+        archive.
+
   Exit status:
     0   if OK
     !0  in case of error
-- 
1.9.1
