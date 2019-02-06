From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:29:26 +0100
Subject: [Buildroot] [git commit] package/gst1-shark: new package
Message-ID: <20190206102804.DBF00837B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b7b7cbac6e8e479bde519235902d90234ea5a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GstShark leverages GStreamers newest instrumentation subsystem by
installing a set of custom hooks to the trace points. A variety of
data analytics are extracted and presented to the user in a graphical,
friendly way.

https://developer.ridgerun.com/wiki/index.php?title=GstShark
https://github.com/RidgeRun/gst-shark

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>
Cc: Jo??o Victor Oliveira <jv.oliveirag@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Igor Miranda <igorcmiranda3110@gmail.com>
[Thomas:
 - fix package prompt to be gtk1-shark in Config.in
 - license is LGPL-2.1+, not LGPL-2.1
 - add entry to DEVELOPERS file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 package/gstreamer1/Config.in                  |  1 +
 package/gstreamer1/gst1-shark/Config.in       | 12 ++++++++++++
 package/gstreamer1/gst1-shark/gst1-shark.hash |  5 +++++
 package/gstreamer1/gst1-shark/gst1-shark.mk   | 19 +++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65b6a09121..1f3cc6a888 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -461,6 +461,7 @@ F:	configs/orangepi_plus_defconfig
 
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/eventlog/
+F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
 F:	package/micropython-lib/
 F:	package/syslog-ng/
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 28b1ed25c5..922ecefcff 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -11,6 +11,7 @@ source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-interpipe/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
+source "package/gstreamer1/gst1-shark/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
diff --git a/package/gstreamer1/gst1-shark/Config.in b/package/gstreamer1/gst1-shark/Config.in
new file mode 100644
index 0000000000..9d656e2419
--- /dev/null
+++ b/package/gstreamer1/gst1-shark/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GST1_SHARK
+	bool "gst1-shark"
+	select BR2_PACKAGE_GSTREAMER1_CHECK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	help
+	  GstShark leverages GStreamers newest instrumentation subsystem
+	  by installing a set of custom hooks to the trace points. A
+	  variety of data analytics are extracted and presented to the
+	  user in a graphical, friendly way.
+
+	  https://github.com/RidgeRun/gst-shark
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
new file mode 100644
index 0000000000..fdcbc563a8
--- /dev/null
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -0,0 +1,5 @@
+# locally computed hash
+sha256 35c56b89c10f42c623f5831f9533e1b9dcab8946eff0e4000bf3137bad5c705a  gst1-shark-v0.5.5.tar.gz
+
+# Hashes for license files:
+sha256 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
new file mode 100644
index 0000000000..1e198f0cdd
--- /dev/null
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# gst1-shark
+#
+################################################################################
+
+GST1_SHARK_VERSION = v0.5.5
+GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
+GST1_SHARK_SITE_METHOD = git
+GST1_SHARK_GIT_SUBMODULES = YES
+
+GST1_SHARK_LICENSE = LGPL-2.1+
+GST1_SHARK_LICENSE_FILES = COPYING
+
+GST1_SHARK_AUTORECONF = YES
+GST1_SHARK_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
+GST1_SHARK_CONF_OPTS = --disable-graphviz
+
+$(eval $(autotools-package))
