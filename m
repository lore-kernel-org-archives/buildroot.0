From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon, 24 Jan 2011 00:41:31 +0200
Subject: [Buildroot] [PATCH 3rd RESEND 2/6] Fix gstreamer packages for make
	3.82
In-Reply-To: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1295822495-16972-3-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These packages would get fixed on the next releases, but each one gets
released at different periods. For now this is needed to build on 3.82.

I only tested gstreamer, gst-plugins-base, and gst-plugins-good, but all
the ones using the 'common' submodule should have this issue.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |    2 ++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 ++
 .../gst-plugins-base/gst-plugins-base.mk           |    2 ++
 .../gst-plugins-good/gst-plugins-good.mk           |    2 ++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 ++
 package/multimedia/gstreamer/gstreamer.mk          |    7 +++++++
 6 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index 557c146..8b9ddb6 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -15,4 +15,6 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 GST_FFMPEG_DEPENDENCIES += bzip2
 endif
 
+GST_FFMPEG_POST_EXTRACT_HOOKS += GSTREAMER_FIX_MAKE
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-ffmpeg))
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 7a059c1..db35440 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -368,4 +368,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
 endif
 
+GST_PLUGINS_BAD_POST_EXTRACT_HOOKS += GSTREAMER_FIX_MAKE
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-bad))
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index e91d5fc..e8e9407 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -158,4 +158,6 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-vorbis
 endif
 
+GST_PLUGINS_BASE_POST_EXTRACT_HOOKS += GSTREAMER_FIX_MAKE
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-base))
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index f7a2087..33284a9 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -336,4 +336,6 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
+GST_PLUGINS_GOOD_POST_EXTRACT_HOOKS += GSTREAMER_FIX_MAKE
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index fc2fcff..1540a55 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -82,4 +82,6 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
 endif
 
+GST_PLUGINS_UGLY_POST_EXTRACT_HOOKS += GSTREAMER_FIX_MAKE
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-ugly))
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index d689619..9801e16 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -24,4 +24,11 @@ GSTREAMER_CONF_OPT = \
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
+define GSTREAMER_FIX_MAKE
+	$(SED) 's/^        \(-gtkdoc\)/	\1/' `find $(@D)/docs -name Makefile.in`
+endef
+
+# should be fixed on 0.10.31
+GSTREAMER_POST_EXTRACT_HOOKS += GSTREAMER_FIX_MAKE
+
 $(eval $(call AUTOTARGETS,package/multimedia,gstreamer))
-- 
1.7.4.rc2
