From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 13 Dec 2018 19:54:33 +0100
Subject: [Buildroot] [PATCH] netsurf: fix build error
Message-ID: <20181213185433.6633-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the previous commit allows to build host-libpng

now, this library is found when compiling the host tool convert_image

see http://autobuild.buildroot.net/results/d0b/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/netsurf/netsurf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 3339b35c9..1671944e9 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -27,6 +27,7 @@ endif
 ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
 NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
+NETSURF_CONFIG="HOST_CFLAGS=-I$(HOST_DIR)/include HOST_LDFLAGS='-lpng -L$(HOST_DIR)/lib'"
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
@@ -52,6 +53,7 @@ NETSURF_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	AR="$(TARGET_AR)" \
 	TMP_PREFIX=$(STAGING_DIR)/usr \
+	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
 	PREFIX=/usr
 
 define NETSURF_BUILD_CMDS
-- 
2.17.1
