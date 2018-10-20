From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:03:29 +0200
Subject: [Buildroot] [git commit] toolchain-external: add Arm AArch64
 toolchain 8.2-2018.08
Message-ID: <20181020151147.AE8CE815DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d74c133ad56349ca1b50dc6233787d8255560583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the same toolchain that was previously distributed by Linaro. [1]

Switch default toolchain as this toolchain supersed the Linaro AArch64 toolchain.
Only x86_64 host are supported, so keep Linaro toolchain for x86 host.

Tested with qemu_aarch64_virt_defconfig.

[1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                            |  1 +
 toolchain/toolchain-external/Config.in                |  4 +++-
 .../toolchain-external-arm-aarch64/Config.in          | 19 +++++++++++++++++++
 .../toolchain-external-arm-aarch64/Config.in.options  |  9 +++++++++
 .../toolchain-external-arm-aarch64.hash               |  4 ++++
 .../toolchain-external-arm-aarch64.mk                 | 12 ++++++++++++
 6 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index efa7d0f6b1..ed2d529b6d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1822,6 +1822,7 @@ F:	package/tk/
 F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
+F:	toolchain/toolchain-external/toolchain-external-arm-aarch64/
 F:	toolchain/toolchain-external/toolchain-external-arm-arm/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2b430c9f8..47e54fc354 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -11,7 +11,8 @@ comment "glibc toolchains only available with shared lib support"
 # Kept toolchains sorted by architecture in order to use some toolchain
 # as default choice
 
-# Aarch64 (use Linaro toolchain by default)
+# Aarch64 (use ARM toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
@@ -111,6 +112,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 # BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL and BR2_TOOLCHAIN_EXTERNAL_PREFIX
 
 # Aarch64
+source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
new file mode 100644
index 0000000000..ba627129cb
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -0,0 +1,19 @@
+config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
+	bool "Arm AArch64 2018.08"
+	depends on BR2_aarch64
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
+	  Arm toolchain for the AArch64 architecture.
+
+	  This is the same toolchain that was previously distributed by
+	  Linaro.
+
+	  https://developer.arm.com/open-source/gnu-toolchain
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
new file mode 100644
index 0000000000..19b75805c9
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "aarch64-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-arm-aarch64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
new file mode 100644
index 0000000000..d651bb0182
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -0,0 +1,4 @@
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz.asc
+md5 1c47f4edc431cf19604a9f1b09975269 gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz
+# locally calculated
+sha256 3e60644846ac60693e58ad71a319d64c5f7bcf95ff34411272c8d9674f85648f gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
new file mode 100644
index 0000000000..515b66cd79
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-external-arm-aarch64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)
+
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
+
+$(eval $(toolchain-external-package))
