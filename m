From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 12 Nov 2014 23:06:40 +0100
Subject: [Buildroot] [PATCH v3] gst1-validate: needs python
Message-ID: <1415830000-701-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 http://autobuild.buildroot.net/results/e8c/e8c27db2a0935c2daef173d5650f6a2b3a219493/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - add select BR2_PACKAGE_PYTHON_PYEXPAT (enables python xml package
    needed by gst-validate-launcher)

Changes v1 -> v2:
  - changed from python/python3 to python only (python3 is not usable because
    gst-validate-launcher script is python2 only, see [1] from
    Vicente Olivert Riera)

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/111907.html
---
 package/gstreamer1/gst1-validate/Config.in        | 7 ++++++-
 package/gstreamer1/gst1-validate/gst1-validate.mk | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index ffcdd27..34ec85f 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -1,9 +1,14 @@
-menuconfig BR2_PACKAGE_GST1_VALIDATE
+config BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate"
+	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_PYTHON_PYEXPAT
 	help
 	  GstValidate is a tool that allows GStreamer developers to
 	  check that the GstElements they write behave the way they
 	  are supposed to.
 
 	  http://gstreamer.freedesktop.org/
+
+comment "gst1-validate depends on python"
+	depends on !BR2_PACKAGE_PYTHON
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 4972cac..9a9e796 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -12,6 +12,6 @@ GST1_VALIDATE_LICENSE_FILES = COPYING
 
 GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
 
-GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
+GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base host-python python
 
 $(eval $(autotools-package))
-- 
1.8.1.4
