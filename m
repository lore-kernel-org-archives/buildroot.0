From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 09:39:10 -0300
Subject: [Buildroot] [PATCH v2 5/6] weston: add weston-launch support
In-Reply-To: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459255151-17084-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The weston-launch supplemental group is for users to be able to
use/launch weston.
For a full weston(-launch) experience users should be at least members
of weston-launch, video (for framebuffer permissions) and optionally
audio.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7a4a2e0..77f99d6 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -21,12 +21,28 @@ WESTON_CONF_OPTS = \
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
+WESTON_CONF_OPTS += \
+	--enable-weston-launch \
+	--disable-setuid-install
+WESTON_DEPENDENCIES += linux-pam
+else
+WESTON_CONF_OPTS += --disable-weston-launch
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 WESTON_DEPENDENCIES += libegl
 else
@@ -67,7 +83,6 @@ ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
 WESTON_DEPENDENCIES += rpi-userland
 WESTON_CONF_OPTS += --enable-rpi-compositor \
 	--disable-resize-optimization \
-	--disable-setuid-install \
 	--disable-xwayland-test \
 	WESTON_NATIVE_BACKEND=rpi-backend.so
 else
-- 
2.7.3
