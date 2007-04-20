From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 20 Apr 2007 04:12:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20070420111252.7C01A48092@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-20 04:12:50 -0700 (Fri, 20 Apr 2007)
New Revision: 18503

Log:
- pass the correct endian


Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2007-04-20 08:35:45 UTC (rev 18502)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2007-04-20 11:12:50 UTC (rev 18503)
@@ -22,6 +22,12 @@
 	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ netsnmp\*.patch
 	touch $(NETSNMP_DIR)/.unpacked
 
+ifeq ($(BR2_ENDIAN),"BIG")
+NETSNMP_ENDIAN=big
+else
+NETSNMP_ENDIAN=little
+endif
+
 # We set CAN_USE_SYSCTL to no and use /proc since the
 # sysctl code in this thing is apparently intended for
 # freebsd or some such thing...
@@ -37,7 +43,7 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--with-endianness=little \
+		--with-endianness=$(NETSNMP_ENDIAN) \
 		--with-persistent-directory=/var/lib/snmp \
 		--enable-ucd-snmp-compatibility \
 		--enable-shared \
