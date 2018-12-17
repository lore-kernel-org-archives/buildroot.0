From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 09:19:42 +0100
Subject: [Buildroot] [git commit] package/netsurf: make sure host libpng can
 be found
Message-ID: <20181217084316.965FA81840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b0ac875385e3bcb052fc2f376f45fa61e102673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 42c8f9f6b46e196a7c337c683a7df5ae6bd421b2 ("package/netsurf: add
dependency on host-libpng for sdl") ensured host-libpng was built
prior to netsurf when the SDL backend is selected. However, this is
not sufficient for the netsurf build system to find libpng on the
host, we need to help by providing the right HOST_CFLAGS and
HOST_LDFLAGS.

Fixes:

  http://autobuild.buildroot.net/results/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: rewrite commit message.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/netsurf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 692d2b770c..e5a251b9c1 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -35,6 +35,9 @@ endif
 ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
 NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
+NETSURF_CONFIG = \
+	HOST_CFLAGS=-I$(HOST_DIR)/include \
+	HOST_LDFLAGS='-lpng -L$(HOST_DIR)/lib'
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 NETSURF_DEPENDENCIES += freetype
 define NETSURF_FONTLIB_CONFIGURE_CMDS
@@ -76,6 +79,7 @@ NETSURF_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	AR="$(TARGET_AR)" \
 	TMP_PREFIX=$(STAGING_DIR)/usr \
+	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
 	PREFIX=/usr
 
 define NETSURF_BUILD_CMDS
