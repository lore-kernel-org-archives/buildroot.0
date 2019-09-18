From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Sep 2019 08:19:13 +0200
Subject: [Buildroot] [pkg-luarocks 4/6] pkg-luarocks: add support of
 host-luarocks-package
In-Reply-To: <20190918061915.31250-1-francois.perrad@gadz.org>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
Message-ID: <20190918061915.31250-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-luarocks.txt |  4 +--
 package/pkg-luarocks.mk                  | 31 +++++++++++++++++-------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index f7104f373..5bab0c799 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -73,9 +73,7 @@ infrastructures in Buildroot, respectively.
 
 The main macro of the LuaRocks package infrastructure is +luarocks-package+:
 like +generic-package+ it works by defining a number of variables providing
-metadata information about the package, and then calling +luarocks-package+. It
-is worth mentioning that building LuaRocks packages for the host is not
-supported, so the macro +host-luarocks-package+ is not implemented.
+metadata information about the package, and then calling +luarocks-package+.
 
 Just like the generic infrastructure, the LuaRocks infrastructure works
 by defining a number of variables before calling the +luarocks-package+
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 23906f4a8..28218fde0 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -19,8 +19,10 @@
 
 LUAROCKS_RUN_CMD = $(HOST_DIR)/bin/luarocks
 LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
+HOST_LUAROCKS_CFLAGS = $(HOST_CFLAGS) -fPIC
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
+HOST_LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 ################################################################################
@@ -40,15 +42,16 @@ endif
 define inner-luarocks-package
 
 $(2)_BUILD_OPTS		?=
-$(2)_NAME_UPSTREAM	?= $(1)
-$(2)_SUBDIR		?= $$($(2)_NAME_UPSTREAM)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).rockspec
-$(2)_SOURCE		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).src.rock
-$(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
+$(3)_NAME_UPSTREAM	?= $(1)
+$(3)_SUBDIR		?= $$($(3)_NAME_UPSTREAM)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
+$(3)_ROCKSPEC		?= $$(call LOWERCASE,$$($(3)_NAME_UPSTREAM))-$$($(3)_VERSION).rockspec
+$(3)_SOURCE		?= $$(call LOWERCASE,$$($(3)_NAME_UPSTREAM))-$$($(3)_VERSION).src.rock
+$(3)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
-# Since we do not support host-luarocks-package, we know this is
-# a target package, and can just add the required dependencies
-$(2)_DEPENDENCIES	+= luainterpreter
+ifeq ($(4),target)
+$(2)_DEPENDENCIES += luainterpreter
+endif
+# host-luarocks implies host-luainterpreter
 $(2)_EXTRACT_DEPENDENCIES += host-luarocks
 
 #
@@ -82,6 +85,16 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	cd $$($(2)_SRCDIR) && \
+		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
+			CFLAGS="$$(HOST_LUAROCKS_CFLAGS)" \
+			LIBFLAG="-shared $$(HOST_LDFLAGS)" \
+			$$($(2)_BUILD_OPTS) $$($(2)_ROCKSPEC)
+endef
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
@@ -99,4 +112,4 @@ endef
 ################################################################################
 
 luarocks-package = $(call inner-luarocks-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
-# host-luarocks-package not supported
+host-luarocks-package = $(call inner-luarocks-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.20.1
