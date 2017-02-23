From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:40 +0100
Subject: [Buildroot] [PATCH 18/25] luarocks-package: introduce
	PKG_NAME_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-19-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we now require Lua package names to start with "lua", it is likely
that the Buildroot name is different from the upstream LuaRocks name.
Add a feature to the luarocks-package infra that makes it easier to
handle this situation: the package can explicitly specify the upstream
name in PKG_NAME_UPSTREAM, and that name will be used in PKG_ROCKSPEC,
PKG_SOURCE and PKG_SUBDIR.

Add an explanation of this feature to the manual. To make the example
relevant, it is changed to lua-foo, where the upstream name is plain
foo. To avoid confusion with the dependency on a native library, that
dependency is renamed to bar.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
The change in the manual should perhaps have been a separate commit, but
this series is already long enough as it is :-)
---
 docs/manual/adding-packages-luarocks.txt | 54 +++++++++++++++++++-------------
 package/pkg-luarocks.mk                  |  7 +++--
 2 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index 712c29e9a4..4965a209ae 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -13,34 +13,40 @@ with an example :
 ------------------------
 01: ################################################################################
 02: #
-03: # luafoo
+03: # lua-foo
 04: #
 05: ################################################################################
 06:
-07: LUAFOO_VERSION = 1.0.2-1
-08: LUAFOO_DEPENDENCIES = foo
-09:
-10: LUAFOO_BUILD_OPTS += FOO_INCDIR=$(STAGING_DIR)/usr/include
-11: LUAFOO_BUILD_OPTS += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
-12: LUAFOO_LICENSE = luaFoo license
-13: LUAFOO_LICENSE_FILES = $(LUAFOO_SUBDIR)/COPYING
-14:
-15: $(eval $(luarocks-package))
+07: LUA_FOO_VERSION = 1.0.2-1
+08: LUA_FOO_NAME_UPSTREAM = foo
+09: LUA_FOO_DEPENDENCIES = bar
+10:
+11: LUA_FOO_BUILD_OPTS += BAR_INCDIR=$(STAGING_DIR)/usr/include
+12: LUA_FOO_BUILD_OPTS += BAR_LIBDIR=$(STAGING_DIR)/usr/lib
+13: LUA_FOO_LICENSE = luaFoo license
+14: LUA_FOO_LICENSE_FILES = $(LUA_FOO_SUBDIR)/COPYING
+15:
+16: $(eval $(luarocks-package))
 ------------------------
 
 On line 7, we declare the version of the package (the same as in the rockspec,
 which is the concatenation of the upstream version and the rockspec revision,
 separated by a hyphen '-').
 
-On line 8, we declare our dependencies against native libraries, so that they
+On line 8, we declare that the package is called "foo" on LuaRocks. In
+Buildroot, we give Lua-related packages a name that starts with "lua", so the
+Buildroot name is different from the upstream name. +LUA_FOO_NAME_UPSTREAM+
+makes the link between the two names.
+
+On line 9, we declare our dependencies against native libraries, so that they
 are built before the build process of our package starts.
 
-On lines 10-11, we tell Buildroot to pass custom options to LuaRocks when it is
+On lines 11-12, we tell Buildroot to pass custom options to LuaRocks when it is
 building the package.
 
-On lines 12-13, we specify the licensing terms for the package.
+On lines 13-14, we specify the licensing terms for the package.
 
-Finally, on line 15, we invoke the +luarocks-package+
+Finally, on line 16, we invoke the +luarocks-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
@@ -67,24 +73,28 @@ macro.
 
 First, all the package metadata information variables that exist in
 the generic infrastructure also exist in the LuaRocks infrastructure:
-+LUAFOO_VERSION+, +LUAFOO_SOURCE+, +LUAFOO_SITE+,
-+LUAFOO_DEPENDENCIES+, +LUAFOO_LICENSE+, +LUAFOO_LICENSE_FILES+.
++LUA_FOO_VERSION+, +LUA_FOO_SOURCE+, +LUA_FOO_SITE+,
++LUA_FOO_DEPENDENCIES+, +LUA_FOO_LICENSE+, +LUA_FOO_LICENSE_FILES+.
 
 Two of them are populated by the LuaRocks infrastructure (for the
 +download+ step). If your package is not hosted on the LuaRocks mirror
 +$(BR2_LUAROCKS_MIRROR)+, you can override them:
 
-* +LUAFOO_SITE+, which defaults to +$(BR2_LUAROCKS_MIRROR)+
+* +LUA_FOO_SITE+, which defaults to +$(BR2_LUAROCKS_MIRROR)+
 
-* +LUAFOO_SOURCE+, which defaults to +luafoo-$(LUAFOO_VERSION).src.rock+
+* +LUA_FOO_SOURCE+, which defaults to +$(LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION).src.rock+
 
 A few additional variables, specific to the LuaRocks infrastructure, are
 also defined. They can be overridden in specific cases.
 
-* +LUAFOO_ROCKSPEC+, which defaults to +luafoo-$(LUAFOO_VERSION).rockspec+
+* +LUA_FOO_NAME_UPSTREAM+, which defaults to +lua-foo+, i.e. the Buildroot
+  package name
+
+* +LUA_FOO_ROCKSPEC+, which defaults to
+  +$(LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION).rockspec+
 
-* +LUAFOO_SUBDIR+, which defaults to
-  +luafoo-$(LUAFOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+
+* +LUA_FOO_SUBDIR+, which defaults to
+  +$(LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+
 
-* +LUAFOO_BUILD_OPTS+ contains additional build options for the
+* +LUA_FOO_BUILD_OPTS+ contains additional build options for the
   +luarocks build+ call.
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 08ea9b801a..2689035cdc 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -34,9 +34,10 @@
 define inner-luarocks-package
 
 $(2)_BUILD_OPTS		?=
-$(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC		?= $(1)-$$($(2)_VERSION).rockspec
-$(2)_SOURCE		?= $(1)-$$($(2)_VERSION).src.rock
+$(2)_NAME_UPSTREAM	?= $(1)
+$(2)_SUBDIR		?= $$($(2)_NAME_UPSTREAM)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
+$(2)_ROCKSPEC		?= $$($(2)_NAME_UPSTREAM)-$$($(2)_VERSION).rockspec
+$(2)_SOURCE		?= $$($(2)_NAME_UPSTREAM)-$$($(2)_VERSION).src.rock
 $(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
 # Since we do not support host-luarocks-package, we know this is
-- 
2.11.0
