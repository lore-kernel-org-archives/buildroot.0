From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 21:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] sdl: fix build of other sdl
	components
Message-ID: <20100718200735.4CEA382BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=66264b87557b32d379389d1e4f6d8c98ef887ee5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The post installation hook of SDL was not being executed, due to an
incorrect usage of the infrastructure. Moreover, it did not patch
prefix/exec_prefix in sdl-config as is needed. In addition to that, we
remove the -Wl,-rpath option from sdl-config, since it is not needed.

This fixes at least the build of sdl_image, and probably of other sdl
components as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 87c7533..3834137 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -46,11 +46,19 @@ SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-esd \
 		--disable-nasm
 
-define SDL_POST_INSTALL_STAGING_HOOKS
-       $(SED) 's^libdir=\$${exec_prefix}^libdir=/usr^' \
-               $(STAGING_DIR)/usr/bin/sdl-config
+# Fixup prefix= and exec_prefix= in sdl-config, and remove the
+# -Wl,-rpath option.
+define SDL_FIXUP_SDL_CONFIG
+	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/bin/sdl-config
+	$(SED) 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/bin/sdl-config
+	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
+		$(STAGING_DIR)/usr/bin/sdl-config
 endef
 
+SDL_POST_INSTALL_STAGING_HOOKS+=SDL_FIXUP_SDL_CONFIG
+
 define SDL_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
 endef
-- 
1.7.1
