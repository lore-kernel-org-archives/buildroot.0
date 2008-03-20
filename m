From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 20 Mar 2008 09:55:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: alsamixergui docker
Message-ID: <20080320165537.513A83C311@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-20 09:55:37 -0700 (Thu, 20 Mar 2008)
New Revision: 21416

Log:
add alsamixergui and docker packages

Added:
   trunk/buildroot/package/alsamixergui/
   trunk/buildroot/package/alsamixergui/Config.in
   trunk/buildroot/package/alsamixergui/alsamixergui.mk
   trunk/buildroot/package/alsamixergui/alsamixergui_0.9.0rc2-1-7.patch
   trunk/buildroot/package/docker/
   trunk/buildroot/package/docker/Config.in
   trunk/buildroot/package/docker/docker-1.5-skip-configure.patch
   trunk/buildroot/package/docker/docker.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-03-20 16:54:51 UTC (rev 21415)
+++ trunk/buildroot/package/Config.in	2008-03-20 16:55:37 UTC (rev 21416)
@@ -383,6 +383,7 @@
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
 source "package/tslib/Config.in"
+source "package/webkit/Config.in"
 
 comment "X Window managers"
 source "package/matchbox/Config.in"
@@ -390,20 +391,21 @@
 source "package/blackbox/Config.in"
 
 comment "X applications"
+source "package/alsamixergui/Config.in"
 source "package/dillo/Config.in"
+source "package/docker/Config.in"
+source "package/gqview/Config.in"
+source "package/leafpad/Config.in"
 source "package/midori/Config.in"
-source "package/webkit/Config.in"
+source "package/pcmanfm/Config.in"
 source "package/rdesktop/Config.in"
 source "package/rxvt/Config.in"
+source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
-source "package/gqview/Config.in"
-source "package/leafpad/Config.in"
 source "package/torsmo/Config.in"
-source "package/pcmanfm/Config.in"
+source "package/x11vnc/Config.in"
+source "package/xpdf/Config.in"
 source "package/xstroke/Config.in"
-source "package/sylpheed/Config.in"
-source "package/xpdf/Config.in"
-source "package/x11vnc/Config.in"
 source "package/xvkbd/Config.in"
 
 comment "Video libraries/codecs and applications"

Added: trunk/buildroot/package/alsamixergui/Config.in
===================================================================
--- trunk/buildroot/package/alsamixergui/Config.in	                        (rev 0)
+++ trunk/buildroot/package/alsamixergui/Config.in	2008-03-20 16:55:37 UTC (rev 21416)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ALSAMIXERGUI
+	bool "alsamixergui"
+	default n
+	help
+	  A nice GUI mixer for Alsa using fltk
+
+	  http://snapshot.debian.net/archive/2008/03/19/debian/pool/main/a/alsamixergui

Added: trunk/buildroot/package/alsamixergui/alsamixergui.mk
===================================================================
--- trunk/buildroot/package/alsamixergui/alsamixergui.mk	                        (rev 0)
+++ trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-03-20 16:55:37 UTC (rev 21416)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# alsamixergui
+#
+#############################################################
+ALSAMIXERGUI_VERSION = 0.9.0rc2-1
+ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
+ALSAMIXERGUI_SITE = http://snapshot.debian.net/archive/2008/03/19/debian/pool/main/a/alsamixergui
+ALSAMIXERGUI_AUTORECONF = YES
+ALSAMIXERGUI_INSTALL_STAGING = NO
+ALSAMIXERGUI_INSTALL_TARGET = YES
+
+ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++"
+
+ALSAMIXERGUI_DEPENDENCIES = uclibc fltk
+
+$(eval $(call AUTOTARGETS,package,alsamixergui))
+

Added: trunk/buildroot/package/alsamixergui/alsamixergui_0.9.0rc2-1-7.patch
===================================================================
--- trunk/buildroot/package/alsamixergui/alsamixergui_0.9.0rc2-1-7.patch	                        (rev 0)
+++ trunk/buildroot/package/alsamixergui/alsamixergui_0.9.0rc2-1-7.patch	2008-03-20 16:55:37 UTC (rev 21416)
@@ -0,0 +1,40 @@
+--- a/configure.in
++++ b/configure.in
+@@ -11,7 +11,10 @@
+ AC_PROG_LN_S
+ 
+ dnl Checks for libraries.
+-AC_CHECK_LIB(fltk,numericsort,,AC_MSG_ERROR("missing fltk"))
++AC_CHECK_LIB(fltk,numericsort,,
++AC_CHECK_LIB(fltk,fl_numericsort,,
++AC_MSG_ERROR("missing fltk"))
++)
+ AM_PATH_ALSA(0.9.0)
+ 
+ dnl Checks for header files.
+--- a/src/alsamixer.cxx	2007-10-21 12:39:11.000000000 -0400
++++ b/src/alsamixer.cxx	2007-10-21 12:49:10.000000000 -0400
+@@ -2081,8 +2081,8 @@ static void
+ mixer_signal_handler (int signal)
+ {
+   if (signal != SIGSEGV)
+-    mixer_abort (ERR_SIGNAL, sys_siglist[signal], 0);
+-  else
++  //  mixer_abort (ERR_SIGNAL, sys_siglist[signal], 0);
++  //else
+     {
+       fprintf (stderr, "\nSegmentation fault.\n");
+       _exit (11);
+--- a/src/alsamixer.cxx	2006-01-16 12:41:54.000000000 -0600
++++ b/src/alsamixer.cxx	2006-01-16 12:45:44.000000000 -0600
+@@ -653,8 +653,8 @@
+     if (vleft >= 0 && vright >= 0) {
+       if (joined) {
+ #ifdef ALSAMIXER_GUI
+-	for (chn = snd_mixer_selem_channel_id_t(0); chn < SND_MIXER_SCHN_LAST; 
+-	snd_mixer_selem_channel_id_t(int(chn)++))
++	for (chn = snd_mixer_selem_channel_id_t(0); chn < SND_MIXER_SCHN_LAST;
++	snd_mixer_selem_channel_id_t(int(chn)+1))
+ #else
+ 	for (chn = 0; chn < SND_MIXER_SCHN_LAST; chn++)
+ #endif

Added: trunk/buildroot/package/docker/Config.in
===================================================================
--- trunk/buildroot/package/docker/Config.in	                        (rev 0)
+++ trunk/buildroot/package/docker/Config.in	2008-03-20 16:55:37 UTC (rev 21416)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DOCKER
+	bool "docker"
+	default n
+	help
+	  a system tray dock for X
+
+	  http://icculus.org/openbox/2/docker

Added: trunk/buildroot/package/docker/docker-1.5-skip-configure.patch
===================================================================
--- trunk/buildroot/package/docker/docker-1.5-skip-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/docker/docker-1.5-skip-configure.patch	2008-03-20 16:55:37 UTC (rev 21416)
@@ -0,0 +1,4 @@
+--- a/.stamp_configured	2008-03-19 03:34:24.425005162 -0400
++++ b/.stamp_configured	2008-03-19 14:25:33.000000000 -0400
+@@ -0,0 +1 @@
++ 

Added: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	                        (rev 0)
+++ trunk/buildroot/package/docker/docker.mk	2008-03-20 16:55:37 UTC (rev 21416)
@@ -0,0 +1,22 @@
+#############################################################
+#
+# docker
+#
+#############################################################
+DOCKER_VERSION = 1.5
+DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
+DOCKER_SITE = http://icculus.org/openbox/2/docker
+DOCKER_AUTORECONF = NO
+DOCKER_INSTALL_STAGING = NO
+DOCKER_INSTALL_TARGET = YES
+
+DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
+					CFLAGS="-I$(STAGING_DIR)/usr/include" \
+					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
+
+DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
+
+DOCKER_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,docker))
+
