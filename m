From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 11:18:11 +0200
Subject: [Buildroot] [PATCH 5/5] sdl: fix build of other sdl components
In-Reply-To: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f800341385a920189716290cd4d766aaa030e808.1279271863.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The post installation hook of SDL was not being executed, due to an
incorrect usage of the infrastructure. Moreover, it did not patch
prefix/exec_prefix in sdl-config as is needed. In addition to that, we
remove the -Wl,-rpath option from sdl-config, since it is not needed.

This fixes at least the build of sdl_image, and probably of other sdl
components as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
