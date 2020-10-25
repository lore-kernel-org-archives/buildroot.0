From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 13:38:16 +0100
Subject: [Buildroot] [git commit] package/lua-gd: bump to version
 2ce8e478a8591afd71e607506bc8c64b161bbd30
Message-ID: <20201025122608.317DC840DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f51d1723b1721ec0b12f01e34fff1e990c760cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

drop gdlib-config

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-gd/lua-gd.hash |  2 +-
 package/lua-gd/lua-gd.mk   | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/lua-gd/lua-gd.hash b/package/lua-gd/lua-gd.hash
index d1bab37bc1..512573b474 100644
--- a/package/lua-gd/lua-gd.hash
+++ b/package/lua-gd/lua-gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  114f273a64da6ccbf6e0555757b952f84ab8c134416dd7aae1aeb666ca0e964d  lua-gd-e60b13b7977bb3424d7044976ccba5d42c256934.tar.gz
+sha256  928fa036b37595d773db1999c9ff43195c4290f0722298fa5b0c3e619c678525  lua-gd-2ce8e478a8591afd71e607506bc8c64b161bbd30.tar.gz
 sha256  b0ca41d88ddb0ca785436d37b08b8f413055755eb6bfd3ea0a6ff3214303aa43  COPYING
diff --git a/package/lua-gd/lua-gd.mk b/package/lua-gd/lua-gd.mk
index e9a51a1677..099df31f7f 100644
--- a/package/lua-gd/lua-gd.mk
+++ b/package/lua-gd/lua-gd.mk
@@ -4,17 +4,37 @@
 #
 ################################################################################
 
-LUA_GD_VERSION = e60b13b7977bb3424d7044976ccba5d42c256934
+LUA_GD_VERSION = 2ce8e478a8591afd71e607506bc8c64b161bbd30
 LUA_GD_SITE = $(call github,ittner,lua-gd,$(LUA_GD_VERSION))
 LUA_GD_LICENSE = MIT
 LUA_GD_LICENSE_FILES = COPYING
 LUA_GD_DEPENDENCIES = luainterpreter gd
 
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LUA_GD_FEATURES += -DGD_FONTCONFIG
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+LUA_GD_FEATURES += -DGD_FREETYPE
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LUA_GD_FEATURES += -DGD_JPEG
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LUA_GD_FEATURES += -DGD_PNG
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
+LUA_GD_FEATURES += -DGD_XPM
+endif
+
 # VERSION follows the scheme described on https://ittner.github.io/lua-gd/manual.html#intro,
 # the current version of the binding is 3.
 define LUA_GD_BUILD_CMDS
 	$(MAKE) -C $(@D) gd.so \
-		GDLIBCONFIG="$(STAGING_DIR)/usr/bin/gdlib-config" \
+		GDFEATURES="$(LUA_GD_FEATURES)" \
 		CC=$(TARGET_CC) \
 		CFLAGS="$(TARGET_CFLAGS) -fPIC -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
 		LFLAGS="-shared -lgd"
