From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:30:49 +0200
Subject: [Buildroot] [git commit] libepoxy: drop patch merged upstream
Message-ID: <20170902212554.89F4A806A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d10c61ce6402000150c793dbd771d73a3c257ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the merge of the "next" branch back into "master", the
libepoxy package fails to build, because its version was bumped in the
"next" branch and patches were backported in the "master" branch,
which are no longer needed since they are upstream as of version
1.4.3.

Fixes:

  http://autobuild.buildroot.net/results/5b77479c101dc43f92f23d3fd893d2df80697db0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nal_has_gl_extension-epoxy_egl_version-ad.patch | 62 ----------------------
 1 file changed, 62 deletions(-)

diff --git a/package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch b/package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch
deleted file mode 100644
index 770d210..0000000
--- a/package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0e004b7344ea67fd682f33446d19e3b63a187513 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Mon, 24 Apr 2017 16:10:28 +0200
-Subject: [PATCH] epoxy_internal_has_gl_extension, epoxy_egl_version: add some
- missing nullpointer checks from
- https://bugzilla.redhat.com/show_bug.cgi?id=1395366 Related commit:
- b3b8bd9af7bf1fcfe544fd131f4d4f0d117ae7bc  Fix "epoxy_glx_version" to handle
- the case when GLX is not active on the display. Patch is tweak from the
- original version posted by Tom Horsley
-
-Backported from: https://github.com/anholt/libepoxy/pull/118
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
----
- src/dispatch_common.c | 9 ++++++++-
- src/dispatch_egl.c    | 3 +++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/dispatch_common.c b/src/dispatch_common.c
-index b521b1b..a38c0fc 100644
---- a/src/dispatch_common.c
-+++ b/src/dispatch_common.c
-@@ -443,7 +443,12 @@ bool
- epoxy_extension_in_string(const char *extension_list, const char *ext)
- {
-     const char *ptr = extension_list;
--    int len = strlen(ext);
-+    int len;
-+
-+    if (!ext)
-+        return false;
-+
-+    len = strlen(ext);
- 
-     if (extension_list == NULL || *extension_list == '\0')
-         return false;
-@@ -478,6 +483,8 @@ epoxy_internal_has_gl_extension(const char *ext, bool invalid_op_mode)
- 
-         for (i = 0; i < num_extensions; i++) {
-             const char *gl_ext = (const char *)glGetStringi(GL_EXTENSIONS, i);
-+            if (!gl_ext)
-+                return false;
-             if (strcmp(ext, gl_ext) == 0)
-                 return true;
-         }
-diff --git a/src/dispatch_egl.c b/src/dispatch_egl.c
-index 50e66dd..f555a58 100644
---- a/src/dispatch_egl.c
-+++ b/src/dispatch_egl.c
-@@ -65,6 +65,9 @@ epoxy_egl_version(EGLDisplay dpy)
-     int ret;
- 
-     version_string = eglQueryString(dpy, EGL_VERSION);
-+    if (!version_string)
-+        return 0;
-+
-     ret = sscanf(version_string, "%d.%d", &major, &minor);
-     assert(ret == 2);
-     return major * 10 + minor;
--- 
-2.14.1
-
