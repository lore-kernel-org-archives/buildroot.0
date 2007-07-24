From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 24 Jul 2007 10:48:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  tinyx xorg
Message-ID: <20070724174859.D4BB1A466D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-24 10:48:58 -0700 (Tue, 24 Jul 2007)
New Revision: 19253

Log:
- add a choice for Xserver selection.
  This is ment as a suggestion Re: http://lists.busybox.net/lists/buildroot/2007-July/003835.html


Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/tinyx/Config.in
   trunk/buildroot/package/xorg/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-24 16:34:28 UTC (rev 19252)
+++ trunk/buildroot/package/Config.in	2007-07-24 17:48:58 UTC (rev 19253)
@@ -303,10 +303,30 @@
 
 #source "package/microwin/Config.in"
 
-comment "X Window System server"
+choice
+prompt "X Window System server"
+	default BR2_PACKAGE_XSERVER_none
+	help
+	  Xserver to use.
+	  For more information about the X protocol see
+	  http://www.x.org
+
+config BR2_PACKAGE_XSERVER_none
+	bool "none"
+config BR2_PACKAGE_XSERVER_xorg
+	bool "xorg"
+config BR2_PACKAGE_XSERVER_tinyx
+	bool "tinyx"
+endchoice
+if BR2_PACKAGE_XSERVER_xorg
 source "package/xorg/Config.in"
+endif
+if BR2_PACKAGE_XSERVER_tinyx
 source "package/tinyx/Config.in"
+endif
+
 comment "X libraries and helper libraries"
+#XXX: maybe some of these should depend on !BR2_PACKAGE_XSERVER_none
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
 source "package/pango/Config.in"

Modified: trunk/buildroot/package/tinyx/Config.in
===================================================================
--- trunk/buildroot/package/tinyx/Config.in	2007-07-24 16:34:28 UTC (rev 19252)
+++ trunk/buildroot/package/tinyx/Config.in	2007-07-24 17:48:58 UTC (rev 19253)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_TINYX
 	bool "tinyx"
-	default n
+	default y if BR2_PACKAGE_XSERVER_tinyx
 	help
 	  A tiny X server.  Also known as 'Xfbdev' and 'kdrive'.

Modified: trunk/buildroot/package/xorg/Config.in
===================================================================
--- trunk/buildroot/package/xorg/Config.in	2007-07-24 16:34:28 UTC (rev 19252)
+++ trunk/buildroot/package/xorg/Config.in	2007-07-24 17:48:58 UTC (rev 19253)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XORG
 	bool "X.org X Window System"
-	default n
-	depends !BR2_PACKAGE_TINYX
+	default y if BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_EXPAT
