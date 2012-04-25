From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 12:14:24 -0300
Subject: [Buildroot] [PATCHv2] util-linux: disable installing binaries by
	default
Message-ID: <1335366864-25618-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable installing binaries by default.
This is to avoid installing unnecessary bloat when we just need
libblkid/libuuid for some packages like e2fsprogs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/Config.in     |   41 +++++++++++++++++++++++--------------
 package/util-linux/util-linux.mk |   37 +++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 43a8444..8c7973c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -11,6 +11,29 @@ config BR2_PACKAGE_UTIL_LINUX
 
 if BR2_PACKAGE_UTIL_LINUX
 
+config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	bool "libblkid"
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	bool "libmount"
+
+config BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	bool "libuuid"
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_BINARIES
+	bool "install utilities"
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Install util-linux binaries.
+
+if BR2_PACKAGE_UTIL_LINUX_BINARIES
+
 ############################################
 # default enabled and should be disabled by
 #  --disable-foo
@@ -18,28 +41,13 @@ if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "build mount utilties"
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 config BR2_PACKAGE_UTIL_LINUX_FSCK
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "build \"fsck\""
 
-config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	bool "build libmount"
-
-config BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	bool "build libuuid and uuid utilities"
-	default y
-
 config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	bool "build \"uuidd\""
 
-config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	bool "build libblkid and blkid utilities"
-	default y
-
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "build \"agetty\""
 
@@ -69,7 +77,6 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
 
 config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "build \"addpart, delpart, partx\""
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 ############################################
 # default disabled and should be enabled by
@@ -104,5 +111,7 @@ config BR2_PACKAGE_UTIL_LINUX_WRITE
 
 endif
 
+endif
+
 comment "util-linux requires a toolchain with LARGEFILE + WCHAR support"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d8a3ac9..08dbdcd 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -3,6 +3,7 @@
 # util-linux
 #
 #############################################################
+
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_VERSION_MAJOR = 2.20
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
@@ -11,7 +12,6 @@ UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkg-config
 UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
-
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
 # We don't want the host-busybox dependency to be added automatically
@@ -81,6 +81,41 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-fallocate --disable-unshare --disable-rename \
 	--disable-schedutils --disable-wall --disable-partx
 
+# Avoid the basic utilities if we just want the libraries
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),y)
+define UTIL_LINUX_INSTALL_BINARIES
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+define UTIL_LINUX_INSTALL_LIBBLKID
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libblkid \
+		DESTDIR=$(TARGET_DIR) install
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+define UTIL_LINUX_INSTALL_LIBMOUNT
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libmount \
+		DESTDIR=$(TARGET_DIR) install
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+define UTIL_LINUX_INSTALL_LIBUUID
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libuuid \
+		DESTDIR=$(TARGET_DIR) install
+endef
+endif
+
+define UTIL_LINUX_INSTALL_TARGET_CMDS
+	$(UTIL_LINUX_INSTALL_BINARIES)
+	$(UTIL_LINUX_INSTALL_LIBBLKID)
+	$(UTIL_LINUX_INSTALL_LIBMOUNT)
+	$(UTIL_LINUX_INSTALL_LIBUUID)
+endef
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
 
-- 
1.7.3.4
