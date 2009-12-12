From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Dec 2009 08:55:09 +0100
Subject: [Buildroot] [git commit master] package: Added libdvdnav package
	(dependency of gst-plugins-bad)
Message-ID: <20091212075530.F09A7776C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c2ceaa21aac097efc0ae746fc350ff8fcd9a274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                   |    2 +-
 package/multimedia/Config.in              |    1 +
 package/multimedia/libdvdnav/Config.in    |    9 +++++++++
 package/multimedia/libdvdnav/libdvdnav.mk |   20 ++++++++++++++++++++
 4 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/libdvdnav/Config.in
 create mode 100644 package/multimedia/libdvdnav/libdvdnav.mk

diff --git a/CHANGES b/CHANGES
index e93d111..b31d5dc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.02, Not yet released:
 
-	New packages: libcdaudio, libdvdread, hostapd, tcpreplay
+	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 5bb897b..8a55caf 100644
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
index 0000000..c4d73a0
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
+	  http://www.mplayerhq.hu
diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/multimedia/libdvdnav/libdvdnav.mk
new file mode 100644
index 0000000..b3fea2f
--- /dev/null
+++ b/package/multimedia/libdvdnav/libdvdnav.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# libdvdnav
+#
+#############################################################
+
+LIBDVDNAV_VERSION = 4.1.3
+LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
+LIBDVDNAV_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav
+LIBDVDNAV_AUTORECONF = YES
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
1.6.3.3
