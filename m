From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:31 -0000
Subject: [Buildroot] [git commit] tpm2-tools: bump to version 3.1.3
Message-ID: <20181202071555.A71DF8A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4076e407ac61d8d8df4dec154d62ba186ec003f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop C++ requirement, which came from tpm2-tss.
- Drop musl restriction.
- Drop the patch to build with LibreSSL, which is not required anymore.
- Update the patch for the "variable may be used uninitialized" error to
  match tpm2-tss 2.1.0, which defines TPM2_ALG_ERROR, not TPM_ALG_ERROR.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tpm2-tools/0001-Fix-build-with-LibreSSL.patch  | 64 ----------------------
 ...y-fix-type-may-be-used-uninitialized-warn.patch | 14 ++---
 package/tpm2-tools/Config.in                       |  7 +--
 package/tpm2-tools/tpm2-tools.hash                 |  2 +-
 package/tpm2-tools/tpm2-tools.mk                   |  2 +-
 5 files changed, 11 insertions(+), 78 deletions(-)

diff --git a/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch b/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
deleted file mode 100644
index 0fdd2dc4dd..0000000000
--- a/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7f8d9359dcf9edbb13bb447f70234397afa4fb05 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Tue, 30 Jan 2018 11:21:14 -0200
-Subject: [PATCH] Fix build with LibreSSL
-
-OPENSSL_VERSION_NUMBER is used to test the version of OpenSSL but this
-test alone breaks the build with LibreSSL due to implicit declarations
-of functions 'RSA_set0_key' and 'HMAC_CTX_free'.
-
-Test if OpenSSL < 1.1.0 or LIBRESSL_VERSION_NUMBER is defined, instead.
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- lib/conversion.c | 2 +-
- lib/tpm_kdfa.c   | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/conversion.c b/lib/conversion.c
-index 1d0a0b7..df02de4 100644
---- a/lib/conversion.c
-+++ b/lib/conversion.c
-@@ -133,7 +133,7 @@ static bool tpm2_convert_pubkey_ssl(TPMT_PUBLIC *public, pubkey_format format, c
-         goto error;
-     }
- 
--#if OPENSSL_VERSION_NUMBER < 0x1010000fL /* OpenSSL 1.1.0 */
-+#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER) /* OpenSSL 1.1.0 */
-     ssl_rsa_key->e = e;
-     ssl_rsa_key->n = n;
- #else
-diff --git a/lib/tpm_kdfa.c b/lib/tpm_kdfa.c
-index ee3cf8a..e43bdeb 100644
---- a/lib/tpm_kdfa.c
-+++ b/lib/tpm_kdfa.c
-@@ -54,7 +54,7 @@ static const EVP_MD *tpm_algorithm_to_openssl_digest(TPMI_ALG_HASH algorithm) {
- static HMAC_CTX *hmac_alloc()
- {
-     HMAC_CTX *ctx;
--#if OPENSSL_VERSION_NUMBER < 0x1010000fL /* OpenSSL 1.1.0 */
-+#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER) /* OpenSSL 1.1.0 */
-     ctx = malloc(sizeof(*ctx));
- #else
-     ctx = HMAC_CTX_new();
-@@ -62,7 +62,7 @@ static HMAC_CTX *hmac_alloc()
-     if (!ctx)
-         return NULL;
- 
--#if OPENSSL_VERSION_NUMBER < 0x1010000fL
-+#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
-     HMAC_CTX_init(ctx);
- #endif
- 
-@@ -71,7 +71,7 @@ static HMAC_CTX *hmac_alloc()
- 
- static void hmac_del(HMAC_CTX *ctx)
- {
--#if OPENSSL_VERSION_NUMBER < 0x1010000fL
-+#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
-     HMAC_CTX_cleanup(ctx);
-     free(ctx);
- #else
--- 
-2.14.3
-
diff --git a/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch b/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
index b472666f46..327f5e403b 100644
--- a/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
+++ b/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
@@ -1,4 +1,4 @@
-From e15b01a1eb27e31964308892fcaa9c7d4f17f181 Mon Sep 17 00:00:00 2001
+From 295cd8f7fb8e1a1ad8f64d981e99969a364d941e Mon Sep 17 00:00:00 2001
 From: Carlos Santos <casantos@datacom.ind.br>
 Date: Sat, 24 Mar 2018 22:46:46 -0300
 Subject: [PATCH] tpm2_certify: fix "'type' may be used uninitialized" warning
@@ -10,7 +10,7 @@ because set_scheme returns immediately if get_key_type retuns false but
 the compiler does not understand that logic and fails because warnings
 are treated as errors.
 
-Adapted for version 3.0.3 from the change submitted upstream:
+Adapted for version 3.1.3 from the change submitted upstream:
 
   https://github.com/tpm2-software/tpm2-tools/pull/954
 
@@ -20,17 +20,17 @@ Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
  1 file changed, 1 insertion(+)
 
 diff --git a/tools/tpm2_certify.c b/tools/tpm2_certify.c
-index eaac02f..cbc42a9 100644
+index 0575072..e562586 100644
 --- a/tools/tpm2_certify.c
 +++ b/tools/tpm2_certify.c
-@@ -107,6 +107,7 @@ static bool get_key_type(TSS2_SYS_CONTEXT *sapi_context, TPMI_DH_OBJECT object_h
+@@ -98,6 +98,7 @@ static bool get_key_type(TSS2_SYS_CONTEXT *sapi_context, TPMI_DH_OBJECT object_h
              &out_public, &name, &qualified_name, &sessions_data_out));
-     if (rval != TPM_RC_SUCCESS) {
+     if (rval != TPM2_RC_SUCCESS) {
          LOG_ERR("TPM2_ReadPublic failed. Error Code: 0x%x", rval);
-+        *type = TPM_ALG_ERROR;
++        *type = TPM2_ALG_ERROR;
          return false;
      }
  
 -- 
-2.14.3
+2.19.1
 
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index e5feb18786..24cd4b8f9a 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
-	depends on BR2_INSTALL_LIBSTDCPP # tpm2-tss
 	depends on BR2_USE_MMU # dbus, libglib
 	depends on BR2_USE_WCHAR # libglib -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
-	depends on !BR2_TOOLCHAIN_USES_MUSL # tpm2-abrmd
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
@@ -20,7 +18,6 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a uClibc or glibc toolchain w/ C++, wchar, threads"
+comment "tpm2-tools needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index e33b3e5945..ae228c591c 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 c990c0656165afef0fad61e1852a9a189a4b93b43d2a684b151a5dc0b3c6249d  tpm2-tools-3.0.3.tar.gz
+sha256 cc95576f49cf9bacf75772fd98dcb7edc5172a6a8dfa20c215fe3cc69b0a3a16  tpm2-tools-3.1.3.tar.gz
 sha256 3d6b149c8b042bd5f3db678d587fbe55230d071ca084bd38dcae451679c6dd45  LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 13fdb163bb..9c224018ce 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 3.0.3
+TPM2_TOOLS_VERSION = 3.1.3
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-2-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
