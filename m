From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Dec 2012 00:06:26 +0100
Subject: [Buildroot] [PATCH] qwt: new package
In-Reply-To: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
References: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1355094387-22886-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in                                  |  1 +
 package/qwt/Config.in                              | 17 +++++
 .../qwt/qwt-5.2.1-change-install-directories.patch | 23 +++++++
 package/qwt/qwt-5.2.1-disable-designer.patch       | 17 +++++
 package/qwt/qwt.mk                                 | 74 ++++++++++++++++++++++
 5 files changed, 132 insertions(+)
 create mode 100644 package/qwt/Config.in
 create mode 100644 package/qwt/qwt-5.2.1-change-install-directories.patch
 create mode 100644 package/qwt/qwt-5.2.1-disable-designer.patch
 create mode 100644 package/qwt/qwt.mk

diff --git a/package/Config.in b/package/Config.in
index 45ccbcf..88849d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -141,6 +141,7 @@ comment "QT libraries and helper libraries"
 source "package/grantlee/Config.in"
 source "package/qextserialport/Config.in"
 source "package/qtuio/Config.in"
+source "package/qwt/Config.in"
 endif
 
 source "package/x11r7/Config.in"
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
new file mode 100644
index 0000000..15e3925
--- /dev/null
+++ b/package/qwt/Config.in
@@ -0,0 +1,17 @@
+comment "Qwt requires Qt to be installed"
+	depends on !BR2_PACKAGE_QT
+
+config BR2_PACKAGE_QWT
+	bool "Qwt"
+	depends on BR2_PACKAGE_QT
+	help
+	  Qwt for Embedded Linux.
+
+	  http://qwt.sourceforge.net/
+
+config BR2_PACKAGE_QWT_EXAMPLES
+	bool "Examples"
+	depends on BR2_PACKAGE_QWT
+	select BR2_PACKAGE_QT_SVG
+	help
+	  Compile & install the examples.
diff --git a/package/qwt/qwt-5.2.1-change-install-directories.patch b/package/qwt/qwt-5.2.1-change-install-directories.patch
new file mode 100644
index 0000000..4c28065
--- /dev/null
+++ b/package/qwt/qwt-5.2.1-change-install-directories.patch
@@ -0,0 +1,23 @@
+Change install directories.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- qwt-5.2.1/src/src.pro.orig	2010-09-28 14:40:39.000000000 +0200
++++ qwt-5.2.1/src/src.pro	2010-09-28 14:41:29.000000000 +0200
+@@ -218,9 +218,12 @@
+ }
+ 
+ # Install directives
+-
+-headers.files  = $$HEADERS
+-doc.files      = $${QWT_ROOT}/doc/html $${QWT_ROOT}/doc/qwt-5.2.0.qch
++
++target.path = /usr/lib
++headers.files  = $$HEADERS
++headers.path = /usr/include/qwt-5.2.1
++doc.files      = $${QWT_ROOT}/doc/html $${QWT_ROOT}/doc/qwt-5.2.0.qch
++doc.path = /usr/doc/qwt-5.2.1
+ unix {
+     doc.files      += $${QWT_ROOT}/doc/man
+ }
diff --git a/package/qwt/qwt-5.2.1-disable-designer.patch b/package/qwt/qwt-5.2.1-disable-designer.patch
new file mode 100644
index 0000000..5d1bbe5
--- /dev/null
+++ b/package/qwt/qwt-5.2.1-disable-designer.patch
@@ -0,0 +1,17 @@
+Disable QwtDesigner.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- qwt-5.2.1/qwtconfig.pri.orig	2010-09-28 14:34:01.000000000 +0200
++++ qwt-5.2.1/qwtconfig.pri	2010-09-28 15:37:02.000000000 +0200
+@@ -115,7 +115,7 @@
+ # Otherwise you have to build it from the designer directory.
+ ######################################################################
+ 
+-CONFIG     += QwtDesigner
++#CONFIG     += QwtDesigner
+ 
+ ######################################################################
+ # If you want to auto build the examples, enable the line below
+
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
new file mode 100644
index 0000000..3d4e7f1
--- /dev/null
+++ b/package/qwt/qwt.mk
@@ -0,0 +1,74 @@
+######################################################################
+#
+# QWT
+#
+######################################################################
+QWT_VERSION = 5.2.1
+QWT_SOURCE = qwt-$(QWT_VERSION).zip
+QWT_SITE = http://sourceforge.net/projects/qwt/files/qwt/$(QWT_VERSION)
+# Qwt License v1.0 is a LGPL v2.1 with exceptions
+QWT_LICENSE = QWTv1.0
+QWT_LICENSE_FILES = COPYING
+
+QWT_DEPENDENCIES = qt
+
+QWT_INSTALL_STAGING = YES
+
+define QWT_EXTRACT_CMDS
+	$(RM) -rf $(QWT_DIR)
+	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(QWT_SOURCE)
+	test -d $(QWT_DIR) || \
+		mv $(BUILD_DIR)/$(subst .zip,,$(QWT_SOURCE)) $(QWT_DIR)
+endef
+
+ifeq ($(BR2_PACKAGE_QWT_EXAMPLES),y)
+define QWT_CONFIGURE_EXAMPLES
+	test ! -f $(@D)/examples/Makefile || $(MAKE) -C $(@D)/examples distclean
+	cd $(@D)/examples && $(QT_QMAKE)
+endef
+
+define QWT_BUILD_EXAMPLES
+	$(MAKE) -C $(@D)/examples
+endef
+
+define QWT_INSTALL_STAGING_EXAMPLES
+	$(INSTALL) -d $(STAGING_DIR)/usr/local/qwt-5.2.1/examples/bin
+	cp -f $(@D)/examples/bin/* \
+		$(STAGING_DIR)/usr/local/qwt-5.2.1/examples/bin
+endef
+
+define QWT_INSTALL_TARGET_EXAMPLES
+	$(INSTALL) -d $(TARGET_DIR)/usr/local/qwt-5.2.1/examples/bin
+	cp -f $(STAGING_DIR)/usr/local/qwt-5.2.1/examples/bin/* \
+		$(TARGET_DIR)/usr/local/qwt-5.2.1/examples/bin
+endef
+endif
+
+
+define QWT_CONFIGURE_CMDS
+	test ! -f $(@D)/Makefile || $(MAKE) -C $(@D) distclean
+	cd $(@D) && $(QT_QMAKE)
+	$(QWT_CONFIGURE_EXAMPLES)
+endef
+
+define QWT_BUILD_CMDS
+	$(MAKE) -C $(@D)
+	$(QWT_BUILD_EXAMPLES)
+endef
+
+define QWT_INSTALL_STAGING_CMDS
+	$(MAKE) INSTALL_ROOT=$(STAGING_DIR) -C $(@D) install
+	$(QWT_INSTALL_STAGING_EXAMPLES)
+endef
+
+define QWT_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libqwt.so* $(TARGET_DIR)/usr/lib/
+	$(QWT_INSTALL_TARGET_EXAMPLES)
+endef
+
+define QWT_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+	-rm $(TARGET_DIR)/usr/lib/libqwt.so.*
+endef
+
+$(eval $(generic-package))
-- 
1.8.0.1
