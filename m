From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jun 2018 00:35:25 +0200
Subject: [Buildroot] [PATCH v6 5/9] gst1-vaapi: bump to 1.14.1
In-Reply-To: <20180623223529.13629-1-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
Message-ID: <20180623223529.13629-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

- add upstream patch to fix the following compile failure:

  gstvaapipluginutil.c:259:12: error: ?GstGLDisplay? undeclared (first use in this function); did you mean ?GstVaapiDisplay??
             (GstGLDisplay **) & plugin->gl_display,
              ^~~~~~~~~~~~
              GstVaapiDisplay
  gstvaapipluginutil.c:259:12: note: each undeclared identifier is reported only once for each function it appears in
  gstvaapipluginutil.c:259:27: error: expected expression before ?)? token
             (GstGLDisplay **) & plugin->gl_display,
                             ^

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Update to 1.14.1]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v5 -> v6:
  - update to 1.14.1
  - add upstream patch to fix compile failure
---
 .../0001-plugins-guard-GstGL-code.patch       | 35 +++++++++++++++++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  5 +--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch

diff --git a/package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch b/package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch
new file mode 100644
index 0000000000..a85d666e31
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch
@@ -0,0 +1,35 @@
+From 73e31146a5c6bcd48eb3089a2a140833a401623b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
+ <vjaquez@igalia.com>
+Date: Mon, 21 May 2018 13:27:14 +0200
+Subject: [PATCH] plugins: guard GstGL code
+
+Upstream: https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi/patch/?id=45fb111850955d9192e43b9dbcb2ef8e3974e58d
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gst/vaapi/gstvaapipluginutil.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst/vaapi/gstvaapipluginutil.c b/gst/vaapi/gstvaapipluginutil.c
+index fa25131..648c91b 100644
+--- a/gst/vaapi/gstvaapipluginutil.c
++++ b/gst/vaapi/gstvaapipluginutil.c
+@@ -246,6 +246,7 @@ gst_vaapi_create_display_from_gl_context (GstObject * gl_context_object)
+ static void
+ gst_vaapi_find_gl_context (GstElement * element)
+ {
++#if USE_GST_GL_HELPERS
+   GstVaapiPluginBase *const plugin = GST_VAAPI_PLUGIN_BASE (element);
+ 
+   /* if the element is vaapisink or any vaapi encoder it doesn't need
+@@ -282,6 +283,7 @@ no_valid_gl_display:
+     gst_object_replace (&plugin->gl_other_context, NULL);
+     return;
+   }
++#endif
+ }
+ 
+ gboolean
+-- 
+2.17.1
+
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 3eebc0afe7..b3c72310c2 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.4.tar.xz.sha256sum
-sha256 1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9 gstreamer-vaapi-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.14.1.tar.xz.sha256sum
+sha256 585c3ddb0c39220de0a33e5d0ed6196a108b8407ec3538d7c64617713b4434e8 gstreamer-vaapi-1.14.1.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 6b637416f5..1e7e6f1c86 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.4
+GST1_VAAPI_VERSION = 1.14.1
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.17.1
