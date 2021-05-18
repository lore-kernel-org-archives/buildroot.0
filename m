From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 18:55:21 +0200
Subject: [Buildroot] [git commit branch/next] package/wlroots: bump to
 version 0.13.0
Message-ID: <20210518164141.53D1987A43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7657250808d8169af2ef3c585213645bec1c70ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update wlroots to version 0.13.0. This is a release which changes
API/ABI, applications which use wlroots need to be rebuilt. Currently in
Buildroot there is only cage, to be updated by a follow-up patch of the
series.

Additionally, remove usage of the xcb-icccm build option, which is no
longer available and update the dependencies needed by the X11 support.
Note that the dependencies neded by the X11 backend are a superset of
the ones needed for XWayland support, so we can make toggle both Meson
options at once.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wlroots/Config.in    |  3 +++
 package/wlroots/wlroots.hash |  4 ++--
 package/wlroots/wlroots.mk   | 22 ++++------------------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 694aa79de4..41f8986772 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -33,6 +33,9 @@ if BR2_PACKAGE_WLROOTS
 config BR2_PACKAGE_WLROOTS_X11
 	bool "X11 backend"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	select BR2_PACKAGE_XCB_UTIL_WM
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Support Wayland sessions nested inside a X11 window
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 2fab9b30b4..024ea93cae 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.12.0/wlroots-0.12.0.tar.gz.sig
-sha256  c9e9f4f6d2f526d0b2886daf3ec37e64831773059aa669fb98a88522a1626bdb  wlroots-0.12.0.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.13.0/wlroots-0.13.0.tar.gz.sig
+sha256  f6bea37fd4a6f5e5f552b83d61adae8c73e64b0bcb9ae0ab464ebcd9309d3cf3  wlroots-0.13.0.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 0160b1aedb..a20f6683a9 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.12.0
+WLROOTS_VERSION = 0.13.0
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -40,24 +40,10 @@ WLROOTS_CONF_OPTS += -Dlogind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
-WLROOTS_CONF_OPTS += -Dx11-backend=enabled
-WLROOTS_DEPENDENCIES += xlib_libX11
+WLROOTS_CONF_OPTS += -Dx11-backend=enabled -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
 else
-WLROOTS_CONF_OPTS += -Dx11-backend=disabled
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCB),y)
-WLROOTS_CONF_OPTS += -Dxwayland=enabled
-WLROOTS_DEPENDENCIES += libxcb
-else
-WLROOTS_CONF_OPTS += -Dxwayland=disabled
-endif
-
-ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
-WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
-WLROOTS_DEPENDENCIES += xcb-util-wm
-else
-WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
+WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
 endif
 
 $(eval $(meson-package))
