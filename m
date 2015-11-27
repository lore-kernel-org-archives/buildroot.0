From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 13:22:04 +0100
Subject: [Buildroot] [git commit] polarssl: disable assembly for MIPS R6
Message-ID: <20151127122301.09BCC81F7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47dd01f1aca80801ed6dcfa2359989c17acf4874
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c34/c343c68d3e0dae4a7ecd59693298a9622bc56662/

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polarssl/polarssl.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
