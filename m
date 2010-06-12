From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:23 +0200
Subject: [Buildroot] [PATCH 49/49] linux: fix dependency on mkimage
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8e73aeb69e20635f7e7832e6694967adb3cb58eb.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the rework of the U-Boot configuration/compilation process, we
need to slightly rework how target/linux/Makefile.in.advanced depends
on mkimage on the host to produce an uImage.

target/linux/Makefile.in doesn't need to be fixed as it just doesn't
handle this dependency for the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/linux/Config.in.advanced   |    1 -
 target/linux/Makefile.in.advanced |    4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index d6c8559..645ed2e 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -383,7 +383,6 @@ config BR2_LINUX_BIN_BZIMAGE
 config BR2_LINUX_BIN_UIMAGE
 	bool "uImage"
 	depends on BR2_PACKAGE_LINUX
-	select BR2_TARGET_UBOOT
 
 config BR2_LINUX_BIN_VMLINUX
 	bool "vmlinux"
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 86d94ca..cc9d1e1 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -137,8 +137,8 @@ endif
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
-LINUX26_MKIMAGE_DIR:=$(BUILD_DIR)/u-boot-tools
-LINUX26_MKIMAGE_DEP:=$(LINUX26_MKIMAGE_DIR)/mkimage
+LINUX26_MKIMAGE_DIR:=$(MKIMAGE)
+LINUX26_MKIMAGE_DEP:=$(MKIMAGE)
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
-- 
1.7.0.4
