From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 15:10:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20071030221018.B9FA5A616A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 15:10:17 -0700 (Tue, 30 Oct 2007)
New Revision: 20342

Log:
Allow use of 'haserl' developer version

Added:
   trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch

Modified:
   trunk/buildroot/package/haserl/Config.in
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2007-10-30 21:58:15 UTC (rev 20341)
+++ trunk/buildroot/package/haserl/Config.in	2007-10-30 22:10:17 UTC (rev 20342)
@@ -7,3 +7,28 @@
 	  where something like PHP is too big.
 
 	  http://haserl.sourceforge.net/
+
+choice
+	prompt "Haserl version"
+	default BR2_PACKAGE_HASERL_VERSION_0_9_20
+	depends on BR2_PACKAGE_HASERL
+	help
+	  Select the older stable version, or the newer developer version
+
+config BR2_PACKAGE_HASERL_VERSION_0_8_0
+	bool	"v 0.8.0"
+	help
+	  stable version
+
+config BR2_PACKAGE_HASERL_VERSION_0_9_20
+	bool	"v 0.9.20"
+	help
+	  developer version - seems OK though
+
+endchoice
+
+
+config BR2_PACKAGE_HASERL_VERSION
+	string
+	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_0
+	default "0.9.20"	if BR2_PACKAGE_HASERL_VERSION_0_9_20

Added: trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch	2007-10-30 22:10:17 UTC (rev 20342)
@@ -0,0 +1,12 @@
+diff -urN haserl-0.9.20-0rig/src/haserl.c haserl-0.9.20/src/haserl.c
+--- haserl-0.9.20-0rig/src/haserl.c	2007-10-30 22:58:00.000000000 +0100
++++ haserl-0.9.20/src/haserl.c	2007-10-30 23:00:10.000000000 +0100
+@@ -210,7 +210,7 @@
+     }
+   memcpy ((char *) (entry + strlen (prefix)), str, strlen (str));
+ 
+-  keylen = (size_t) (index (entry, '=') - entry);
++  keylen = (size_t) (strchr (entry, '=') - entry);
+ 
+   if (keylen <= 0)
+     {

Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2007-10-30 21:58:15 UTC (rev 20341)
+++ trunk/buildroot/package/haserl/haserl.mk	2007-10-30 22:10:17 UTC (rev 20342)
@@ -4,10 +4,11 @@
 #
 #############################################################
 
-HASERL_VERSION=0.8.0
-HASERL_SOURCE=haserl-$(HASERL_VERSION).tar.gz
-HASERL_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
-HASERL_DIR=$(BUILD_DIR)/haserl-$(HASERL_VERSION)
+HASERL_VERSION:=$(strip $(subst ",,$(BR2_PACKAGE_HASERL_VERSION)))
+#"))
+HASERL_SOURCE:=haserl-$(HASERL_VERSION).tar.gz
+HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
+HASERL_DIR:=$(BUILD_DIR)/haserl-$(HASERL_VERSION)
 HASERL_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(HASERL_SOURCE):
