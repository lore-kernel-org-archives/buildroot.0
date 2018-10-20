From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:02:08 +0200
Subject: [Buildroot] [git commit] toolchain-external: add Arm ARM toolchain
 8.2-2018.08
Message-ID: <20181020151147.9890C815DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a98f7236c42b365b69907cb65d91353117aa0434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the same toolchain that was previously distributed by Linaro. [1]

Switch default toolchain as this toolchain supersed the Linaro ARM toolchain.
Only x86_64 host are supported, so keep Linaro toolchain for x86 host.

Tested with qemu_arm_vexpress_defconfig.

[1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 toolchain/toolchain-external/Config.in             |  4 ++-
 .../toolchain-external-arm-arm/Config.in           | 30 ++++++++++++++++++++++
 .../toolchain-external-arm-arm/Config.in.options   |  9 +++++++
 .../toolchain-external-arm-arm.hash                |  4 +++
 .../toolchain-external-arm-arm.mk                  | 12 +++++++++
 6 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 341bf7de3b..efa7d0f6b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1822,6 +1822,7 @@ F:	package/tk/
 F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
+F:	toolchain/toolchain-external/toolchain-external-arm-arm/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
 F:	package/davfs2/
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 273910699f..d2b430c9f8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -21,7 +21,8 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
-# ARM (use Linaro toolchain by default)
+# ARM (use ARM toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
 
@@ -120,6 +121,7 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
 
 # ARM
+source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
new file mode 100644
index 0000000000..4ec61f2d07
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -0,0 +1,30 @@
+comment "Arm toolchains available for Cortex-A + EABIhf"
+	depends on BR2_arm
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+
+config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
+	bool "Arm ARM 2018.08"
+	depends on BR2_arm
+	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Arm toolchain for the ARM architecture. It uses GCC 8.2.1,
+	  GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates code that
+	  runs on all Cortex-A profile devices, but tuned for the
+	  Cortex-A9. The code generated uses the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+	  This is the same toolchain that was previously distributed by
+	  Linaro.
+
+	  https://developer.arm.com/open-source/gnu-toolchain
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options
new file mode 100644
index 0000000000..16e7d6ff3c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "arm-linux-gnueabihf"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-arm-arm"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
new file mode 100644
index 0000000000..f13c43a7ef
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -0,0 +1,4 @@
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.xz.asc
+md5 dc7455746d90259337fb88c3e67f8855 gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.xz
+# locally calculated
+sha256 5b3f20e1327edc3073e545a5bd3d15f33e7f94181ff4e37a76e95924c1b439b9 gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
new file mode 100644
index 0000000000..03de21a28a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-external-arm-arm
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)
+
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
+
+$(eval $(toolchain-external-package))
