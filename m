From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 13 Jul 2011 11:13:59 +0200
Subject: [Buildroot] [PATCH] New package: acl
Message-ID: <4E1D61D7.1080704@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

POSIX Access Control Lists, which are used to define more
fine-grained discretionary access rights for files and
directories.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/Config.in     |    1 +
 package/acl/Config.in |   10 ++++++++++
 package/acl/acl.mk    |   28 ++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/acl/Config.in
 create mode 100644 package/acl/acl.mk
 create mode 100644 package/attr/Config.in
 create mode 100644 package/attr/attr.mk

Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,7 @@
 endmenu
 
 menu "System tools"
+source "package/acl/Config.in"
 source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
Index: b/package/acl/Config.in
===================================================================
--- /dev/null
+++ b/package/acl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ACL
+	bool "acl"
+	select BR2_PACKAGE_ATTR
+	help
+	  POSIX Access Control Lists, which are used to define more
+	  fine-grained discretionary access rights for files and
+	  directories.
+	  This package also provides libacl.
+
+	  http://savannah.nongnu.org/projects/acl
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
+ACL_VERSION = 2.2.51
+ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
+ACL_SITE = http://download.savannah.gnu.org/releases/acl
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
