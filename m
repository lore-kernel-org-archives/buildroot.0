From: David Lechner <david@lechnology.com>
Date: Sun, 30 Oct 2016 18:32:25 -0500
Subject: [Buildroot] [PATCH 3/4] linux: add ev3dev extension
In-Reply-To: <1477870346-4941-1-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
Message-ID: <1477870346-4941-4-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds an ev3dev extension that provides linux kernel drivers for LEGO
MINDSTORMS EV3 from the ev3dev project.

Signed-off-by: David Lechner <david@lechnology.com>
---
 linux/Config.ext.in                    | 10 ++++++++++
 linux/linux-ext-ev3dev.mk              | 13 +++++++++++++
 package/Config.in                      |  1 +
 package/ev3dev/Config.in               | 12 ++++++++++++
 package/ev3dev/ev3dev.mk               | 11 +++++++++++
 package/ev3dev/lego-linux-drivers.hash |  2 ++
 support/scripts/pkg-stats              |  1 +
 7 files changed, 50 insertions(+)
 create mode 100644 linux/linux-ext-ev3dev.mk
 create mode 100644 package/ev3dev/Config.in
 create mode 100644 package/ev3dev/ev3dev.mk
 create mode 100644 package/ev3dev/lego-linux-drivers.hash

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 5d5e7ef..552d482 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -46,6 +46,16 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	  RTAI Kernel part.
 
 #-------------------------------------------------------------------------------
+# ev3dev
+config BR2_LINUX_KERNEL_EXT_EV3DEV
+	bool "ev3dev drivers"
+	select BR2_PACKAGE_EV3DEV
+	help
+	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project.
+
+	  https://github.com/ev3dev/lego-linux-drivers
+
+#-------------------------------------------------------------------------------
 # fbtft
 config BR2_LINUX_KERNEL_EXT_FBTFT
 	bool "FB TFT drivers"
diff --git a/linux/linux-ext-ev3dev.mk b/linux/linux-ext-ev3dev.mk
new file mode 100644
index 0000000..23e4c8d
--- /dev/null
+++ b/linux/linux-ext-ev3dev.mk
@@ -0,0 +1,13 @@
+################################################################################
+# Linux ev3dev extensions
+#
+# Patch the linux kernel with ev3dev extension
+################################################################################
+
+LINUX_EXTENSIONS += ev3dev
+
+define EV3DEV_PREPARE_KERNEL
+	dest=drivers/lego ; \
+	mkdir -p $(LINUX_DIR)/$${dest}; \
+	cp -dpfr $(EV3DEV_DIR)/* $(LINUX_DIR)/$${dest}/
+endef
diff --git a/package/Config.in b/package/Config.in
index 0f6260b..78a5029 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/eeprog/Config.in"
 	source "package/eudev/Config.in"
+	source "package/ev3dev/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fan-ctrl/Config.in"
diff --git a/package/ev3dev/Config.in b/package/ev3dev/Config.in
new file mode 100644
index 0000000..2509f0c
--- /dev/null
+++ b/package/ev3dev/Config.in
@@ -0,0 +1,12 @@
+# Prompt-less option, because this package is not doing anything except
+# downloading the ev3dev driver sources. The real work is done by a Linux
+# extension.
+config BR2_PACKAGE_EV3DEV
+	bool
+	depends on BR2_LINUX_KERNEL
+	help
+	  Linux drivers for LEGO MINDSTORMS EV3
+
+	  This is only the download helper for the kernel patch.
+
+	  https://github.com/ev3dev/lego-linux-drivers
diff --git a/package/ev3dev/ev3dev.mk b/package/ev3dev/ev3dev.mk
new file mode 100644
index 0000000..653387b
--- /dev/null
+++ b/package/ev3dev/ev3dev.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# ev3dev
+#
+################################################################################
+
+EV3DEV_VERSION = 0e551eb25ae8600c1f178814781bfb42dc835496
+EV3DEV_SITE = $(call github,ev3dev,lego-linux-drivers,$(EV3DEV_VERSION))
+EV3DEV_LICENSE = GPLv2
+
+$(eval $(generic-package))
diff --git a/package/ev3dev/lego-linux-drivers.hash b/package/ev3dev/lego-linux-drivers.hash
new file mode 100644
index 0000000..cc48f65
--- /dev/null
+++ b/package/ev3dev/lego-linux-drivers.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  9d2740b348c8d43e7e15fedc4cec99bf351a3a2ba8691f2a07c439a9c034bc04  lego-linux-drivers-0e551eb25ae8600c1f178814781bfb42dc835496.tar.gz
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc3bef4..d0a6fe6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -94,6 +94,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 
     if test \
 	$i = "boot/common.mk" -o \
+	$i = "linux/linux-ext-ev3dev.mk" -o \
 	$i = "linux/linux-ext-fbtft.mk" -o \
 	$i = "linux/linux-ext-xenomai.mk" -o \
 	$i = "linux/linux-ext-rtai.mk" -o \
-- 
2.7.4
