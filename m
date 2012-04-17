From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 17 Apr 2012 12:19:12 +0200
Subject: [Buildroot] [PATCH 1/2] udev: replace UDEV_ALL_EXTRAS with more
	fine-grained options
Message-ID: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace the BR2_PACKAGE_UDEV_ALL_EXTRAS options with a bunch of
configuration choices that allow more fine-grainded control over
the features that should be built into udev.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/udev/Config.in |   39 ++++++++++++++++++++++++++++++---------
 package/udev/udev.mk   |   41 ++++++++++++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 20 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index d3244d1..55daa01 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -15,20 +15,41 @@ config BR2_PACKAGE_UDEV
 
 if BR2_PACKAGE_UDEV
 
+config BR2_PACKAGE_UDEV_ACL
+	bool "enable acl permissions"
+	help
+	  Enable enable local user acl permissions support
+
+config BR2_PACKAGE_UDEV_GUDEV
+	bool "enable GObject libudev support"
+	help
+	  Enable GObject libudev support
+
+config BR2_PACKAGE_UDEV_HWDATA
+	bool "enable hardware data"
+	help
+	  Enable hardware identification and configuration data
+
+config BR2_PACKAGE_UDEV_INTROSPECTION
+	bool "enable GObject introspection"
+	help
+	  Enable GObject introspection support
+
+config BR2_PACKAGE_UDEV_KEYMAP
+	bool "enable keymap fixup"
+	help
+	  Enable keymap fixup support
+
+config BR2_PACKAGE_UDEV_MTD
+	bool "enable MTD support"
+	help
+	  Enable MTD probe support
+
 config BR2_PACKAGE_UDEV_RULES_GEN
 	bool "enable rules generator"
 	help
 	  Enable persistant rules generator
 
-config BR2_PACKAGE_UDEV_ALL_EXTRAS
-	bool "enable all extras"
-	select BR2_PACKAGE_ACL
-	select BR2_PACKAGE_HWDATA
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  Enable all extras with external dependencies like
-	  libacl, hwdata and libglib2
-
 endif
 
 comment "udev requires /dev mgmnt set to udev under System configuration"
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 726aed6..13c0895 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -15,24 +15,43 @@ UDEV_CONF_OPT =			\
 	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
 	--libexecdir=/lib	\
-	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
-	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
 	--with-firmware-path=/lib/firmware		\
-	--disable-introspection
+	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
+	--with-pci-ids-path=/usr/share/hwdata/pci.ids
 
 UDEV_DEPENDENCIES = host-gperf host-pkg-config util-linux kmod
 
-ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
-UDEV_CONF_OPT += --enable-rule_generator
+ifeq ($(BR2_PACKAGE_UDEV_ACL),y)
+UDEV_CONF_OPT += --enable-udev_acl
+UDEV_DEPENDENCIES += acl
+endif
+
+ifeq ($(BR2_PACKAGE_UDEV_GUDEV),y)
+UDEV_DEPENDENCIES += libglib2
+else
+UDEV_CONF_OPT += --disable-gudev
+endif
+
+ifeq ($(BR2_PACKAGE_UDEV_HWDATA),y)
+UDEV_DEPENDENCIES += hwdata
 endif
 
-ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += acl hwdata libglib2
-UDEV_CONF_OPT +=		\
-	--enable-udev_acl
+ifeq ($(BR2_PACKAGE_UDEV_INTROSPECTION),y)
+UDEV_DEPENDENCIES += libglib2
 else
-UDEV_CONF_OPT +=		\
-	--disable-gudev
+UDEV_CONF_OPT += --disable-introspection
+endif
+
+ifneq ($(BR2_PACKAGE_UDEV_KEYMAP),y)
+UDEV_CONF_OPT += --disable-keymap
+endif
+
+ifneq ($(BR2_PACKAGE_UDEV_MTD),y)
+UDEV_CONF_OPT += --disable-mtd_probe
+endif
+
+ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
+UDEV_CONF_OPT += --enable-rule_generator
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
1.7.9.5
