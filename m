From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 14:11:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpcap
Message-ID: <20070819211116.24FBDA610C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 14:11:15 -0700 (Sun, 19 Aug 2007)
New Revision: 19568

Log:
libpcap cleanup

Modified:
   trunk/buildroot/package/libpcap/Config.in
   trunk/buildroot/package/libpcap/libpcap.mk


Changeset:
Modified: trunk/buildroot/package/libpcap/Config.in
===================================================================
--- trunk/buildroot/package/libpcap/Config.in	2007-08-19 21:09:28 UTC (rev 19567)
+++ trunk/buildroot/package/libpcap/Config.in	2007-08-19 21:11:15 UTC (rev 19568)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPCAP
 	bool "libpcap"
+	select BR2_PACKAGE_ZLIB
 	default n
 	help
 	  A system-independent library for user-level network packet capture.

Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2007-08-19 21:09:28 UTC (rev 19567)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2007-08-19 21:11:15 UTC (rev 19568)
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libpcap 
+# libpcap
 #
 #############################################################
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
@@ -48,20 +48,10 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--with-build-cc="$(HOSTCC)" \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		--disable-yydebug \
-		--prefix=/usr \
 		--with-pcap=linux \
 		$(DISABLE_IPV6) \
 	)
@@ -76,8 +66,9 @@
 libpcap: uclibc zlib $(STAGING_DIR)/usr/lib/libpcap.a
 
 libpcap-clean:
-	rm -f $(STAGING_DIR)/usr/include/pcap*.h \
-		$(STAGING_DIR)/usr/lib/libpcap.a
+	rm -f $(addprefix $(STAGING_DIR)/usr/,include/pcap*.h \
+					      lib/libpcap.a \
+					      share/man/man?/pcap.*)
 	-$(MAKE) -C $(LIBPCAP_DIR) clean
 
 libpcap-dirclean:
