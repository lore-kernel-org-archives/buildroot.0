From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 10:26:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20070728172620.EFAE1A4942@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 10:26:18 -0700 (Sat, 28 Jul 2007)
New Revision: 19303

Log:
Add colourdepth support to Qtopia config

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2007-07-28 17:14:06 UTC (rev 19302)
+++ trunk/buildroot/package/qtopia4/Config.in	2007-07-28 17:26:18 UTC (rev 19303)
@@ -12,14 +12,42 @@
 
 config BR2_PACKAGE_QTOPIA4_DEBUG
         bool "Compile with debug support"
-        default y 
+        default y
 	depends BR2_PACKAGE_QTOPIA4
         help
 
+choice
+	prompt "Qtopia 4 Core license type"
+	default BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  Selects the type of license you which to use for Qtopia 4 Core.
+
+config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
+	bool "GPL license"
+
+config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
+	bool "Commercial license"
+
+endchoice
+
+config BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED
+	bool "Approve Qtopia Core 4 GPL licence"
+	default n
+	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
+	help
+	  Select this if you approve the GNU GENERAL PUBLIC LICENSE Version 2
+	  on the Qtopia Core 4 library. By doing this you will not be asked
+	  while the library is compiled. Please read and understand the GPL
+	  licence before approving this.
+
+	  For full GPL version 2 see http://www.gnu.org/licenses/gpl.txt
+
+
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
         string "Qtopia Core 4 Commercial License Username"
         default ""
-	depends BR2_PACKAGE_QTOPIA4
+	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
         help
             Commercial users can download their source directly by providing a username.
 
@@ -27,17 +55,25 @@
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
         string "Qtopia Core 4 Commercial License Password"
         default ""
-	depends BR2_PACKAGE_QTOPIA4
+	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
         help
             Commercial users can download their source directly by providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
         bool "Compatibility with Qt3"
-        default y 
+        default y
 	depends BR2_PACKAGE_QTOPIA4
         help
 	    Turns on support for older Qt3.
 
+config BR2_PACKAGE_QTOPIA4_DEPTHS
+        string "color depths to support"
+        default "-depths 8"
+	depends BR2_PACKAGE_QTOPIA4
+        help
+	    Which color depths to support for the library. Default is "-depths
+	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
+
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
         string "The embedded platform we are making Qtopia4 for"
 	default "arm"	if BR2_arm

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2007-07-28 17:14:06 UTC (rev 19302)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2007-07-28 17:26:18 UTC (rev 19303)
@@ -2,15 +2,15 @@
 #
 # qtopia4 (Qtopia Core 4)
 # http://www.trolltech.com/
-# 
+#
 # This makefile composed by Thomas Lundquist <thomasez@zelow.no>
 #
 # There is two versions built, one for the target and one for
 # staging. The target version is built in the staging_dir and the
 # staging version in the toolchain_dir.
 #
-# BTW, this uses alot of FPU calls and it's pretty slow if you use 
-# the kernels FPU emulation so it's better to choose soft float in the 
+# BTW, this uses alot of FPU calls and it's pretty slow if you use
+# the kernels FPU emulation so it's better to choose soft float in the
 # buildroot config (and uClibc.config of course, if you have your own.)
 #
 ######################################################################
@@ -40,15 +40,19 @@
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qtopia-core-opensource-src-$(QTOPIA4_VERSION)
 QTOPIA4_HOST_DIR:=$(TOOL_BUILD_DIR)/qtopia-core-opensource-src-$(QTOPIA4_VERSION)
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
+QTOPIA4_APPROVE_GPL_LICENSE:=-confirm-license
 endif
 
-# If you want extra tweaking you can copy 
+endif
+
+# If you want extra tweaking you can copy
 # $(QTOPIA4_TARGET_DIR)/src/corelib/global/qconfig-myfile.h
-# to the qtopia4 packages directory (where this .mk file is) and 
+# to the qtopia4 packages directory (where this .mk file is) and
 # remove the comment.
 # QTOPIA4_QCONFIG_COMMAND:=-qconfig myfile
 #
-# For the options you can set in this file, look at 
+# For the options you can set in this file, look at
 # $(QTOPIA4_TARGET_DIR)/src/corelib/global/qfeatures.txt
 #
 QTOPIA4_QCONFIG_FILE:=package/qtopia4/qconfig-myfile.h
@@ -81,6 +85,12 @@
 else
 QTOPIA4_ENDIAN=-big-endian
 endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_DEPTHS),"")
+QTOPIA4_DEPTHS=-depths 8
+else
+QTOPIA4_DEPTHS:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_DEPTHS)))
+#"))
+endif
 
 QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
 #"))
@@ -105,12 +115,14 @@
 
 $(QTOPIA4_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
 	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(QTOPIA4_TARGET_DIR) package/qtopia4/ \
+		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
 	touch $(QTOPIA4_TARGET_DIR)/.unpacked
 
 # This configure is very tailored towards my needs.
 $(QTOPIA4_TARGET_DIR)/.configured: $(QTOPIA4_TARGET_DIR)/.unpacked
 	# Patching configure to get rid of some feature I dont want.
-	# (I don't want SQL either but there is no option for that at all. 
+	# (I don't want SQL either but there is no option for that at all.
 	# the SQL library will be built even without the plugins/drivers.
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
@@ -119,7 +131,7 @@
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
-	 	$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
+		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
 		PATH=$(TARGET_PATH) \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -133,7 +145,7 @@
 		-xplatform qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++ \
 		$(QTOPIA4_QCONFIG_COMMAND) \
 		$(QTOPIA4_DEBUG) \
-		-depths 8 \
+		$(QTOPIA4_DEPTHS) \
 		-no-cups \
 		-no-nis \
 		-no-freetype \
@@ -151,12 +163,11 @@
 		-no-sql-tds \
 		-prefix /usr \
 		-prefix-install \
-		-L $(STAGING_DIR)/usr/lib \
-		-I $(STAGING_DIR)/usr/include \
 		$(QTOPIA4_QT3SUPPORT) \
 		$(QTOPIA4_TSLIB) \
 		$(QTOPIA4_LARGEFILE) \
 		$(QTOPIA4_ENDIAN) \
+		$(QTOPIA4_APPROVE_GPL_LICENSE) \
 	);
 	touch $(QTOPIA4_TARGET_DIR)/.configured
 
@@ -192,12 +203,14 @@
 
 $(QTOPIA4_HOST_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
 	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(QTOPIA4_HOST_DIR) package/qtopia4/ \
+		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
 	touch $(QTOPIA4_HOST_DIR)/.unpacked
 
 # This configure is very tailored towards my needs.
 $(QTOPIA4_HOST_DIR)/.configured: $(QTOPIA4_HOST_DIR)/.unpacked
 	# Patching configure to get rid of some feature I dont want.
-	# (I don't want SQL either but there is no option for that at all. 
+	# (I don't want SQL either but there is no option for that at all.
 	# the SQL library will be built even without the plugins/drivers.
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_HOST_DIR)/configure
@@ -206,7 +219,7 @@
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_HOST_DIR)/configure
 	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_HOST_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
-	 	$(QTOPIA4_HOST_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
+		$(QTOPIA4_HOST_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_HOST_DIR); rm -rf config.cache; \
 		PATH=$(TARGET_PATH) \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -220,7 +233,7 @@
 		-xplatform qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++ \
 		$(QTOPIA4_QCONFIG_COMMAND) \
 		$(QTOPIA4_DEBUG) \
-		-depths 8 \
+		$(QTOPIA4_DEPTHS) \
 		-no-cups \
 		-no-nis \
 		-no-freetype \
@@ -236,12 +249,11 @@
 		-no-sql-tds \
 		-prefix $(QTOPIA4_STAGING_DIR) \
 		-prefix-install \
-		-L $(STAGING_DIR)/usr/lib \
-		-I $(STAGING_DIR)/usr/include \
 		$(QTOPIA4_QT3SUPPORT) \
 		$(QTOPIA4_TSLIB) \
 		$(QTOPIA4_LARGEFILE) \
 		$(QTOPIA4_ENDIAN) \
+		$(QTOPIA4_APPROVE_GPL_LICENSE) \
 	);
 	touch $(QTOPIA4_HOST_DIR)/.configured
 
