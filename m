From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:20:08 +0100
Subject: [Buildroot] [git commit] package/efl: bump to 1.15.3
Message-ID: <20160119202027.D8B45827D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21be670459400e4bd5886f5479676bb65070cbf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches.
Autoreconf is still needed.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ecore_fb_private.h-define-EAPI-before-use.patch |  64 ---------
 package/efl/0002-ecore_x-Remove-XPrint-usage.patch | 153 ---------------------
 package/efl/efl.hash                               |   4 +-
 package/efl/efl.mk                                 |   3 +-
 4 files changed, 3 insertions(+), 221 deletions(-)

diff --git a/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
deleted file mode 100644
index 81d14f9..0000000
--- a/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2fb4fdf641e67e49b87a3524038a694c8dd0ba4e Mon Sep 17 00:00:00 2001
-From: Vicente Bergas <vicencb@gmail.com>
-Date: Fri, 9 Oct 2015 23:35:20 +0200
-Subject: [PATCH] ecore_fb_private.h: define EAPI before use
-
-From [1]:
-When running terminology, a message appears in eina_module_load with:
-could not dlopen("/usr/lib/ecore_evas/engines/fb/v-1.15/module.so",
-Error relocating /usr/lib/ecore_evas/engines/fb/v-1.15/module.so:
-ecore_fb_ts_shutdown: symbol not found): RTLD_NOW
-It seems like the EAPI macro has no effect...
-
-A patch from Ross Vandegrift has been posted on enlightenment mailing
-list [2], but it's not yet an upstream patch.
-
-[1] http://sourceforge.net/p/enlightenment/mailman/message/34493376
-[2] http://sourceforge.net/p/enlightenment/mailman/message/34492801
-
-Signed-off-by: Vicente Bergas <vicencb@gmail.com>
-[Romain:
-  - Add a commit log
-  - Add a link to the enlightenment mailing list
-  - Add Vicente's SoB line]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/lib/ecore_fb/ecore_fb_private.h | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/src/lib/ecore_fb/ecore_fb_private.h b/src/lib/ecore_fb/ecore_fb_private.h
-index f7dc0c6..f54c8d2 100644
---- a/src/lib/ecore_fb/ecore_fb_private.h
-+++ b/src/lib/ecore_fb/ecore_fb_private.h
-@@ -33,6 +33,20 @@
- 
- #include <Ecore_Fb.h>
- 
-+#ifdef EAPI
-+# undef EAPI
-+#endif
-+
-+#ifdef __GNUC__
-+# if __GNUC__ >= 4
-+#  define EAPI __attribute__ ((visibility("default")))
-+# else
-+#  define EAPI
-+# endif
-+#else
-+# define EAPI
-+#endif
-+
- /* ecore_fb_li.c */
- struct _Ecore_Fb_Input_Device
- {
-@@ -92,4 +106,7 @@ void ecore_fb_vt_shutdown(void);
- #define TS_GET_CAL 0x8014660a
- #endif
-   
-+#undef EAPI
-+#define EAPI
-+
- #endif
--- 
-2.4.3
-
diff --git a/package/efl/0002-ecore_x-Remove-XPrint-usage.patch b/package/efl/0002-ecore_x-Remove-XPrint-usage.patch
deleted file mode 100644
index 4687e4c..0000000
--- a/package/efl/0002-ecore_x-Remove-XPrint-usage.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 434572355c7e929b84210b2f795634d38f13c913 Mon Sep 17 00:00:00 2001
-From: Derek Foreman <derekf@osg.samsung.com>
-Date: Tue, 6 Oct 2015 13:13:01 -0400
-Subject: [PATCH] ecore_x: Remove XPrint usage
-
-Summary:
-Xprint has been deprecated since 2008.
-
-It's recently (August 2015) been removed from debian.
-
-Reviewers: zmike, devilhorns
-
-Subscribers: cedric
-
-Differential Revision: https://phab.enlightenment.org/D3150
----
- configure.ac                           |  1 -
- src/lib/ecore_x/xlib/ecore_x.c         | 78 ----------------------------------
- src/lib/ecore_x/xlib/ecore_x_private.h |  3 --
- 3 files changed, 82 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9c17946..c34191c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3624,7 +3624,6 @@ if test "x${want_x11_xlib}" = "xyes" ; then
-    ECORE_CHECK_X_EXTENSION([Xdpms], [dpms.h], [Xext], [DPMSQueryExtension])
-    ECORE_CHECK_X_EXTENSION([Xfixes], [Xfixes.h], [Xfixes], [XFixesExpandRegion])
-    ECORE_CHECK_X_EXTENSION([Xinerama], [Xinerama.h], [Xinerama], [XineramaQueryScreens])
--   ECORE_CHECK_X_EXTENSION([Xprint], [Print.h], [Xp], [XpQueryScreens])
-    ECORE_CHECK_X_EXTENSION([Xrandr], [Xrandr.h], [Xrandr], [XRRGetScreenResourcesCurrent])
-    ECORE_CHECK_X_EXTENSION([Xrender], [Xrender.h], [Xrender], [XRenderFindVisualFormat])
-    ECORE_CHECK_X_EXTENSION([Xtest], [XTest.h], [Xtst], [XTestFakeKeyEvent])
-diff --git a/src/lib/ecore_x/xlib/ecore_x.c b/src/lib/ecore_x/xlib/ecore_x.c
-index 096f64d..8e2057e 100644
---- a/src/lib/ecore_x/xlib/ecore_x.c
-+++ b/src/lib/ecore_x/xlib/ecore_x.c
-@@ -1219,9 +1219,6 @@ ecore_x_window_root_list(int *num_ret)
- {
-    int num, i;
-    Ecore_X_Window *roots;
--#ifdef ECORE_XPRINT
--   int xp_base, xp_err_base;
--#endif /* ifdef ECORE_XPRINT */
- 
-    if (!num_ret)
-      return NULL;
-@@ -1229,80 +1226,6 @@ ecore_x_window_root_list(int *num_ret)
-    *num_ret = 0;
- 
-    LOGFN(__FILE__, __LINE__, __FUNCTION__);
--#ifdef ECORE_XPRINT
--   num = ScreenCount(_ecore_x_disp);
--   if (XpQueryExtension(_ecore_x_disp, &xp_base, &xp_err_base))
--     {
--        Screen **ps = NULL;
--        int psnum = 0;
--
--        ps = XpQueryScreens(_ecore_x_disp, &psnum);
--        if (ps)
--          {
--             int overlap, j;
--
--             overlap = 0;
--             for (i = 0; i < num; i++)
--               {
--                  for (j = 0; j < psnum; j++)
--                    {
--                       if (ScreenOfDisplay(_ecore_x_disp, i) == ps[j])
--                         overlap++;
--                    }
--               }
--             roots = malloc(MAX((num - overlap) * sizeof(Ecore_X_Window), 1));
--             if (roots)
--               {
--                  int k;
--
--                  k = 0;
--                  for (i = 0; i < num; i++)
--                    {
--                       int is_print;
--
--                       is_print = 0;
--                       for (j = 0; j < psnum; j++)
--                         {
--                            if (ScreenOfDisplay(_ecore_x_disp, i) == ps[j])
--                              {
--                                 is_print = 1;
--                                 break;
--                              }
--                         }
--                       if (!is_print)
--                         {
--                            roots[k] = RootWindow(_ecore_x_disp, i);
--                            k++;
--                         }
--                    }
--                  *num_ret = k;
--               }
--
--             XFree(ps);
--          }
--        else
--          {
--             roots = malloc(num * sizeof(Ecore_X_Window));
--             if (!roots)
--               return NULL;
--
--             *num_ret = num;
--             for (i = 0; i < num; i++)
--               roots[i] = RootWindow(_ecore_x_disp, i);
--          }
--     }
--   else
--     {
--        roots = malloc(num * sizeof(Ecore_X_Window));
--        if (!roots)
--          return NULL;
--
--        *num_ret = num;
--        for (i = 0; i < num; i++)
--          roots[i] = RootWindow(_ecore_x_disp, i);
--     }
--
--#else /* ifdef ECORE_XPRINT */
-    num = ScreenCount(_ecore_x_disp);
-    roots = malloc(num * sizeof(Ecore_X_Window));
-    if (!roots)
-@@ -1311,7 +1234,6 @@ ecore_x_window_root_list(int *num_ret)
-    *num_ret = num;
-    for (i = 0; i < num; i++)
-      roots[i] = RootWindow(_ecore_x_disp, i);
--#endif /* ifdef ECORE_XPRINT */
-    return roots;
- }
- 
-diff --git a/src/lib/ecore_x/xlib/ecore_x_private.h b/src/lib/ecore_x/xlib/ecore_x_private.h
-index 97b3858..07c09fb 100644
---- a/src/lib/ecore_x/xlib/ecore_x_private.h
-+++ b/src/lib/ecore_x/xlib/ecore_x_private.h
-@@ -19,9 +19,6 @@
- #ifdef ECORE_XCURSOR
- #include <X11/Xcursor/Xcursor.h>
- #endif /* ifdef ECORE_XCURSOR */
--#ifdef ECORE_XPRINT
--#include <X11/extensions/Print.h>
--#endif /* ifdef ECORE_XPRINT */
- #ifdef ECORE_XINERAMA
- #include <X11/extensions/Xinerama.h>
- #endif /* ifdef ECORE_XINERAMA */
--- 
-2.4.3
-
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 7ac26f4..6673bb5 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.15.2.tar.xz.sha256
-sha256	dd738f19f454621a7fa1fdb4c008457c170989f5f0c535edfed7b6773ae6c2a4	efl-1.15.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.15.3.tar.xz.sha256
+sha256	3bac40e6294288034bd7f8902088bf1169cf376f6fd25b7a49854ab561630642	efl-1.15.3.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 014e010..2ea2592 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.15.2
+EFL_VERSION = 1.15.3
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
@@ -24,7 +24,6 @@ EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev \
 
 # Regenerate the autotools:
 #  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
-#  - to remove dependency on libXp: https://phab.enlightenment.org/D3150
 EFL_AUTORECONF = YES
 EFL_GETTEXTIZE = YES
 
