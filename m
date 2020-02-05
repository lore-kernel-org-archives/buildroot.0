From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:46:54 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-imx: allow to
 build with Waf on Python3
Message-ID: <20200205153552.7DB878CA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=796e4ca9a147198a93970788389e697378076855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes gst1-imx use the Waf package ditributed in Buildroot,
instead of its own one, as the latter does not support Python3.

Also backport a patch from upstream that tweaks the wscript,
such as to make it run on Waf >=2.0.12

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gst1-imx/0001-waf-update-to-2-0-12.patch       | 28 ++++++++++++++++++++++
 package/gstreamer1/gst1-imx/gst1-imx.mk            |  1 +
 2 files changed, 29 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch b/package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch
new file mode 100644
index 0000000000..dcc586311e
--- /dev/null
+++ b/package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch
@@ -0,0 +1,28 @@
+From 66bc1c2b9c74dab4706a1ca3696e863ed8d30433 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Sun, 15 Dec 2019 14:24:54 +0000
+Subject: [PATCH] waf: update to 2.0.12
+
+Prepare to allow building with python3.
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+[Titouan: backport part from upstream, but drop the update of waf itself]
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ wscript |  3 ++-
+ 2 files changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/wscript b/wscript
+index c3a9926..f076b64 100644
+--- a/wscript
++++ b/wscript
+@@ -152,7 +152,8 @@ def configure(conf):
+ 
+ 	# test for GStreamer libraries
+ 
+-	gst_version_str = conf.check_cfg(package = 'gstreamer-1.0 >= 1.2.0', modversion = "gstreamer-1.0", uselib_store = 'GSTREAMER', args = '--cflags --libs', mandatory = 1)
++	conf.check_cfg(package = 'gstreamer-1.0 >= 1.2.0', uselib_store = 'GSTREAMER', args = '--cflags --libs', mandatory = 1)
++	gst_version_str = conf.check_cfg(modversion = "gstreamer-1.0", uselib_store = 'GSTREAMER', args = '--cflags --libs', mandatory = 1)
+ 	gst_version = [int(x) for x in re.match('(\d*)\.(\d*)\.(\d*)', gst_version_str).groups()]
+ 	conf.env['GSTREAMER_VERSION'] = gst_version
+ 
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 43b4d9b15f..1156077274 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -11,6 +11,7 @@ GST1_IMX_LICENSE = LGPL-2.0+
 GST1_IMX_LICENSE_FILES = LICENSE
 
 GST1_IMX_INSTALL_STAGING = YES
+GST1_IMX_NEEDS_EXTERNAL_WAF = YES
 
 GST1_IMX_DEPENDENCIES += \
 	host-pkgconf \
