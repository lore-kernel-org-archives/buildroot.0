From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:50:05 +0100
Subject: [Buildroot] [git commit] gst1-validate: fix compile with cairo
	support
Message-ID: <20151027215120.751167F9D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7855885b95cf6ce9e0f2780d9764ae0b51f3538c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case cairo support is (auto-)detected cairo PNG support
is required.

Fixes ([1]):

../gst-libs/gst/video/.libs/libgstvalidatevideo-1.0.so: undefined reference to `cairo_surface_write_to_png'
../gst-libs/gst/video/.libs/libgstvalidatevideo-1.0.so: undefined reference to `cairo_image_surface_create_from_png'
collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/c5e/c5eb6cb12dba559226c67f5d258cc151aa8a8d3a

[Peter: reworded comment, dropped extra line]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/Config.in        |    2 ++
 package/gstreamer1/gst1-validate/gst1-validate.mk |    7 ++++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index 34ec85f..a9bb2aa 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_GST1_VALIDATE
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_PYTHON_PYEXPAT
+	# cairo is autodetected but needs PNG support
+	select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
 	help
 	  GstValidate is a tool that allows GStreamer developers to
 	  check that the GstElements they write behave the way they
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
