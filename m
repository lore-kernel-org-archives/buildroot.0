From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:24 +0200
Subject: [Buildroot] [PATCH 1/9] luaposix: bump to version 34.0.1
Message-ID: <20170924075932.5990-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.hash |  2 +-
 package/luaposix/luaposix.mk   | 24 ++++++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index e2216be73..b3984c1d1 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 e66262f5b7fe1c32c65f17a5ef5ffb31c4d1877019b4870a5d373e2ab6526a21 luaposix-33.4.0.tar.gz
+sha256 ba0bc343783fc33958cd02a68cdbfd65430152d9f297f7ed92678b1a305bd5d7  luaposix-34.0.1.tar.gz
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index ea3af16fb..779e707ce 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,11 +4,27 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 33.4.0
+LUAPOSIX_VERSION = 34.0.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
-LUAPOSIX_LICENSE_FILES = COPYING
+LUAPOSIX_LICENSE_FILES = LICENSE
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
-LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
-$(eval $(autotools-package))
+define LUAPOSIX_BUILD_CMDS
+	(cd $(@D); \
+		$(LUA_RUN) build-aux/luke \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LUA_INCDIR=$(STAGING_DIR)/usr/include \
+	)
+endef
+
+define LUAPOSIX_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(LUA_RUN) build-aux/luke install \
+		INST_LIBDIR="$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
+		INST_LUADIR="$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)" \
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
