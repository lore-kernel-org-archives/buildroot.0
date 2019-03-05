From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Mar 2019 23:01:04 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/gst-plugins-bad: remove apexsink support
Message-ID: <20190305220104.16670-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apexsink does not build with OpenSSL 1.1.x so remove this option
especially because there is no more apexsink option in gstreamer1 (since
version 1.12)

Fixes:
 - http://autobuild.buildroot.org/results/a29e8a8509190fc4b3c419dae2301cf72a601f62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update commit message with information about gstreamer1

 Config.in.legacy                                     | 8 ++++++++
 package/gstreamer/gst-plugins-bad/Config.in          | 4 ----
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 8 +-------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 25b48fba82..93e50f3f60 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2019.05"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
+	bool "gst-plugins-bad apexsink option removed"
+	select BR2_LEGACY
+	help
+	  The gst-plugins-bad apexsink option was removed.
+
 comment "Legacy options removed in 2019.02"
 
 config BR2_PACKAGE_QT
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index f45981f6c8..971668b710 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -242,10 +242,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M
 
 comment "plugins with external dependencies (there may be more available)"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
-	bool "apexsink"
-	select BR2_PACKAGE_OPENSSL
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 856ff9665d..a98eac4235 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -12,6 +12,7 @@ GST_PLUGINS_BAD_LICENSE = LGPL-2.1+, GPL-2.0+
 GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
 
 GST_PLUGINS_BAD_CONF_OPTS = \
+	--disable-apexsink \
 	--disable-examples \
 	--disable-spandsp
 
@@ -472,13 +473,6 @@ GST_PLUGINS_BAD_CONF_OPTS += --disable-y4m
 endif
 
 # plugins with deps
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-apexsink
-GST_PLUGINS_BAD_DEPENDENCIES += openssl
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-apexsink
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2),y)
 GST_PLUGINS_BAD_CONF_OPTS += --enable-bz2
 GST_PLUGINS_BAD_DEPENDENCIES += bzip2
-- 
2.14.1
