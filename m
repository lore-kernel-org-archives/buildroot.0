From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:16:22 +0100
Subject: [Buildroot] [git commit] bluez_utils: broken for static builds
Message-ID: <20131226221644.052C39C1E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe093f226c40dd0a3466fc8dfc779a936daee4cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bluez_utils package requires shared library support unconditionally.
We can't fix it to make it build on static because, for instance,
"plugin.c" file uses dlfcn and it's a basic prereq for bluetoothd, so
add "depend on !BR2_PREFER_STATIC_LIB" to it and recursively to all
packages that selects BR2_PACKAGE_BLUEZ_UTILS.

Fixes:

   http://autobuild.buildroot.net/results/d81/d81970024649c1e89c01da491c63760afdad6cb6/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/Config.in   |    5 +++--
 package/efl/libedbus/Config.in  |    5 +++--
 package/openobex/Config.in      |    5 +++--
 package/sconeserver/Config.in   |    5 +++++
 package/snowball-init/Config.in |    5 +++--
 package/ussp-push/Config.in     |    5 +++--
 6 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 1315b9e..9efd83d 100644
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
@@ -45,6 +46,6 @@ config BR2_PACKAGE_BLUEZ_UTILS_GATT
 	  This will install the gatttool utility.
 endif
 
-comment "bluez-utils needs a toolchain w/ wchar, threads"
+comment "bluez-utils needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 783a54e..907c7fe 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -17,15 +17,16 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	depends on !BR2_avr32 # bluez_utils
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	depends on BR2_USE_WCHAR # bluez_utils -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
 
-comment "bluez support needs a toolchain w/ wchar, threads"
+comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
 	bool "connman support"
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 9b9d2f9..b52f757 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -12,14 +12,15 @@ if BR2_PACKAGE_OPENOBEX
 config BR2_PACKAGE_OPENOBEX_BLUEZ
 	bool "enable bluez support"
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_BLUEZ_UTILS
 
-comment "bluez support needs a toolchain w/ wchar, threads"
+comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
 	bool "enable libusb support"
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 58c1e03..b8755c6 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -44,10 +44,15 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	depends on BR2_USE_MMU # bluez->dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
 	depends on !BR2_avr32 # bluez_utils
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth module for Sconeserver
 
+comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_avr32 && BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_SCONESERVER_RSS
 	bool "rss"
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
index e6e3272..d633d89 100644
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
@@ -12,6 +13,6 @@ config BR2_PACKAGE_SNOWBALL_INIT
 
 	  http://www.igloocommunity.org
 
-comment "snowball-init needs a toolchain w/ wchar, threads"
+comment "snowball-init needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index 4a79779..c8facef 100644
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
@@ -14,6 +15,6 @@ config BR2_PACKAGE_USSP_PUSH
 
 	  http://www.xmailserver.org/ussp-push.html
 
-comment "ussp-push needs a toolchain w/ wchar, IPv6, threads"
+comment "ussp-push needs a toolchain w/ wchar, IPv6, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
