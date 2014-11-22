From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:18:59 +0100
Subject: [Buildroot] [git commit] gst1-validate: needs python
Message-ID: <20141122191906.E91607FE1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3c6fa297a4b06b29c15d343488ba7cad3602d89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If host installed python version is < 2.7.0 gst1-validate compile will fail with

	checking for a Python interpreter with version >= 2.7.0... none
	configure: error: no suitable Python interpreter found

Fixed by adding host-python dependency.

Target tool /usr/bin/gst-validate-launcher is a python2 script

	$ head -1 /usr/bin/gst-validate-launcher
	#!/usr/bin/env python2

(and not easily upgradable to python3) so add python2 dependency and to fix
the following runtime error

	$ gst-validate-launcher
	Traceback (most recent call last):
	  File "/usr/bin/gst-validate-launcher", line 44, in <module>
	    from launcher.main import main
	  File "/usr/lib/gst-validate-launcher/python/launcher/main.py", line 26, in <module>
	    import reporters
	  File "/usr/lib/gst-validate-launcher/python/launcher/reporters.py", line 29, in <module>
	    from xml.sax import saxutils
	ImportError: No module named xml.sax

add additional BR2_PACKAGE_PYTHON_PYEXPAT select.

Fixes:
 http://autobuild.buildroot.net/results/e8c/e8c27db2a0935c2daef173d5650f6a2b3a219493/
 http://autobuild.buildroot.net/results/723/723fe3036e8f0af2a90ff9e98173387466655000/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-validate/Config.in        |    7 ++++++-
 package/gstreamer1/gst1-validate/gst1-validate.mk |    2 +-
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
