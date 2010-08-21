From: Massimiliano Marretta <max@marretta.com>
Date: Sat, 21 Aug 2010 14:53:07 +0200
Subject: [Buildroot] [PATCH] GStreamer: xorg support
Message-ID: <4C6FCC33.8040206@marretta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  I add support for xorg and upgrade version for mp3 issue.





diff -crBN 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
*** 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk    
Fri Jul 30 12:35:45 2010
--- 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk    
Thu Aug 19 13:43:35 2010
***************
*** 3,9 ****
   # gst-plugins-bad
   #
   #############################################################
! GST_PLUGINS_BAD_VERSION = 0.10.14
   GST_PLUGINS_BAD_SOURCE = 
gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
   GST_PLUGINS_BAD_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-bad
   GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
--- 3,9 ----
   # gst-plugins-bad
   #
   #############################################################
! GST_PLUGINS_BAD_VERSION = 0.10.19
   GST_PLUGINS_BAD_SOURCE = 
gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
   GST_PLUGINS_BAD_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-bad
   GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
diff -crBN 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-base/gst-plugins-base.mk 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-base/gst-plugins-base.mk
*** 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-base/gst-plugins-base.mk    
Fri Jul 30 12:35:45 2010
--- 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-base/gst-plugins-base.mk    
Thu Aug 19 09:59:20 2010
***************
*** 3,9 ****
   # gst-plugins-base
   #
   #############################################################
! GST_PLUGINS_BASE_VERSION = 0.10.25
   GST_PLUGINS_BASE_SOURCE = 
gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
   GST_PLUGINS_BASE_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-base
   GST_PLUGINS_BASE_INSTALL_STAGING = YES
--- 3,9 ----
   # gst-plugins-base
   #
   #############################################################
! GST_PLUGINS_BASE_VERSION = 0.10.30
   GST_PLUGINS_BASE_SOURCE = 
gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
   GST_PLUGINS_BASE_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-base
   GST_PLUGINS_BASE_INSTALL_STAGING = YES
***************
*** 18,26 ****

   GST_PLUGINS_BASE_CONF_OPT = \
           --disable-examples \
-         --disable-x \
-         --disable-xvideo \
-         --disable-xshm \
           --disable-oggtest \
           --disable-vorbistest \
           --disable-freetypetest
--- 18,23 ----
***************
*** 28,33 ****
--- 28,44 ----
   GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil \
           $(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)

+ ifeq ($(BR2_PACKAGE_XORG7),y)
+ GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
+ GST_PLUGINS_BASE_CONF_OPT += --enable-x \
+         --enable-xvideo \
+         --enable-xshm
+ else
+ GST_PLUGINS_BASE_CONF_OPT += --disable-x \
+         --disable-xvideo \
+         --disable-xshm
+ endif
+
   ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
   GST_PLUGINS_BASE_CONF_OPT += --enable-adder
   else
diff -crBN 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-good/gst-plugins-good.mk 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-good/gst-plugins-good.mk
*** 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-good/gst-plugins-good.mk    
Fri Jul 30 12:35:45 2010
--- 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-good/gst-plugins-good.mk    
Thu Aug 19 10:13:01 2010
***************
*** 3,9 ****
   # gst-plugins-good
   #
   #############################################################
! GST_PLUGINS_GOOD_VERSION = 0.10.16
   GST_PLUGINS_GOOD_SOURCE = 
gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
   GST_PLUGINS_GOOD_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-good
   GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
--- 3,9 ----
   # gst-plugins-good
   #
   #############################################################
! GST_PLUGINS_GOOD_VERSION = 0.10.24
   GST_PLUGINS_GOOD_SOURCE = 
gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
   GST_PLUGINS_GOOD_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-good
   GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
***************
*** 16,24 ****
           --disable-osx_audio \
           --disable-osx_video \
           --disable-gst_v4l2 \
-         --disable-x \
-         --disable-xshm \
-         --disable-xvideo \
           --disable-aalib \
           --disable-aalibtest \
           --disable-esd \
--- 16,21 ----
***************
*** 28,33 ****
--- 25,43 ----

   GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base

+ ifeq ($(BR2_PACKAGE_XORG7),y)
+ GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
+ GST_PLUGINS_BASE_CONF_OPT += --enable-x \
+         --enable-x \
+         --enable-xvideo \
+         --enable-xshm
+ else
+ GST_PLUGINS_BASE_CONF_OPT += --disable-x \
+         --disable-x \
+         --disable-xvideo \
+         --disable-xshm
+ endif
+
   ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
   GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
   GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
diff -crBN 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
*** 
buildroot-2010.08-rc1-old/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk    
Fri Jul 30 12:35:45 2010
--- 
buildroot-2010.08-rc1/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk    
Thu Aug 19 13:41:21 2010
***************
*** 3,9 ****
   # gst-plugins-ugly
   #
   #############################################################
! GST_PLUGINS_UGLY_VERSION = 0.10.10
   GST_PLUGINS_UGLY_SOURCE = 
gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
   GST_PLUGINS_UGLY_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-ugly
   GST_PLUGINS_UGLY_LIBTOOL_PATCH = NO
--- 3,9 ----
   # gst-plugins-ugly
   #
   #############################################################
! GST_PLUGINS_UGLY_VERSION = 0.10.15
   GST_PLUGINS_UGLY_SOURCE = 
gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
   GST_PLUGINS_UGLY_SITE = 
http://gstreamer.freedesktop.org/src/gst-plugins-ugly
   GST_PLUGINS_UGLY_LIBTOOL_PATCH = NO
diff -crBN 
buildroot-2010.08-rc1-old/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch 
buildroot-2010.08-rc1/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
*** 
buildroot-2010.08-rc1-old/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch    
Fri Jul 30 12:35:45 2010
--- 
buildroot-2010.08-rc1/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch    
Thu Jan  1 01:00:00 1970
***************
*** 1,36 ****
- [PATCH] gst-arch.m4: fix unaligned detection for x86-64 when cross 
compiling
-
- Submitted upstream at https://bugzilla.gnome.org/show_bug.cgi?id=607317
-
- Commit 4221e9dc (amd64/x86_64 allows unaligned memory access too) added
- x86-64 to the unaligned access whitelist, but missed the trailing
- wildcards, so the test never succeeds (host is something like
- x86_64-unknown-linux-gnu).
-
- When building natively, this isn't a big deal as the AC_TRY_RUN test
- correctly detects it, but that doesn't work when cross compiling so
- the build dies with:
-
- configure: error: cannot run test program while cross compiling
- See `config.log' for more details.
-
- Fix it by adding the trailing wildcards.
-
- Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
- ---
-  configure |    2 +-
-  1 file changed, 1 insertion(+), 1 deletion(-)
-
- Index: gstreamer-0.10.25/configure
- ===================================================================
- --- gstreamer-0.10.25.orig/configure
- +++ gstreamer-0.10.25/configure
- @@ -15655,7 +15655,7 @@ $as_echo_n "checking if unaligned memory
-          $as_echo_n "(blacklisted) " >&6
-          as_cv_unaligned_access=no
-      ;;
- -      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
- +      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
-          $as_echo_n "(whitelisted) " >&6
-          as_cv_unaligned_access=yes
-      ;;
--- 0 ----
diff -crBN 
buildroot-2010.08-rc1-old/package/multimedia/gstreamer/gstreamer.mk 
buildroot-2010.08-rc1/package/multimedia/gstreamer/gstreamer.mk
*** 
buildroot-2010.08-rc1-old/package/multimedia/gstreamer/gstreamer.mk    
Fri Jul 30 12:35:45 2010
--- buildroot-2010.08-rc1/package/multimedia/gstreamer/gstreamer.mk    
Thu Aug 19 09:40:29 2010
***************
*** 3,9 ****
   # gstreamer
   #
   #############################################################
! GSTREAMER_VERSION = 0.10.25
   GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
   GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
   GSTREAMER_INSTALL_STAGING = YES
--- 3,9 ----
   # gstreamer
   #
   #############################################################
! GSTREAMER_VERSION = 0.10.30
   GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
   GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
   GSTREAMER_INSTALL_STAGING = YES
