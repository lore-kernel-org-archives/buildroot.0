From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 12:24:17 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 0.19.0,
	add locale dependency
Message-ID: <20150718120023.D4E428164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7697638c09e462b5ac3b006a464958547d6d0a57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 2015-04-22 libinput needs locale support:
http://cgit.freedesktop.org/wayland/libinput/commit/src/libinput-util.c?id=5c671e0375cc03032fcac26efe4a7835a74c8bfc

This patch adds the needed dependency also to
weston and xdriver_xf86-input-libinput.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/Config.in                         |    5 +++--
 package/libinput/libinput.hash                     |    4 ++--
 package/libinput/libinput.mk                       |    2 +-
 package/weston/Config.in                           |    6 ++++--
 .../x11r7/xdriver_xf86-input-libinput/Config.in    |    5 +++--
 5 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 14e4e70..f7793df 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
+	depends on BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_MTDEV
@@ -13,5 +14,5 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
-comment "libinput needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "libinput needs udev /dev management and a toolchain w/ locale"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_ENABLE_LOCALE
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 6452847..299a28f 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-April/021485.html
-sha256	2bed202ebe2d5026950d6f9d2ac0f0160d12f61c5a0f6d0d6ef671bbb02c1b64	libinput-0.14.1.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-July/023184.html
+sha256	69a97da47ef8fa9debadaa8ee11005b9b5183bd2b87c5aa7827b7c388a5acc5d	libinput-0.19.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index bacee6a..175e04f 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.14.1
+LIBINPUT_VERSION = 0.19.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
diff --git a/package/weston/Config.in b/package/weston/Config.in
index dec3583..07773f0 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,7 +1,8 @@
-comment "weston needs udev and a toolchain w/ threads, dynamic library, headers >= 3.0"
+comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -13,6 +14,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
 	select BR2_PACKAGE_LIBINPUT
+	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
diff --git a/package/x11r7/xdriver_xf86-input-libinput/Config.in b/package/x11r7/xdriver_xf86-input-libinput/Config.in
index cc878b6..69697ed 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/Config.in
+++ b/package/x11r7/xdriver_xf86-input-libinput/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT
 	bool "xf86-input-libinput"
+	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
@@ -9,5 +10,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT
 	  libinput, so while it does provide all features that libinput supports
 	  it does little beyond.
 
-comment "xf86-input-libinput requires udev to be enabled"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "xf86-input-libinput needs udev /dev management and a toolchain w/ locale"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_ENABLE_LOCALE
