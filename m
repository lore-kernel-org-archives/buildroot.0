From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Mar 2013 10:58:13 +0100
Subject: [Buildroot] [git commit] linux: Add a load address option for
	building uImage on 3.7+ multi-platform kernels
Message-ID: <20130315154408.6FABD9B110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8215e19b5343387db0714bcc373030ee4a565e68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add quotes as suggested by Arnout]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   13 +++++++++++++
 linux/linux.mk  |    5 +++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 94ce951..a44880f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -213,6 +213,19 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
+	string "load address (for 3.7+ multi-platform image)"
+	depends on BR2_arm || BR2_armeb
+	depends on BR2_LINUX_KERNEL_UIMAGE || BR2_LINUX_KERNEL_APPENDED_UIMAGE
+	help
+	  If your ARM system's Linux kernel is configured with the new (3.7+)
+	  multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your
+	  kernel config), then it is necessary to specify a kernel load address
+	  when building the uImage. This should be a hexadecimal string
+	  beginning with 0x, for example: 0x00008000.
+
+	  If unsure, let this option empty.
+
 config BR2_LINUX_KERNEL_DTS_SUPPORT
 	bool "Device tree support"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 0352acd..8a73767 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -95,6 +95,11 @@ LINUX_IMAGE_NAME=vmlinuz
 endif
 endif
 
+LINUX_KERNEL_UIMAGE_LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
+ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
+LINUX_MAKE_FLAGS+=LOADADDR="$(LINUX_KERNEL_UIMAGE_LOADADDR)"
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 LINUX_IMAGE_TARGET=zImage
 else
