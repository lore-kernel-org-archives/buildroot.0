From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:42 +0100
Subject: [Buildroot] [PATCH 20/25] luarocks-package: lowercase the upstream
	name for LuaRocks
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-21-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LuaRocks has a policy that the rockspec and rock filenames are lower
case. However, the upstream name may contain uppercase characters.
We have several packages like that in Buildroot. To simplify the
package .mk files, apply the lowercase from within the infra.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-luarocks.txt | 5 +++--
 package/pkg-luarocks.mk                  | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index 4965a209ae..ec3d4e7ccd 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -82,7 +82,8 @@ Two of them are populated by the LuaRocks infrastructure (for the
 
 * +LUA_FOO_SITE+, which defaults to +$(BR2_LUAROCKS_MIRROR)+
 
-* +LUA_FOO_SOURCE+, which defaults to +$(LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION).src.rock+
+* +LUA_FOO_SOURCE+, which defaults to
+  +$(lowercase LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION).src.rock+
 
 A few additional variables, specific to the LuaRocks infrastructure, are
 also defined. They can be overridden in specific cases.
@@ -91,7 +92,7 @@ also defined. They can be overridden in specific cases.
   package name
 
 * +LUA_FOO_ROCKSPEC+, which defaults to
-  +$(LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION).rockspec+
+  +$(lowercase LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION).rockspec+
 
 * +LUA_FOO_SUBDIR+, which defaults to
   +$(LUA_FOO_NAME_UPSTREAM)-$(LUA_FOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 2689035cdc..d762867111 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -36,8 +36,8 @@ define inner-luarocks-package
 $(2)_BUILD_OPTS		?=
 $(2)_NAME_UPSTREAM	?= $(1)
 $(2)_SUBDIR		?= $$($(2)_NAME_UPSTREAM)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC		?= $$($(2)_NAME_UPSTREAM)-$$($(2)_VERSION).rockspec
-$(2)_SOURCE		?= $$($(2)_NAME_UPSTREAM)-$$($(2)_VERSION).src.rock
+$(2)_ROCKSPEC		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).rockspec
+$(2)_SOURCE		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).src.rock
 $(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
 # Since we do not support host-luarocks-package, we know this is
-- 
2.11.0
