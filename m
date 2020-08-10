From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Aug 2020 08:41:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 security fix for CVE-2020-14347
Message-ID: <20200810064109.447089-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.x.org/archives/xorg-announce/2020-July/003051.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../1.20.8/0007-fix-for-ZDI-11426.patch       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch

diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch b/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch
new file mode 100644
index 0000000000..ce623b24cb
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch
@@ -0,0 +1,36 @@
+From aac28e162e5108510065ad4c323affd6deffd816 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Sat, 25 Jul 2020 19:33:50 +0200
+Subject: [PATCH] fix for ZDI-11426
+
+Avoid leaking un-initalized memory to clients by zeroing the
+whole pixmap on initial allocation.
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://gitlab.freedesktop.org/xorg/xserver/-/commit/aac28e162e5108510065ad4c323affd6deffd816]
+---
+ dix/pixmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dix/pixmap.c b/dix/pixmap.c
+index 1186d7dbbf..5a0146bbb6 100644
+--- a/dix/pixmap.c
++++ b/dix/pixmap.c
+@@ -116,7 +116,7 @@ AllocatePixmap(ScreenPtr pScreen, int pixDataSize)
+     if (pScreen->totalPixmapSize > ((size_t) - 1) - pixDataSize)
+         return NullPixmap;
+ 
+-    pPixmap = malloc(pScreen->totalPixmapSize + pixDataSize);
++    pPixmap = calloc(1, pScreen->totalPixmapSize + pixDataSize);
+     if (!pPixmap)
+         return NullPixmap;
+ 
+-- 
+GitLab
+
-- 
2.27.0
