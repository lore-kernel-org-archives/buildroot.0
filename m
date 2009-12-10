From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 11 Dec 2009 00:31:17 +0100
Subject: [Buildroot] [PATCH 5/6] package: Added libdvdnav package
	(dependency of gst-plugins-bad)
In-Reply-To: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1260487878-21126-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libdvdnav/Config.in    |    9 +++++++++
 package/multimedia/libdvdnav/libdvdnav.mk |   19 +++++++++++++++++++
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
index 0000000..07381fa
--- /dev/null
+++ b/package/multimedia/libdvdnav/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBDVDNAV
+	bool "libdvdnav"
+        select BR2_PACKAGE_LIBDVDREAD
+	help
+	  libdvdnav is a library that allows easy use of sophisticated
+	  DVD navigation features such as DVD menus, multiangle
+	  playback and even interactive DVD games.
+
+          http://www.mplayerhq.hu
diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/multimedia/libdvdnav/libdvdnav.mk
new file mode 100644
index 0000000..7ecfbc0
--- /dev/null
+++ b/package/multimedia/libdvdnav/libdvdnav.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# libdvdnav
+#
+#############################################################
+
+LIBDVDNAV_VERSION = 4.1.3
+LIBDVDNAV_SOURCE = libdvdnav_$(LIBDVDNAV_VERSION).orig.tar.gz
+LIBDVDNAV_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libd/libdvdnav/
+LIBDVDNAV_INSTALL_STAGING = YES
+LIBDVDNAV_INSTALL_TARGET = YES
+
+LIBDVDNAV_DEPENDENCIES = libdvdread
+
+# By default libdvdnav tries to find dvdread-config in $PATH. Because
+# of cross compilation, we prefer using pkg-config.
+LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
+
+$(eval $(call AUTOTARGETS,package/multimedia,libdvdnav))
-- 
1.6.5.4
