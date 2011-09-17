From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:58 +0200
Subject: [Buildroot] [PATCH 8/8] Add support for the RTAI real-time extension
In-Reply-To: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7866cdfadfff98de581f66937b224319f83bc681.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.ext.in     |   13 +++++++++++++
 linux/linux-ext-rtai.mk |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 package/Config.in       |    1 +
 package/rtai/Config.in  |    2 ++
 package/rtai/rtai.mk    |   16 ++++++++++++++++
 5 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 linux/linux-ext-rtai.mk
 create mode 100644 package/rtai/Config.in
 create mode 100644 package/rtai/rtai.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index fc37d23..bbbe612 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -15,4 +15,17 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 	  and verify that your kernel version in buildroot matches.
 
+# RTAI
+config BR2_LINUX_KERNEL_EXT_RTAI
+       bool "RTAI Real-time patch"
+       select BR2_PACKAGE_RTAI
+       help
+         RTAI Kernel part.
+
+config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
+       depends on BR2_LINUX_KERNEL_EXT_RTAI
+       string "Path for RTAI patch file"
+       help
+         Optionally, explicitly specify the RTAI patch to use.
+
 endmenu
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
new file mode 100644
index 0000000..a54230d
--- /dev/null
+++ b/linux/linux-ext-rtai.mk
@@ -0,0 +1,47 @@
+##################################################
+# Linux RTAI extensions
+#
+# Patch the linux kernel with RTAI extension
+##################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_RTAI),y)
+# Add dependency to RTAI (user-space) which provide kernel patches
+LINUX_DEPENDENCIES += rtai-patch
+
+RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
+
+ifeq ($(KERNEL_ARCH),i386)
+RTAI_ARCH = x86
+else ifeq ($(KERNEL_ARCH),x86_64)
+RTAI_ARCH = x86
+else ifeq ($(KERNEL_ARCH),powerpc)
+RTAI_ARCH = ppc
+else
+RTAI_ARCH = $(KERNEL_ARCH)
+endif
+
+# Prepare kernel patch
+ifeq ($(RTAI_PATCH),)
+define RTAI_PREPARE_KERNEL
+	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
+	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
+		support/script/apply-patches.sh $(LINUX_DIR) 		\
+			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
+			hal-linux-$${kver}-*patch ; \
+	else \
+		echo "No RTAI patch for your kernel version" ; \
+		exit 1 ; \
+	fi
+endef
+else
+define RTAI_PREPARE_KERNEL
+	support/script/apply-patches.sh 	\
+		$(LINUX_DIR)			\
+		$(dir $(RTAI_PATCH))		\
+		$(notdir $(RTAI_PATCH))
+endef
+endif
+
+LINUX_POST_PATCH_HOOKS += RTAI_PREPARE_KERNEL
+
+endif #BR2_LINUX_EXT_RTAI
diff --git a/package/Config.in b/package/Config.in
index efb266a..451b271 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ endmenu
 
 menu "Real-Time"
 source "package/xenomai/Config.in"
+source "package/rtai/Config.in"
 endmenu
 
 menu "Shell and utilities"
diff --git a/package/rtai/Config.in b/package/rtai/Config.in
new file mode 100644
index 0000000..d08e4cb
--- /dev/null
+++ b/package/rtai/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_RTAI
+        bool "rtai"
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
new file mode 100644
index 0000000..2f67cc0
--- /dev/null
+++ b/package/rtai/rtai.mk
@@ -0,0 +1,16 @@
+RTAI_VERSION = 3.8.1
+RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
+RTAI_SITE    = http://www.rtai.org/RTAI/
+
+RTAI_DEPENDENCIES = linux
+
+RTAI_CONF_OPT = \
+	--with-linux-dir=$(LINUX_DIR) 	\
+	--disable-leds		      	\
+	--disable-rtailab		\
+	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/kernel/rtai
+
+RTAI_MAKE = $(MAKE1)
+
+$(eval $(call AUTOTARGETS,package,rtai))
+
-- 
1.7.4.1
