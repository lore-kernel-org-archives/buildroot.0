From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:44 +0100
Subject: [Buildroot] [PATCH 11/13] pkg-infra: add possiblity to check
	downloaded files against known hashes
In-Reply-To: <cover.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <b36750f8cb541e068cdce6ec65241ed155997c97.1393781650.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Some of the packages that Buildroot might build are sensitive packages,
related to security: openssl, dropbear, ca-certificates...

Some of those packages are downloaded over plain http, because there is
no way to get them over a secure channel, such as https.

In these dark times of pervasive surveillance, the potential for harm that
a tampered-with package could generate, we may want to check the integrity
of those sensitive packages.

So, each package may now provide a list of hashes for all files that needs
to be downloaded, and Buildroot will just fail if any downloaded file does
not match its known hash.

Hashes can be any of the sha1 or sha2 variants, and will be checked even if
the file was pre-downloaded.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Note: this is not a bullet-proof solution, since Buildroot may itself be
compromised. But since we do sign our releases, then we secure the list of
hashes at the same time. Only random snapshots from the repository may be
at risk of tampering, although this is highly doubtfull, given how git
stores its data.
---
 package/pkg-download.mk     | 27 +++++++++++------
 support/download/check-hash | 71 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 9 deletions(-)
 create mode 100755 support/download/check-hash

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c94ecba..adaccef 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -58,6 +58,17 @@ domainseparator=$(if $(1),$(1),/)
 # github(user,package,version): returns site of github repository
 github = https://github.com/$(1)/$(2)/tarball/$(3)
 
+# Helper for checking a tarball's checksum
+# If the hash does not match, remove the incorrect file
+# $(1): the path to the fies with the hashes
+# $(2): the full path to the file to check
+define VERIFY_HASH
+	if ! support/download/check-hash $(1) $(2); then \
+		rm -f $(1); \
+		exit 1; \
+	fi
+endef
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
@@ -147,7 +158,8 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2)
+	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2) && \
+	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_SCP
@@ -175,15 +187,11 @@ define SHOW_EXTERNAL_DEPS_HG
   echo $($(PKG)_SOURCE)
 endef
 
-# Download a file using wget. Only download the file if it doesn't
-# already exist in the download directory. If the download fails,
-# remove the file (because wget -O creates a 0-byte file even if the
-# download fails).  To handle an interrupted download as well, download
-# to a temporary file first.  The temporary file will be overwritten
-# the next time the download is tried.
+
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2)
+	$(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2) && \
+	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_WGET
@@ -196,7 +204,8 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)
+	$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR) && \
+	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_LOCALFILES
diff --git a/support/download/check-hash b/support/download/check-hash
new file mode 100755
index 0000000..ae62fc9
--- /dev/null
+++ b/support/download/check-hash
@@ -0,0 +1,71 @@
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
+    _known="${1}"
+    _file="${2}"
+
+    # What type of hash is it?
+    # Note: md5 is supported, but un-documented on-purpose.
+    # Note: sha3 is not supported, since there is currently no implemetation
+    #       (the NIST has yet to publish the parameters).
+    _h=
+    case "${#_known}" in
+        32) _h=md5;;
+        40) _h=sha1;;
+        56) _h=sha224;;
+        64) _h=sha256;;
+        96) _h=sha384;;
+       128) _h=sha512;;
+         *) # Unknown hash, exit with error
+            printf "ERROR: malformed hash '%s' for '%s'\n"  \
+                   "${_known}" "${_file##*/}" >&2
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
+    printf "ERROR: Incomplete download, or MITM attack\n" >&2
+
+    exit 1
+}
+
+# Do we know one or more hashes for that file?
+while read h f; do
+    case "${h}" in
+        ''|'#'*)
+            # Skip comments and empty lines
+            continue
+            ;;
+        *)
+            if [ "${f}" = "${file##*/}" ]; then
+                check_one_hash "${h}" "${file}"
+            fi
+            ;;
+    esac
+done <"${h_file}"
-- 
1.8.3.2
