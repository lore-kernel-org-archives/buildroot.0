From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  9 Feb 2016 04:42:44 -0200
Subject: [Buildroot]  [PATCH] xapp_xf86dga: fix xlib_libXaw dependency
Message-ID: <1455000164-1743-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make it select BR2_PACKAGE_XLIB_LIBXAW, that also selects
BR2_PACKAGE_XLIB_LIBXT and BR2_PACKAGE_XLIB_LIBXMU

Fixes:
http://autobuild.buildroot.net/results/aee/aee4a895c74647292715705bfcdf742f3ea2f76f/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
---
The error message is:
Makefile:475: *** xlib_libXaw is in the dependency chain of xapp_xf86dga that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

The error can reproduced with this config
BR2_TOOLCHAIN_EXTERNAL=y # easy for toolchain w/ MMU sup.
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XAPP_XF86DGA=y
---
 package/x11r7/xapp_xf86dga/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 8a13bd4..bd128c0 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
+	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_USE_MMU # fork()
 	help
 	  test program for the XFree86-DGA extension
-- 
1.9.1
