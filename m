From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Fri, 4 Feb 2011 22:26:55 +0100
Subject: [Buildroot] [git commit master 1/1] gstreamer: update to the latest
	gstreamer +plugins packages
Message-ID: <20110204214750.4FD778F3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7120391443533e8fd3b46496e45db9952955cfef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liboil is not needed not used any more. orc _can_ be used instead, but
it's not needed.

[Peter: get rid of liboil selects]
Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    4 +-
 package/multimedia/gst-plugins-base/Config.in      |    1 -
 .../gst-plugins-base/gst-plugins-base.mk           |    4 +-
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 ....10.25-fix-unaligned-detectiob-for-x86-64.patch |   36 --------------------
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 7 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 7a059c1..c300256 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,7 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.14
+GST_PLUGINS_BAD_VERSION = 0.10.21
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
@@ -11,7 +11,7 @@ GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
 GST_PLUGINS_BAD_CONF_OPT = \
 		--disable-examples
 
-GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer liboil
+GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-aacparse
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 0f552fe..09c243c 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -1,7 +1,6 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
 	bool "gst-plugins-base"
 	depends on BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_LIBOIL
 	help
 	  A basic set of well-supported plug-ins for GStreamer.
 
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index e91d5fc..828d156 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,7 +3,7 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.25
+GST_PLUGINS_BASE_VERSION = 0.10.32
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -25,7 +25,7 @@ GST_PLUGINS_BASE_CONF_OPT = \
 		--disable-vorbistest \
 		--disable-freetypetest
 
-GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil
+GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
 
 # alsa support needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index f7a2087..7a67dc5 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,7 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.16
+GST_PLUGINS_GOOD_VERSION = 0.10.27
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index fc2fcff..4eb02e5 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -3,7 +3,7 @@
 # gst-plugins-ugly
 #
 #############################################################
-GST_PLUGINS_UGLY_VERSION = 0.10.10
+GST_PLUGINS_UGLY_VERSION = 0.10.17
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST_PLUGINS_UGLY_LIBTOOL_PATCH = NO
diff --git a/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch b/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
deleted file mode 100644
index 1635fe7..0000000
--- a/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-[PATCH] gst-arch.m4: fix unaligned detection for x86-64 when cross compiling
-
-Submitted upstream at https://bugzilla.gnome.org/show_bug.cgi?id=607317
-
-Commit 4221e9dc (amd64/x86_64 allows unaligned memory access too) added
-x86-64 to the unaligned access whitelist, but missed the trailing
-wildcards, so the test never succeeds (host is something like
-x86_64-unknown-linux-gnu).
-
-When building natively, this isn't a big deal as the AC_TRY_RUN test
-correctly detects it, but that doesn't work when cross compiling so
-the build dies with:
-
-configure: error: cannot run test program while cross compiling
-See `config.log' for more details.
-
-Fix it by adding the trailing wildcards.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: gstreamer-0.10.25/configure
-===================================================================
---- gstreamer-0.10.25.orig/configure
-+++ gstreamer-0.10.25/configure
-@@ -15655,7 +15655,7 @@ $as_echo_n "checking if unaligned memory
-         $as_echo_n "(blacklisted) " >&6
-         as_cv_unaligned_access=no
- 	;;
--      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
-+      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
-         $as_echo_n "(whitelisted) " >&6
-         as_cv_unaligned_access=yes
- 	;;
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index d689619..558d476 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -3,7 +3,7 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.25
+GSTREAMER_VERSION = 0.10.32
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
-- 
1.7.3.4
