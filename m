From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Sep 2010 14:43:25 +0200
Subject: [Buildroot] [git commit master 1/1] barebox/u-boot/linux: don't
	error out on missing config when make source
Message-ID: <20100928124500.461D38B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3e5e39a8a25a4a085afe08bdcf46933c8d569ed7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it breaks 'make allyesconfig; make source', used for the source mirror.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    4 +++-
 boot/u-boot/u-boot.mk   |    4 +++-
 linux/linux.mk          |    5 ++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7c2cbc1..85224ca 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -53,9 +53,11 @@ barebox: $(BAREBOX_DIR)/.installed
 ifeq ($(BR2_TARGET_BAREBOX),y)
 TARGETS+=barebox
 
-# we NEED a board defconfig file
+# we NEED a board defconfig file unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BAREBOX_BOARD_DEFCONFIG),)
 $(error No Barebox defconfig file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)
 endif
+endif
 
 endif
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index f97674a..9719207 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -193,9 +193,11 @@ u-boot-configured: $(U_BOOT_DIR)/.header_modified
 ifeq ($(BR2_TARGET_UBOOT),y)
 TARGETS+=u-boot
 
-# we NEED a board name
+# we NEED a board name unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(U_BOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
+endif
 
 endif
diff --git a/linux/linux.mk b/linux/linux.mk
index ea338fc..aabecc1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -159,6 +159,7 @@ TARGETS+=linux26
 endif
 
 # Checks to give errors that the user can understand
+ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
 $(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
@@ -169,4 +170,6 @@ ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
 $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
 endif
-endif
\ No newline at end of file
+endif
+
+endif
-- 
1.7.1
