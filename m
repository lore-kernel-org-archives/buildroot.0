From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 23:44:24 +0200
Subject: [Buildroot] [PATCH 8/9] package/weston: add RPi compositor
In-Reply-To: <cover.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <5f7eec067dd2386563d55353426a080f7094f0dd.1381354867.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Procedure highly inspired by:
    http://wayland.freedesktop.org/raspberrypi.html

The resulting weston works almost flawlessly, but requires a bit
of love:
  - /boot/config.txt must include this line: dispmanx_offline=1
  - at least 128MiB of RAM must be allocated to the GPU
  - after 24-or-so terminal-clients are connected, the screen
    turns black. Exiting a client restores the screen

It seems increasing/decreasing the amount of memory allocated to
the GPU makes the clients limit to wobble above/below 24 clients
at a time. YMMV, as they say...

Without dispmanx_offline=1, the limit is much below 24, at around 13.
But changing the amount of memory allocated to the GPU does not change
this limit in this case. YMMV, again.

Anyway, there are not many different clients available, besides the
terminal client, since all other clients are EGL-based, and there
is (yet) no EGL support (for weston!) on the RPi. So the tests were
made only with the terminal client.

The system is rather smooth, but spwaning too many clients in a
rapid-fire is sure to exhibit some lag. Resizing windows is a bit
jerky, but moving them along is fine.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in |  8 ++++++++
 package/weston/weston.mk | 14 +++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 0f168ac..8c00bf6 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -36,4 +36,12 @@ config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 	default y
 
+config BR2_PACKAGE_WESTON_RPI
+	bool "RPi compositor"
+	depends on BR2_arm                  # rpi-userland
+	depends on BR2_INSTALL_LIBSTDCPP    # rpi-userland
+	depends on BR2_LARGEFILE            # rpi-userland
+	select BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8267945..2d68fba 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -23,8 +23,8 @@ WESTON_CONF_OPT = \
 	--disable-drm-compositor \
 	--disable-wayland-compositor \
 	--disable-headless-compositor \
-	--disable-rpi-compositor \
 	--disable-weston-launch \
+	--disable-colord \
 	--disable-libunwind
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
@@ -33,4 +33,16 @@ else
 WESTON_CONF_OPT += --disable-fbdev-compositor
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
+WESTON_DEPENDENCIES += rpi-userland
+WESTON_CONF_OPT += --enable-rpi-compositor \
+	--disable-resize-optimization \
+	--disable-setuid-install \
+	--disable-xwayland-test \
+	--disable-simple-egl-clients \
+	WESTON_NATIVE_BACKEND=rpi-backend.so
+else
+WESTON_CONF_OPT += --disable-rpi-compositor
+endif # BR2_PACKAGE_WESTON_RPI
+
 $(eval $(autotools-package))
-- 
1.8.1.2
