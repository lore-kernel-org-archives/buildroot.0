From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:02:09 +0200
Subject: [Buildroot] [git commit] package/kodi: add optional support for
	bluez5
Message-ID: <20170429101427.2B21F827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43122d64e05a2831a96dabcbf149ba199726767f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: add missing dependency on BR2_TOOLCHAIN_HAS_SYNC_4 from
bluez5_utils.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 9 +++++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7e11402..e8efd72 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -113,6 +113,15 @@ config BR2_PACKAGE_KODI_AVAHI
 	  Enable Avahi support.
 	  Select this if you want Kodi to support Bonjour protocol.
 
+config BR2_PACKAGE_KODI_BLUEZ
+	bool "bluetooth"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
+	select BR2_PACKAGE_BLUEZ5_UTILS
+	help
+	    Enable bluetooth support
+
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
 	select BR2_PACKAGE_DBUS
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index c357665..7341cc3 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -183,6 +183,13 @@ else
 KODI_CONF_OPTS += -DENABLE_CAP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
+KODI_CONF_OPTS += -DENABLE_BLUETOOTH=ON
+KODI_DEPENDENCIES += bluez5_utils
+else
+KODI_CONF_OPTS += -DENABLE_BLUETOOTH=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_DBUS),y)
 KODI_DEPENDENCIES += dbus
 KODI_CONF_OPTS += -DENABLE_DBUS=ON
