From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jun 2018 23:07:02 +0200
Subject: [Buildroot] [PATCH v2 18/22]
 package/x11r7/xdriver_xf86-input-mouse: add upstream patch to fix support
 for xserver_xorg-server 1.20.0
In-Reply-To: <20180623210706.2519-1-bernd.kuhls@t-online.de>
References: <20180623210706.2519-1-bernd.kuhls@t-online.de>
Message-ID: <20180623210706.2519-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-Adapt-to-removal-of-xf86GetOS.patch  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-input-mouse/0002-Adapt-to-removal-of-xf86GetOS.patch

diff --git a/package/x11r7/xdriver_xf86-input-mouse/0002-Adapt-to-removal-of-xf86GetOS.patch b/package/x11r7/xdriver_xf86-input-mouse/0002-Adapt-to-removal-of-xf86GetOS.patch
new file mode 100644
index 0000000000..dbf72b7e56
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-mouse/0002-Adapt-to-removal-of-xf86GetOS.patch
@@ -0,0 +1,47 @@
+From 3c8f243b750a92d5837a449d344ff884dbd02b57 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Thu, 16 Feb 2017 09:21:21 -0500
+Subject: [PATCH] Adapt to removal of xf86GetOS
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/xorg/driver/xf86-input-mouse/commit/?id=3c8f243b750a92d5837a449d344ff884dbd02b57
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/mouse.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/src/mouse.c b/src/mouse.c
+index dae98aa..40d97a9 100644
+--- a/src/mouse.c
++++ b/src/mouse.c
+@@ -794,7 +794,6 @@ InitProtocols(void)
+ {
+     int classes;
+     int i;
+-    const char *osname = NULL;
+ 
+     if (osInfo)
+         return TRUE;
+@@ -821,11 +820,11 @@ InitProtocols(void)
+                 mouseProtocols[i].id = PROT_UNSUP;
+ 
+     /* NetBSD uses PROT_BM for "PS/2". */
+-    xf86GetOS(&osname, NULL, NULL, NULL);
+-    if (osname && xf86NameCmp(osname, "netbsd") == 0)
+-        for (i = 0; mouseProtocols[i].name; i++)
+-            if (mouseProtocols[i].id == PROT_PS2)
+-                mouseProtocols[i].id = PROT_BM;
++#if defined(__NetBSD__)
++    for (i = 0; mouseProtocols[i].name; i++)
++        if (mouseProtocols[i].id == PROT_PS2)
++            mouseProtocols[i].id = PROT_BM;
++#endif
+ 
+     return TRUE;
+ }
+-- 
+2.17.1
+
-- 
2.17.1
