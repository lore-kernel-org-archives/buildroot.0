From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 18:25:01 +0100
Subject: [Buildroot] [git commit] nodejs: build for the right MIPS
	architecture variant
Message-ID: <20151212172709.CF3CB80771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5aabd858650bc3c0af8e797151ffea7ad7e523c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/faa/faae16b543e146b230256d7653d181fb895c83fc/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index edf8bac..7ede89d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -66,6 +66,18 @@ NODEJS_CPU = arm
 NODEJS_ARM_FP = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 endif
 
+# MIPS architecture specific options
+ifeq ($(BR2_mips)$(BR2_mipsel),y)
+ifeq ($(BR2_mips_32r6),y)
+NODEJS_MIPS_ARCH_VARIANT = r6
+NODEJS_MIPS_FPU_MODE = fp64
+else ifeq ($(BR2_mips_32r2),y)
+NODEJS_MIPS_ARCH_VARIANT = r2
+else ifeq ($(BR2_mips_32),y)
+NODEJS_MIPS_ARCH_VARIANT = r1
+endif
+endif
+
 define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -81,6 +93,8 @@ define NODEJS_CONFIGURE_CMDS
 		--without-etw \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
+		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
+		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
 		--dest-os=linux \
 	)
 endef
