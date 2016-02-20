From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 18:22:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/links: add optional support for
	librsvg
Message-ID: <1455988925-26749-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When librsvg was compiled before, links will use it as optional
dependency, along with other gtk libraries:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/links | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libbz2.so.1.0]
 0x0000000000000001 (NEEDED)             Shared library: [libcairo.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libevent-2.0.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libgdk_pixbuf-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgio-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libglib-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgobject-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgpm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libjpeg.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [liblzma.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libpng16.so.16]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [librsvg-2.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libtiff.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libX11.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 28253fc..1ae4087 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -33,6 +33,12 @@ LINKS_DEPENDENCIES += jpeg
 else
 LINKS_CONF_OPTS += --without-libjpeg
 endif
+ifeq ($(BR2_PACKAGE_LIBRSVG),y)
+LINKS_CONF_OPTS += --with-librsvg
+LINKS_DEPENDENCIES += librsvg
+else
+LINKS_CONF_OPTS += --without-librsvg
+endif
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LINKS_CONF_OPTS += --with-libtiff
 LINKS_DEPENDENCIES += tiff
-- 
2.7.0
