From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun,  5 Apr 2015 17:10:11 -0500
Subject: [Buildroot] [PATCH v2 2/2] miraclecast: new package
In-Reply-To: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <1428271811-27530-2-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Baruch Siach <baruch@tkos.co.il>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
 - Added a SYSTEMD_KDBUS option (suggested by Baruch)
 - Fixed select and depends (suggested by Yann)
 - Add dependancy on host-pkgconf (suggested by Yann)
 - Installed dbus configuration file

To Do:
 - Need to actually test the package on real hardware
---
 package/Config.in                  |  1 +
 package/miraclecast/Config.in      | 23 +++++++++++++++++++++++
 package/miraclecast/miraclecast.mk | 23 +++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/miraclecast/Config.in
 create mode 100644 package/miraclecast/miraclecast.mk

diff --git a/package/Config.in b/package/Config.in
index de8e856..787137c 100644
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
index 0000000..4c6a8aa
--- /dev/null
+++ b/package/miraclecast/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_MIRACLECAST
+	bool "miraclecast"
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SYSTEMD_KDBUS
+	help
+	  The MiracleCast project provides software to connect external
+	  monitors to your system via Wifi. It is compatible to the
+	  Wifi-Display specification also known as Miracast. MiracleCast
+	  implements the Display-Source as well as Display-Sink side.
+
+	  https://github.com/albfan/miraclecast
+
+comment "miraclecast needs systemd and a glibc toolchain w/ threads and wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_SYSTEMD
diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
new file mode 100644
index 0000000..b35a517
--- /dev/null
+++ b/package/miraclecast/miraclecast.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# miraclecast
+#
+################################################################################
+
+MIRACLECAST_VERSION = 8b61f733da124ccbfd1b85e188581fad1c41c1e1
+MIRACLECAST_SITE = $(call github,albfan,miraclecast,$(MIRACLECAST_VERSION))
+MIRACLECAST_LICENSE = LGPLv2.1+ GPLv2 (gdhcp) GPLv2.1 (htable)
+MIRACLECAST_LICENSE_FILES = COPYING LICENSE_gdhcp LICENSE_htable LICENSE_lgpl
+MIRACLECAST_DEPENDENCIES = host-pkgconf systemd gstreamer1 \
+	readline libglib2
+# Straight out the repository, no ./configure
+MIRACLECAST_AUTORECONF = YES
+
+define MIRACLECAST_INSTALL_DBUS_POLICY
+	$(INSTALL) -m 0644 -D \
+		$(@D)/res/org.freedesktop.miracle.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/org.freedesktop.miracle.conf
+endef
+MIRACLECAST_POST_INSTALL_TARGET_HOOKS += MIRACLECAST_INSTALL_DBUS_POLICY
+
+$(eval $(autotools-package))
-- 
1.9.1
