From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 18:05:11 +0200
Subject: [Buildroot] [PATCH] linux: select BR2_PACKAGE_HOST_UBOOT_TOOLS
	instead of BR2_LINUX_KERNEL_UBOOT_IMAGE
Message-ID: <20170410160511.16278-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A long time ago, the blind config option BR2_LINUX_KERNEL_UBOOT_IMAGE
was introduced to be able to trigger the linux -> host-uboot-tools
dependency. Back in those days, there was no user-configurable
BR2_PACKAGE_HOST_UBOOT_TOOLS.

Now, however, it is possible to select a custom kernel image name that
needs uboot-tools, and manually enable BR2_PACKAGE_HOST_UBOOT_TOOLS. In
this case, however, the linux -> host-uboot-tools is missed and the
build is not reproducible. An example of such a situation is the
upcoming CI40 defconfig.

As a solution, remove BR2_LINUX_KERNEL_UBOOT_IMAGE entirely. Instead,
just select BR2_PACKAGE_HOST_UBOOT_TOOLS and add the dependency if it
is selected.

Note that this may introduce a redundant dependency in case the user
selected BR2_PACKAGE_HOST_UBOOT_TOOLS for some other reason (e.g. to
be able to generate a U-Boot environment to include in the image, while
the kernel is built as a zImage). However, the redundant dependency
shouldn't hurt much.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Abhimanyu Vishwakarma <abhimanyu.v@gmail.com>
---
 linux/Config.in | 13 +++++--------
 linux/linux.mk  |  4 +++-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2fbf689f9a..30a0b99063 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -187,9 +187,6 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
 # Binary format
 #
 
-config BR2_LINUX_KERNEL_UBOOT_IMAGE
-	bool
-
 choice
 	prompt "Kernel binary format"
 	default BR2_LINUX_KERNEL_ZIMAGE if BR2_arm || BR2_armeb
@@ -200,14 +197,14 @@ config BR2_LINUX_KERNEL_UIMAGE
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_sh || BR2_mips || BR2_mipsel || \
 		   BR2_mips64 || BR2_mips64el || BR2_xtensa
-	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
 	bool "uImage with appended DT"
 	depends on BR2_arm || BR2_armeb
 	select BR2_LINUX_KERNEL_DTS_SUPPORT
 	select BR2_LINUX_KERNEL_APPENDED_DTB
-	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
@@ -232,14 +229,14 @@ config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 config BR2_LINUX_KERNEL_CUIMAGE
 	bool "cuImage"
 	depends on BR2_powerpc
-	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 	select BR2_LINUX_KERNEL_DTS_SUPPORT
 	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 
 config BR2_LINUX_KERNEL_SIMPLEIMAGE
 	bool "simpleImage"
 	depends on BR2_microblaze
-	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 	select BR2_LINUX_KERNEL_DTS_SUPPORT
 	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 
@@ -250,7 +247,7 @@ config BR2_LINUX_KERNEL_IMAGE
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
 	depends on BR2_microblaze
-	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
diff --git a/linux/linux.mk b/linux/linux.mk
index 7973677d05..e387c7dd44 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -80,7 +80,9 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) = CONFIG_KERNEL_LZMA
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) = CONFIG_KERNEL_LZO
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) = CONFIG_KERNEL_XZ
 
-ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
+# If host-uboot-tools is selected by the user, assume it is needed to
+# create a custom image
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
 LINUX_DEPENDENCIES += host-uboot-tools
 endif
 
-- 
2.11.0
