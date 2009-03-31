From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 31 Mar 2009 14:29:30 +0000 (UTC)
Subject: [Buildroot] svn commit: [25906] trunk/buildroot/package/qtopia4
Message-ID: <20090331142930.C9F22771A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-31 14:29:30 +0000 (Tue, 31 Mar 2009)
New Revision: 25906

Log:
qtopia4: make qmake.conf handling more robust (fixes build for x86/x86_64/ppc)

qmake.conf needs to be tweaked to make QT use the correct toolchain for
building, but the current approach relies on the fact that the selected
platform qmake.conf has QMAKE_{CC,CXX,LINK,LINK_SHLIB,AR,OBJCOPY,RANLIB,STRIP}
lines that are then adapted to the correct settings.

This is true for some configs (namely arm and avr32), but not for others -
Causing the build to fail (or build for the host).

Instead add a QTOPIA4_QMAKE_SET macro which removes any existing lines
and add the correct lines to the qmake.conf, so it works no matter if the
platform provides them or not.

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-03-31 13:14:18 UTC (rev 25905)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-03-31 14:29:30 UTC (rev 25906)
@@ -327,6 +327,21 @@
 # Variable for other Qt applications to use
 QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
 
+################################################################################
+# QTOPIA4_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
+# QTOPIA_QMAKE_CONF. Will remove existing variable declaration if available.
+#
+# Argument 1 is the variable name (without QMAKE_)
+# Argument 2 is the value to set variable to
+#
+# E.G. use like this:
+# $(call QTOPIA4_QMAKE_SET,variable,value)
+################################################################################
+define QTOPIA4_QMAKE_SET
+	$(SED) '/QMAKE_$(1)/d' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QTOPIA4_QMAKE_CONF)
+endef
+
 $(DL_DIR)/$(QTOPIA4_SOURCE):
 	$(call DOWNLOAD,$(QTOPIA4_SITE),$(QTOPIA4_SOURCE))
 
@@ -346,16 +361,15 @@
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
-	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_QMAKE_CONF)
 	# Fix compiler path
-	$(SED) '\,QMAKE_CC[ 	]*=, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '\,QMAKE_CXX[ 	]*=, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '\,QMAKE_LINK[ 	]*=, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '\,QMAKE_LINK_SHLIB[ 	]*=, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '\,QMAKE_AR[ 	]*=, c\QMAKE_AR = $(TARGET_AR) cqs' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '\,QMAKE_RANLIB[ 	]*=, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_QMAKE_CONF)
-	$(SED) '\,QMAKE_STRIP[ 	]*=, c\QMAKE_STRIP = $(TARGET_STRIP)' $(QTOPIA4_QMAKE_CONF)
-
+	$(call QTOPIA4_QMAKE_SET,CC,$(TARGET_CC))
+	$(call QTOPIA4_QMAKE_SET,CXX,$(TARGET_CXX))
+	$(call QTOPIA4_QMAKE_SET,LINK,$(TARGET_CXX))
+	$(call QTOPIA4_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
+	$(call QTOPIA4_QMAKE_SET,AR,$(TARGET_AR))
+	$(call QTOPIA4_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
+	$(call QTOPIA4_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
+	$(call QTOPIA4_QMAKE_SET,STRIP,$(TARGET_STRIP))
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 # Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
