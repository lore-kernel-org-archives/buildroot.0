From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 5 Aug 2011 00:02:41 +0300
Subject: [Buildroot] [PATCH] add QWT library: Qt Widgets for Technical
	Applications
Message-ID: <1312491761-15130-1-git-send-email-ivan.kuten@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, please consider adding QWT package to Buildroot.

Signed-off-by: Ivan Kuten <ivan.kuten@promwad.com>
---
 package/Config.in                                |    1 +
 package/qwt/Config.in                            |   10 ++++
 package/qwt/qwt-6.0.0-disable-svg-designer.patch |   40 ++++++++++++++
 package/qwt/qwt.mk                               |   60 ++++++++++++++++++++++
 4 files changed, 111 insertions(+), 0 deletions(-)
 create mode 100644 package/qwt/Config.in
 create mode 100644 package/qwt/qwt-6.0.0-disable-svg-designer.patch
 create mode 100644 package/qwt/qwt.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..6f9a671 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -117,6 +117,7 @@ source "package/sdl_gfx/Config.in"
 
 comment "other GUIs"
 source "package/qt/Config.in"
+source "package/qwt/Config.in"
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
new file mode 100644
index 0000000..5c53152
--- /dev/null
+++ b/package/qwt/Config.in
@@ -0,0 +1,10 @@
+comment "Qwt requires Qt to be installed"
+	depends on !BR2_PACKAGE_QT
+
+menuconfig BR2_PACKAGE_QWT
+	bool "Qwt"
+	depends on BR2_PACKAGE_QT
+	help
+	  Qt Widgets for Technical Applications
+
+	  http://qwt.sourceforge.net/
diff --git a/package/qwt/qwt-6.0.0-disable-svg-designer.patch b/package/qwt/qwt-6.0.0-disable-svg-designer.patch
new file mode 100644
index 0000000..54515e0
--- /dev/null
+++ b/package/qwt/qwt-6.0.0-disable-svg-designer.patch
@@ -0,0 +1,40 @@
+diff -urN qwt-6.0.0/qwtconfig.pri qwt-6.0.0_new/qwtconfig.pri
+--- qwt-6.0.0/qwtconfig.pri	2011-04-15 13:51:11.000000000 +0300
++++ qwt-6.0.0_new/qwtconfig.pri	2011-07-26 16:33:44.063285248 +0300
+@@ -79,7 +79,7 @@
+ # export a plot to a SVG document
+ ######################################################################
+ 
+-QWT_CONFIG     += QwtSvg
++QWT_CONFIG     -= QwtSvg
+ 
+ ######################################################################
+ # You can use the MathML renderer of the Qt solutions package to 
+@@ -98,7 +98,7 @@
+ # Otherwise you have to build it from the designer directory.
+ ######################################################################
+ 
+-QWT_CONFIG     += QwtDesigner
++QWT_CONFIG     -= QwtDesigner
+ 
+ ######################################################################
+ # If you want to auto build the examples, enable the line below
+diff -urN qwt-6.0.0/src/src.pro qwt-6.0.0_new/src/src.pro
+--- qwt-6.0.0/src/src.pro	2011-04-15 13:51:11.000000000 +0300
++++ qwt-6.0.0_new/src/src.pro	2011-07-26 16:33:44.019285248 +0300
+@@ -214,13 +214,13 @@
+ 
+ # Install directives
+ 
+-target.path    = $${QWT_INSTALL_LIBS}
++target.path    = /usr/lib/
+ 
+ doc.files      = $${QWT_ROOT}/doc/html 
+ unix:doc.files += $${QWT_ROOT}/doc/man
+ doc.path       = $${QWT_INSTALL_DOCS}
+ 
+-INSTALLS       = target doc
++INSTALLS       = target
+ 
+ CONFIG(lib_bundle) {
+ 
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
new file mode 100644
index 0000000..2ac038d
--- /dev/null
+++ b/package/qwt/qwt.mk
@@ -0,0 +1,60 @@
+######################################################################
+#
+# QWT
+#
+######################################################################
+
+QWT_VERSION:=6.0.0
+QWT_SOURCE:=qwt-$(QWT_VERSION).zip
+QWT_SITE:=https://sourceforge.net/projects/qwt/files/qwt/$(QWT_VERSION)
+QWT_UNZIP:=unzip
+QWT_TARGET_DIR:=$(BUILD_DIR)/qwt-$(QWT_VERSION)
+QWT_CONFIG_FILE:=qwt.pro
+QMAKE_DIR:=$(HOST_DIR)/usr
+
+$(DL_DIR)/$(QWT_SOURCE):
+	$(call DOWNLOAD,$(QWT_SITE),$(QWT_SOURCE))
+
+qwt-source: $(DL_DIR)/$(QWT_SOURCE)
+
+$(QWT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QWT_SOURCE)
+	$(QWT_UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(QWT_SOURCE)
+	toolchain/patch-kernel.sh $(QWT_TARGET_DIR) package/qwt/ \
+		qwt-$(QWT_VERSION)-\*.patch \
+		qwt-$(QWT_VERSION)-\*.patch.$(ARCH)
+	touch $@
+
+$(QWT_TARGET_DIR)/.configured: $(QWT_TARGET_DIR)/.unpacked
+	-[ -f $(QWT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QWT_TARGET_DIR) distclean
+	$(QMAKE_DIR)/bin/qmake $(QWT_TARGET_DIR)/$(QWT_CONFIG_FILE)
+	touch $@
+
+$(QWT_TARGET_DIR)/.compiled: $(QWT_TARGET_DIR)/.configured
+	$(MAKE) -C $(QWT_TARGET_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libqwt.so: $(QWT_TARGET_DIR)/.compiled
+	(export INSTALL_ROOT=$(STAGING_DIR); $(MAKE) -C $(QWT_TARGET_DIR) install)
+
+$(TARGET_DIR)/usr/lib/libqwt.so: $(STAGING_DIR)/usr/lib/libqwt.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libqwt.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libqwt.so*
+
+qwt: qt $(TARGET_DIR)/usr/lib/libqwt.so
+
+qwt-clean:
+	-$(MAKE) -C $(QWT_TARGET_DIR) clean
+	-rm $(TARGET_DIR)/usr/lib/libqwt.so.*
+	-rm $(STAGING_DIR)/usr/lib/libqwt.so.*
+
+qwt-dirclean:
+	rm -rf $(QWT_TARGET_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_QWT),y)
+TARGETS+=qwt
+endif
-- 
1.7.2.5
