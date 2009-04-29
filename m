From: correa at uclibc.org <correa@uclibc.org>
Date: Wed, 29 Apr 2009 18:29:25 +0000 (UTC)
Subject: [Buildroot] svn commit: [26245] trunk/buildroot/package/qtopia4
Message-ID: <20090429182925.0FB2E775F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-29 18:29:24 +0000 (Wed, 29 Apr 2009)
New Revision: 26245

Log:
Improve Qt embedded target_dir install handling and granularity. This saves me 600k on jffs2 compressed fs for avr32.

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-04-29 18:27:24 UTC (rev 26244)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-04-29 18:29:24 UTC (rev 26245)
@@ -127,16 +127,19 @@
 
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"
+	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	help
 	  This compiles and installs the plugin for GIF reading support.
 
 config BR2_PACKAGE_QTOPIA4_LIBMNG
 	bool "Enable libmng support"
+	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	help
 	  This compiles and installs the plugin for MNG support.
 
 choice
 	prompt "JPEG support"
+	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	default BR2_PACKAGE_QTOPIA4_NOJPEG
 	help
 	  Select libjpeg support.
@@ -160,6 +163,7 @@
 
 choice
 	prompt "PNG support"
+	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	default BR2_PACKAGE_QTOPIA4_NOPNG
 	help
 	  Select which library to use if PNG support should be enabled.
@@ -177,6 +181,7 @@
 
 choice
 	prompt "TIFF support"
+	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	default BR2_PACKAGE_QTOPIA4_NOTIFF
 	help
 	  Select which library to use if TIFF support should be enabled.
@@ -212,6 +217,7 @@
 
 choice
 	prompt "freetype2 support"
+	depends on BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	default BR2_PACKAGE_QTOPIA4_NOFREETYPE
 	help
 	  Select freetype2 support.
@@ -257,8 +263,10 @@
 	  The target platform.
 
 source "package/qtopia4/Config.sql.in"
+if BR2_PACKAGE_QTOPIA4_GUI_MODULE
 source "package/qtopia4/Config.gfx.in"
 source "package/qtopia4/Config.mouse.in"
+endif
 
 config BR2_PACKAGE_QTOPIA4_PHONON
 	bool "Phonon Module"
@@ -269,8 +277,15 @@
 	  formats can be configured at the GStreamer package.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QTOPIA4_XML
+	bool "XML Module"
+	default y
+	help
+	  Build the XML module.
+
 config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
 	bool "XML Patterns Module"
+	depends on BR2_PACKAGE_QTOPIA4_XML
 	help
 	  Build QtXmlPatterns module.
 	  If unsure, say n
@@ -281,14 +296,23 @@
 	  Build the SVG module.
 	  If unsure, say n
 
+config BR2_PACKAGE_QTOPIA4_NETWORK
+	bool "Network Module"
+	default y
+	help
+	  Install the Network module.
+	  if unsure, say y
+
 config BR2_PACKAGE_QTOPIA4_WEBKIT
 	bool "WebKit Module"
+	depends on BR2_PACKAGE_QTOPIA4_NETWORK
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
 config BR2_PACKAGE_QTOPIA4_OPENSSL
 	bool "Enable OpenSSL support"
+	depends on BR2_PACKAGE_QTOPIA4_NETWORK
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable support for the OpenSSL encryption library. If you use
@@ -296,4 +320,19 @@
 	  target.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QTOPIA4_SCRIPT
+	bool "Script Module"
+	default y
+	help
+	  Build the Qt Script module.
+	  if unsure, say y.
+
+config BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS
+	bool "Script Tools Module"
+	depends on BR2_PACKAGE_QTOPIA4_SCRIPT
+	default n
+	help
+	  Build the Qt Script Tools module.
+	  if unsure, say n.
+
 endif # BR2_PACKAGE_QTOPIA4

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-29 18:27:24 UTC (rev 26244)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-29 18:29:24 UTC (rev 26245)
@@ -1,9 +1,10 @@
 ######################################################################
 #
-# qtopia4 (Qtopia Core 4)
-# http://www.trolltech.com/
+# qtopia4 (Qt Embedded for Linux 4.5)
+# http://www.qtsoftware.com/
 #
-# This makefile composed by Thomas Lundquist <thomasez@zelow.no>
+# This makefile was oiginaly composed by Thomas Lundquist <thomasez@zelow.no>
+# Later heavily modified by buildroot developers
 #
 # BTW, this uses alot of FPU calls and it's pretty slow if you use
 # the kernels FPU emulation so it's better to choose soft float in the
@@ -339,6 +340,38 @@
 endif
 # End of workaround.
 
+# Figure out what libs to install in the target
+QTOPIA4_LIBS=#empty
+ifeq ($(BR2_PACKAGE_QTOPIA4_GUI_MODULE),y)
+QTOPIA4_LIBS+= qtopia4-gui  
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
+QTOPIA4_LIBS+= qtopia4-sql
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
+QTOPIA4_LIBS+= qtopia4-phonon
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
+QTOPIA4_LIBS+= qtopia4-svg
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_NETWORK),y)
+QTOPIA4_LIBS+= qtopia4-network
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_WEBKIT),y)
+QTOPIA4_LIBS+= qtopia4-webkit
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_XML),y)
+QTOPIA4_LIBS+= qtopia4-xml
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_XMLPATTERNS),y)
+QTOPIA4_LIBS+= qtopia4-xmlpatterns
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_SCRIPT),y)
+QTOPIA4_LIBS+= qtopia4-script
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS),y)
+QTOPIA4_LIBS+= qtopia4-scripttools
+endif
 
 QTOPIA4_QMAKE_CONF:=$(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 
@@ -362,6 +395,23 @@
 	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QTOPIA4_QMAKE_CONF)
 endef
 
+################################################################################
+# QTOPIA4_INSTALL_PLUGINS -- helper macro to install Qt plugins to target and 
+# strip them
+#
+# Argument 1 is the plugin folder
+# 
+# E.G. use like this to install plugins/sqldrivers:
+# $(call QTOPIA4_INSTALL_PLUGINS,sqldrivers)
+# ################################################################################
+define QTOPIA4_INSTALL_PLUGINS
+        if [ -d $(STAGING_DIR)/usr/plugins/$(1) ]; then \
+                mkdir -p $(TARGET_DIR)/usr/plugins; \
+                cp -dpfr $(STAGING_DIR)/usr/plugins/$(1) $(TARGET_DIR)/usr/plugins/; \
+                $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/$(1)/*; \
+        fi
+endef
+
 $(DL_DIR)/$(QTOPIA4_SOURCE):
 	$(call DOWNLOAD,$(QTOPIA4_SITE),$(QTOPIA4_SOURCE))
 
@@ -429,48 +479,83 @@
 $(STAGING_DIR)/usr/lib/libQtCore.la: $(QTOPIA4_TARGET_DIR)/.compiled
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) install
 
-$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la
+qtopia4-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
+	# Install image plugins if they are built
+	$(call QTOPIA4_INSTALL_PLUGINS,imageformats)
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
-ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qtopia4-sql: $(STAGING_DIR)/usr/lib/libQtCore.la
+	$(call QTOPIA4_INSTALL_PLUGINS,sqldrivers)
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+qtopia4-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
+	$(call QTOPIA4_INSTALL_PLUGINS,phonon_backend)
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libphonon.so.*
 endif
+
+qtopia4-svg: $(STAGING_DIR)/usr/lib/libQtCore.la
+	$(call QTOPIA4_INSTALL_PLUGINS,iconengines)
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtSvg.so.* $(TARGET_DIR)/usr/lib/
 endif
-	# Install image plugins if they are built
-	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
-		mkdir -p $(TARGET_DIR)/usr/plugins; \
-		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
-	fi
-ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
-	mkdir -p $(TARGET_DIR)/usr/plugins
-	cp -dpfr $(STAGING_DIR)/usr/plugins/phonon_backend $(TARGET_DIR)/usr/plugins/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/phonon_backend/*
+
+qtopia4-network: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtNetwork.so.* $(TARGET_DIR)/usr/lib/
 endif
-ifneq ($(BR2_PACKAGE_QTOPIA4_GUI_MODULE),y)
-	# Remove Gui library, not needed
-	-rm $(TARGET_DIR)/usr/lib/libQtGui*
+
+qtopia4-webkit: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtWebKit.so.* $(TARGET_DIR)/usr/lib/
 endif
-ifneq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
-	# Remove Sql libraries, not needed
-	-rm $(TARGET_DIR)/usr/lib/libQtSql*
+
+qtopia4-xml: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtXml.so.* $(TARGET_DIR)/usr/lib/
 endif
-ifneq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
-	# Remove Svg libraries, not needed
-	-rm $(TARGET_DIR)/usr/lib/libQtSvg*
+
+qtopia4-xmlpatterns: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtXmlPatterns.so.* $(TARGET_DIR)/usr/lib/
 endif
 
-qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
+qtopia4-script: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtScript.so.* $(TARGET_DIR)/usr/lib/
+endif
 
+qtopia4-scripttools: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
+endif
+
+
+$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QTOPIA4_LIBS)
+	# Strip all installed libs
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
+endif
+
+qtopia4: uclibc $(QTOPIA4_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
+
 qtopia4-clean:
 	-$(MAKE) -C $(QTOPIA4_TARGET_DIR) clean
+	-rm -rf $(TARGET_DIR)/usr/lib/fonts
+ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
+	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
+endif
 
 qtopia4-dirclean:
 	rm -rf $(QTOPIA4_TARGET_DIR)
