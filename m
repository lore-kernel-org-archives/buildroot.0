From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 15 Aug 2017 00:31:17 +0300
Subject: [Buildroot] [PATCH 1/1] libepoxy: add patch to fix segfaults when
	using in X11 without GLX
Message-ID: <20170814213117.4735-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a patch cherry-picked from libepoxy 1.4.2, which adds missing
NULL-pointer checks and avoids segmentation faults when using libepoxy
under X11, when the server does not have the GLX extension, or it is
disabled -- and applications can still use EGL.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...nal_has_gl_extension-epoxy_egl_version-ad.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch

diff --git a/package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch b/package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch
new file mode 100644
index 0000000000..770d210097
--- /dev/null
+++ b/package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch
@@ -0,0 +1,62 @@
+From 0e004b7344ea67fd682f33446d19e3b63a187513 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Mon, 24 Apr 2017 16:10:28 +0200
+Subject: [PATCH] epoxy_internal_has_gl_extension, epoxy_egl_version: add some
+ missing nullpointer checks from
+ https://bugzilla.redhat.com/show_bug.cgi?id=1395366 Related commit:
+ b3b8bd9af7bf1fcfe544fd131f4d4f0d117ae7bc  Fix "epoxy_glx_version" to handle
+ the case when GLX is not active on the display. Patch is tweak from the
+ original version posted by Tom Horsley
+
+Backported from: https://github.com/anholt/libepoxy/pull/118
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+---
+ src/dispatch_common.c | 9 ++++++++-
+ src/dispatch_egl.c    | 3 +++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/dispatch_common.c b/src/dispatch_common.c
+index b521b1b..a38c0fc 100644
+--- a/src/dispatch_common.c
++++ b/src/dispatch_common.c
+@@ -443,7 +443,12 @@ bool
+ epoxy_extension_in_string(const char *extension_list, const char *ext)
+ {
+     const char *ptr = extension_list;
+-    int len = strlen(ext);
++    int len;
++
++    if (!ext)
++        return false;
++
++    len = strlen(ext);
+ 
+     if (extension_list == NULL || *extension_list == '\0')
+         return false;
+@@ -478,6 +483,8 @@ epoxy_internal_has_gl_extension(const char *ext, bool invalid_op_mode)
+ 
+         for (i = 0; i < num_extensions; i++) {
+             const char *gl_ext = (const char *)glGetStringi(GL_EXTENSIONS, i);
++            if (!gl_ext)
++                return false;
+             if (strcmp(ext, gl_ext) == 0)
+                 return true;
+         }
+diff --git a/src/dispatch_egl.c b/src/dispatch_egl.c
+index 50e66dd..f555a58 100644
+--- a/src/dispatch_egl.c
++++ b/src/dispatch_egl.c
+@@ -65,6 +65,9 @@ epoxy_egl_version(EGLDisplay dpy)
+     int ret;
+ 
+     version_string = eglQueryString(dpy, EGL_VERSION);
++    if (!version_string)
++        return 0;
++
+     ret = sscanf(version_string, "%d.%d", &major, &minor);
+     assert(ret == 2);
+     return major * 10 + minor;
+-- 
+2.14.1
+
-- 
2.14.1
