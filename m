From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 11:39:04 +0200
Subject: [Buildroot] [PATCH 1/4] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_BISON & BR2_LINUX_KERNEL_NEEDS_HOST_FLEX
Message-ID: <20180402093907.23274-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed pre-generated files and switched over to build-time
generation, for details see

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=033dba2ec06c47a9fe1b190bc3281058fb20738d
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=29c833061c1d8c2d1d23a62e7061561eadd76cdb
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in | 14 ++++++++++++++
 linux/linux.mk  |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d9c5b62863..487863875f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -420,6 +420,20 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
 	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
 	  libelf-devel or elfutils-libelf-devel".
 
+config BR2_LINUX_KERNEL_NEEDS_HOST_BISON
+	bool "Needs host bison"
+	help
+	  Linux kernel versions >= 4.16 need host-bison.
+
+	  Enable this option if you want to build a Linux kernel >= 4.16
+
+config BR2_LINUX_KERNEL_NEEDS_HOST_FLEX
+	bool "Needs host flex"
+	help
+	  Linux kernel versions >= 4.16 need host-flex.
+
+	  Enable this option if you want to build a Linux kernel >= 4.16
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 7609a15f23..f1bed1eb09 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,6 +88,14 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
 LINUX_DEPENDENCIES += host-elfutils
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_BISON),y)
+LINUX_DEPENDENCIES += host-bison
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_FLEX),y)
+LINUX_DEPENDENCIES += host-flex
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
-- 
2.14.2
