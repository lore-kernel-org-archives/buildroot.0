From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 3 Dec 2013 17:50:39 +0000
Subject: [Buildroot] [PATCH] bluez_utils: broken for static builds
Message-ID: <1386093039-56954-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bluez_utils package requires shared library support unconditionally.
We can't fix it to make it build on static because, for instance,
"plugin.c" file uses dlfcn and it's a basic prereq for bluetoothd, so
add "depend on !BR2_PREFER_STATIC_LIB" to it and recursively to all
packages that selects BR2_PACKAGE_BLUEZ_UTILS.

Fixes:

   http://autobuild.buildroot.net/results/d81/d81970024649c1e89c01da491c63760afdad6cb6/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bluez_utils/Config.in   |    1 +
 package/efl/libedbus/Config.in  |    1 +
 package/openobex/Config.in      |    1 +
 package/sconeserver/Config.in   |    1 +
 package/snowball-init/Config.in |    1 +
 package/ussp-push/Config.in     |    1 +
 6 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index e08e9be..f9d35d5 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 783a54e..6a16d5d 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	depends on !BR2_avr32 # bluez_utils
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	depends on BR2_USE_WCHAR # bluez_utils -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
 	select BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 9b9d2f9..6bb1973 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_OPENOBEX
 config BR2_PACKAGE_OPENOBEX_BLUEZ
 	bool "enable bluez support"
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 58c1e03..d80fd6a 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	depends on BR2_USE_MMU # bluez->dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
 	depends on !BR2_avr32 # bluez_utils
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth module for Sconeserver
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
index e6e3272..b46ebb6 100644
--- a/package/snowball-init/Config.in
+++ b/package/snowball-init/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SNOWBALL_INIT
 	# Runtime dependency, needed by snowball startup script
 	select BR2_PACKAGE_BLUEZ_UTILS
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index 4a79779..35ee661 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_USSP_PUSH
 	bool "ussp-push"
 	depends on BR2_INET_IPV6
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
-- 
1.7.1
