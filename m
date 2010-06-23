From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] Remove now unused Config.in for
	kernel selection
Message-ID: <20100623092837.7163581886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b7b4260966a5d991b1dabc82c792fbecd77c63a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now linux/Config.in that allows to configure the kernel
configuration/compilation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in |   50 --------------------------------------------------
 1 files changed, 0 insertions(+), 50 deletions(-)
 delete mode 100644 target/Config.in

diff --git a/target/Config.in b/target/Config.in
deleted file mode 100644
index 2d96793..0000000
--- a/target/Config.in
+++ /dev/null
@@ -1,50 +0,0 @@
-menu "Kernel"
-choice
-	prompt "Kernel type"
-	default BR2_KERNEL_none
-
-config BR2_KERNEL_none
-	bool "none"
-	help
-	  Do not build a kernel
-
-config BR2_KERNEL_LINUX_ADVANCED
-	bool "linux (Advanced configuration)"
-	select BR2_PACKAGE_LINUX
-	help
-	  The Linux kernel - Advanced Configuration.
-	  http://www.kernel.org/
-
-	  Note: Requires kernel-headers >= 2.6.19 since the other
-	        kernel headers are just that (headers) and not full
-	        kernels. This is a feature.
-
-# The kernel with the same version as linux headers cannot be compiled
-# when using an external toolchain, because the linux headers are not
-# handled by Buildroot in this case.
-if BR2_TOOLCHAIN_BUILDROOT
-
-config BR2_KERNEL_LINUX
-	bool "linux (Same version as linux headers)"
-	select BR2_PACKAGE_LINUX
-	help
-	  The Linux kernel.
-	  http://www.kernel.org/
-
-	  Note: Requires kernel-headers >= 2.6.19 since the other
-	        kernel headers are just that (headers) and not full
-	        kernels. This is a feature.
-
-endif
-
-endchoice
-
-config BR2_PACKAGE_LINUX
-	bool
-
-if BR2_PACKAGE_LINUX
-source "target/linux/Config.in"
-source "target/linux/Config.in.advanced"
-endif
-
-endmenu
-- 
1.7.1
