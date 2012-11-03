From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:52 +0100
Subject: [Buildroot] [PATCH 07/18] busybox: add support to link against
	libtirpc when available
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <97979d348585d1faffa214caeaf25becfd129004.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   19 +++++++++++++++++--
 package/libtirpc/Config.in |    5 -----
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 306b46f..b43f779 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,14 +15,29 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
+BUSYBOX_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-I$(LINUX_HEADERS_DIR)/include
+
+BUSYBOX_LDFLAGS = \
+	$(TARGET_LDFLAGS)
+
+# Link against libtirpc if available so that we can leverage its RPC
+# support for NFS mounting with Busybox
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
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 0172f0d..7e891b4 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBTIRPC
 	bool "libtirpc"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
 
 	  http://sourceforge.net/projects/libtirpc/
-
-config BR2_RPC_SUPPORT_AVAILABLE
-       bool
-       default y if (BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_PACKAGE_LIBTIRPC)
-- 
1.7.9.5
