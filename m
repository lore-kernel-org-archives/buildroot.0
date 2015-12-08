From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Dec 2015 14:18:15 +0000
Subject: [Buildroot] [PATCH 2/2] nodejs: build for the right MIPS
	architecture variant
In-Reply-To: <1449584295-21736-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449584295-21736-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1449584295-21736-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.4.10
