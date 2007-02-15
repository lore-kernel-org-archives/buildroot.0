From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 15 Feb 2007 04:30:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/openswan target
Message-ID: <20070215123017.E268E4856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-15 04:30:15 -0800 (Thu, 15 Feb 2007)
New Revision: 17895

Log:
- set some kernel related variables for use by packages


Modified:
   trunk/buildroot/package/openswan/openswan.mk
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2007-02-15 11:24:35 UTC (rev 17894)
+++ trunk/buildroot/package/openswan/openswan.mk	2007-02-15 12:30:15 UTC (rev 17895)
@@ -32,14 +32,16 @@
 	@echo "using kernel $(LINUX_KERNEL)"
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
+		CC=$(TARGET_CC) LD=$(TARGET_LD) \
 		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) INC_USRLOCAL=/usr \
-		CC=$(TARGET_CC) USERCOMPILE="$(OPENSWAN_CFLAGS) $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH="$(TARGET_DIR)/lib:$(TARGET_DIR)/usr/lib" programs
+		USERCOMPILE="$(OPENSWAN_CFLAGS) $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" programs
 
 $(TARGET_DIR)/$(OPENSWAN_TARGET_BINARY): $(OPENSWAN_DIR)/$(OPENSWAN_BINARY)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
+		CC=$(TARGET_CC) LD=$(TARGET_LD) \
 		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) INC_USRLOCAL=/usr \
-		CC=$(TARGET_CC) USERCOMPILE="$(OPENSWAN_CFLAGS) $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH="$(TARGET_DIR)/lib:$(TARGET_DIR)/usr/lib" install
+		USERCOMPILE="$(OPENSWAN_CFLAGS) $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" install
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 

Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-02-15 11:24:35 UTC (rev 17894)
+++ trunk/buildroot/target/linux26.mk	2007-02-15 12:30:15 UTC (rev 17895)
@@ -40,6 +40,11 @@
 # Version of Linux AFTER patches
 LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
+# for packages that need it
+LINUX_VERSION=$(LINUX_VERSION)
+LINUX_DIR=$(LINUX26_DIR)
+LINUX_KERNEL=$(LINUX26_KERNEL)
+
 # kernel patches
 LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/
 
