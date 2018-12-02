From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:31 -0000
Subject: [Buildroot] [git commit] tpm2-tss: bump to version 2.1.0
Message-ID: <20181202071555.9563F8A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcc9232b0c9759978a6928eec070d73ed6fb3922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop C++ requirement (tmp2-tss is pure C now).
- Add explicit dependency on openssl (gnutls can be used too but this
  option will be added by a subsequent patch).
- Drop the patch on tcti_socket.cpp, which is not applicable.
- Add a patch already submitted upstream to support using libressl[1].
- Update LICENSE hash. The terms are is still BSD-2-Clause but the file
  now contains a SPDX license identifier.

1. https://github.com/tpm2-software/tpm2-tss/pull/1207

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ESYS-Fix-build-with-LibreSSL.patch        | 48 ++++++++++++++++++++++
 ...ocket.cpp-add-missing-inclusion-of-sys-se.patch | 33 ---------------
 package/tpm2-tss/Config.in                         |  5 +--
 package/tpm2-tss/tpm2-tss.hash                     |  4 +-
 package/tpm2-tss/tpm2-tss.mk                       |  9 ++--
 5 files changed, 54 insertions(+), 45 deletions(-)

diff --git a/package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch b/package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch
new file mode 100644
index 0000000000..d8bf2a665c
--- /dev/null
+++ b/package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch
@@ -0,0 +1,48 @@
+From e8b8ecd2f761430dd2e2c74505974b429fe6b40f Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Wed, 14 Nov 2018 23:31:25 -0200
+Subject: [PATCH] ESYS: Fix build with LibreSSL
+
+RAND_bytes() is declared in rand.h. Also, LibreSSL does not provide OAEP
+macros EVP_PKEY_CTX_set0_rsa_oaep_label and EVP_PKEY_CTX_set_rsa_oaep_md
+so use them conditionally.
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ src/tss2-esys/esys_crypto_ossl.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/tss2-esys/esys_crypto_ossl.c b/src/tss2-esys/esys_crypto_ossl.c
+index 43088f4a..6c0c76fe 100644
+--- a/src/tss2-esys/esys_crypto_ossl.c
++++ b/src/tss2-esys/esys_crypto_ossl.c
+@@ -10,6 +10,7 @@
+ #include <openssl/aes.h>
+ #include <openssl/rsa.h>
+ #include <openssl/engine.h>
++#include <openssl/rand.h>
+ #include <stdio.h>
+ 
+ #include "tss2_esys.h"
+@@ -660,6 +661,8 @@ iesys_cryptossl_pk_encrypt(TPM2B_PUBLIC * pub_tpm_key,
+                    "Could not set RSA passing.", cleanup);
+     }
+ 
++/* LibreSSL does not provide these OAEP functions */
++#ifdef EVP_PKEY_CTX_set0_rsa_oaep_label
+     if (1 != EVP_PKEY_CTX_set0_rsa_oaep_label(ctx, label, strlen(label)+1)) {
+         goto_error(r, TSS2_ESYS_RC_GENERAL_FAILURE,
+                    "Could not set RSA label.", cleanup);
+@@ -669,6 +672,9 @@ iesys_cryptossl_pk_encrypt(TPM2B_PUBLIC * pub_tpm_key,
+         goto_error(r, TSS2_ESYS_RC_GENERAL_FAILURE,
+                    "Could not set hash algorithm.", cleanup);
+     }
++#else
++    (void) label;
++#endif
+ 
+     /* Determine out size */
+     if (1 != EVP_PKEY_encrypt(ctx, NULL, out_size, in_buffer, in_size)) {
+-- 
+2.19.1
+
diff --git a/package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch b/package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch
deleted file mode 100644
index e8e0d842f2..0000000000
--- a/package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2fdbf9f56bd6e7b00c695881a81c0df2f5088760 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Fri, 23 Mar 2018 09:15:44 -0300
-Subject: [PATCH] tcti/tcti_socket.cpp: add missing inclusion of sys/select.h
-
-Prevents compilation errors due to undeclared "fd_set" type.
-
-Fixes:
-  http://autobuild.buildroot.net/results/09e8b3b85d7113d60e8967a2d41a6aea8f8197c0
-  http://autobuild.buildroot.net/results/2e4c70f2f1239eb19235ae04a936a6492daf316d
-  http://autobuild.buildroot.net/results/bbd68f52781da735e983b1260de5b804787374b1
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- tcti/tcti_socket.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tcti/tcti_socket.cpp b/tcti/tcti_socket.cpp
-index e8982f1..b6e5874 100644
---- a/tcti/tcti_socket.cpp
-+++ b/tcti/tcti_socket.cpp
-@@ -28,6 +28,8 @@
- #include <stdio.h>
- #include <stdlib.h>   // Needed for _wtoi
- 
-+#include <sys/select.h>   // for fd_set
-+
- #include "sapi/tpm20.h"
- #include "tcti/tcti_socket.h"
- #include "sysapi_util.h"
--- 
-2.14.3
-
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 7a757bd70a..4e299eccc1 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBURIPARSER
+	select BR2_PACKAGE_OPENSSL
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
 	  Software Stack (TSS). This stack consists of the following
@@ -30,6 +30,3 @@ config BR2_PACKAGE_TPM2_TSS
 	    Microsoft software TPM2 simulator.
 
 	  https://github.com/tpm2-software/tpm2-tss
-
-comment "tpm2-tss needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index 67c5a85842..d6f65fa7de 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 cf8784cc536be16e6fba47f77033e093a6aeaed8420877ac9f42f77fb7b09031  tpm2-tss-1.4.0.tar.gz
-sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
+sha256 a50b8dbd51f0c274cf874351786ed252c5024c952bf699fbd595ac292a27ab19  tpm2-tss-2.1.0.tar.gz
+sha256 f7da3c2da12cec3348bb7ee9e2a9e651a241450b2efb67da29d5a75ef2da058a  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index dcc1e5d74d..3bb0702916 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 1.4.0
+TPM2_TSS_VERSION = 2.1.0
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = liburiparser host-pkgconf
-
-# configure.ac doesn't contain a link test, so it doesn't detect when
-# libssp is missing.
-TPM2_TSS_CONF_ENV = ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
+TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc
 
 $(eval $(autotools-package))
