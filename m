From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 14:46:49 +0200
Subject: [Buildroot] [git commit] package/w*/Config.in: fix ordering of
	statements
Message-ID: <20170502124713.F41AD8283E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83b27df7685bfdbffd3406f377a84bd9e19dd91a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter w in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in         | 10 +++++-----
 package/wireshark/Config.in      |  4 ++--
 package/wmctrl/Config.in         |  6 +++---
 package/wpa_supplicant/Config.in |  4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index b4e198d..454a14d 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -5,6 +5,11 @@ comment "weston needs udev and a toolchain w/ locale, threads, dynamic library,
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -14,11 +19,6 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
 	select BR2_PACKAGE_LIBINPUT
-	depends on BR2_ENABLE_LOCALE # libinput
-	depends on BR2_PACKAGE_HAS_UDEV
-	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one compositor is selected.
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index c5b5c3e..4d5a215 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
-	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Network traffic sniffer and protocol decoder.
 
diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
index bc09431..37a1f25 100644
--- a/package/wmctrl/Config.in
+++ b/package/wmctrl/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_WMCTRL
 	bool "wmctrl"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Provides command line access to almost all the features
 	  defined in the EWMH specification. It can be used, for
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 9250a3b..0f62916 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -11,8 +11,8 @@ if BR2_PACKAGE_WPA_SUPPLICANT
 config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
 	bool "Enable nl80211 support"
 	default y
-	select BR2_PACKAGE_LIBNL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	help
 	  Enable support for nl80211.  This is the current wireless
 	  API for Linux, supported by all wireless drivers in vanilla
@@ -83,8 +83,8 @@ config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	  Install wpa_cli command line utility
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO
-	depends on !BR2_STATIC_LIBS
 	bool "Install wpa_client shared library"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Install libwpa_client.so.
 
