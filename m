From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 14:17:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tcpdump
Message-ID: <20070819211749.9F61AA6148@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 14:17:48 -0700 (Sun, 19 Aug 2007)
New Revision: 19572

Log:
move tcpdump from lib to usr/lib, simplify configure, general cleanup

Modified:
   trunk/buildroot/package/tcpdump/Config.in
   trunk/buildroot/package/tcpdump/dhcpdump.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk


Changeset:
Modified: trunk/buildroot/package/tcpdump/Config.in
===================================================================
--- trunk/buildroot/package/tcpdump/Config.in	2007-08-19 21:15:42 UTC (rev 19571)
+++ trunk/buildroot/package/tcpdump/Config.in	2007-08-19 21:17:48 UTC (rev 19572)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TCPDUMP
 	bool "tcpdump"
+	select BR2_PACKAGE_LIBPCAP
 	default n
 	help
 	  A tool for network monitoring and data acquisition.
@@ -9,6 +10,6 @@
 config BR2_PACKAGE_DHCPDUMP
 	bool "dhcpdump"
 	default n
-	depends BR2_PACKAGE_TCPDUMP
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.

Modified: trunk/buildroot/package/tcpdump/dhcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-08-19 21:15:42 UTC (rev 19571)
+++ trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-08-19 21:17:48 UTC (rev 19572)
@@ -19,7 +19,7 @@
 
 $(DHCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(DHCPDUMP_SOURCE)
 	$(DHCPDUMP_CAT) $(DL_DIR)/$(DHCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(DHCPDUMP_DIR)/.unpacked
+	touch $@
 
 $(DHCPDUMP_DIR)/.configured: $(DHCPDUMP_DIR)/.unpacked
 	( \
@@ -32,31 +32,23 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--with-build-cc="$(HOSTCC)" \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 	)
-	touch $(DHCPDUMP_DIR)/.configured
+	touch $@
 
 $(DHCPDUMP_DIR)/dhcpdump: $(DHCPDUMP_DIR)/.configured
 	$(MAKE) CC="$(TARGET_CC)" -C $(DHCPDUMP_DIR)
 
-$(TARGET_DIR)/sbin/dhcpdump: $(DHCPDUMP_DIR)/dhcpdump
+$(TARGET_DIR)/usr/sbin/dhcpdump: $(DHCPDUMP_DIR)/dhcpdump
 	cp -af $< $@
 
-dhcpdump: uclibc zlib libpcap $(TARGET_DIR)/sbin/dhcpdump
+dhcpdump: uclibc zlib libpcap $(TARGET_DIR)/usr/sbin/dhcpdump
 
 dhcpdump-clean:
-	rm -f $(TARGET_DIR)/sbin/dhcpdump
+	rm -f $(TARGET_DIR)/usr/sbin/dhcpdump
 	-$(MAKE) -C $(DHCPDUMP_DIR) clean
 
 dhcpdump-dirclean:

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-08-19 21:15:42 UTC (rev 19571)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-08-19 21:17:48 UTC (rev 19572)
@@ -34,18 +34,8 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--with-build-cc="$(HOSTCC)" \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		--without-crypto \
 		--disable-smb \
 	)
@@ -54,19 +44,19 @@
 
 $(TCPDUMP_DIR)/tcpdump: $(TCPDUMP_DIR)/.configured
 	$(MAKE) CC="$(TARGET_CC)" \
-		LDFLAGS="-L$(STAGING_DIR)/lib" \
+		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 		LIBS="-lpcap" \
 		INCLS="-I. -I$(STAGING_DIR)/usr/include" \
 		-C $(TCPDUMP_DIR)
 
-$(TARGET_DIR)/sbin/tcpdump: $(TCPDUMP_DIR)/tcpdump
+$(TARGET_DIR)/usr/sbin/tcpdump: $(TCPDUMP_DIR)/tcpdump
 	cp -f $< $@
-	$(STRIP) -s $@
+	$(STRIP) $@
 
-tcpdump: uclibc zlib libpcap $(TARGET_DIR)/sbin/tcpdump
+tcpdump: uclibc zlib libpcap $(TARGET_DIR)/usr/sbin/tcpdump
 
 tcpdump-clean:
-	rm -f $(TARGET_DIR)/sbin/tcpdump
+	rm -f $(TARGET_DIR)/usr/sbin/tcpdump
 	-$(MAKE) -C $(TCPDUMP_DIR) clean
 
 tcpdump-dirclean:
