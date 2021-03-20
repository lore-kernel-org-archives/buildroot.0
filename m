From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:24:50 +0100
Subject: [Buildroot] [git commit] package/lualdap: bump to version 1.2.6
Message-ID: <20210320212201.61AAC81121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09edbd1ed1404dc6fb2e3c9cfdec631f785d7443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- switch to luarocks infrastructure
- support Lua 5.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lualdap/Config.in    |  7 +++----
 package/lualdap/lualdap.hash |  6 +++---
 package/lualdap/lualdap.mk   | 30 +++++-------------------------
 3 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/package/lualdap/Config.in b/package/lualdap/Config.in
index ef3e932027..5ef89728f2 100644
--- a/package/lualdap/Config.in
+++ b/package/lualdap/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUALDAP
 	bool "lualdap"
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_PACKAGE_LUA_5_4
 	depends on BR2_USE_WCHAR # openldap
 	depends on BR2_USE_MMU # openldap
 	select BR2_PACKAGE_OPENLDAP
@@ -9,8 +8,8 @@ config BR2_PACKAGE_LUALDAP
 	  LuaLDAP is a simple interface from Lua to an LDAP client,
 	  in fact it is a bind to OpenLDAP client.
 
-	  https://github.com/lualdap/lualdap
+	  https://lualdap.github.io/lualdap/
 
-comment "lualdap needs a toolchain w/ wchar, dynamic library, Lua <= 5.3"
+comment "lualdap needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index 77eced4341..488deb4e16 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
-# locally computed
-sha256  3e028faa6a5798cf2f3d50b9853b9b3fb6eb562b62010747bd5b6f50b57bb1cc  lualdap-1.2.5.tar.gz
-sha256  7afd8bed6c96a2ba1d1fa9f03ea04c140065462dbd37d7fb66cc7c3c6722aa89  LICENSE.md
+# computed by luarocks/buildroot
+sha256 0fcd82a77b20f7cee00050b63b4241d462564421bbd464f6fd0c1bebc62bff32  lualdap-1.2.6-1.src.rock
+sha256 b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
index 6ab3302697..acfcbdfc68 100644
--- a/package/lualdap/lualdap.mk
+++ b/package/lualdap/lualdap.mk
@@ -4,30 +4,10 @@
 #
 ################################################################################
 
-LUALDAP_VERSION = 1.2.5
-LUALDAP_SITE = $(call github,lualdap,lualdap,v$(LUALDAP_VERSION))
+LUALDAP_VERSION = 1.2.6-1
+LUALDAP_SUBDIR = lualdap
 LUALDAP_LICENSE = MIT
-LUALDAP_LICENSE_FILES = LICENSE.md
-LUALDAP_DEPENDENCIES = luainterpreter openldap
+LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
+LUALDAP_DEPENDENCIES = openldap
 
-define LUALDAP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		CC=$(TARGET_CC) \
-		LUA_LIB=-llua \
-		LUA_LIBDIR="$(STAGING_DIR)/usr/lib" \
-		LUA_INCDIR="$(STAGING_DIR)/usr/include" \
-		LDAP_LIBDIR="$(STAGING_DIR)/usr/lib" \
-		LDAP_INCDIR="$(STAGING_DIR)/usr/include" \
-		LBER_LIBDIR="$(STAGING_DIR)/usr/lib" \
-		LBER_INCDIR="$(STAGING_DIR)/usr/include" \
-		src/lualdap.so
-endef
-
-define LUALDAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" \
-		INST_LIBDIR="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/" \
-		install
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
