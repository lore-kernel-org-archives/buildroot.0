From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 12 Jul 2011 10:00:59 +0200
Subject: [Buildroot] [PATCH v3] New packages: acl and attr
Message-ID: <4E1BFF3B.4040606@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to providing the acl and extended attributes functionality,
these new packages satisfy newer udev versions, so you can build all extras.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in      |    2 ++
 package/acl/Config.in  |    8 ++++++++
 package/acl/acl.mk     |   28 ++++++++++++++++++++++++++++
 package/attr/Config.in |    7 +++++++
 package/attr/attr.mk   |   27 +++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)
 create mode 100644 package/acl/Config.in
 create mode 100644 package/acl/acl.mk
 create mode 100644 package/attr/Config.in
 create mode 100644 package/attr/attr.mk

Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,8 @@
 endmenu
 
 menu "System tools"
+source "package/acl/Config.in"
+source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
Index: b/package/acl/Config.in
===================================================================
--- /dev/null
+++ b/package/acl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ACL
+	bool "acl"
+	select BR2_PACKAGE_ATTR
+	help
+	  POSIX Access Control Lists, which are used to define more
+	  fine-grained discretionary access rights for files and
+	  directories.
+	  This package also provides libacl.
Index: b/package/acl/acl.mk
===================================================================
--- /dev/null
+++ b/package/acl/acl.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# acl
+#
+#############################################################
+
+ACL_VERSION = 2.2.49
+ACL_SOURCE = acl_$(ACL_VERSION).orig.tar.gz
+ACL_SITE = http://ftp.debian.org/debian/pool/main/a/acl
+ACL_INSTALL_STAGING = YES
+ACL_DEPENDENCIES = attr
+ACL_CONF_OPT = --enable-gettext=no
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+ACL_INSTALL_STAGING_OPT = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
+	install-dev install-lib
+
+ACL_INSTALL_TARGET_OPT = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install install-lib
+
+$(eval $(call AUTOTARGETS,package,acl))
Index: b/package/attr/Config.in
===================================================================
--- /dev/null
+++ b/package/attr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ATTR
+	bool "attr"
+	help
+	  Extended attributes are name:value pairs associated permanently with
+	  files and directories, similar to the environment strings associated
+	  with a process
+	  This package also provides libattr.
Index: b/package/attr/attr.mk
===================================================================
--- /dev/null
+++ b/package/attr/attr.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+
+ATTR_VERSION = 2.4.46
+ATTR_SOURCE = attr_$(ATTR_VERSION).orig.tar.gz
+ATTR_SITE = http://ftp.debian.org/debian/pool/main/a/attr
+ATTR_INSTALL_STAGING = YES
+ATTR_CONF_OPT = --enable-gettext=no
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+ATTR_INSTALL_STAGING_OPT = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
+	install-dev install-lib
+
+ATTR_INSTALL_TARGET_OPT = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install install-lib
+
+$(eval $(call AUTOTARGETS,package,attr))
