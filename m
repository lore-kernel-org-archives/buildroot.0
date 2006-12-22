From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 03:29:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20061222112953.0AA4648582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 03:29:52 -0800 (Fri, 22 Dec 2006)
New Revision: 17043

Log:
- add option to enable debugging support


Modified:
   trunk/buildroot/package/openswan/Config.in
   trunk/buildroot/package/openswan/openswan.mk


Changeset:
Modified: trunk/buildroot/package/openswan/Config.in
===================================================================
--- trunk/buildroot/package/openswan/Config.in	2006-12-22 10:39:56 UTC (rev 17042)
+++ trunk/buildroot/package/openswan/Config.in	2006-12-22 11:29:52 UTC (rev 17043)
@@ -7,3 +7,13 @@
 	  Openswan is an implementation of IPsec for Linux.
           http://openswan.org/
 
+config BR2_PACKAGE_OPENSWAN_DEBUGGING
+	bool "debugging support"
+	default n
+	depends on BR2_PACKAGE_OPENSWAN
+	help
+	  Enable debugging support.
+	  This is not needed if you know what you do but makes it quite
+	  hard to diagnose eventual problems.
+	  It is safe to say Yes here.
+

Modified: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2006-12-22 10:39:56 UTC (rev 17042)
+++ trunk/buildroot/package/openswan/openswan.mk	2006-12-22 11:29:52 UTC (rev 17043)
@@ -14,6 +14,10 @@
 OPENSWAN_BINARY:=programs/pluto/pluto
 OPENSWAN_TARGET_BINARY:=usr/sbin/ipsec
 
+ifneq ($(BR2_PACKAGE_OPENSWAN_DEBUGGING),y)
+OPENSWAN_CFLAGS=-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE
+endif
+
 $(DL_DIR)/$(OPENSWAN_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(OPENSWAN_SITE)/$(OPENSWAN_SOURCE)
 
@@ -25,17 +29,17 @@
 	touch $(OPENSWAN_DIR)/.unpacked
 
 $(OPENSWAN_DIR)/$(OPENSWAN_BINARY): $(OPENSWAN_DIR)/.unpacked
-	@echo $(LINUX_KERNEL)
+	@echo "using kernel $(LINUX_KERNEL)"
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
 		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) INC_USRLOCAL=/usr \
-		CC=$(TARGET_CC) USERCOMPILE="-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib programs
+		CC=$(TARGET_CC) USERCOMPILE="$(OPENSWAN_CFLAGS) $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH="$(TARGET_DIR)/lib:$(TARGET_DIR)/usr/lib" programs
 
 $(TARGET_DIR)/$(OPENSWAN_TARGET_BINARY): $(OPENSWAN_DIR)/$(OPENSWAN_BINARY)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
 		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) INC_USRLOCAL=/usr \
-		CC=$(TARGET_CC) USERCOMPILE="-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib install
+		CC=$(TARGET_CC) USERCOMPILE="$(OPENSWAN_CFLAGS) $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH="$(TARGET_DIR)/lib:$(TARGET_DIR)/usr/lib" install
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
