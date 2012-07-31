From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:08:28 +0200
Subject: [Buildroot] [git commit] linux: Add new image formats for PowerPC
	and Microblaze
Message-ID: <20120731213819.07730827BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18e752de8712df676b31b32003acea57ace95cb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the following Linux kernel image formats:

 * cuImage(powerpc)
 * simpleImage(microblaze)
 * linux.bin(microblaze)

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |   21 +++++++++++++++++++++
 linux/linux.mk  |    6 ++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 553aa39..9bd88e1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -161,6 +161,27 @@ config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	select BR2_LINUX_KERNEL_DTS_SUPPORT
 	select BR2_LINUX_KERNEL_APPENDED_DTB
 
+config BR2_LINUX_KERNEL_CUIMAGE
+	bool "cuImage"
+	depends on BR2_powerpc
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+
+config BR2_LINUX_KERNEL_SIMPLEIMAGE
+	bool "simpleImage"
+	depends on BR2_microblaze
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+
+config BR2_LINUX_KERNEL_LINUX_BIN
+	bool "linux.bin"
+	depends on BR2_microblaze
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
diff --git a/linux/linux.mk b/linux/linux.mk
index d466228..5365d5f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -83,6 +83,12 @@ else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX_IMAGE_NAME=zImage
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
 LINUX_IMAGE_NAME=zImage
+else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
+LINUX_IMAGE_NAME=cuImage.$(KERNEL_DTS_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+LINUX_IMAGE_NAME=simpleImage.$(KERNEL_DTS_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
+LINUX_IMAGE_NAME=linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
