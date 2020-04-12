From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:48:18 +0200
Subject: [Buildroot] [git commit] package/pkg-luarocks.mk: add support of
 host-luarocks-package
Message-ID: <20200412123416.38A528E66B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=060eb0e7e4fe67f86f0027383c6f74ee46eb3aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-luarocks.txt     |  4 +-
 package/luarocks/luarocks-br-host-config.lua |  3 ++
 package/luarocks/luarocks.mk                 |  3 ++
 package/pkg-luarocks.mk                      | 67 +++++++++++++++++++++++-----
 4 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index df97cdd503..70f48fc02c 100644
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
diff --git a/package/luarocks/luarocks-br-host-config.lua b/package/luarocks/luarocks-br-host-config.lua
new file mode 100644
index 0000000000..631959545c
--- /dev/null
+++ b/package/luarocks/luarocks-br-host-config.lua
@@ -0,0 +1,3 @@
+-- BR host compilation
+local function getenv (name) return os_getenv(name) or '' end
+external_deps_dirs = { getenv('HOST_DIR') }
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cf111e4c91..2ea3c8d8d6 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -14,6 +14,7 @@ HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
 LUAROCKS_CONFIG_FILE_DEFAULT = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config.lua
+HOST_LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/host-config.lua
 
 define LUAROCKS_ADDON_EXTRACT
 	mkdir $(@D)/src/luarocks/cmd/external
@@ -35,6 +36,8 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	$(MAKE1) -C $(@D) install
 	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua \
 		> $(LUAROCKS_CONFIG_FILE)a
+	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-host-config.lua \
+		> $(HOST_LUAROCKS_CONFIG_FILE)
 	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 endef
 
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index a50a4fcf5a..603c0851b4 100644
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
@@ -39,16 +41,50 @@ endif
 
 define inner-luarocks-package
 
-$(2)_BUILD_OPTS		?=
-$(2)_NAME_UPSTREAM	?= $(1)
-$(2)_SUBDIR		?= $$($(2)_NAME_UPSTREAM)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).rockspec
-$(2)_SOURCE		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).src.rock
-$(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
+ifndef $(2)_NAME_UPSTREAM
+  ifdef $(3)_NAME_UPSTREAM
+    $(2)_NAME_UPSTREAM = $($(3)_NAME_UPSTREAM)
+  else
+    $(2)_NAME_UPSTREAM ?= $(1)
+  endif
+endif
+
+ifndef $(2)_SUBDIR
+  ifdef $(3)_SUBDIR
+    $(2)_SUBDIR = $($(3)_SUBDIR)
+  else
+    $(2)_SUBDIR ?= $$($(3)_NAME_UPSTREAM)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
+  endif
+endif
+
+ifndef $(2)_ROCKSPEC
+  ifdef $(3)_ROCKSPEC
+    $(2)_ROCKSPEC = $($(3)_ROCKSPEC)
+  else
+    $(2)_ROCKSPEC ?= $$(call LOWERCASE,$$($(3)_NAME_UPSTREAM))-$$($(3)_VERSION).rockspec
+  endif
+endif
+
+ifndef $(2)_SOURCE
+  ifdef $(3)_SOURCE
+    $(2)_SOURCE = $($(3)_SOURCE)
+  else
+    $(2)_SOURCE ?= $$(call LOWERCASE,$$($(3)_NAME_UPSTREAM))-$$($(3)_VERSION).src.rock
+  endif
+endif
+
+ifndef $(2)_SITE
+  ifdef $(3)_SITE
+    $(2)_SITE = $($(3)_SITE)
+  else
+    $(2)_SITE ?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
+  endif
+endif
 
-# Since we do not support host-luarocks-package, we know this is
-# a target package, and can just add the required dependencies
-$(2)_DEPENDENCIES	+= luainterpreter
+ifeq ($(4),target)
+$(2)_DEPENDENCIES += luainterpreter
+endif
+# host-luarocks implies host-luainterpreter
 $(2)_EXTRACT_DEPENDENCIES += host-luarocks
 
 #
@@ -83,6 +119,17 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	cd $$($(2)_SRCDIR) && \
+		LUAROCKS_CONFIG=$$(HOST_LUAROCKS_CONFIG_FILE) \
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
@@ -100,4 +147,4 @@ endef
 ################################################################################
 
 luarocks-package = $(call inner-luarocks-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
-# host-luarocks-package not supported
+host-luarocks-package = $(call inner-luarocks-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
