From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Mar 2012 23:05:45 +0100
Subject: [Buildroot] [git commit] gst-plugins-base: bump version
Message-ID: <20120314220942.1928990D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=841a6dc0a95dcdef91ca222e9c8d3c9121f0124d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...base-0.10.35-disable-testchannels-example.patch |   26 --------------------
 ...-tremor.patch => gst-plugins-base-tremor.patch} |    0
 .../gst-plugins-base/gst-plugins-base.mk           |    8 +++++-
 3 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-disable-testchannels-example.patch b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-disable-testchannels-example.patch
deleted file mode 100644
index e991c4e..0000000
--- a/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-disable-testchannels-example.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] disable testchannels example
-
-The testchannels example doesn't build because it forgets to link with
-libgstinterfaces. Unfortunately testchannels gets built even though
---disable-examples is used, so instead disable it in Makefile.in
-(package doesn't autoreconf cleanly, so don't edit Makefile.am)
-
-Problem is fixed upstream in 0.11 branch (940291dd38be66fa).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- gst-libs/gst/audio/Makefile.in |    1 -
- 1 file changed, 1 deletion(-)
-
-Index: gst-plugins-base-0.10.35/gst-libs/gst/audio/Makefile.in
-===================================================================
---- gst-plugins-base-0.10.35.orig/gst-libs/gst/audio/Makefile.in
-+++ gst-plugins-base-0.10.35/gst-libs/gst/audio/Makefile.in
-@@ -45,7 +45,6 @@
- POST_UNINSTALL = :
- build_triplet = @build@
- host_triplet = @host@
--noinst_PROGRAMS = testchannels$(EXEEXT)
- DIST_COMMON = $(libgstaudio_ at GST_MAJORMINOR@include_HEADERS) \
- 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
- 	$(top_srcdir)/common/gst-glib-gen.mak TODO
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-tremor.patch b/package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch
similarity index 100%
rename from package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-tremor.patch
rename to package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 3b21c27..848eaf2 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,7 +3,7 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.35
+GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -174,4 +174,10 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-vorbis
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST_PLUGINS_BASE_DEPENDENCIES += zlib
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-zlib
+endif
+
 $(eval $(call AUTOTARGETS))
