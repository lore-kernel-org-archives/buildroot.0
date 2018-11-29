From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:31:06 +0100
Subject: [Buildroot] [git commit] package/wolfssl: enable ARMv8 hardware
 acceleration
Message-ID: <20181202071601.0D468803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=630a87907fa580f668d7159a5e84398419d6b3fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable hardware acceleration for ARMv8 targets.

When ARMv8 hardware acceleration is enabled on AArch64 without any
additional flags, the build fails with the following messages:

/tmp/cciv7Oei.s: Assembler messages:
/tmp/cciv7Oei.s:580: Error: invalid addressing mode at operand 2 -- `ld1 {v0.2d},[x0,256]'
/tmp/cciv7Oei.s:616: Error: invalid addressing mode at operand 2 -- `st1 {v0.2d},[x0,256]'
/tmp/cciv7Oei.s:629: Error: invalid addressing mode at operand 2 -- `ld1 {v0.2d},[x0,256]'
/tmp/cciv7Oei.s:669: Error: invalid addressing mode at operand 2 -- `st1 {v0.2d},[x0,256]'
/tmp/cciv7Oei.s:1211: Error: invalid addressing mode at operand 2 -- `ld1 {v16.2d},[x0,304]'
/tmp/cciv7Oei.s:1368: Error: invalid addressing mode at operand 2 -- `ld1 {v17.16b},[x19,304]'
/tmp/cciv7Oei.s:1554: Error: invalid addressing mode at operand 2 -- `ld1 {v16.2d},[x0,304]'
/tmp/cciv7Oei.s:1719: Error: invalid addressing mode at operand 2 -- `ld1 {v17.16b},[x19,304]'
/tmp/cciv7Oei.s:1870: Error: invalid addressing mode at operand 2 -- `ld1 {v16.2d},[x0,304]'
/tmp/cciv7Oei.s:2043: Error: invalid addressing mode at operand 2 -- `ld1 {v17.16b},[x19,304]'
make[3]: *** [Makefile:3801: wolfcrypt/src/port/arm/src_libwolfssl_la-armv8-aes.lo] Error 1

This is because of some inline assembly in parts of the AES structure
using the "m" constraint.

So lets use the flag -mstrict-align to prevent this error.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Thomas: restrict the -mstrict-align workaround to AArch64, as ARMv8-A
can also be used in an AArch32 build, and in this case, gcc doesn't
support the -mstrict-align flag]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 68b638c3e2..aefcea33d0 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -30,7 +30,17 @@ else
 WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
-# build fails when ARMv8 hardware acceleration is enabled
+# enable ARMv8 hardware acceleration
+ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+WOLFSSL_CONF_OPTS += --enable-armasm
+# the flag -mstrict-align is needed to prevent build errors caused by
+# some inline assembly in parts of the AES structure using the "m"
+# constraint
+ifeq ($(BR2_aarch64),y)
+WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"
+endif
+else
 WOLFSSL_CONF_OPTS += --disable-armasm
+endif
 
 $(eval $(autotools-package))
