From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 13 Jul 2011 11:12:29 +0200
Subject: [Buildroot] [PATCH] New package: attr
Message-ID: <4E1D617D.4080303@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commands for Manipulating Filesystem Extended Attributes.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/Config.in      |    1 +
 package/attr/Config.in |    7 +++++++
 package/attr/attr.mk   |   27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

Index: b/package/attr/Config.in
===================================================================
--- /dev/null
+++ b/package/attr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ATTR
+	bool "attr"
+	help
+	  Commands for Manipulating Filesystem Extended Attributes.
+	  This package also provides libattr.
+
+	  http://savannah.nongnu.org/projects/attr
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
+ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
+ATTR_SITE = http://download.savannah.gnu.org/releases/attr
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
Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,7 @@
 endmenu
 
 menu "System tools"
+source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
