From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Apr 2016 10:42:37 -0300
Subject: [Buildroot] [PATCH] weston: check for both EGL and GLES
Message-ID: <1460122957-3164-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The conditional is wrong, it was check for BR2_PACKAGE_MESA3D_OPENGL_ES
(correct, means GLESv2 support) and BR2_PACKAGE_MESA3D_OPENGL_GLES
(incorrect, there's no such symbol).
So now check for BR2_PACKAGE_MESA3D_OPENGL_EGL (EGL support) plus
BR2_PACKAGE_MESA3D_OPENGL_ES (GLESv2 support), both are required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7706599..1f31097 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -48,7 +48,7 @@ WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
 # Needs wayland-egl, which normally only mesa provides
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES)$(BR2_PACKAGE_MESA3D_OPENGL_GLES),yy)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_MESA3D_OPENGL_ES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
-- 
2.7.3
