From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:14:00 +0200
Subject: [Buildroot] [PATCH 10/10] libqwt: new package
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <655f8a8354c421c2c1147e56e4ed91ae6c12de81.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent GONZALEZ <br2@gezedo.com>

Patch initially written by Thomas Petazzoni, then reworked and updated
by Laurent Gonzalez, and finally cleaned up by Thomas again.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/libqwt/Config.in                           |   23 +++++++++
 package/libqwt/libqwt-remove-installed-check.patch |   32 ++++++++++++
 package/libqwt/libqwt.mk                           |   51 ++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 package/libqwt/Config.in
 create mode 100644 package/libqwt/libqwt-remove-installed-check.patch
 create mode 100644 package/libqwt/libqwt.mk

diff --git a/package/Config.in b/package/Config.in
index 36a2cd0..d3a1444 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -348,6 +348,7 @@ source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libqwt/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
diff --git a/package/libqwt/Config.in b/package/libqwt/Config.in
new file mode 100644
index 0000000..48b27ca
--- /dev/null
+++ b/package/libqwt/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBQWT
+	bool "libqwt"
+	depends on BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  Qwt is a graphics extension to the Qt GUI application
+	  framework. It provides a 2D plotting widget and more.
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
diff --git a/package/libqwt/libqwt-remove-installed-check.patch b/package/libqwt/libqwt-remove-installed-check.patch
new file mode 100644
index 0000000..7490a7b
--- /dev/null
+++ b/package/libqwt/libqwt-remove-installed-check.patch
@@ -0,0 +1,32 @@
+Remove useless check at build time
+
+At build time, Qwt looks whether the Qwt libraries are already
+installed in the destination directory, to avoid confusion between
+libraries installed system-wide and locally-built shared
+libraries. However, this behaviour conflicts with how Buildroot builds
+and installs libraries, so get rid of it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: qwt-6.0.0/qwtbuild.pri
+===================================================================
+--- qwt-6.0.0.orig/qwtbuild.pri	2011-09-12 19:37:35.663275952 +0200
++++ qwt-6.0.0/qwtbuild.pri	2011-09-12 19:37:41.913275949 +0200
+@@ -53,17 +53,3 @@
+ !debug_and_release {
+     OBJECTS_DIR       = obj
+ }
+-
+-unix {
+-
+-    exists( $${QMAKE_LIBDIR_QT}/libqwt.* ) {
+-
+-        # On some Linux distributions the Qwt libraries are installed 
+-        # in the same directory as the Qt libraries. Unfortunately
+-        # qmake always adds QMAKE_LIBDIR_QT at the beginning of the 
+-        # linker path, so that the installed libraries will be
+-        # used instead of the local ones.
+-
+-        error( "local build will conflict with $${QMAKE_LIBDIR_QT}/libqwt.*" )
+-    }
+-}
diff --git a/package/libqwt/libqwt.mk b/package/libqwt/libqwt.mk
new file mode 100644
index 0000000..44d7eda
--- /dev/null
+++ b/package/libqwt/libqwt.mk
@@ -0,0 +1,51 @@
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
+# After installation, we fixup the INSTALL_PREFIX in qwtconfig.pri so
+# that when building with qmake, -L$(STAGING_DIR)/usr/lib is used and
+# not -L/usr/lib.
+define LIBQWT_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
+	$(SED) "s%QWT_INSTALL_PREFIX = .*%QWT_INSTALL_PREFIX = $(STAGING_DIR)/usr%" \
+		$(STAGING_DIR)/usr/mkspecs/features/qwtconfig.pri
+endef
+
+define LIBQWT_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
+	rm -Rf $(TARGET_DIR)/usr/mkspecs
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
