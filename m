From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 13:23:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: Add
	gettext/iconv support
Message-ID: <1427628199-21758-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses gettext/iconv when needed

fli4l at fli4lbuild64:~/br5$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libXpm.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 0x00000001 (NEEDED)                     Shared library: [libxcb.so.1]
 0x00000001 (NEEDED)                     Shared library: [libXau.so.6]
 0x00000001 (NEEDED)                     Shared library: [libXdmcp.so.6]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXpm/Config.in      |    1 +
 package/x11r7/xlib_libXpm/xlib_libXpm.mk |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
index 528498c..73da0c2 100644
--- a/package/x11r7/xlib_libXpm/Config.in
+++ b/package/x11r7/xlib_libXpm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXPM
 	bool "libXpm"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 766724f..997ef95 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -13,6 +13,8 @@ XLIB_LIBXPM_INSTALL_STAGING = YES
 # we patch configure.ac
 XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	host-gettext
 
 $(eval $(autotools-package))
-- 
1.7.10.4
