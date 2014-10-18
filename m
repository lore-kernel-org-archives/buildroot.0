From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 18 Oct 2014 22:04:00 +0200
Subject: [Buildroot] [PATCH v2] modplugtools: Added package
In-Reply-To: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
References: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
Message-ID: <1413662640-16030-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This installs the 'modplug123' command line tool to play tracker music
files (MOD, S3M, XM etc.) using libmodplug.

http://modplug-xmms.sourceforge.net/

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 Changes since v1:
 - clarified the help text
 - clarified why modplugplay is not installed
 - changed the way modplugplay is excluded: don't build it, instead of
   removing it post-install

 package/Config.in                    |  1 +
 package/modplugtools/Config.in       |  9 +++++++++
 package/modplugtools/modplugtools.mk | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/modplugtools/Config.in
 create mode 100644 package/modplugtools/modplugtools.mk

diff --git a/package/Config.in b/package/Config.in
index 4c6685a..8b8a20f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -17,6 +17,7 @@ menu "Audio and video applications"
 	source "package/lame/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
+	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
diff --git a/package/modplugtools/Config.in b/package/modplugtools/Config.in
new file mode 100644
index 0000000..20009b6
--- /dev/null
+++ b/package/modplugtools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MODPLUGTOOLS
+	bool "modplugtools"
+	select BR2_PACKAGE_LIBAO
+	select BR2_PACKAGE_LIBMODPLUG
+	help
+	  This installs the 'modplug123' command line tool to play tracker music
+	  files (MOD, S3M, XM etc.) using libmodplug.
+
+	  http://modplug-xmms.sourceforge.net/
diff --git a/package/modplugtools/modplugtools.mk b/package/modplugtools/modplugtools.mk
new file mode 100644
index 0000000..186d4a7
--- /dev/null
+++ b/package/modplugtools/modplugtools.mk
@@ -0,0 +1,23 @@
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
+# The modplugtools package can build two players: modplugplay that plays
+# directly via OSS and modplug123 that plays via libao. Since modplugplay
+# won't work without OSS support and modern kernels are likely to have no
+# OSS or OSS emulation, we build only modplug123.
+# If you have a system without ALSA support for some reason, you can still
+# use modplug123 to play over OSS via libao.
+MODPLUGTOOLS_MAKE_OPTS = SUBDIRS=mp123
+MODPLUGTOOLS_INSTALL_TARGET_OPTS = SUBDIRS=mp123 DESTDIR=$(TARGET_DIR) install
+
+$(eval $(autotools-package))
-- 
1.8.4.5
