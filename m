From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:53 +0200
Subject: [Buildroot] [PATCH v2 13/14] systemd: remove hard dependency on dbus
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-14-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A substantial functionality of systemd does not
depend on dbus anymore.
It is certainly possible to used most of its core
system managment functionality inclusive logging.

In other words, most commands from systemctl and
loginctl do work, aslong as used from root.

These features will need dbus (incomplete list):

-   Access to systemd from non-root
-   Loginctl
-   Timedatectl

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b09bd36ab6..a7f41d2a38 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -25,7 +25,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -90,6 +89,10 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
+comment "systemd recommends enabling a dbus daemon"
+	depends on !BR2_PACKAGE_DBUS
+	depends on !BR2_PACKAGE_DBUS_BROKER
+
 config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
 	depends on BR2_i386 || BR2_x86_64
-- 
2.27.0
