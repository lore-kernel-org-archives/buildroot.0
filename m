From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:47:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cairo: add optional support for
	lzo
Message-ID: <1456066049-28163-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When lzo was compiled before, cairo will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cairo-sphinx | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [liblzo2.so.2]

The build system offers no option to en-/disable lzo support:
https://cgit.freedesktop.org/cairo/tree/configure.ac#n54

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: moved lzo outside BR2_PACKAGE_CAIRO_TEE option (Arnout)

 package/cairo/cairo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 205250d..6b54b28 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -93,6 +93,10 @@ else
 CAIRO_CONF_OPTS += --disable-vg
 endif
 
+ifeq ($(BR2_PACKAGE_LZO),y)
+CAIRO_DEPENDENCIES += lzo
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
 CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
-- 
2.7.0
