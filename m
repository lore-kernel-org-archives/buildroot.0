From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:38 +0200
Subject: [Buildroot] [PATCH 06/20] busybox: add support to link against
	libtirpc when available
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <982e7938fd23732ce642ef91ecdc26b0f073b4c7.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7277301..17c8317 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -12,14 +12,28 @@ BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
+
+BUSYBOX_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-I$(LINUX_HEADERS_DIR)/include
+
+BUSYBOX_LDFLAGS = \
+	$(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+BUSYBOX_DEPENDENCIES += libtirpc
+BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+BUSYBOX_LDFLAGS += -ltirpc
+endif
+
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
-BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
+BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(BUSYBOX_CFLAGS)"
 BUSYBOX_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
-	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+	EXTRA_LDFLAGS="$(BUSYBOX_LDFLAGS)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_PREFIX="$(TARGET_DIR)" \
 	SKIP_STRIP=y
@@ -79,7 +93,7 @@ endef
 endif
 
 # If RPC is enabled then enable nfs mounts
-ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),y)
+ifeq ($(BR2_RPC_AVAILABLE),y)
 define BUSYBOX_SET_RPC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
 endef
-- 
1.7.9.5
