From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 Nov 2015 10:37:18 +0000
Subject: [Buildroot] [PATCH] polarssl: disable assembly for MIPS R6
Message-ID: <1448620638-44691-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is not yet supported and the compilation will fail like this:

[  4%] Building C object library/CMakeFiles/polarssl.dir/bignum.c.o
/tmp/ccLDxl9G.s: Assembler messages:
/tmp/ccLDxl9G.s:92: Error: opcode not supported on this processor:
mips32r6 (mips32r6) `multu $13,$14'
/tmp/ccLDxl9G.s:93: Error: opcode not supported on this processor:
mips32r6 (mips32r6) `addi $10,$10,4'
/tmp/ccLDxl9G.s:94: Error: opcode not supported on this processor:
mips32r6 (mips32r6) `mflo $14'
/tmp/ccLDxl9G.s:95: Error: opcode not supported on this processor:
mips32r6 (mips32r6) `mfhi $9'

[...]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/polarssl/polarssl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index c589ec7..d988bf1 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -20,10 +20,13 @@ endef
 
 # ARM in thumb mode breaks debugging with asm optimizations
 # Microblaze asm optimizations are broken in general
+# MIPS R6 asm is not yet supported
 ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
 POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
 else ifeq ($(BR2_microblaze),y)
 POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
+else ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
 endif
 
 $(eval $(cmake-package))
-- 
2.4.10
