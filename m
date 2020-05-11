From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 21:14:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libvncserver: fix
 CVE-2019-20788
Message-ID: <20200511190851.407D08A53F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3d7d0371f8477d65b6d37a140eeb7af12f4355e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

libvncclient/cursor.c in LibVNCServer through 0.9.12 has a
HandleCursorShape integer overflow and heap-based buffer overflow via a
large height or width value. NOTE: this may overlap CVE-2019-15690.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 705adbaf9a17ad7ada4af592491e56e3cbe618dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nt-cursor-limit-width-height-input-values.patch | 40 ++++++++++++++++++++++
 package/libvncserver/libvncserver.mk               |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch b/package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch
new file mode 100644
index 0000000000..c389f2ecfb
--- /dev/null
+++ b/package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch
@@ -0,0 +1,40 @@
+From 54220248886b5001fbbb9fa73c4e1a2cb9413fed Mon Sep 17 00:00:00 2001
+From: Christian Beier <dontmind@freeshell.org>
+Date: Sun, 17 Nov 2019 17:18:35 +0100
+Subject: [PATCH] libvncclient/cursor: limit width/height input values
+
+Avoids a possible heap overflow reported by Pavel Cheremushkin
+<Pavel.Cheremushkin@kaspersky.com>.
+
+re #275
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/LibVNC/libvncserver/commit/54220248886b5001fbbb9fa73c4e1a2cb9413fed]
+---
+ libvncclient/cursor.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libvncclient/cursor.c b/libvncclient/cursor.c
+index 67f45726..40ffb3b0 100644
+--- a/libvncclient/cursor.c
++++ b/libvncclient/cursor.c
+@@ -28,6 +28,8 @@
+ #define OPER_SAVE     0
+ #define OPER_RESTORE  1
+ 
++#define MAX_CURSOR_SIZE 1024
++
+ #define RGB24_TO_PIXEL(bpp,r,g,b)                                       \
+    ((((uint##bpp##_t)(r) & 0xFF) * client->format.redMax + 127) / 255             \
+     << client->format.redShift |                                              \
+@@ -54,6 +56,9 @@ rfbBool HandleCursorShape(rfbClient* client,int xhot, int yhot, int width, int h
+   if (width * height == 0)
+     return TRUE;
+ 
++  if (width >= MAX_CURSOR_SIZE || height >= MAX_CURSOR_SIZE)
++    return FALSE;
++
+   /* Allocate memory for pixel data and temporary mask data. */
+   if(client->rcSource)
+     free(client->rcSource);
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 5b8648fa6d..890672d04b 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -19,6 +19,9 @@ LIBVNCSERVER_IGNORE_CVES += CVE-2018-20750
 # 0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
 LIBVNCSERVER_IGNORE_CVES += CVE-2019-15681
 
+# 0006-libvncclient-cursor-limit-width-height-input-values.patch
+LIBVNCSERVER_IGNORE_CVES += CVE-2019-20788
+
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
