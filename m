From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:24:35 +0100
Subject: [Buildroot] [git commit] wolfssl: fix build on ARMV8
Message-ID: <20180115202438.5D0D083CCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7210d1dfd1b521b30e2d24d36700a5d00088f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wolfssl/wolfssl.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index c8ef50a..84073f3 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -29,10 +29,7 @@ else
 WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
-ifeq ($(BR2_ARM_CPU_ARMV8A),y)
-WOLFSSL_CONF_OPTS += --enable-armasm
-else
+# build fails when ARMv8 hardware acceleration is enabled
 WOLFSSL_CONF_OPTS += --disable-armasm
-endif
 
 $(eval $(autotools-package))
