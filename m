From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Dec 2020 12:02:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/x11vnc: fix
 CVE-2020-29074
Message-ID: <20201212104827.6243083D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=023ac3c6c1611a49453a013596a44e29637ff38e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

scan.c in x11vnc 0.9.16 uses IPC_CREAT|0777 in shmget calls, which
allows access by actors other than the current user.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3b6a105af87662f2ecca3fe4717fea11e267b0c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...to-shared-memory-segments-to-current-user.patch | 25 ++++++++++++++++++++++
 package/x11vnc/x11vnc.mk                           |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
new file mode 100644
index 0000000000..e4dbdf1894
--- /dev/null
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
@@ -0,0 +1,25 @@
+From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
+Date: Wed, 18 Nov 2020 08:40:45 +0100
+Subject: [PATCH] scan: limit access to shared memory segments to current user
+
+[Retrieved from:
+https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/scan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scan.c b/src/scan.c
+index 43e00d2..12994d5 100644
+--- a/src/scan.c
++++ b/src/scan.c
+@@ -320,7 +320,7 @@ static int shm_create(XShmSegmentInfo *shm, XImage **ximg_ptr, int w, int h,
+ 
+ #if HAVE_XSHM
+ 	shm->shmid = shmget(IPC_PRIVATE,
+-	    xim->bytes_per_line * xim->height, IPC_CREAT | 0777);
++	    xim->bytes_per_line * xim->height, IPC_CREAT | 0600);
+ 
+ 	if (shm->shmid == -1) {
+ 		rfbErr("shmget(%s) failed.\n", name);
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 9daf490581..571febfcfc 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -12,6 +12,8 @@ X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
+# 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
+X11VNC_IGNORE_CVES += CVE-2020-29074
 
 # Source coming from github, no configure included
 X11VNC_AUTORECONF = YES
