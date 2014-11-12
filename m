From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 12 Nov 2014 14:28:04 +0000
Subject: [Buildroot] [PATCH] gst1-validate: needs python
Message-ID: <1415802484-4026-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-validate needs Python at build time. Otherwise it will fail showing
an error like this one:

checking for a Python interpreter with version >= 2.7.0... none
configure: error: no suitable Python interpreter found

It also needs Python at run time because the installed file
"gst-validate-launcher" is a Python2 script:

$ file -b output/target/usr/bin/gst-validate-launcher
a /usr/bin/env python2 script text executable

Fixes:
  http://autobuild.buildroot.net/results/723/723fe3036e8f0af2a90ff9e98173387466655000/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-validate/Config.in        |    8 ++++++++
 package/gstreamer1/gst1-validate/gst1-validate.mk |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index ffcdd27..8b9f56f 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -1,9 +1,17 @@
 menuconfig BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate"
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_USE_MMU # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	help
 	  GstValidate is a tool that allows GStreamer developers to
 	  check that the GstElements they write behave the way they
 	  are supposed to.
 
 	  http://gstreamer.freedesktop.org/
+
+comment "gst1-validate needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 4972cac..1464922 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -12,6 +12,6 @@ GST1_VALIDATE_LICENSE_FILES = COPYING
 
 GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
 
-GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
+GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base python
 
 $(eval $(autotools-package))
-- 
1.7.1
