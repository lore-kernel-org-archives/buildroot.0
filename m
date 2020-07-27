From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jul 2020 14:56:21 -0600
Subject: [Buildroot] [PATCH 1/1] package/minetest: don't depend on luajit
Message-ID: <20200727205621.2556101-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since minetest has a fallback to a bundled lua when luajit is not
available we don't need to depend on luajit or any lua version at all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/minetest/Config.in   |  2 --
 package/minetest/minetest.mk | 10 ++++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index b8ee175d52..19da290df4 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_MINETEST
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlicht
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
-	depends on BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_IRRLICHT
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_JSONCPP
@@ -52,7 +51,6 @@ comment "sound support needs a toolchain w/ threads NPTL"
 endif
 
 comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index e8fe5b45ce..c0301273be 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -9,12 +9,11 @@ MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = LICENSE.txt
 
-MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
+MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
 	-DENABLE_GLES=OFF \
-	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
@@ -75,6 +74,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_SPATIAL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+MINETEST_DEPENDENCIES += luajit
+MINETEST_CONF_OPTS += -DENABLE_LUAJIT=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_LUAJIT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 MINETEST_DEPENDENCIES += postgresql
 MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=ON
-- 
2.25.1
