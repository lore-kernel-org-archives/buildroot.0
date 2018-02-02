From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  2 Feb 2018 13:56:13 -0200
Subject: [Buildroot] [PATCH 3/4] tpm2-tools: new package
In-Reply-To: <20180202155614.26938-1-casantos@datacom.ind.br>
References: <20180202155614.26938-1-casantos@datacom.ind.br>
Message-ID: <20180202155614.26938-4-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TPM (Trusted Platform Module) 2.0 CLI tools based on system API of
TPM2-TSS. These tools can be used to manage keys, perform
encryption/decryption/signing/etc crypto operations, and manage
non-volatile storage through a TPM2.0 HW implementation.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in                                  |  1 +
 .../tpm2-tools/0001-Fix-build-with-LibreSSL.patch  | 64 ++++++++++++++++++++++
 package/tpm2-tools/Config.in                       | 17 ++++++
 package/tpm2-tools/tpm2-tools.hash                 |  3 +
 package/tpm2-tools/tpm2-tools.mk                   | 13 +++++
 5 files changed, 98 insertions(+)
 create mode 100644 package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
 create mode 100644 package/tpm2-tools/Config.in
 create mode 100644 package/tpm2-tools/tpm2-tools.hash
 create mode 100644 package/tpm2-tools/tpm2-tools.mk

diff --git a/package/Config.in b/package/Config.in
index c078d14688..8be3a7c73b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1997,6 +1997,7 @@ menu "System tools"
 	source "package/tar/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
+	source "package/tpm2-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/xen/Config.in"
diff --git a/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch b/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
new file mode 100644
index 0000000000..0fdd2dc4dd
--- /dev/null
+++ b/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
@@ -0,0 +1,64 @@
+From 7f8d9359dcf9edbb13bb447f70234397afa4fb05 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Tue, 30 Jan 2018 11:21:14 -0200
+Subject: [PATCH] Fix build with LibreSSL
+
+OPENSSL_VERSION_NUMBER is used to test the version of OpenSSL but this
+test alone breaks the build with LibreSSL due to implicit declarations
+of functions 'RSA_set0_key' and 'HMAC_CTX_free'.
+
+Test if OpenSSL < 1.1.0 or LIBRESSL_VERSION_NUMBER is defined, instead.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ lib/conversion.c | 2 +-
+ lib/tpm_kdfa.c   | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/conversion.c b/lib/conversion.c
+index 1d0a0b7..df02de4 100644
+--- a/lib/conversion.c
++++ b/lib/conversion.c
+@@ -133,7 +133,7 @@ static bool tpm2_convert_pubkey_ssl(TPMT_PUBLIC *public, pubkey_format format, c
+         goto error;
+     }
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x1010000fL /* OpenSSL 1.1.0 */
++#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER) /* OpenSSL 1.1.0 */
+     ssl_rsa_key->e = e;
+     ssl_rsa_key->n = n;
+ #else
+diff --git a/lib/tpm_kdfa.c b/lib/tpm_kdfa.c
+index ee3cf8a..e43bdeb 100644
+--- a/lib/tpm_kdfa.c
++++ b/lib/tpm_kdfa.c
+@@ -54,7 +54,7 @@ static const EVP_MD *tpm_algorithm_to_openssl_digest(TPMI_ALG_HASH algorithm) {
+ static HMAC_CTX *hmac_alloc()
+ {
+     HMAC_CTX *ctx;
+-#if OPENSSL_VERSION_NUMBER < 0x1010000fL /* OpenSSL 1.1.0 */
++#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER) /* OpenSSL 1.1.0 */
+     ctx = malloc(sizeof(*ctx));
+ #else
+     ctx = HMAC_CTX_new();
+@@ -62,7 +62,7 @@ static HMAC_CTX *hmac_alloc()
+     if (!ctx)
+         return NULL;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x1010000fL
++#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
+     HMAC_CTX_init(ctx);
+ #endif
+ 
+@@ -71,7 +71,7 @@ static HMAC_CTX *hmac_alloc()
+ 
+ static void hmac_del(HMAC_CTX *ctx)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x1010000fL
++#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
+     HMAC_CTX_cleanup(ctx);
+     free(ctx);
+ #else
+-- 
+2.14.3
+
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
new file mode 100644
index 0000000000..583fb33076
--- /dev/null
+++ b/package/tpm2-tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TPM2_TOOLS
+	bool "tpm2-tools"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_TPM2_ABRMD # run-time
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
+	  API of TPM2-TSS. These tools can be used to manage keys,
+	  perform encryption/decryption/signing/etc crypto operations,
+	  and manage non-volatile storage through a TPM2.0 HW
+	  implementation.
+
+	  https://github.com/tpm2-software/tpm2-tools
diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
new file mode 100644
index 0000000000..e33b3e5945
--- /dev/null
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 c990c0656165afef0fad61e1852a9a189a4b93b43d2a684b151a5dc0b3c6249d  tpm2-tools-3.0.3.tar.gz
+sha256 3d6b149c8b042bd5f3db678d587fbe55230d071ca084bd38dcae451679c6dd45  LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
new file mode 100644
index 0000000000..0697900d2d
--- /dev/null
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tpm2-tools
+#
+################################################################################
+
+TPM2_TOOLS_VERSION = 3.0.3
+TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
+TPM2_TOOLS_LICENSE = BSD-2-Clause
+TPM2_TOOLS_LICENSE_FILES = LICENSE
+TPM2_TOOLS_DEPENDENCIES = dbus libcurl libglib2 openssl tpm2-tss host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.14.3
