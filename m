From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Apr 2018 10:23:39 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: fix gobject with gcc <= 4.7
Message-ID: <20180415082339.5520-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch under upstream review: https://bugzilla.gnome.org/show_bug.cgi?id=795138

Fixes:
 - http://autobuild.buildroot.net/results/b29a2f868438a2210873ea72f491db63175848be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0003-gobject-fix-compilation-with-gcc-4.7.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch

diff --git a/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch b/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
new file mode 100644
index 0000000000..ed43674b2b
--- /dev/null
+++ b/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
@@ -0,0 +1,49 @@
+From a2b27c0d038ad76cc8016999f8788245da97e946 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Apr 2018 19:18:57 +0200
+Subject: [PATCH] gobject: fix compilation with gcc <= 4.7
+
+On gcc 4.7, we got the following error:
+
+i686-nptl-linux-gnu-gcc --version
+> i686-nptl-linux-gnu-gcc (crosstool-NG 1.20.0) 4.7.4
+> $ echo '#include <glib-object.h>' | i686-nptl-linux-gnu-gcc -x c -I
+staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall
+-Werror -c - -o /tmp/foo.o
+> In file included from
+staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
+>                  from staging/usr/include/glib-2.0/glib-object.h:23,
+>                  from <stdin>:1:
+> staging/usr/include/glib-2.0/gobject/gobject.h: In function
+'g_set_object':
+> staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value
+computed is not used [-Werror=unused-value]
+> cc1: all warnings being treated as errors
+
+This error has been added by commit 3fae39a5d742afe73741f5fd7aa24e3ae8182f06
+So enable the new g_set_object definition only if gcc >= 4.8
+
+Fixes:
+ - http://autobuild.buildroot.net/results/b29a2f868438a2210873ea72f491db63175848be
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gobject/gobject.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gobject/gobject.h b/gobject/gobject.h
+index 9830663ce..838046fe0 100644
+--- a/gobject/gobject.h
++++ b/gobject/gobject.h
+@@ -507,7 +507,7 @@ GLIB_AVAILABLE_IN_ALL
+ void        g_object_remove_weak_pointer      (GObject        *object, 
+                                                gpointer       *weak_pointer_location);
+ 
+-#if defined(__GNUC__) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
++#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
+ /* Make reference APIs type safe with macros */
+ #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
+ #define g_object_ref_sink(Obj) ((__typeof__(Obj)) (g_object_ref_sink) (Obj))
+-- 
+2.14.1
+
-- 
2.14.1
