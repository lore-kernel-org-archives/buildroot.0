From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 22:11:32 +0200
Subject: [Buildroot] [git commit] weston: check for both EGL and GLES
Message-ID: <20160408201246.F096E81E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e14605ba859532d65bc598f9c66561528c6fd84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conditional is wrong, it was check for BR2_PACKAGE_MESA3D_OPENGL_ES
(correct, means GLESv2 support) and BR2_PACKAGE_MESA3D_OPENGL_GLES
(incorrect, there's no such symbol).
So now check for BR2_PACKAGE_MESA3D_OPENGL_EGL (EGL support) plus
BR2_PACKAGE_MESA3D_OPENGL_ES (GLESv2 support), both are required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7aa2130..e3088ff 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -49,7 +49,7 @@ WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
 # Needs wayland-egl, which normally only mesa provides
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES)$(BR2_PACKAGE_MESA3D_OPENGL_GLES),yy)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_MESA3D_OPENGL_ES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
