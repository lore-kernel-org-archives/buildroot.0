From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Apr 2016 15:34:01 -0300
Subject: [Buildroot] [PATCH] weston: egl requires gles as well
Message-ID: <1459794841-3736-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From configure.ac lines 83-89:

AC_ARG_ENABLE(egl, [  --disable-egl],,
	enable_egl=yes)
AM_CONDITIONAL(ENABLE_EGL, test x$enable_egl = xyes)
if test x$enable_egl = xyes; then
	AC_DEFINE([ENABLE_EGL], [1], [Build Weston with
	EGL support])
	PKG_CHECK_MODULES(EGL, [egl glesv2])
	PKG_CHECK_MODULES([EGL_TESTS], [egl glesv2 wayland-client
	wayland-egl])

It also requires wayland-egl which is only provided by mesa3d for now,
hence make it conditional on mesa3d egl+gles.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 2891fe3..7aa2130 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -49,7 +49,7 @@ WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
 # Needs wayland-egl, which normally only mesa provides
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES)$(BR2_PACKAGE_MESA3D_OPENGL_GLES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
-- 
2.7.3
