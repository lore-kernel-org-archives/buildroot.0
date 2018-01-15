From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 15 Jan 2018 07:55:10 -0200
Subject: [Buildroot] [PATCH] wolfssl: fix build on ARMV8
Message-ID: <1516010110-11590-1-git-send-email-sergio.prado@e-labworks.com>
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
 package/wolfssl/wolfssl.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index c8ef50a9bc6e..3e661cd26ef4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -29,10 +29,4 @@ else
 WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
-ifeq ($(BR2_ARM_CPU_ARMV8A),y)
-WOLFSSL_CONF_OPTS += --enable-armasm
-else
-WOLFSSL_CONF_OPTS += --disable-armasm
-endif
-
 $(eval $(autotools-package))
-- 
1.9.1
