From: Maarten ter Huurne <maarten@treewalker.org>
Date: Fri, 17 Oct 2014 19:10:11 +0200
Subject: [Buildroot] [PATCH] modplugtools: Added package
Message-ID: <1413565811-7196-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This installs the 'modplug123' command line tool to play music files
using libmodplug.

http://modplug-xmms.sourceforge.net/

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
The command line tool is about 10 kB in size and is useful to test
libmodplug and/or audio playback in general.

 package/Config.in                    |  1 +
 package/modplugtools/Config.in       |  9 +++++++++
 package/modplugtools/modplugtools.mk | 21 +++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/modplugtools/Config.in
 create mode 100644 package/modplugtools/modplugtools.mk

diff --git a/package/Config.in b/package/Config.in
index 76fd1a0..03c7074 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -18,6 +18,7 @@ menu "Audio and video applications"
 	source "package/lame/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
+	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
diff --git a/package/modplugtools/Config.in b/package/modplugtools/Config.in
new file mode 100644
index 0000000..53e9672
--- /dev/null
+++ b/package/modplugtools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MODPLUGTOOLS
+	bool "modplugtools"
+	select BR2_PACKAGE_LIBAO
+	select BR2_PACKAGE_LIBMODPLUG
+	help
+	  This installs the 'modplug123' command line tool to play music files
+	  using libmodplug.
+
+	  http://modplug-xmms.sourceforge.net/
diff --git a/package/modplugtools/modplugtools.mk b/package/modplugtools/modplugtools.mk
new file mode 100644
index 0000000..392f0f2
--- /dev/null
+++ b/package/modplugtools/modplugtools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# modplugtools
+#
+################################################################################
+
+MODPLUGTOOLS_VERSION = 0.5.3
+MODPLUGTOOLS_SITE = http://downloads.sourceforge.net/project/modplug-xmms/modplug-tools
+MODPLUGTOOLS_LICENSE = GPLv3
+MODPLUGTOOLS_LICENSE_FILES = COPYING
+
+MODPLUGTOOLS_DEPENDENCIES = libao libmodplug
+
+# Only play through libao: some platforms don't have OSS support and for those
+# that do, playing through libao is still going to be sufficient.
+define MODPLUGTOOLS_REMOVE_MODPLUGPLAY
+	rm $(TARGET_DIR)/usr/bin/modplugplay
+endef
+MODPLUGTOOLS_POST_INSTALL_TARGET_HOOKS += MODPLUGTOOLS_REMOVE_MODPLUGPLAY
+
+$(eval $(autotools-package))
-- 
1.8.4.5
