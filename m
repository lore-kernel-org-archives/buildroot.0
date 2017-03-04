From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:55:04 +0100
Subject: [Buildroot] [git commit] package/librsvg: disable gdk-pixbuf-loader
Message-ID: <20170304105533.8A37982268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7372c80cc5b07b25d5ee5bc9909ed807a9e69fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdk-pixbuf-loader support is enabled by default but it silently fail to
generate gdk-pixbuf.loaders file when host != target.

For exemple on ARM target:
output/host/usr/bin/gdk-pixbuf-query-loaders ./libpixbufloader-svg.la
g_module_open() failed for output/build/librsvg-2.40.16/gdk-pixbuf-loader/./libpixbufloader-svg.la: output/build/librsvg-2.40.16/gdk-pixbuf-loader/./.libs/libpixbufloader-svg.so: wrong ELF class: ELFCLASS32

But it doesn't break the build.

When host = target using the Sourcery CodeBench AMD64 2016.11 toolchain
optimized for x86_68 AMD Puma/Jaguar or AMD Steamroller, it break the
build due to "Illegal instruction".

output/host/usr/bin/gdk-pixbuf-query-loaders libpixbufloader-svg.la
Illegal instruction (core dumped)

Since this option is broken for cross-compilation, disable it.

Fixes:
http://autobuild.buildroot.net/results/393/393145bc9bcb93d6df55ec8c63725c3d9a299957

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsvg/librsvg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index b711de4..db57193 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -9,7 +9,7 @@ LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).16
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_CONF_OPTS = --disable-tools --enable-introspection=no
+LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
