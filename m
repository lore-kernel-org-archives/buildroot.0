From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 12:51:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20061129205148.4472448590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 12:51:47 -0800 (Wed, 29 Nov 2006)
New Revision: 16728

Log:
- use the correct installation path.


Modified:
   trunk/buildroot/package/openswan/openswan.mk


Changeset:
Modified: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2006-11-29 20:26:05 UTC (rev 16727)
+++ trunk/buildroot/package/openswan/openswan.mk	2006-11-29 20:51:47 UTC (rev 16728)
@@ -11,8 +11,8 @@
 OPENSWAN_SITE:=http://www.openswan.org/download/
 OPENSWAN_DIR:=$(BUILD_DIR)/openswan-$(OPENSWAN_VERSION)
 OPENSWAN_CAT:=$(ZCAT)
-OPENSWAN_BINARY:=openswan
-OPENSWAN_TARGET_BINARY:=usr/sbin/openswan
+OPENSWAN_BINARY:=programs/pluto/pluto
+OPENSWAN_TARGET_BINARY:=usr/sbin/ipsec
 
 $(DL_DIR)/$(OPENSWAN_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(OPENSWAN_SITE)/$(OPENSWAN_SOURCE)
@@ -28,16 +28,16 @@
 	touch  $(OPENSWAN_DIR)/.configured
 
 $(OPENSWAN_DIR)/$(OPENSWAN_BINARY): $(OPENSWAN_DIR)/.configured
-	echo $(LINUX_KERNEL)
+	@echo $(LINUX_KERNEL)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
-		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) \
+		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) INC_USRLOCAL=/usr \
 		CC=$(TARGET_CC) USERCOMPILE="-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib programs
 
 $(TARGET_DIR)/$(OPENSWAN_TARGET_BINARY): $(OPENSWAN_DIR)/$(OPENSWAN_BINARY)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
-		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) \
+		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) INC_USRLOCAL=/usr \
 		CC=$(TARGET_CC) USERCOMPILE="-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib install
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
