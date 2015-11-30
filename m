From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:23:12 +0100
Subject: [Buildroot] [git commit branch/next] miraclecast: new package
Message-ID: <20151130222422.56CD87FF18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0209b529b09868352cbfd456bbfbf47c0d8aa9d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - add hash file
  - fix license information: use comma as a separator in
    <pkg>_LICENSE, and htable is under LGPLv2.1+ and not GPLv2.1+
    (which doesn't exist)]

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Baruch Siach <baruch@tkos.co.il>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/miraclecast/Config.in        |   23 +++++++++++++++++++++++
 package/miraclecast/miraclecast.hash |    2 ++
 package/miraclecast/miraclecast.mk   |   23 +++++++++++++++++++++++
 4 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 658dc03..3343a53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -21,6 +21,7 @@ menu "Audio and video applications"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
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
diff --git a/package/miraclecast/miraclecast.hash b/package/miraclecast/miraclecast.hash
new file mode 100644
index 0000000..2a92cbf
--- /dev/null
+++ b/package/miraclecast/miraclecast.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 deef87155ed07bcf737260c29599e886bd248b573e72ba167369df93acb1fa61 miraclecast-8b61f733da124ccbfd1b85e188581fad1c41c1e1.tar.gz
diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
new file mode 100644
index 0000000..598dbd5
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
+MIRACLECAST_LICENSE = LGPLv2.1+, GPLv2 (gdhcp)
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
