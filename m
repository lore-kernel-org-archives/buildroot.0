From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:30 +0200
Subject: [Buildroot] [PATCH 12/14] pkg-infra: add possiblity to check
	downloaded files against known hashes
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <851f7ea39c778965d1e46bf6cabb723265d34eaf.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the packages that Buildroot might build are sensitive packages,
related to security: openssl, dropbear, ca-certificates...

Some of those packages are downloaded over plain http, because there is
no way to get them over a secure channel, such as https.

In these dark times of pervasive surveillance, the potential for harm that
a tampered-with package could generate, we may want to check the integrity
of those sensitive packages.

So, each package may now provide a list of hashes for all files that needs
to be downloaded, and Buildroot will just fail if any downloaded file does
not match its known hash, in which case it is removed.

Hashes can be any of the md5, sha1 or sha2 variants, and will be checked
even if the file was pre-downloaded.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v7 -> v8
  - expand MITM to its full-length meaning  (Thomas DS)
  - typo  (Thomas DS)

Changes v4 -> v5:
  - fix detection of comments and empty lines

---
Note: this is not a bullet-proof solution, since Buildroot may itself be
compromised. But since we do sign our releases, then we secure the list of
hashes at the same time. Only random snapshots from the repository may be
at risk of tampering, although this is highly doubtfull, given how git
stores its data.
---
 package/pkg-download.mk     | 20 ++++++++++--
 support/download/check-hash | 76 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100755 support/download/check-hash

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index d3cd0c1..7f208d5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -58,6 +58,17 @@ domainseparator=$(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
+# Helper for checking a tarball's checksum
+# If the hash does not match, remove the incorrect file
+# $(1): the path to the file with the hashes
+# $(2): the full path to the file to check
+define VERIFY_HASH
+	if ! support/download/check-hash $(1) $(2); then \
+		rm -f $(2); \
+		exit 1; \
+	fi
+endef
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
@@ -148,7 +159,8 @@ endef
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/scp '$(call stripurischeme,$(call qstrip,$(1)))' \
-					  $(DL_DIR)/$(2)
+					  $(DL_DIR)/$(2) && \
+	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_SCP
@@ -179,7 +191,8 @@ endef
 
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2)
+	$(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2) && \
+	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_WGET
@@ -193,7 +206,8 @@ endef
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
-					 $(DL_DIR)
+					 $(DL_DIR) && \
+	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_LOCALFILES
diff --git a/support/download/check-hash b/support/download/check-hash
new file mode 100755
index 0000000..b13aad9
--- /dev/null
+++ b/support/download/check-hash
@@ -0,0 +1,76 @@
+#!/bin/sh
+set -e
+
+# Helper to check a file matches its known hash
+# Call it with:
+#   $1: the full path to the file to check
+#   $2: the path of the file containing all the the expected hashes
+
+h_file="${1}"
+file="${2}"
+
+# Does the hash-file exist?
+if [ ! -f "${h_file}" ]; then
+    exit 0
+fi
+
+# Check one hash for a file
+# $1: known hash
+# $2: file (full path)
+check_one_hash() {
+    _h="${1}"
+    _known="${2}"
+    _file="${3}"
+
+    # Note: sha3 is not supported, since there is currently no implementation
+    #       (the NIST has yet to publish the parameters).
+    case "${_h}" in
+        md5|sha1)                       ;;
+        sha224|sha256|sha384|sha512)    ;;
+        *) # Unknown hash, exit with error
+            printf "ERROR: unknown hash '%s' for '%s'\n"  \
+                   "${_h}" "${_file##*/}" >&2
+            exit 1
+            ;;
+    esac
+
+    # Do the hashes match?
+    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
+    if [ "${_hash}" = "${_known}" ]; then
+        printf "%s: OK (%s: %s)\n" "${_file##*/}" "${_h}" "${_hash}"
+        return 0
+    fi
+
+    printf "ERROR: %s has wrong %s hash:\n" "${_file##*/}" "${_h}" >&2
+    printf "ERROR: expected: %s\n" "${_known}" >&2
+    printf "ERROR: got     : %s\n" "${_hash}" >&2
+    printf "ERROR: Incomplete download, or man-in-the-middle (MITM) attack\n" >&2
+
+    exit 1
+}
+
+# Do we know one or more hashes for that file?
+nb_checks=0
+while read t h f; do
+    case "${t}" in
+        ''|'#'*)
+            # Skip comments and empty lines
+            continue
+            ;;
+        *)
+            if [ "${f}" = "${file##*/}" ]; then
+                check_one_hash "${t}" "${h}" "${file}"
+                : $((nb_checks++))
+            fi
+            ;;
+    esac
+done <"${h_file}"
+
+if [ ${nb_checks} -eq 0 ]; then
+    if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
+        printf "ERROR: No hash found for %s\n" "${file}" >&2
+        exit 1
+    else
+        printf "WARNING: No hash found for %s\n" "${file}" >&2
+    fi
+fi
-- 
1.9.1
