From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Nov 2020 08:43:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/civetweb: drop
 BR2_PACKAGE_CIVETWEB_WITH_LUA
Message-ID: <20201104074311.491932-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop BR2_PACKAGE_CIVETWEB_WITH_LUA and enable Lua support depending on
BR2_PACKAGE_LUA and BR2_PACKAGE_LUAJIT

It should be noted that civetweb will still use its embedded version of
sqlite

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy             |  9 +++++++++
 package/civetweb/Config.in   | 12 ------------
 package/civetweb/civetweb.mk | 20 +++++++++++++++++---
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index edb110debf..fec9ece82b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_CIVETWEB_WITH_LUA
+	bool "civetweb's Lua support option removed"
+	select BR2_LEGACY
+	help
+	  Lua support does not depend on a version of Lua bundled
+	  within the Civetweb sources anymore. Lua support is
+	  automatically enabled if an Lua interpreter (lua or luajit)
+	  is enabled on buildroot.
+
 config BR2_PACKAGE_OPENCV
 	bool "opencv package was removed"
 	select BR2_LEGACY
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index 9e43969085..6bca5ed8fd 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -21,18 +21,6 @@ config BR2_PACKAGE_CIVETWEB_LIB
 	  Enable the civetweb library for embedding in another
 	  application.
 
-config BR2_PACKAGE_CIVETWEB_WITH_LUA
-	bool "enable Lua support"
-	# required by the bundled Sqlite3 and Lua code
-	depends on !BR2_STATIC_LIBS
-	help
-	  Enable Lua support in Civetweb. Note that this will use a
-	  version of Lua and Sqlite bundled within the Civetweb
-	  sources, and not the packages from Buildroot.
-
-comment "lua support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 endif
 
 comment "civetweb needs a toolchain w/ threads"
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index c0cbdb4a20..448f979b41 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -25,9 +25,23 @@ ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
 CIVETWEB_COPT += -DNO_ATOMICS=1
 endif
 
-ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
-CIVETWEB_CONF_OPTS += WITH_LUA=1
-CIVETWEB_LIBS += -ldl
+ifeq ($(BR2_PACKAGE_LUA),y)
+CIVETWEB_CONF_OPTS += WITH_LUA=1 WITH_LUA_SHARED=1
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs lua`
+CIVETWEB_DEPENDENCIES += host-pkgconf lua
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=501
+else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=503
+else ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=504
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+CIVETWEB_CONF_OPTS += WITH_LUA=1 WITH_LUAJIT_SHARED=1
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs luajit`
+CIVETWEB_DEPENDENCIES += host-pkgconf luajit
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.28.0
