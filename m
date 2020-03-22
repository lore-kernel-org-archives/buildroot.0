From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Mar 2020 09:07:04 +0100
Subject: [Buildroot] [pkg-luarocks v2 3/5] pkg-luarocks: add support of
 host-luarocks-package
In-Reply-To: <20200322080706.19806-1-francois.perrad@gadz.org>
References: <20200322080706.19806-1-francois.perrad@gadz.org>
Message-ID: <20200322080706.19806-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-luarocks.txt     |  4 +-
 package/luarocks/luarocks-br-host-config.lua |  3 +
 package/luarocks/luarocks.mk                 | 10 ++-
 package/pkg-luarocks.mk                      | 68 +++++++++++++++++---
 4 files changed, 70 insertions(+), 15 deletions(-)
 create mode 100644 package/luarocks/luarocks-br-host-config.lua

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index df97cdd50..70f48fc02 100644
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
index 000000000..631959545
--- /dev/null
+++ b/package/luarocks/luarocks-br-host-config.lua
@@ -0,0 +1,3 @@
+-- BR host compilation
+local function getenv (name) return os_getenv(name) or '' end
+external_deps_dirs = { getenv('HOST_DIR') }
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 17360048c..b95172047 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -12,7 +12,9 @@ LUAROCKS_LICENSE_FILES = COPYING
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
 LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
-LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CONFIG_FILE_DEFAULT = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config.lua
+HOST_LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/host-config.lua
 
 define LUAROCKS_ADDON_EXTRACT
 	mkdir $(@D)/src/luarocks/cmd/external
@@ -30,9 +32,13 @@ define HOST_LUAROCKS_CONFIGURE_CMDS
 endef
 
 define HOST_LUAROCKS_INSTALL_CMDS
-	rm -f $(LUAROCKS_CONFIG_FILE)
+	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 	$(MAKE1) -C $(@D) install
+	cp $(LUAROCKS_CONFIG_FILE_DEFAULT) $(LUAROCKS_CONFIG_FILE)
 	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)
+	cp $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_CONFIG_FILE)
+	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-host-config.lua >> $(HOST_LUAROCKS_CONFIG_FILE)
+	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 23906f4a8..603c0851b 100644
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
@@ -70,6 +106,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($(2)_SRCDIR) && \
+		LUAROCKS_CONFIG=$$(LUAROCKS_CONFIG_FILE) \
 		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
 			--tree "$$(TARGET_DIR)/usr" \
 			LUA_INCDIR="$$(STAGING_DIR)/usr/include" \
@@ -82,6 +119,17 @@ define $(2)_INSTALL_TARGET_CMDS
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
@@ -99,4 +147,4 @@ endef
 ################################################################################
 
 luarocks-package = $(call inner-luarocks-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
-# host-luarocks-package not supported
+host-luarocks-package = $(call inner-luarocks-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.20.1
