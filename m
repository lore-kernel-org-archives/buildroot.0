From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  4 Nov 2014 22:07:55 +0100
Subject: [Buildroot] [PATCH] gst1-validate: needs python
Message-ID: <1415135275-8828-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 http://autobuild.buildroot.net/results/e8c/e8c27db2a0935c2daef173d5650f6a2b3a219493/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-validate/Config.in        | 7 ++++++-
 package/gstreamer1/gst1-validate/gst1-validate.mk | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index ffcdd27..b22aa4a 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -1,5 +1,6 @@
-menuconfig BR2_PACKAGE_GST1_VALIDATE
+config BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GstValidate is a tool that allows GStreamer developers to
@@ -7,3 +8,7 @@ menuconfig BR2_PACKAGE_GST1_VALIDATE
 	  are supposed to.
 
 	  http://gstreamer.freedesktop.org/
+
+comment "gst1-validate depends on python"
+	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
+
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 4972cac..6cc0f65 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -12,6 +12,8 @@ GST1_VALIDATE_LICENSE_FILES = COPYING
 
 GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
 
-GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
+GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	$(if $(BR2_PACKAGE_PYTHON3),python3,python)
 
 $(eval $(autotools-package))
-- 
1.8.1.4
