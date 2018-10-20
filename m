From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:12:21 +0200
Subject: [Buildroot] [git commit] toolchain-external: add Arm AArch64-BE
 toolchain 8.2-2018.08
Message-ID: <20181020151147.C1F198283F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1b99023b98b58fb33876998d3eb2d43a4633e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the same toolchain that was previously distributed by Linaro. [1]

Switch default toolchain as this toolchain supersed the Linaro AArch64-BE toolchain.
Only x86_64 host are supported, so keep Linaro toolchain for x86 host.

[1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                            |  1 +
 toolchain/toolchain-external/Config.in                |  2 ++
 .../toolchain-external-arm-aarch64-be/Config.in       | 19 +++++++++++++++++++
 .../Config.in.options                                 |  9 +++++++++
 .../toolchain-external-arm-aarch64-be.hash            |  4 ++++
 .../toolchain-external-arm-aarch64-be.mk              | 13 +++++++++++++
 6 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed2d529b6d..5b3e8f322e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1823,6 +1823,7 @@ F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
 F:	toolchain/toolchain-external/toolchain-external-arm-aarch64/
+F:	toolchain/toolchain-external/toolchain-external-arm-aarch64-be/
 F:	toolchain/toolchain-external/toolchain-external-arm-arm/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 47e54fc354..1f14f0350a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -17,6 +17,7 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
 # Aarch64 big-endian
+source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in"
 
 # ARC
@@ -117,6 +118,7 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
 # Aarch64 big-endian
+source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options"
 
 # ARC
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
new file mode 100644
index 0000000000..1e303c5ec2
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -0,0 +1,19 @@
+config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
+	bool "Arm AArch64 BE 2018.08"
+	depends on BR2_aarch64_be
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Arm toolchain for the AArch64 Big Endian architecture.
+
+	  This is the same toolchain that was previously distributed by
+	  Linaro.
+
+	  https://developer.arm.com/open-source/gnu-toolchain
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options
new file mode 100644
index 0000000000..add4adad2a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "aarch64_be-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-arm-aarch64-be"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
new file mode 100644
index 0000000000..9ab0eb519c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -0,0 +1,4 @@
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz.asc
+md5 789171dc11bc2e37e90ea3c6de46c719 gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz
+# locally calculated
+sha256 2cd8a1a35a892db5f0cd738a8b17bd1563f6d6e4be43a2b527b355bcfb295df8 gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
new file mode 100644
index 0000000000..30db8c92e6
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# toolchain-external-arm-aarch64-be
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)
+
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-linux-gnu.tar.xz
+
+
+$(eval $(toolchain-external-package))
