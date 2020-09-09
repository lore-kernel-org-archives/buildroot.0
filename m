From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2020 22:36:19 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/lcdproc: fix
 build with gcc 10
Message-ID: <20200909203533.65046813DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e07b1d36bcb2d2a40c814a5562e057222d1c705b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/67367f43cf8b2cc74e9a4f51f9d685ef058d5745

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 95c51a3fa832247f8cd2dd331cb6120733d4f2c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Fixcompilation-with-GCC-10-x.patch        | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/lcdproc/0003-Fixcompilation-with-GCC-10-x.patch b/package/lcdproc/0003-Fixcompilation-with-GCC-10-x.patch
new file mode 100644
index 0000000000..c8a3dc20a3
--- /dev/null
+++ b/package/lcdproc/0003-Fixcompilation-with-GCC-10-x.patch
@@ -0,0 +1,46 @@
+From 084126b03f29b33ab3e657c66e8c6a439f27f8e1 Mon Sep 17 00:00:00 2001
+From: Harald Geyer <harald@ccbib.org>
+Date: Mon, 10 Feb 2020 13:15:10 +0100
+Subject: [PATCH] Fix compilation with GCC >= 10.x
+
+Starting with GCC >= 10.x, -fno-common is used as default
+instead of -fcommon. This patch fixes the compilation.
+
+Closes: #148
+
+Suggested-by: Conrad Kostecki <conrad@kostecki.com>
+Signed-off-by: Harald Geyer <harald@ccbib.org>
+
+[Retrieved from:
+https://github.com/lcdproc/lcdproc/commit/084126b03f29b33ab3e657c66e8c6a439f27f8e1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ clients/lcdproc/iface.c | 1 +
+ clients/lcdproc/iface.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clients/lcdproc/iface.c b/clients/lcdproc/iface.c
+index 40e50cb7..1ac355bd 100644
+--- a/clients/lcdproc/iface.c
++++ b/clients/lcdproc/iface.c
+@@ -32,6 +32,7 @@
+ #define UNSET_INT -1
+ #define UNSET_STR "\01"
+ 
++IfaceInfo iface[MAX_INTERFACES];
+ 
+ static int iface_count = 0;	/* number of interfaces */
+ static char unit_label[10] = "B";	/* default unit label is Bytes */
+diff --git a/clients/lcdproc/iface.h b/clients/lcdproc/iface.h
+index cc6dbaaf..c1bd6b5b 100644
+--- a/clients/lcdproc/iface.h
++++ b/clients/lcdproc/iface.h
+@@ -18,7 +18,7 @@
+ /** max number of interfaces in multi-interface mode */
+ #define MAX_INTERFACES 3
+ 
+-IfaceInfo iface[MAX_INTERFACES];	/* interface info */
++extern IfaceInfo iface[MAX_INTERFACES];	/* interface info */
+ 
+ /** Update screen content */
+ int iface_screen(int rep, int display, int *flags_ptr);
