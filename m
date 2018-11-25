From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Nov 2018 07:20:27 -0200
Subject: [Buildroot] [PATCH] package/wolfssl: enable ARMv8 hardware
 acceleration
Message-ID: <20181125092027.5824-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable hardware acceleration for ARMv8 targets.

When ARMv8 hardware acceleration is enabled without any additional flags,
the build fails with the following messages:

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

This is because of some inline assembly in parts of the AES structure using the "m" constraint.

So lets use the flag -mstrict-align to prevent this error.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/wolfssl/wolfssl.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 68b638c3e2a8..ab5f5ea4550c 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -30,7 +30,14 @@ else
 WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
-# build fails when ARMv8 hardware acceleration is enabled
+# enable ARMv8 hardware acceleration (the flag -mstrict-align is
+# needed to prevent build errors caused by some inline assembly
+# in parts of the AES structure using the "m" constraint)
+ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+WOLFSSL_CONF_OPTS += --enable-armasm
+WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"
+else
 WOLFSSL_CONF_OPTS += --disable-armasm
+endif
 
 $(eval $(autotools-package))
-- 
2.17.1
