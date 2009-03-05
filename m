From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 14:17:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse lzma
	netkitbase qtopia4
Message-ID: <20090305141755.ED5BC7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 14:17:55 +0000 (Thu, 05 Mar 2009)
New Revision: 25547

Log:
package: convert some Config.in selects to depends

Patch by Olaf Rempel <razzor@kopf-tisch.de>.

quick grep showed theses invalid selects of toolchain options.

Modified:
   trunk/buildroot/package/fuse/Config.in
   trunk/buildroot/package/lzma/Config.in
   trunk/buildroot/package/netkitbase/Config.in
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/fuse/Config.in
===================================================================
--- trunk/buildroot/package/fuse/Config.in	2009-03-05 13:48:29 UTC (rev 25546)
+++ trunk/buildroot/package/fuse/Config.in	2009-03-05 14:17:55 UTC (rev 25547)
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
-	select BR2_LARGEFILE
+	depends on BR2_LARGEFILE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
 	  http://fuse.sourceforge.net/
+
+comment "libfuse requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE

Modified: trunk/buildroot/package/lzma/Config.in
===================================================================
--- trunk/buildroot/package/lzma/Config.in	2009-03-05 13:48:29 UTC (rev 25546)
+++ trunk/buildroot/package/lzma/Config.in	2009-03-05 14:17:55 UTC (rev 25547)
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_LZMA_TARGET
 	bool "Install lzma for the target system"
-	select BR2_GCC_CROSS_CXX
+	depends on BR2_GCC_CROSS_CXX
 	help
 	  lzma utils on the target
 
 	  http://tukaani.org/lzma/
 
+comment "lzma requires a toolchain with C++ support"
+        depends on !BR2_GCC_CROSS_CXX
+
 config BR2_PACKAGE_LZMA_TARGET_HEADERS
 	bool "lzma headers in target"
 	depends on BR2_PACKAGE_LZMA_TARGET

Modified: trunk/buildroot/package/netkitbase/Config.in
===================================================================
--- trunk/buildroot/package/netkitbase/Config.in	2009-03-05 13:48:29 UTC (rev 25546)
+++ trunk/buildroot/package/netkitbase/Config.in	2009-03-05 14:17:55 UTC (rev 25547)
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
-	select BR2_INET_RPC
+	depends on BR2_INET_RPC
 	help
 	  Old-style inetd.
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
+
+comment "netkitbase requires a toolchain with RPC support"
+        depends on !BR2_INET_RPC

Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-05 13:48:29 UTC (rev 25546)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-05 14:17:55 UTC (rev 25547)
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_QTOPIA4
 	bool "qtopia4"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PTHREADS_NATIVE
+	depends on BR2_PTHREADS_NATIVE
 	help
 	  Qtopia core 4.
 
 	  http://www.trolltech.com/
 
-comment "qtopia4 requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "qtopia4 requires a toolchain with C++ and NPTL support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PTHREADS_NATIVE
 
 if BR2_PACKAGE_QTOPIA4
 
