From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 15:08:39 +0100
Subject: [Buildroot] [git commit] package/tpm2-tss: force libopenssl as
 openssl provider
Message-ID: <20181202071558.BC92982855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b122623145a963d009e105131d0eeac099c3759b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL and drop the patch to
compile with libressl.

The discussion with the tpm2-tss developers led to the conclusion that
libressl lacks some required functionalities. Quoting Andreas Fuchs[1]:
"LibreSSL does not support OAEP-mode with labels at all, even though the
internal OAEP-padding-function includes the parameters already. [...]
Further, the internal OAEP-padding-function does not support variable
hash algs, but staticly uses SHA1."

Notice that there will NOT be an option to use libgcrypt. OpenSSL will
soon become the default ESAPI crypto backend to prevent the problem of
forcing applications to link against both libgcrypt and libssl[2].

1. https://github.com/tpm2-software/tpm2-tss/pull/1207#issuecomment-440217659
2. https://github.com/tpm2-software/tpm2-tss/issues/1169

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ESYS-Fix-build-with-LibreSSL.patch        | 48 ----------------------
 package/tpm2-tss/Config.in                         |  1 +
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch b/package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch
deleted file mode 100644
index d8bf2a665c..0000000000
--- a/package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From e8b8ecd2f761430dd2e2c74505974b429fe6b40f Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.com.br>
-Date: Wed, 14 Nov 2018 23:31:25 -0200
-Subject: [PATCH] ESYS: Fix build with LibreSSL
-
-RAND_bytes() is declared in rand.h. Also, LibreSSL does not provide OAEP
-macros EVP_PKEY_CTX_set0_rsa_oaep_label and EVP_PKEY_CTX_set_rsa_oaep_md
-so use them conditionally.
-
-Signed-off-by: Carlos Santos <casantos@datacom.com.br>
----
- src/tss2-esys/esys_crypto_ossl.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/tss2-esys/esys_crypto_ossl.c b/src/tss2-esys/esys_crypto_ossl.c
-index 43088f4a..6c0c76fe 100644
---- a/src/tss2-esys/esys_crypto_ossl.c
-+++ b/src/tss2-esys/esys_crypto_ossl.c
-@@ -10,6 +10,7 @@
- #include <openssl/aes.h>
- #include <openssl/rsa.h>
- #include <openssl/engine.h>
-+#include <openssl/rand.h>
- #include <stdio.h>
- 
- #include "tss2_esys.h"
-@@ -660,6 +661,8 @@ iesys_cryptossl_pk_encrypt(TPM2B_PUBLIC * pub_tpm_key,
-                    "Could not set RSA passing.", cleanup);
-     }
- 
-+/* LibreSSL does not provide these OAEP functions */
-+#ifdef EVP_PKEY_CTX_set0_rsa_oaep_label
-     if (1 != EVP_PKEY_CTX_set0_rsa_oaep_label(ctx, label, strlen(label)+1)) {
-         goto_error(r, TSS2_ESYS_RC_GENERAL_FAILURE,
-                    "Could not set RSA label.", cleanup);
-@@ -669,6 +672,9 @@ iesys_cryptossl_pk_encrypt(TPM2B_PUBLIC * pub_tpm_key,
-         goto_error(r, TSS2_ESYS_RC_GENERAL_FAILURE,
-                    "Could not set hash algorithm.", cleanup);
-     }
-+#else
-+    (void) label;
-+#endif
- 
-     /* Determine out size */
-     if (1 != EVP_PKEY_encrypt(ctx, NULL, out_size, in_buffer, in_size)) {
--- 
-2.19.1
-
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 933adb4b2a..2fb5b0f213 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TPM2_TSS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
 	  Software Stack (TSS). This stack consists of the following
