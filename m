From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:01:48 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libopenssl: set
 no-asm with generic architectures
Message-ID: <20191031135523.6AE958E153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba2642fd215818f20fdca4b4ad5d9e31908cb2ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Use no-asm when building with generic architectures such as gcc or
linux-generic32, see https://github.com/openssl/openssl/issues/9839

This will fix a static build failure on x86_64 due to the removal of
x86/x86_64 BSAES and AES_ASM support by
https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491

Fixes:
 - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 027c02660b8cd670eff0ba6fdd9e49253968517f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 4a430bcb4d..a1bbf9a900 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -12,7 +12,9 @@ LIBOPENSSL_LICENSE_FILES = LICENSE
 LIBOPENSSL_INSTALL_STAGING = YES
 LIBOPENSSL_DEPENDENCIES = zlib
 HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
-LIBOPENSSL_TARGET_ARCH = linux-generic32
+# no-asm is needed with generic architectures such as linux-generic32, see
+# https://github.com/openssl/openssl/issues/9839
+LIBOPENSSL_TARGET_ARCH = linux-generic32 no-asm
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
 
@@ -55,7 +57,9 @@ endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # Use "gcc" minimalistic target to disable DSO
-LIBOPENSSL_TARGET_ARCH = gcc
+# no-asm is needed with generic architectures such as gcc, see
+# https://github.com/openssl/openssl/issues/9839
+LIBOPENSSL_TARGET_ARCH = gcc no-asm
 else
 # Some architectures are optimized in OpenSSL
 # Doesn't work for thumb-only (Cortex-M?)
