From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:10:44 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20081204161044.93E6B3C8DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:10:44 -0800 (Thu, 04 Dec 2008)
New Revision: 24271

Log:
alsa-util: bump version to 1.0.18 and add patches for this version

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Added:
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch

Modified:
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk


Changeset:
Added: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch	2008-12-04 16:10:44 UTC (rev 24271)
@@ -0,0 +1,13 @@
+Index: alsa-utils-1.0.18/alsactl/init_sysdeps.c
+===================================================================
+--- alsa-utils-1.0.18.orig/alsactl/init_sysdeps.c	2008-12-01 08:27:16.000000000 +0100
++++ alsa-utils-1.0.18/alsactl/init_sysdeps.c	2008-12-01 08:27:22.000000000 +0100
+@@ -17,7 +17,7 @@
+  *
+  */
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__USE_BSD)
+ static size_t strlcpy(char *dst, const char *src, size_t size)
+ {
+ 	size_t bytes = 0;

Added: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch	2008-12-04 16:10:44 UTC (rev 24271)
@@ -0,0 +1,11 @@
+--- a/seq/aseqnet/Makefile.in
++++ b/seq/aseqnet/Makefile.in
+@@ -252,7 +252,7 @@ clean-binPROGRAMS:
+ 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
+ aseqnet$(EXEEXT): $(aseqnet_OBJECTS) $(aseqnet_DEPENDENCIES) 
+ 	@rm -f aseqnet$(EXEEXT)
+-	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS)
++	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS) $(INTLLIBS)
+ 
+ mostlyclean-compile:
+ 	-rm -f *.$(OBJEXT)

Modified: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2008-12-04 16:10:06 UTC (rev 24270)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2008-12-04 16:10:44 UTC (rev 24271)
@@ -3,7 +3,7 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VERSION:=1.0.14
+ALSA_UTILS_VERSION:=1.0.18
 ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VERSION)
