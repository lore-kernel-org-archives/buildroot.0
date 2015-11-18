From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 18 Nov 2015 15:37:01 +0100
Subject: [Buildroot] [PATCH 2/2] help: relocate help messages specific to
	one package
In-Reply-To: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
Message-ID: <1447857421-9380-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use $LOCAL_HELP feature in order to integrate help messages specific
to one package (linux-menuconfig, etc...) package they are
related.

It would be possible to do it using kconfig framework, but I was not
sure it is necessary to document kconfig targets systematicaly.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile                   | 16 ----------------
 boot/barebox/barebox.mk    |  5 +++++
 linux/linux.mk             |  7 +++++++
 package/busybox/busybox.mk |  4 ++++
 package/uclibc/uclibc.mk   |  4 ++++
 5 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index 4322da9..8c14281 100644
--- a/Makefile
+++ b/Makefile
@@ -885,22 +885,6 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
-endif
-ifeq ($(BR2_LINUX_KERNEL),y)
-	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
-	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
-	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
-	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
-endif
-ifeq ($(BR2_TARGET_BAREBOX),y)
-	@echo '  barebox-menuconfig     - Run barebox menuconfig'
-	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
-endif
 ifneq ($(LOCAL_HELP),)
 	@echo
 	@echo 'Local targets:'
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 00e1537..d8dde20 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -116,4 +116,9 @@ $(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or
 endif
 endif
 
+ifeq ($(BR2_TARGET_BAREBOX),y)
+	LOCAL_HELP += 'barebox-menuconfig     - Run barebox menuconfig'
+	LOCAL_HELP += 'barebox-savedefconfig  - Run barebox savedefconfig'
+endif
+
 $(eval $(kconfig-package))
diff --git a/linux/linux.mk b/linux/linux.mk
index 9507837..a4d1301 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -390,6 +390,13 @@ endif
 
 endif # BR_BUILDING
 
+ifeq ($(BR2_LINUX_KERNEL),y)
+	LOCAL_HELP += 'linux-menuconfig       - Run Linux kernel menuconfig'
+	LOCAL_HELP += 'linux-savedefconfig    - Run Linux kernel savedefconfig'
+	LOCAL_HELP += 'linux-update-defconfig - Save the Linux configuration to the path specified'
+	LOCAL_HELP += '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
+endif
+
 $(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7f6dbd6..3e6ca78 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -262,4 +262,8 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	LOCAL_HELP += 'busybox-menuconfig     - Run BusyBox menuconfig'
+endif
+
 $(eval $(kconfig-package))
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c62a40f..e8af45e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -470,4 +470,8 @@ $(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG set
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_UCLIBC),y)
+	LOCAL_HELP += 'uclibc-menuconfig      - Run uClibc menuconfig'
+endif
+
 $(eval $(kconfig-package))
-- 
2.1.4
