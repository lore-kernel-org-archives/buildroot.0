From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:17:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  magiccube4d
Message-ID: <20080306181744.31C56120237@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:17:43 -0800 (Thu, 06 Mar 2008)
New Revision: 21211

Log:
added magiccube4d game

Added:
   trunk/buildroot/package/magiccube4d/
   trunk/buildroot/package/magiccube4d/Config.in
   trunk/buildroot/package/magiccube4d/magiccube4d-2_2-add-installer.patch
   trunk/buildroot/package/magiccube4d/magiccube4d-2_2-no-warn-err.patch
   trunk/buildroot/package/magiccube4d/magiccube4d.mk


Changeset:
Added: trunk/buildroot/package/magiccube4d/Config.in
===================================================================
--- trunk/buildroot/package/magiccube4d/Config.in	                        (rev 0)
+++ trunk/buildroot/package/magiccube4d/Config.in	2008-03-06 18:17:43 UTC (rev 21211)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MAGICCUBE4D
+	bool "magiccube4d"
+	default n
+	help
+	  Another rubiks cube-like game in 4D
+
+	  http://avr32linux.org/twiki/bin/viewfile/Main

Added: trunk/buildroot/package/magiccube4d/magiccube4d-2_2-add-installer.patch
===================================================================
--- trunk/buildroot/package/magiccube4d/magiccube4d-2_2-add-installer.patch	                        (rev 0)
+++ trunk/buildroot/package/magiccube4d/magiccube4d-2_2-add-installer.patch	2008-03-06 18:17:43 UTC (rev 21211)
@@ -0,0 +1,13 @@
+--- a/Makefile.in	2000-04-01 22:45:36.000000000 -0500
++++ b/Makefile.in	2008-02-29 13:18:24.000000000 -0500
+@@ -126,6 +126,10 @@ tgz: $(SRCTGZ)
+ 
+ bindist: $(BINTGZ)
+ 
++install :
++	mkdir -p $(GAMESDIR)
++	install -c magiccube4d $(GAMESDIR)
++
+ rpm: $(SRCTGZ)
+ 	rpm -ta $(SRCTGZ)
+ 

Added: trunk/buildroot/package/magiccube4d/magiccube4d-2_2-no-warn-err.patch
===================================================================
--- trunk/buildroot/package/magiccube4d/magiccube4d-2_2-no-warn-err.patch	                        (rev 0)
+++ trunk/buildroot/package/magiccube4d/magiccube4d-2_2-no-warn-err.patch	2008-03-06 18:17:43 UTC (rev 21211)
@@ -0,0 +1,11 @@
+--- a/configure	2000-02-10 23:19:34.000000000 -0500
++++ b/configure	2008-02-29 13:12:33.000000000 -0500
+@@ -686,7 +686,7 @@ fi
+ 
+ 
+ if test "$GXX" = "yes" ; then
+-   WFLAGS="$WFLAGS -pedantic -Wall -W -Wunused -Werror"
++   WFLAGS="$WFLAGS -pedantic -Wall -W -Wunused"
+ fi
+ echo $ac_n "checking how to run the C preprocessor""... $ac_c" 1>&6
+ echo "configure:693: checking how to run the C preprocessor" >&5

Added: trunk/buildroot/package/magiccube4d/magiccube4d.mk
===================================================================
--- trunk/buildroot/package/magiccube4d/magiccube4d.mk	                        (rev 0)
+++ trunk/buildroot/package/magiccube4d/magiccube4d.mk	2008-03-06 18:17:43 UTC (rev 21211)
@@ -0,0 +1,17 @@
+#############################################################
+#
+# magiccube4d
+#
+#############################################################
+MAGICCUBE4D_VERSION = 2_2
+MAGICCUBE4D_SOURCE = magiccube4d-src-$(MAGICCUBE4D_VERSION).tar.gz
+MAGICCUBE4D_SITE = http://avr32linux.org/twiki/pub/Main/MagicCube4D
+MAGICCUBE4D_AUTORECONF = NO
+MAGICCUBE4D_INSTALL_STAGING = NO
+MAGICCUBE4D_INSTALL_TARGET = YES
+MAGICCUBE4D_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
+
+MAGICCUBE4D_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,magiccube4d))
+
