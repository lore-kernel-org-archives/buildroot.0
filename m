From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2015 15:13:25 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: unbreak vp8 support
Message-ID: <20150430132750.C993581DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5aed4e4e1992444f8d8bbfa8d4072bf3950f596
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/84e/84e7a2df4a8de2ca1ce075a8f5f32a94b7f45ce8/
http://autobuild.buildroot.net/results/db8/db8309c8cc6d4fb8a28d17c3b1ed71c49277d212/
http://autobuild.buildroot.net/results/5e4/5e424a25ee6796207e7a85ecbc80ac4428b0522e/
http://autobuild.buildroot.net/results/3b0/3b0e0356549d40edbe1c9a86214437e0f81fb3a3/

And many more.

gst-plugins-bad didn't have any explicit libvpx handling, so it would be
built with/without support for it depending on build order.

More importantly, the recent libvpx bump dropped the legacy (prefix-less)
symbols from the header file and gst-plugins-bad's handling of the non
legacy symbols was buggy.

Fix it by adding an explicit vp8 suboption and add a patch to fix (drop) the
legacy symbol handling.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-drop-buggy-libvpx-legacy-handling.patch   |   44 ++++++++++++++++++++
 package/gstreamer/gst-plugins-bad/Config.in        |    4 ++
 .../gstreamer/gst-plugins-bad/gst-plugins-bad.mk   |    7 +++
 3 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch b/package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch
new file mode 100644
index 0000000..780b5e3
--- /dev/null
+++ b/package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch
@@ -0,0 +1,44 @@
+[PATCH] vp8: drop buggy libvpx legacy handling
+
+Legacy handling for older libvpx versions were added back in 2010, but this
+was unfortunately buggy as these symbols are enums and not defines - So they
+are never defined and the legacy symbols always used.
+
+Now that the legacy symbols are completely removed from libvpx from v1.4.0
+onwards this breaks.  Fix it by simply dropping the legacy handling, nobody
+should be using libvpx versions from before 2010 (or gstreamer 0.10 for that
+matter) any more.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ext/vp8/gstvp8utils.h |   17 -----------------
+ 1 file changed, 17 deletions(-)
+
+Index: gst-plugins-bad-0.10.23/ext/vp8/gstvp8utils.h
+===================================================================
+--- gst-plugins-bad-0.10.23.orig/ext/vp8/gstvp8utils.h
++++ gst-plugins-bad-0.10.23/ext/vp8/gstvp8utils.h
+@@ -25,23 +25,6 @@
+ 
+ G_BEGIN_DECLS
+ 
+-/* Some compatibility defines for older libvpx versions */
+-#ifndef VPX_IMG_FMT_I420
+-#define VPX_IMG_FMT_I420 IMG_FMT_I420
+-#endif
+-
+-#ifndef VPX_PLANE_Y
+-#define VPX_PLANE_Y PLANE_Y
+-#endif
+-
+-#ifndef VPX_PLANE_U
+-#define VPX_PLANE_U PLANE_U
+-#endif
+-
+-#ifndef VPX_PLANE_V
+-#define VPX_PLANE_V PLANE_V
+-#endif
+-
+ const char * gst_vpx_error_name (vpx_codec_err_t status);
+ 
+ G_END_DECLS
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 1a3bdb2..1b465b2 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -316,4 +316,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
+	bool "vp8"
+	select BR2_PACKAGE_LIBVPX
+
 endif
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index ea0bd60..0a85603 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -578,4 +578,11 @@ else
 GST_PLUGINS_BAD_CONF_OPTS += --disable-vcd
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8),y)
+GST_PLUGINS_BAD_CONF_OPTS += --enable-vp8
+GST_PLUGINS_BAD_DEPENDENCIES += libvpx
+else
+GST_PLUGINS_BAD_CONF_OPTS += --disable-vp8
+endif
+
 $(eval $(autotools-package))
