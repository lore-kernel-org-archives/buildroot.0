From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Fri, 28 Dec 2018 08:37:32 +0800
Subject: [Buildroot] [PATCH 3/3] package/luaposix: bump version to 34.0.4
In-Reply-To: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
References: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <1545957452-9451-3-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This version has a new dependency on lua-normalize.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/luaposix/Config.in     |  1 +
 package/luaposix/luaposix.hash |  2 +-
 package/luaposix/luaposix.mk   | 26 +++++---------------------
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 91abcb9..f1e5cbd 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LUA_NORMALIZE # runtime
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index b3984c1..e219407 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ba0bc343783fc33958cd02a68cdbfd65430152d9f297f7ed92678b1a305bd5d7  luaposix-34.0.1.tar.gz
+sha256 e262c91bc9f89bacb816a77499e5037ec39bf511d2474a9afca0f9282c2b357b  luaposix-34.0.4-1.src.rock
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 779e707..db0a4e7 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,27 +4,11 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 34.0.1
-LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
+LUAPOSIX_VERSION_UPSTREAM = 34.0.4
+LUAPOSIX_VERSION = $(LUAPOSIX_VERSION_UPSTREAM)-1
+LUAPOSIX_NAME_UPSTREAM = luaposix
+LUAPOSIX_SUBDIR = luaposix-$(LUAPOSIX_VERSION_UPSTREAM)
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
 
-define LUAPOSIX_BUILD_CMDS
-	(cd $(@D); \
-		$(LUA_RUN) build-aux/luke \
-		CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LUA_INCDIR=$(STAGING_DIR)/usr/include \
-	)
-endef
-
-define LUAPOSIX_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-		$(LUA_RUN) build-aux/luke install \
-		INST_LIBDIR="$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
-		INST_LUADIR="$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)" \
-	)
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
-- 
2.7.4
