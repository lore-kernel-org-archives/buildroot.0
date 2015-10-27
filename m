From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2015 21:58:30 +0100
Subject: [Buildroot] [PATCH v1] gst1-validate: fix compile with cairo support
Message-ID: <1445979510-9276-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case cairo support is (auto-)detected cairo PNG support
is required.

Fixes ([1]):

../gst-libs/gst/video/.libs/libgstvalidatevideo-1.0.so: undefined reference to `cairo_surface_write_to_png'
../gst-libs/gst/video/.libs/libgstvalidatevideo-1.0.so: undefined reference to `cairo_image_surface_create_from_png'
collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/c5e/c5eb6cb12dba559226c67f5d258cc151aa8a8d3a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-validate/Config.in        | 3 +++
 package/gstreamer1/gst1-validate/gst1-validate.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index 34ec85f..1b3b2f5 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_GST1_VALIDATE
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_PYTHON_PYEXPAT
+	# if package cairo is autodetected PNG support is needed
+	select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
 	help
 	  GstValidate is a tool that allows GStreamer developers to
 	  check that the GstElements they write behave the way they
@@ -12,3 +14,4 @@ config BR2_PACKAGE_GST1_VALIDATE
 
 comment "gst1-validate depends on python"
 	depends on !BR2_PACKAGE_PYTHON
+
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index b8b09da..a7d66be 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -12,6 +12,11 @@ GST1_VALIDATE_LICENSE_FILES = COPYING
 
 GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
 
-GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base host-python python
+GST1_VALIDATE_DEPENDENCIES = \
+	gstreamer1 \
+	gst1-plugins-base \
+	host-python \
+	python \
+	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
 $(eval $(autotools-package))
-- 
2.1.4
