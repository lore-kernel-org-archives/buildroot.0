From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 23:33:17 +0100
Subject: [Buildroot] [PATCH 5/6] Added libdvdnav package (dependency of
	gst-plugins-bad)
In-Reply-To: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258065198-22972-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libdvdnav/Config.in    |    7 +++++++
 package/multimedia/libdvdnav/libdvdnav.mk |   21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libdvdnav/Config.in
 create mode 100644 package/multimedia/libdvdnav/libdvdnav.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index cd07fdc..1958e2a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -11,6 +11,7 @@ source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
 source "package/multimedia/libdvdread/Config.in"
+source "package/multimedia/libdvdnav/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libmms/Config.in"
diff --git a/package/multimedia/libdvdnav/Config.in b/package/multimedia/libdvdnav/Config.in
new file mode 100644
index 0000000..54b8cf1
--- /dev/null
+++ b/package/multimedia/libdvdnav/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDVDNAV
+	bool "libdvdnav"
+        select BR2_PACKAGE_LIBDVDREAD
+	help
+	  libdvdnav is a library that allows easy use of sophisticated
+	  DVD navigation features such as DVD menus, multiangle
+	  playback and even interactive DVD games.
diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/multimedia/libdvdnav/libdvdnav.mk
new file mode 100644
index 0000000..ecbb6da
--- /dev/null
+++ b/package/multimedia/libdvdnav/libdvdnav.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# libdvdnav
+#
+#############################################################
+
+LIBDVDNAV_VERSION = 4.1.3
+LIBDVDNAV_SOURCE = libdvdnav_$(LIBDVDNAV_VERSION).orig.tar.gz
+LIBDVDNAV_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libd/libdvdnav/
+LIBDVDNAV_AUTORECONF = YES
+LIBDVDNAV_LIBTOOL_PATCH = YES
+LIBDVDNAV_INSTALL_STAGING = YES
+LIBDVDNAV_INSTALL_TARGET = YES
+
+LIBDVDNAV_DEPENDENCIES = libdvdread
+
+# By default libdvdnav tries to find dvdread-config in $PATH. Because
+# of cross compilation, we prefer using pkg-config.
+LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
+
+$(eval $(call AUTOTARGETS,package,libdvdnav))
-- 
1.6.5.2
