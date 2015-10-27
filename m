From: Viacheslav Volkov <sv99@inbox.ru>
Date: Tue, 27 Oct 2015 15:06:58 +0300
Subject: [Buildroot] [PATCH 1/1] v4l2grab: new package
Message-ID: <1445947618-8569-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Utility for grabbing JPEGs form V4L2 devices.

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
 package/Config.in            |  1 +
 package/v4l2grab/Config.in   |  8 ++++++++
 package/v4l2grab/v4l2grab.mk | 23 +++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/v4l2grab/Config.in
 create mode 100644 package/v4l2grab/v4l2grab.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..75a5120 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -40,6 +40,7 @@ menu "Audio and video applications"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/upmpdcli/Config.in"
+	source "package/v4l2grab/Config.in"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
diff --git a/package/v4l2grab/Config.in b/package/v4l2grab/Config.in
new file mode 100644
index 0000000..1e1fbfc
--- /dev/null
+++ b/package/v4l2grab/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_V4L2GRAB
+	bool "v4l2grab"
+	select BR2_PACKAGE_JPEG
+    select BR2_PACKAGE_LIBV4L
+	help
+	    Utility for grabbing JPEGs form V4L2 devices.
+		
+		http://www.twam.info/software/v4l2grab-grabbing-jpegs-from-v4l2-devices
diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
new file mode 100644
index 0000000..935bc8e
--- /dev/null
+++ b/package/v4l2grab/v4l2grab.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# v4l2grab
+#
+#############################################################
+
+V4L2GRAB_VERSION = c5fec16df732185de5ba6d73c13790570551d7a6
+V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
+V4L2GRAB_INSTALL_TARGET = YES
+V4L2GRAB_AUTORECONF = YES
+V4L2GRAB_DEPENDENCIES = libjpeg libv4l
+
+define V4L2GRAB_INSTALL_TARGET_CMDS
+
+	mkdir -p $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(@D)/v4l2grab $(TARGET_DIR)/usr/bin
+endef
+
+define V4L2GRAB_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/v4l2grab
+endef
+
+$(eval $(autotools-package))
-- 
2.6.1
