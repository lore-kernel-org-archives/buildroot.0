From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 16 Nov 2007 02:16:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20071116101649.DB67330040@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-16 02:16:48 -0800 (Fri, 16 Nov 2007)
New Revision: 20431

Log:
add more recent version of freetype, required at least for avr32 to build correctly

Modified:
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2007-11-16 05:24:43 UTC (rev 20430)
+++ trunk/buildroot/package/freetype/Config.in	2007-11-16 10:16:48 UTC (rev 20431)
@@ -4,3 +4,23 @@
 	help
 
 	http://www.freetype.org/
+
+choice
+	prompt "Freetype Version"
+	depends BR2_PACKAGE_FREETYPE
+	default BR2_FREETYPE_VERSION_2_2_1
+	help
+	  Select the version of Freetype you wish to use.
+
+	config BR2_FREETYPE_VERSION_2_2_1
+		bool "Freetype 2.2.1"
+
+	config BR2_FREETYPE_VERSION_2_3_5
+		bool "Freetype 2.3.5"
+
+endchoice
+
+config BR2_FREETYPE_VERSION
+	string
+	default "2.2.1"		if BR2_FREETYPE_VERSION_2_2_1
+	default "2.3.5"		if BR2_FREETYPE_VERSION_2_3_5

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-11-16 05:24:43 UTC (rev 20430)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-11-16 10:16:48 UTC (rev 20431)
@@ -3,7 +3,7 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION:=2.2.1
+FREETYPE_VERSION:=$(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
 FREETYPE_SOURCE:=freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_CAT:=$(BZCAT)
