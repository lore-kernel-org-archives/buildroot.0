From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 17:34:22 +0100
Subject: [Buildroot] [git commit] package/gnu-efi: introduce
 BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS option
Message-ID: <20190112164856.3E5248B8A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8064b12ff9d0a28091513e338d0f5b59a95d1396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be used in packages that depend on gnu-efi, and we take this
opportunity to propagate this dependency where it was missing in
gummiboot and syslinux. In practice, it was not a problem because
gummiboot and syslinux are only available on i386 and x86-64, which is
a subset of the architectures supported by gnu-efi.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/gummiboot/Config.in  |  1 +
 boot/syslinux/Config.in   |  1 +
 package/gnu-efi/Config.in | 11 +++++++++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
index 11dbc4f6b7..1b5c4279f7 100644
--- a/boot/gummiboot/Config.in
+++ b/boot/gummiboot/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_GUMMIBOOT
 	bool "gummiboot"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	select BR2_PACKAGE_GNU_EFI
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index e969d53fd0..339a97f0e4 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -44,6 +44,7 @@ config BR2_TARGET_SYSLINUX_MBR
 
 config BR2_TARGET_SYSLINUX_EFI
 	bool "install efi"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	select BR2_PACKAGE_GNU_EFI
 	help
 	  Install the 'efi' image, to boot from an EFI environment.
diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index d8d92c2c17..d456a23837 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,7 +1,14 @@
+config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_HAS_ARM
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_GNU_EFI
 	bool "gnu-efi"
-	depends on BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || \
-		BR2_aarch64_be || BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	help
 	  Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64
 	  (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain
