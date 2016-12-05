From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:16:56 +0100
Subject: [Buildroot] [git commit] toolchain-external-linaro-{arm,
	armeb}: allow on ARMv8
Message-ID: <20161205221749.D6DDA7FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=141358d83811f91b14fc33ecc524a4d843552f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linaro toolchains are currently only available on ARMv7-A, but can
in fact also be used to generate 32 bits code for ARMv8 platforms. This
commit therefore adjusts their architecture dependency.

Example, a 32 bits ARM build produces a 32 bits busybox binary:

$ file output/target/bin/busybox
output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux 2.6.32, BuildID[sha1]=16a7a70eb9cac08759e52a260478b9c287f59238, stripped

Which was built for Cortex-A72:

$ ./output/host/usr/bin/arm-linux-gnueabihf-readelf -A output/target/bin/busybox
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "Cortex-A72"
  Tag_CPU_arch: v8
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: FP for ARMv8
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_rounding: Needed
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6
  Tag_MPextension_use: Allowed
  Tag_Virtualization_use: TrustZone and Virtualization Extensions

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in   | 2 +-
 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index cef42e7..78aeb8e 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -6,7 +6,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2016.11"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index b2fed7f..c7f2f5f 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -6,7 +6,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2016.11"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
