From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 12:42:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tcpdump
Message-ID: <20070901194212.5D734A4CE8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 12:42:11 -0700 (Sat, 01 Sep 2007)
New Revision: 19759

Log:
- add option to turn on SMB dump routines
- honour BR2_INET_IPV6


Modified:
   trunk/buildroot/package/tcpdump/Config.in
   trunk/buildroot/package/tcpdump/tcpdump.mk


Changeset:
Modified: trunk/buildroot/package/tcpdump/Config.in
===================================================================
--- trunk/buildroot/package/tcpdump/Config.in	2007-09-01 18:46:46 UTC (rev 19758)
+++ trunk/buildroot/package/tcpdump/Config.in	2007-09-01 19:42:11 UTC (rev 19759)
@@ -7,6 +7,13 @@
 
 	  http://www.tcpdump.org/
 
+config BR2_PACKAGE_TCPDUMP_SMB
+	bool "smb dump support"
+	default n
+	depends on BR2_PACKAGE_TCPDUMP
+	help
+	  enable possibly-buggy SMB printer
+
 config BR2_PACKAGE_DHCPDUMP
 	bool "dhcpdump"
 	default n

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-09-01 18:46:46 UTC (rev 19758)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-09-01 19:42:11 UTC (rev 19759)
@@ -12,6 +12,12 @@
 TCPDUMP_SOURCE:=tcpdump-$(TCPDUMP_VERSION).tar.gz
 TCPDUMP_CAT:=$(ZCAT)
 
+ifneq ($(BR2_PACKAGE_TCPDUMP_SMB),y)
+TCPDUMP_ENABLE_SMB:=--disable-smb
+else
+TCPDUMP_ENABLE_SMB:=--enable-smb
+endif
+
 $(DL_DIR)/$(TCPDUMP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(TCPDUMP_SITE)/$(TCPDUMP_SOURCE)
 
@@ -37,7 +43,8 @@
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--without-crypto \
-		--disable-smb \
+		$(TCPDUMP_ENABLE_SMB) \
+		$(DISABLE_IPV6) \
 	)
 	$(SED) '/HAVE_PCAP_DEBUG/d' $(TCPDUMP_DIR)/config.h
 	touch $@
