From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 15:00:38 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/nodejs: use
 --with-arm-fpu option on ARM
Message-ID: <20191203152550.13656850D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4ea288caccfbc45e6224b6aac1a13252d8eabf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

nodejs can use some FPU instructions on ARM, but it needs to know that
thanks to the --with-arm-fpu option. Without this, it may use the
wrong FPU setting, such as use VFPv3 even if only a VFPv3-D16 is
available. This has been reported as bug #12166, where the compiled
node binary had some floating point instructions using floating point
registers above 16 on a VFPv3-D16 system.

This commit makes sure we pass the appropriate --with-arm-fpu value
when it makes sense. Note that NodeJS only has explicit support for a
subset of the FPUs, for the ones that are not explicitly supported, we
simply pass no --with-arm-fpu value.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12166

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f3c80d711c8954e408397f7a18fb9fdaaf42d773)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b0d5c49dae..3bd6a1c4dd 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -96,6 +96,19 @@ else ifeq ($(BR2_arm),y)
 NODEJS_CPU = arm
 # V8 needs to know what floating point ABI the target is using.
 NODEJS_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
+# it also wants to know which FPU to use, but only has support for
+# vfp, vfpv3, vfpv3-d16 and neon.
+ifeq ($(BR2_ARM_FPU_VFPV2),y)
+NODEJS_ARM_FPU = vfp
+# vfpv4 is a superset of vfpv3
+else ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4),y)
+NODEJS_ARM_FPU = vfpv3
+# vfpv4-d16 is a superset of vfpv3-d16
+else ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
+NODEJS_ARM_FPU = vfpv3-d16
+else ifeq ($(BR2_ARM_FPU_NEON),y)
+NODEJS_ARM_FPU = neon
+endif
 else ifeq ($(BR2_aarch64),y)
 NODEJS_CPU = arm64
 endif
@@ -125,6 +138,7 @@ define NODEJS_CONFIGURE_CMDS
 		--prefix=/usr \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
+		$(if $(NODEJS_ARM_FPU),--with-arm-fpu=$(NODEJS_ARM_FPU)) \
 		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
 		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
 		$(NODEJS_CONF_OPTS) \
