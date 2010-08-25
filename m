From: Massimiliano Marretta <max@marretta.com>
Date: Wed, 25 Aug 2010 11:58:13 +0200
Subject: [Buildroot] [PATCH 2/2] GStreamer: upgrade to resolve mp3 issue.
	with the previeus version in Qt phonon gstreamer backand the
	mp3 time info is missing. In the new version the unaligned
	detection fix for x86-64 already present.
Message-ID: <1282730293-12902-2-git-send-email-max@marretta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Massimiliano Marretta <max@marretta.com>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
 .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 ....10.25-fix-unaligned-detectiob-for-x86-64.patch |   36 --------------------
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 6 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 7a059c1..558262d 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,7 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.14
+GST_PLUGINS_BAD_VERSION = 0.10.19
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index fcffe28..6418d17 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,7 +3,7 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.25
+GST_PLUGINS_BASE_VERSION = 0.10.30
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index c11b865..39e1c0a 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,7 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.16
+GST_PLUGINS_GOOD_VERSION = 0.10.24
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index c87451f..c6dc6c6 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -3,7 +3,7 @@
 # gst-plugins-ugly
 #
 #############################################################
-GST_PLUGINS_UGLY_VERSION = 0.10.10
+GST_PLUGINS_UGLY_VERSION = 0.10.15
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
index 49ac0df..0fe8265 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -3,7 +3,7 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.25
+GSTREAMER_VERSION = 0.10.30
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
-- 
1.7.1
