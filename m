From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:59:36 +0100
Subject: [Buildroot] [git commit] package/links: add optional support for
	librsvg
Message-ID: <20160221140059.C436F80758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f7991d78c744f5c3b8358b65089ad4ccb102fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 516d4c8..def7b75 100644
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
