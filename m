From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 May 2014 20:17:52 +0200
Subject: [Buildroot] [PATCH 3/8] mesa3d: compile fixes
In-Reply-To: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398968277-9044-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d-0002-gbm-without-dri.patch |   31 ++++++++++++
 package/mesa3d/mesa3d-0003-shared-glapi.patch    |   57 ++++++++++++++++++++++
 package/mesa3d/mesa3d.mk                         |    2 +-
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 package/mesa3d/mesa3d-0002-gbm-without-dri.patch
 create mode 100644 package/mesa3d/mesa3d-0003-shared-glapi.patch

diff --git a/package/mesa3d/mesa3d-0002-gbm-without-dri.patch b/package/mesa3d/mesa3d-0002-gbm-without-dri.patch
new file mode 100644
index 0000000..bbfdf55
--- /dev/null
+++ b/package/mesa3d/mesa3d-0002-gbm-without-dri.patch
@@ -0,0 +1,31 @@
+Fix build issue when gbm backend is built without dri support.
+
+re-use patch by Spenser
+http://lists.busybox.net/pipermail/buildroot/2013-August/076839.html
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr Mesa-10.0.5.org/src/gbm/main/backend.c Mesa-10.0.5/src/gbm/main/backend.c
+--- Mesa-10.0.5.org/src/gbm/main/backend.c	2013-12-17 00:19:27.000000000 +0100
++++ Mesa-10.0.5/src/gbm/main/backend.c	2014-04-29 07:12:38.175264298 +0200
+@@ -36,7 +36,9 @@
+ 
+ #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
+ 
++#ifdef HAVE_DRI
+ extern const struct gbm_backend gbm_dri_backend;
++#endif
+ 
+ struct backend_desc {
+    const char *name;
+@@ -44,7 +46,9 @@
+ };
+ 
+ static const struct backend_desc backends[] = {
++#ifdef HAVE_DRI
+    { "gbm_dri.so", &gbm_dri_backend },
++#endif
+    { "gbm_gallium_drm.so", NULL },
+ };
+ 
diff --git a/package/mesa3d/mesa3d-0003-shared-glapi.patch b/package/mesa3d/mesa3d-0003-shared-glapi.patch
new file mode 100644
index 0000000..3026482
--- /dev/null
+++ b/package/mesa3d/mesa3d-0003-shared-glapi.patch
@@ -0,0 +1,57 @@
+From 4eec16ee10492533de18109a466b53aaa645ac97 Mon Sep 17 00:00:00 2001
+From: Emil Velikov <emil.l.velikov@gmail.com>
+Date: Wed, 19 Feb 2014 00:36:28 +0000
+Subject: [PATCH] configure: use shared-glapi when more than one gl* API is
+ used
+
+Current behaviour states that shared-glapi is usefull when building
+with dri, which is not the case. Shared-glapi is used to dispatch
+the gl* functions across the one or more gl api's which can be dri
+based but do not need to be.
+
+Fixed the following build
+
+ ./configure --enable-gles2 --disable-dri --enable-gallium-egl \
+      --with-egl-platforms=fbdev --with-gallium-drivers=swrast
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=75098
+Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
+
+Backported from mesa3d/master
+http://cgit.freedesktop.org/mesa/mesa/commit/?id=0432aa064bf5d4d0ad8fc3c4d648b8feb238ddfa
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0c45f63..8fa9e91 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -727,13 +727,16 @@ AC_ARG_ENABLE([shared-glapi],
+     [AS_HELP_STRING([--enable-shared-glapi],
+         [Enable shared glapi for OpenGL @<:@default=yes@:>@])],
+     [enable_shared_glapi="$enableval"],
+-    [enable_shared_glapi="$enable_dri"])
++    [enable_shared_glapi=yes])
+ 
+-# Shared GLAPI is only useful for DRI
+-if test "x$enable_dri" = xno; then
+-    AC_MSG_NOTICE([Shared GLAPI is only useful for DRI, disabling])
+-    enable_shared_glapi=no
+-fi
++case "x$enable_opengl$enable_gles1$enable_gles2" in
++x*yes*yes*)
++    if test "x$enable_shared_glapi" = xno; then
++        AC_MSG_ERROR([shared GLAPI required when building two or more of
++                      the following APIs - opengl, gles1 gles2])
++    fi
++    ;;
++esac
+ 
+ AM_CONDITIONAL(HAVE_SHARED_GLAPI, test "x$enable_shared_glapi" = xyes)
+ 
+-- 
+1.9.0
+
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index bc02a54..310731c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -63,13 +63,13 @@ MESA3D_CONF_OPT += \
 	--without-gallium-drivers
 else
 MESA3D_CONF_OPT += \
+	--enable-shared-glapi \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
 	--disable-dri \
-	--disable-shared-glapi \
 	--without-dri-drivers
 else
 MESA3D_CONF_OPT += \
-- 
1.7.10.4
