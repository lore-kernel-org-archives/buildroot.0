From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
Date: Fri, 29 Apr 2016 13:40:52 +0200
Subject: [Buildroot] [PATH RFC] glmark2: check mesa3d opengl when adding drm
In-Reply-To: <1461930052-21032-1-git-send-email-mylene.josserand@free-electrons.com>
References: <1461930052-21032-1-git-send-email-mylene.josserand@free-electrons.com>
Message-ID: <1461930052-21032-2-git-send-email-mylene.josserand@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using Vivante OpenGL, the mesa3d is not enabling gbm which is
needed by glmark3 with flavor "drm".

This patch adds a check to enable "drm" flavors only in case of mesa3d
opengl enabled.

Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>
---
 package/glmark2/glmark2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index bd5b51a..9588576 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -23,6 +23,7 @@ GLMARK2_FLAVORS += x11-gl
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
 GLMARK2_FLAVORS += drm-glesv2
 endif
@@ -30,6 +31,7 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL),yy)
 GLMARK2_FLAVORS += drm-gl
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 GLMARK2_DEPENDENCIES += wayland
-- 
2.8.0.rc3
