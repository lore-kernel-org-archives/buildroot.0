From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:43:47 +0200
Subject: [Buildroot] [git commit] linux/ext: fix Xenomai unmet dependencies
Message-ID: <20160911134931.3D9BF8180C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f5802c16f0c1e13b97ae9a8a6385d3af57edbe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Properly propagate the Xenomai dependencies to the corresponding kernel
extension, to fix the following unmet dependencies:

    warning: (BR2_LINUX_KERNEL_EXT_XENOMAI) selects BR2_PACKAGE_XENOMAI
    which has unmet direct dependencies (BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
    && BR2_TOOLCHAIN_HAS_THREADS && !BR2_TOOLCHAIN_USES_MUSL)

While at it, move the comment lower, after the path option, so that the
path option is properly indented in the menuconfig.

Add markers to separate each extension.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.ext.in | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 755c23b..da1ebd2 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -1,11 +1,12 @@
 menu "Linux Kernel Extensions"
 
+#-------------------------------------------------------------------------------
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
 	bool "Adeos/Xenomai Real-time patch"
+	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-		   BR2_bfin || BR2_powerpc || BR2_sh4
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_XENOMAI
 	help
 	  Xenomai is split in two parts: a kernel part and a userspace
@@ -24,19 +25,19 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2
 	  and PowerPC architectures.
 
-comment "xenomai needs a toolchain w/ threads"
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-		   BR2_bfin || BR2_powerpc || BR2_sh4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
-	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	string "Path for Adeos patch file"
+	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	help
 	  Optionally, explicitly specify the Adeos patch to use.
 	  Download it at http://download.gna.org/adeos/patches
 	  and verify that your kernel version in buildroot matches.
 
+comment "xenomai needs a uClibc or glibc toolchain w/ threads"
+	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+
+#-------------------------------------------------------------------------------
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
@@ -44,6 +45,7 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	help
 	  RTAI Kernel part.
 
+#-------------------------------------------------------------------------------
 # fbtft
 config BR2_LINUX_KERNEL_EXT_FBTFT
 	bool "FB TFT drivers"
