From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 23:00:07 +0200
Subject: [Buildroot] [git commit] Add support for the RTAI real-time
	extension
Message-ID: <20110918210216.92DF48D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8797a9cd1fe6723db34b0c125d0d9d04e3483e8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix rtai Config.in]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.ext.in     |   13 +++++++++++++
 linux/linux-ext-rtai.mk |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 package/Config.in       |    1 +
 package/rtai/Config.in  |    7 +++++++
 package/rtai/rtai.mk    |   15 +++++++++++++++
 5 files changed, 83 insertions(+), 0 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 893edb5..8a9f87e 100644
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
index 0000000..ecbff38
--- /dev/null
+++ b/package/rtai/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RTAI
+	bool "rtai"
+	depends on BR2_LINUX_KERNEL_EXT_RTAI
+	help
+	  RTAI - the RealTime Application Interface for Linux.
+
+	  http://www.rtai.org
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
new file mode 100644
index 0000000..abba614
--- /dev/null
+++ b/package/rtai/rtai.mk
@@ -0,0 +1,15 @@
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
