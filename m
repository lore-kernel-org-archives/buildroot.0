From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 15 Jan 2018 12:48:10 -0200
Subject: [Buildroot] [PATCH v2] wolfssl: fix build on ARMV8
Message-ID: <1516027690-24571-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build on ARMV8 fails when hardware acceleration is enabled:

/tmp/ccmGP5RI.s: Assembler messages:
/tmp/ccmGP5RI.s:532: Error: invalid addressing mode at operand 2 -- `ld1 {v0.2d},[x0,256]'
/tmp/ccmGP5RI.s:568: Error: invalid addressing mode at operand 2 -- `st1 {v0.2d},[x0,256]'
/tmp/ccmGP5RI.s:581: Error: invalid addressing mode at operand 2 -- `ld1 {v0.2d},[x0,256]'
/tmp/ccmGP5RI.s:621: Error: invalid addressing mode at operand 2 -- `st1 {v0.2d},[x0,256]'

So let's disable ARMv8 hardware acceleration for now.

Fixes:
http://autobuild.buildroot.net/results/6080648394d09a0d382087831ee6f063c7638be9

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v1 -> v2:
  - Force configure option to --disable-armasm
---
 package/wolfssl/wolfssl.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index c8ef50a9bc6e..a2e60532f342 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -29,9 +29,8 @@ else
 WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
+# build fails when ARMv8 hardware acceleration is enabled
 ifeq ($(BR2_ARM_CPU_ARMV8A),y)
-WOLFSSL_CONF_OPTS += --enable-armasm
-else
 WOLFSSL_CONF_OPTS += --disable-armasm
 endif
 
-- 
1.9.1
