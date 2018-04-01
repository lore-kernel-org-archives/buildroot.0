From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 18:47:32 +0200
Subject: [Buildroot] [git commit] gst1-interpipe: new package
Message-ID: <20180401164755.5E98B83232@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3522e78fc3a455834f99d7b3f2297ddf79815033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a normal config option instead of menuconfig, update DEVELOPERS]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                          |  1 +
 package/gstreamer1/Config.in                        |  1 +
 package/gstreamer1/gst1-interpipe/Config.in         | 10 ++++++++++
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash   |  5 +++++
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk | 21 +++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d97259e73a..a438aab4cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1454,6 +1454,7 @@ F:	package/dejavu/
 F:	package/dillo/
 F:	package/edid-decode/
 F:	package/ghostscript-fonts/
+F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gst1-validate/
 F:	package/libevdev/
 F:	package/log4cplus/
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 76c32bc6c6..8553cd2b2d 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -8,6 +8,7 @@ source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
+source "package/gstreamer1/gst1-interpipe/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
diff --git a/package/gstreamer1/gst1-interpipe/Config.in b/package/gstreamer1/gst1-interpipe/Config.in
new file mode 100644
index 0000000000..5640c2b3db
--- /dev/null
+++ b/package/gstreamer1/gst1-interpipe/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GST1_INTERPIPE
+	bool "gst1-interpipe"
+	select BR2_PACKAGE_GSTREAMER1_CHECK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	help
+	  GstInterpipe is a Gstreamer plug-in that allows communication
+	  between two independent pipelines.
+
+	  https://github.com/RidgeRun/gst-interpipe
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
new file mode 100644
index 0000000000..b9b1c5e429
--- /dev/null
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -0,0 +1,5 @@
+# locally computed hash
+sha256 3f8cc5cf4861e5836938c66415b47555550c93b06b1bc9faed83e89bacf705cf gst1-interpipe-10dba89eecc200e49f0b432e299f1c8a4312b657.tar.gz
+
+# Hashes for license files:
+sha256 16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5 COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
new file mode 100644
index 0000000000..8f810f9cf1
--- /dev/null
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# gst1-interpipe
+#
+################################################################################
+
+GST1_INTERPIPE_VERSION = 10dba89eecc200e49f0b432e299f1c8a4312b657
+GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
+GST1_INTERPIPE_SITE_METHOD = git
+# fetch gst-interpipe/common sub module
+GST1_INTERPIPE_GIT_SUBMODULES = YES
+
+GST1_INTERPIPE_LICENSE = LGPL-2.1
+GST1_INTERPIPE_LICENSE_FILES = COPYING
+
+# from git source
+GST1_INTERPIPE_AUTORECONF = YES
+
+GST1_INTERPIPE_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
+
+$(eval $(autotools-package))
