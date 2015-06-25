From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 25 Jun 2015 16:04:56 +0200
Subject: [Buildroot] [PATCH 2/2] xen: new package
In-Reply-To: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1435241096-23969-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package allows to compile both the Xen hypervisor image, and the Xen
tool stack intended to be used in the priviledged guest (aka dom0).

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ...mons-create-log-directory-before-using-it.patch | 31 ++++++++++++++
 package/xen/Config.in                              | 30 +++++++++++++
 package/xen/xen.hash                               |  2 +
 package/xen/xen.mk                                 | 49 ++++++++++++++++++++++
 5 files changed, 113 insertions(+)
 create mode 100644 package/xen/0001-xencommons-create-log-directory-before-using-it.patch
 create mode 100644 package/xen/Config.in
 create mode 100644 package/xen/xen.hash
 create mode 100644 package/xen/xen.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2ac422b..6e0124b2eceb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1421,6 +1421,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 endif
 	source "package/util-linux/Config.in"
+	source "package/xen/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/xen/0001-xencommons-create-log-directory-before-using-it.patch b/package/xen/0001-xencommons-create-log-directory-before-using-it.patch
new file mode 100644
index 000000000000..365cdc5b5a9b
--- /dev/null
+++ b/package/xen/0001-xencommons-create-log-directory-before-using-it.patch
@@ -0,0 +1,31 @@
+From a7d1fde9a14ca0cf9c3f7c7950a6f9ea89ff58a6 Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Thu, 25 Jun 2015 15:47:42 +0200
+Subject: [PATCH] xencommons: create log directory before using it
+
+In the case where /var/log is volatile, for example when using a tmpfs, the
+/var/log/xen directory will not be found on the system, and every attempt
+to log something to one of the files in that directory will fail.
+
+Create it in the xencommons init script
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ tools/hotplug/Linux/init.d/xencommons.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/hotplug/Linux/init.d/xencommons.in b/tools/hotplug/Linux/init.d/xencommons.in
+index a1095c29ce0f..89210a02120a 100644
+--- a/tools/hotplug/Linux/init.d/xencommons.in
++++ b/tools/hotplug/Linux/init.d/xencommons.in
+@@ -61,6 +61,7 @@ do_start () {
+ 
+ 	mkdir -p ${XEN_RUN_DIR}
+ 	mkdir -p ${XEN_LOCK_DIR}
++	mkdir -p /var/log/xen
+ 
+ 	if ! `${BINDIR}/xenstore-read -s / >/dev/null 2>&1`
+ 	then
+-- 
+2.4.3
+
diff --git a/package/xen/Config.in b/package/xen/Config.in
new file mode 100644
index 000000000000..33eb11c50a8e
--- /dev/null
+++ b/package/xen/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_XEN
+	bool "xen"
+	depends on BR2_arm || BR2_arm64 || \
+		BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # dtc (libfdt)
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2, util-linux
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_YAJL
+	help
+	  This builds the Xen hypervisor and toolstack
+
+	  http://www.xenproject.org/
+
+if BR2_PACKAGE_XEN
+
+config BR2_PACKAGE_XEN_HYPERVISOR
+	bool "Build the Xen hypervisor"
+
+config BR2_PACKAGE_XEN_TOOLS
+	bool "Build the Xen tools"
+endif
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
new file mode 100644
index 000000000000..7e9bcc123261
--- /dev/null
+++ b/package/xen/xen.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	5bdb40e2b28d2eeb541bd71a9777f40cbe2ae444b987521d33f099541a006f3b	xen-4.5.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
new file mode 100644
index 000000000000..fee9fdc12cdf
--- /dev/null
+++ b/package/xen/xen.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# Xen
+#
+################################################################################
+
+XEN_VERSION = 4.5.0
+XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
+XEN_INSTALL_IMAGES = YES
+
+XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
+
+XEN_MAKE_ENV = \
+	XEN_TARGET_ARCH=arm32 \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -D_FILE_OFFSET_BITS=64" \
+	CFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64" \
+	PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)
+
+XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
+XEN_MAKE_OPTS += dist-xen
+
+define XEN_INSTALL_IMAGES_CMDS
+	cp $(@D)/xen/xen $(BINARIES_DIR)
+endef
+else
+XEN_CONF_OPTS += --disable-xen
+endif
+
+XEN_CONF_OPTS += --disable-ocamltools
+
+ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
+XEN_MAKE_OPTS += dist-tools
+XEN_INSTALL_TARGET_OPTS += install-tools
+
+define XEN_RENAME_INIT_SCRIPTS
+	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
+	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
+	mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
+endef
+else
+XEN_CONF_OPTS += --disable-tools
+endif
+
+XEN_POST_INSTALL_TARGET_HOOKS += XEN_RENAME_INIT_SCRIPTS
+
+$(eval $(autotools-package))
-- 
2.4.3
