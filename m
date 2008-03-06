From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:55:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  bridge-utils
Message-ID: <20080306175551.6F5A61201C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:55:51 -0800 (Thu, 06 Mar 2008)
New Revision: 21183

Log:
renamed bridge to bridge-utils

Added:
   trunk/buildroot/package/bridge-utils/
   trunk/buildroot/package/bridge-utils/Config.in
   trunk/buildroot/package/bridge-utils/bridge.mk
   trunk/buildroot/package/bridge-utils/bridge.patch

Removed:
   trunk/buildroot/package/bridge/


Changeset:
Added: trunk/buildroot/package/bridge-utils/Config.in
===================================================================
--- trunk/buildroot/package/bridge-utils/Config.in	                        (rev 0)
+++ trunk/buildroot/package/bridge-utils/Config.in	2008-03-06 17:55:51 UTC (rev 21183)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BRIDGE
+	bool "bridge-utils"
+	default n
+	help
+	  Manage ethernet bridging; a way to connect networks together to
+	  form a larger network.
+
+	  http://bridge.sourceforge.net/

Added: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	                        (rev 0)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-03-06 17:55:51 UTC (rev 21183)
@@ -0,0 +1,71 @@
+#############################################################
+#
+# bridgeutils - User Space Program For Controlling Bridging
+#
+#############################################################
+#
+BRIDGE_VERSION=1.0.6
+BRIDGE_SOURCE_URL=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge/
+BRIDGE_SOURCE=bridge-utils-$(BRIDGE_VERSION).tar.gz
+BRIDGE_BUILD_DIR=$(BUILD_DIR)/bridge-utils-$(BRIDGE_VERSION)
+BRIDGE_TARGET_BINARY:=usr/sbin/brctl
+
+$(DL_DIR)/$(BRIDGE_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(BRIDGE_SOURCE_URL)/$(BRIDGE_SOURCE)
+
+$(BRIDGE_BUILD_DIR)/.unpacked: $(DL_DIR)/$(BRIDGE_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(BRIDGE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	patch -p1 -d $(BRIDGE_BUILD_DIR) < package/bridge/bridge.patch
+	touch $(BRIDGE_BUILD_DIR)/.unpacked
+
+$(BRIDGE_BUILD_DIR)/.configured: $(BRIDGE_BUILD_DIR)/.unpacked
+	(cd $(BRIDGE_BUILD_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		$(DISABLE_NLS) \
+		--with-linux-headers=$(LINUX_HEADERS_DIR) \
+	)
+	touch $(BRIDGE_BUILD_DIR)/.configured
+
+$(BRIDGE_BUILD_DIR)/brctl/brctl: $(BRIDGE_BUILD_DIR)/.configured
+	$(MAKE) -C $(BRIDGE_BUILD_DIR)
+
+$(TARGET_DIR)/$(BRIDGE_TARGET_BINARY): $(BRIDGE_BUILD_DIR)/brctl/brctl
+	cp -af $(BRIDGE_BUILD_DIR)/brctl/brctl $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
+	$(STRIPCMD) $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
+	#cp -af $(BRIDGE_BUILD_DIR)/brctl/brctld $(TARGET_DIR)/usr/sbin/
+	#$(STRIPCMD) $(TARGET_DIR)/usr/sbin/brctld
+
+bridge: $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
+
+bridge-source: $(DL_DIR)/$(BRIDGE_SOURCE)
+
+bridge-clean:
+	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BRIDGE_BUILD_DIR) uninstall
+	-$(MAKE) -C $(BRIDGE_BUILD_DIR) clean
+
+bridge-dirclean:
+	rm -rf $(BRIDGE_BUILD_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_BRIDGE)),y)
+TARGETS+=bridge-utils
+endif

Added: trunk/buildroot/package/bridge-utils/bridge.patch
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.patch	                        (rev 0)
+++ trunk/buildroot/package/bridge-utils/bridge.patch	2008-03-06 17:55:51 UTC (rev 21183)
@@ -0,0 +1,11 @@
+--- bridge-utils-0.9.6/libbridge/Makefile.in.dist	2004-03-01 20:55:52.000000000 -0600
++++ bridge-utils-0.9.6/libbridge/Makefile.in	2004-03-01 20:56:23.000000000 -0600
+@@ -5,7 +5,7 @@
+ RANLIB=@RANLIB@
+ 
+ CC=@CC@
+-CFLAGS = -Wall -g $(KERNEL_HEADERS)
++CFLAGS = -Wall -g @CFLAGS@ $(KERNEL_HEADERS)
+ 
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
