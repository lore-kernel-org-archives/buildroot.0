From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 14:18:17 +0100
Subject: [Buildroot] [PATCH] package/netsurf: use HOST_CFLAGS/HOST_LDFLAGS
Message-ID: <20181227131818.17917-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 9b0ac875385e3bcb052fc2f376f45fa61e102673 ("package/netsurf:
make sure host libpng can be found"), the netsurf package was modified
to pass -L$(HOST_DIR)/lib so that libpng is found at link time.

However, this is not sufficient: for the host tool to work at runtime,
we need to have the proper RPATH encoded in the host
binary. Otherwise, building netsurf fails with:

build/Linux-framebuffer/tools/convert_image: error while loading shared libraries: libpng16.so.16: cannot open shared object file: No such file or directory
make[3]: *** [build/Linux-framebuffer/image-caret_image.c] Error 127

So basically, we need to build not only with -L$(HOST_DIR)/lib, but
with the complete HOST_LDFLAGS provided by Buildroot.

For consistency, we also use HOST_CFLAGS instead of hardcoding
-I$(HOST_DIR)/include.

It is worth mentioning that we must use single quotes here, because
the NETSURF_CONFIG variable value then gets put within double quotes
to be passed to the netsurf build system.

Fixes:

  http://autobuild.buildroot.net/results/4ff6a8c4017d006a4b6b9ca369a569fa72862900/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/netsurf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index e5a251b9c1..2e17c5768f 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -36,8 +36,8 @@ ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
 NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
 NETSURF_CONFIG = \
-	HOST_CFLAGS=-I$(HOST_DIR)/include \
-	HOST_LDFLAGS='-lpng -L$(HOST_DIR)/lib'
+	HOST_CFLAGS='$(HOST_CFLAGS)' \
+	HOST_LDFLAGS='$(HOST_LDFLAGS) -lpng'
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 NETSURF_DEPENDENCIES += freetype
 define NETSURF_FONTLIB_CONFIGURE_CMDS
-- 
2.20.1
