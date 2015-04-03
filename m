From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu,  2 Apr 2015 22:10:34 -0500
Subject: [Buildroot] [PATCH 1/1] miraclecast: new package
Message-ID: <1428030634-23928-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---

Miraclecast has a heavy dependancy on systemd. The only way that I
could get systemd to install all the header files for miraclecast was
to enable all features + kdbus (kdbus is called out in their
documentation).

---
 package/Config.in                  |  1 +
 package/miraclecast/Config.in      | 22 ++++++++++++++++++++++
 package/miraclecast/miraclecast.mk | 14 ++++++++++++++
 package/systemd/systemd.mk         |  5 +++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/miraclecast/Config.in
 create mode 100644 package/miraclecast/miraclecast.mk

diff --git a/package/Config.in b/package/Config.in
index f00a18f..d2ae661 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -20,6 +20,7 @@ menu "Audio and video applications"
 	source "package/lame/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
+	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
diff --git a/package/miraclecast/Config.in b/package/miraclecast/Config.in
new file mode 100644
index 0000000..fbba349
--- /dev/null
+++ b/package/miraclecast/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_MIRACLECAST
+	bool "miraclecast"
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
+	help
+	  The MiracleCast project provides software to connect external
+	  monitors to your system via Wifi. It is compatible to the
+	  Wifi-Display specification also known as Miracast. MiracleCast
+	  implements the Display-Source as well as Display-Sink side.
+
+	  https://github.com/albfan/miraclecast
+
+comment "miraclecast needs a glibc toolchain w/ threads, wchar and systemd"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_PACKAGE_SYSTEMD || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU
diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
new file mode 100644
index 0000000..4f649a7
--- /dev/null
+++ b/package/miraclecast/miraclecast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# miraclecast
+#
+################################################################################
+
+MIRACLECAST_VERSION = 8b61f733da124ccbfd1b85e188581fad1c41c1e1
+MIRACLECAST_SITE = $(call github,albfan,miraclecast,$(MIRACLECAST_VERSION))
+MIRACLECAST_DEPENDENCIES = systemd gstreamer readline
+MIRACLECAST_LICENSE = LGPLv2.1+ GPLv2 (gdhcp) GPLv2.1 (htable)
+MIRACLECAST_LICENSE_FILES = COPYING LICENSE_gdhcp LICENSE_htable LICENSE_lgpl
+MIRACLECAST_AUTORECONF = YES
+
+$(eval $(autotools-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 98bda02..a94ce04 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -77,6 +77,11 @@ else
 SYSTEMD_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_MIRACLECAST),y)
+# Must enable kdbus in order to get sd-events.h in staging
+SYSTEMD_CONF_OPTS += --enable-kdbus
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += \
 	xz 		\
-- 
1.9.1
