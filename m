From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Wed,  1 Apr 2015 12:30:57 +0200
Subject: [Buildroot] [PATCH 1/1] build host lz4 to support lz4 compression
	in the kernel.
Message-ID: <1427884257-20151-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selecting lz4 compression in the kernel configuration yields a
significant improvement in boot time. Therefore we need lz4 as
dependency for the kernel.
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 linux/linux.mk          |  2 +-
 package/lz4/host-lz4.mk | 21 +++++++++++++++++++++
 package/lz4/lz4.mk      |  9 ---------
 3 files changed, 22 insertions(+), 10 deletions(-)
 create mode 100644 package/lz4/host-lz4.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index 22fce35..137c64d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -49,7 +49,7 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES += host-kmod host-lzop
+LINUX_DEPENDENCIES += host-kmod host-lzop host-lz4
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 LINUX_DEPENDENCIES += host-uboot-tools
diff --git a/package/lz4/host-lz4.mk b/package/lz4/host-lz4.mk
new file mode 100644
index 0000000..03138f9
--- /dev/null
+++ b/package/lz4/host-lz4.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# host-lz4
+#
+################################################################################
+
+HOST_LZ4_VERSION = r123
+HOST_LZ4_SITE = $(call github,Cyan4973,lz4,$(HOST_LZ4_VERSION))
+HOST_LZ4_LICENSE = BSD-2c
+HOST_LZ4_LICENSE_FILES = LICENSE
+
+define HOST_LZ4_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define HOST_LZ4_INSTALL_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(host-generic-package))
+
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 38e10d8..6f8af03 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -17,14 +17,6 @@ endef
 LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
 endif
 
-define HOST_LZ4_BUILD_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define HOST_LZ4_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
-endef
-
 define LZ4_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) liblz4
 endef
@@ -38,4 +30,3 @@ define LZ4_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.3.3
