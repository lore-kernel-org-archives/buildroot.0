From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:00:08 +0200
Subject: [Buildroot] [git commit] weston: add weston-launch support
Message-ID: <20160330150133.667787FEE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c94567b4d609e62f590a8003fb1fde1cc3516b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The weston-launch supplemental group is for users to be able to
use/launch weston.
For a full weston(-launch) experience users should be at least members
of weston-launch, video (for framebuffer permissions) and optionally
audio.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 08c6337..e83abe0 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -20,12 +20,26 @@ WESTON_CONF_OPTS = \
 	--disable-x11-compositor \
 	--disable-wayland-compositor \
 	--disable-headless-compositor \
-	--disable-weston-launch \
-	--disable-colord
+	--disable-colord \
+	--disable-setuid-install
 
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
+# weston-launch must be u+s root in order to work properly
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define WESTON_PERMISSIONS
+	/usr/bin/weston-launch f 4755 0 0 - - - - -
+endef
+define WESTON_USERS
+	- - weston-launch -1 - - - - Weston launcher group
+endef
+WESTON_CONF_OPTS += --enable-weston-launch
+WESTON_DEPENDENCIES += linux-pam
+else
+WESTON_CONF_OPTS += --disable-weston-launch
+endif
+
 # Needs wayland-egl, which normally only mesa provides
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 WESTON_CONF_OPTS += --enable-egl
@@ -68,7 +82,6 @@ ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
 WESTON_DEPENDENCIES += rpi-userland
 WESTON_CONF_OPTS += --enable-rpi-compositor \
 	--disable-resize-optimization \
-	--disable-setuid-install \
 	--disable-xwayland-test \
 	WESTON_NATIVE_BACKEND=rpi-backend.so
 else
