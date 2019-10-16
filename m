From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Oct 2019 19:10:26 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libopenssl: set no-asm for static builds
Message-ID: <20191016171026.3913-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use no-asm when building statically with a generic architecture such as
gcc, see https://github.com/openssl/openssl/issues/9839

This will fix a static build failure on x86_64 due to the removal of
x86/x86_64 BSAES and AES_ASM support by
https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491

Fixes:
 - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Set no-asm with all static builds and not only x86_64

 package/libopenssl/libopenssl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 4a430bcb4d..f631a38abb 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -55,7 +55,9 @@ endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # Use "gcc" minimalistic target to disable DSO
-LIBOPENSSL_TARGET_ARCH = gcc
+# no-asm is needed with generic architectures such as gcc, see
+# https://github.com/openssl/openssl/issues/9839
+LIBOPENSSL_TARGET_ARCH = gcc no-asm
 else
 # Some architectures are optimized in OpenSSL
 # Doesn't work for thumb-only (Cortex-M?)
-- 
2.23.0
