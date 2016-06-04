From: Stanislas Bach <sbach@0g.re>
Date: Sat, 4 Jun 2016 14:15:36 -0700
Subject: [Buildroot] [PATCH] xserver_xorg-server: apply modesettings patch
	for 1.18.3 only
Message-ID: <575344F8.2030103@0g.re>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have two choices for the server's version (1.18.3, and 1.14.7)
but the following patch will only apply for versions >= 1.17.2.

If 1.14.7 is selected the build will fail with the following error:

Applying 0001-modesettings-needs-dri2.patch using patch:
patching file configure.ac
Hunk #1 FAILED at 2036

So move this patch to an appropriate version folder in the package's
directory. It should be good enough until this package provides more
versions >= 1.17.2.

Signed-off-by: Stanislas Bach <sbach@0g.re>

diff --git 
a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch 
b/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
deleted file mode 100644
index 4ef95ef..0000000
--- a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Kernel modesettings support also depends on dri2, see
-http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=91584
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xorg-server-1.17.2.org/configure.ac 
xorg-server-1.17.2/configure.ac
---- xorg-server-1.17.2.org/configure.ac	2015-06-16 17:42:40.000000000 +0200
-+++ xorg-server-1.17.2/configure.ac	2015-08-08 10:44:59.702382624 +0200
-@@ -2036,7 +2036,7 @@
- 	        XORG_SYS_LIBS="$XORG_SYS_LIBS $XORG_MODULES_LIBS"
- 	fi
- --	if test "x$DRM" = xyes; then
-+	if test "x$DRM" = xyes -a "x$DRI2" = xyes; then
- 		dnl 2.4.46 is required for cursor hotspot support.
- 		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
- 		XORG_DRIVER_MODESETTING=yes
diff --git 
a/package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch 
b/package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch
new file mode 100644
index 0000000..4ef95ef
--- /dev/null
+++ 
b/package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch
@@ -0,0 +1,19 @@
+Kernel modesettings support also depends on dri2, see
+http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46
+
+Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=91584
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xorg-server-1.17.2.org/configure.ac 
xorg-server-1.17.2/configure.ac
+--- xorg-server-1.17.2.org/configure.ac	2015-06-16 17:42:40.000000000 +0200
++++ xorg-server-1.17.2/configure.ac	2015-08-08 10:44:59.702382624 +0200
+@@ -2036,7 +2036,7 @@
+ 	        XORG_SYS_LIBS="$XORG_SYS_LIBS $XORG_MODULES_LIBS"
+ 	fi
+ +-	if test "x$DRM" = xyes; then
++	if test "x$DRM" = xyes -a "x$DRI2" = xyes; then
+ 		dnl 2.4.46 is required for cursor hotspot support.
+ 		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
+ 		XORG_DRIVER_MODESETTING=yes
-- 
2.1.4
