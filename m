From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Apr 2011 18:52:51 +0200
Subject: [Buildroot] [PATCH 1/2] qt: fix plugin installation and change
	plugin path
In-Reply-To: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
References: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5dc3f963b1e5b12f9a5bb7bf4972619bce18371e.1301763163.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the conversion of Qt to GENTARGETS in
421cda1fd078f5fa7902f05bd1d2021fd101d9ea, plugin installation could
break in some situations, for example if SQL support was enabled, but
without any SQL driver: the sql plugin directory doesn't exist, but
our qt.mk wanted to copy it.

This patches simplifies the plugin handling a bit, and basically
copies all Qt plugins installed in the $(STAGING_DIR) to the
$(TARGET_DIR), assuming Qt has only built and installed the needed
plugins.

Moreover, instead of installing plugins to usr/plugins, which is a odd
location, we install them in usr/lib/qt/plugins. This requires a small
patch to Qt ./configure script so that even when -hostprefix is used,
the -plugindir option is taken into account.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt-4.7.2-configure.patch |   48 +++++++++++++++++++++++++++++++++++
 package/qt/qt.mk                    |   13 +++------
 2 files changed, 52 insertions(+), 9 deletions(-)
 create mode 100644 package/qt/qt-4.7.2-configure.patch

diff --git a/package/qt/qt-4.7.2-configure.patch b/package/qt/qt-4.7.2-configure.patch
new file mode 100644
index 0000000..cef53e3
--- /dev/null
+++ b/package/qt/qt-4.7.2-configure.patch
@@ -0,0 +1,48 @@
+Fix -hostprefix behaviour
+
+When -hostprefix ./configure option is used, Qt installs all its
+headers, libraries and binaries inside the given host prefix, instead
+of the prefix. This is used by Buildroot to make sure that all Qt
+libraries and headers are installed in $(STAGING_DIR).
+
+Qt ./configure script also allows to tune the installation location of
+various elements, for examples the plugins through the -plugindir
+option. Unfortunately, this option only impact the installation path
+on the target, but not on the host when -hostprefix is used.
+
+This patch modifies Qt ./configure script so that HOST_*PATH_STR
+variables are composed of the host prefix concatenated with the path
+of installation on the target. This way, the plugin installation local
+in the $(STAGING_DIR) and on the target remains the same.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: qt-4.7.2/configure
+===================================================================
+--- qt-4.7.2.orig/configure	2011-03-31 22:28:16.530647168 +0200
++++ qt-4.7.2/configure	2011-03-31 22:29:38.908081695 +0200
+@@ -4456,15 +4456,15 @@
+
+
+ if [ ! -z "$QT_HOST_PREFIX" ]; then
+-    HOSTPREFIX_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_prfxpath=$QT_HOST_PREFIX"`
+-    HOSTDOCUMENTATION_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_docspath=$QT_HOST_PREFIX/doc"`
+-    HOSTHEADERS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_hdrspath=$QT_HOST_PREFIX/include"`
+-    HOSTLIBRARIES_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_libspath=$QT_HOST_PREFIX/lib"`
+-    HOSTBINARIES_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_binspath=$QT_HOST_PREFIX/bin"`
+-    HOSTPLUGINS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_plugpath=$QT_HOST_PREFIX/plugins"`
+-    HOSTIMPORTS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_impspath=$QT_HOST_PREFIX/IMPORTS"`
+-    HOSTDATA_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_datapath=$QT_HOST_PREFIX"`
+-    HOSTTRANSLATIONS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_trnspath=$QT_HOST_PREFIX/translations"`
++    HOSTPREFIX_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_prfxpath=$QT_HOST_PREFIX/$QT_INSTALL_PREFIX"`
++    HOSTDOCUMENTATION_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_docspath=$QT_HOST_PREFIX/$QT_INSTALL_DOCS"`
++    HOSTHEADERS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_hdrspath=$QT_HOST_PREFIX/$QT_INSTALL_HEADERS"`
++    HOSTLIBRARIES_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_libspath=$QT_HOST_PREFIX/$QT_INSTALL_LIBS"`
++    HOSTBINARIES_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_binspath=$QT_HOST_PREFIX/$QT_INSTALL_BINS"`
++    HOSTPLUGINS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_plugpath=$QT_HOST_PREFIX/$QT_INSTALL_PLUGINS"`
++    HOSTIMPORTS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_impspath=$QT_HOST_PREFIX/$QT_INSTALL_IMPORTS"`
++    HOSTDATA_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_datapath=$QT_HOST_PREFIX/$QT_INSTALL_DATA"`
++    HOSTTRANSLATIONS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_trnspath=$QT_HOST_PREFIX/$QT_INSTALL_TRANSLATIONS"`
+     HOSTSETTINGS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_stngpath=$QT_INSTALL_SETTINGS"`
+     HOSTEXAMPLES_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_xmplpath=$QT_INSTALL_EXAMPLES"`
+     HOSTDEMOS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_demopath=$QT_INSTALL_DEMOS"`
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index bdc32d9..62ba869 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -481,7 +481,8 @@ define QT_CONFIGURE_CMDS
 		-no-accessibility \
 		-no-separate-debug-info \
 		-prefix /usr \
-		-hostprefix $(STAGING_DIR)/usr \
+		-plugindir /usr/lib/qt/plugins \
+		-hostprefix $(STAGING_DIR) \
 		-fast \
 		-no-rpath \
 	)
@@ -499,23 +500,19 @@ QT_HOST_PROGRAMS   += moc rcc qmake lrelease
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_INSTALL_LIBS    += QtGui
-QT_INSTALL_PLUGINS += imageformats
 QT_HOST_PROGRAMS   += uic
 endif
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
 QT_INSTALL_LIBS    += QtSql
-QT_INSTALL_PLUGINS += sqldrivers
 endif
 ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
 QT_INSTALL_LIBS    += QtMultimedia
 endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_INSTALL_LIBS    += phonon
-QT_INSTALL_PLUGINS += phonon_backend
 endif
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
 QT_INSTALL_LIBS    += QtSvg
-QT_INSTALL_PLUGINS += iconengines
 endif
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
 QT_INSTALL_LIBS    += QtNetwork
@@ -582,10 +579,8 @@ endif
 
 # Plugin installation
 define QT_INSTALL_TARGET_PLUGINS
-	for plugin in $(QT_INSTALL_PLUGINS); do \
-		mkdir -p $(TARGET_DIR)/usr/plugins ; \
-		cp -dpfr $(STAGING_DIR)/usr/plugins/$$plugin $(TARGET_DIR)/usr/plugins/; \
-	done
+	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
 endef
 
 # Fonts installation
-- 
1.7.1
