From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Sep 2011 12:52:22 -0300
Subject: [Buildroot] [PATCH] util-linux: disable installing binaries by
	default
Message-ID: <1316101942-2190-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable installing binaries by default based on a new "install basic
utilities" option.
This is to avoid installing unnecessary bloat when we just need
libblkid/libuuid for e2fsprogs for example.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/Config.in     |    5 +++++
 package/util-linux/util-linux.mk |   36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 816130d..4cacfca 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -16,6 +16,11 @@ if BR2_PACKAGE_UTIL_LINUX
 #  --disable-foo
 #
 
+config BR2_PACKAGE_UTIL_LINUX_BASIC
+	bool "install basic utilities"
+	help
+	  Install the basic util-linux binaries.
+
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "build mount utilties"
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 49c528a..acc9c93 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -3,6 +3,7 @@
 # util-linux
 #
 #############################################################
+
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_VERSION_MAJOR = 2.20
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
@@ -67,6 +68,41 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
 
+# Avoid the basic utilities if we just want the libraries
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_BASIC),y)
+define UTIL_LINUX_INSTALL_BASIC
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
+	$(UTIL_LINUX_INSTALL_BASIC)
+	$(UTIL_LINUX_INSTALL_LIBBLKID)
+	$(UTIL_LINUX_INSTALL_LIBMOUNT)
+	$(UTIL_LINUX_INSTALL_LIBUUID)
+endef
+
 $(eval $(call AUTOTARGETS,package,util-linux))
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
-- 
1.7.3.4
