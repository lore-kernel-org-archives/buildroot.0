From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 21:40:47 +0200
Subject: [Buildroot] [git commit master 1/1] prboom: re-add big endian fixup
Message-ID: <20101014194137.3D4C58D1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f8f3c92c634e5041769e608a64b680dfc074c80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Seems I misread configure.ac, the endianness detection is only used when
not cross compiling.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/prboom/prboom.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index a8c7f65..3a50fd5 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -19,6 +19,16 @@ PRBOOM_CONF_OPT = \
 		--disable-sdltest \
 		--disable-gl
 
+# endianness detection isn't used when cross compiling
+define PRBOOM_BIG_ENDIAN_FIXUP
+	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
+		$(PRBOOM_DIR)/config.h
+endef
+
+ifeq ($(BR2_ENDIAN),"BIG")
+PRBOOM_POST_CONFIGURE_HOOKS += PRBOOM_BIG_ENDIAN_FIXUP
+endif
+
 define PRBOOM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/src/prboom $(TARGET_DIR)/usr/games/prboom
 	$(INSTALL) -D $(@D)/src/prboom-game-server $(TARGET_DIR)/usr/games/prboom-game-server
-- 
1.7.1
