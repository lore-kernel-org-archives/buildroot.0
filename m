From: Laurent GONZALEZ <br2@gezedo.com>
Date: Sun, 29 Apr 2012 12:07:31 +0200
Subject: [Buildroot] [PATCH] libqwt: new package
Message-ID: <1335694051-21922-1-git-send-email-br2@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in        |    1 +
 package/libqwt/Config.in |   22 +++++++++++++++++++++
 package/libqwt/libqwt.mk |   48 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 package/libqwt/Config.in
 create mode 100644 package/libqwt/libqwt.mk

diff --git a/package/Config.in b/package/Config.in
index a310146..ce7c29d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -317,6 +317,7 @@ source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libqwt/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
diff --git a/package/libqwt/Config.in b/package/libqwt/Config.in
new file mode 100644
index 0000000..6c53ac5
--- /dev/null
+++ b/package/libqwt/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBQWT
+	bool "libqwt"
+	depends on BR2_PACKAGE_QT
+	help
+	  Qwt is a graphics extension to the Qt GUI application framework. It provides a 2D plotting widget and more.
+
+	  http://http://sourceforge.net/projects/qwt
+
+if BR2_PACKAGE_LIBQWT
+
+config BR2_PACKAGE_LIBQWT_SVG
+	bool "SVG support"
+	select BR2_PACKAGE_QT_SVG
+
+config BR2_PACKAGE_LIBQWT_MATHML
+	bool "MathML support"
+
+endif
+
+comment "libqwt requires qt"
+	depends on !BR2_PACKAGE_QT
+
diff --git a/package/libqwt/libqwt.mk b/package/libqwt/libqwt.mk
new file mode 100644
index 0000000..c97010c
--- /dev/null
+++ b/package/libqwt/libqwt.mk
@@ -0,0 +1,48 @@
+#############################################################
+#
+# libqwt
+#
+#############################################################
+LIBQWT_VERSION = 6.0.1
+LIBQWT_SOURCE = qwt-$(LIBQWT_VERSION).tar.bz2
+LIBQWT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/qwt/qwt/$(LIBQWT_VERSION)/
+LIBQWT_INSTALL_STAGING = YES
+LIBQWT_DEPENDENCIES = qt
+
+LIBQWT_CONFIG  =    's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
+LIBQWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDesigner.*$$/\# QWT_CONFIG += QwtDesigner/'
+LIBQWT_CONFIG += -e 's%/features%/mkspecs/features%'
+
+ifeq ($(BR2_PACKAGE_LIBQWT_SVG),y)
+	LIBQWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+else
+	LIBQWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQWT_MATHML),y)
+	LIBQWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/QWT_CONFIG += QwtMathML/'
+else
+	LIBQWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/\# QWT_CONFIG += QwtMathML/'
+endif
+
+define LIBQWT_CONFIGURE_CMDS
+	$(SED) $(LIBQWT_CONFIG) $(@D)/qwtconfig.pri
+	(cd $(@D); $(QT_QMAKE))
+endef
+
+define LIBQWT_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define LIBQWT_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
+	cp -a $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
+	$(SED) 's%QWT_INSTALL_PREFIX = /usr%QWT_INSTALL_PREFIX = $(STAGING_DIR)/usr%' $(HOST_DIR)/usr/mkspecs/features/qwtconfig.pri
+endef
+
+define LIBQWT_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
+	rm -Rf $(TARGET_DIR)/usr/mkspecs
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.5.4
