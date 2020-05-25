From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:42 -0600
Subject: [Buildroot] [PATCH v3 6/9] package/minetest: do not select luajit
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-6-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since luajit is not a requirement for minetest we should not select it
instead we should conditionally use it when available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/minetest/Config.in   |  4 ----
 package/minetest/minetest.mk | 10 ++++++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 085525534d..19da290df4 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -5,11 +5,9 @@ config BR2_PACKAGE_MINETEST
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlicht
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_IRRLICHT
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
 	# At least one option must be enabled
@@ -53,13 +51,11 @@ comment "sound support needs a toolchain w/ threads NPTL"
 endif
 
 comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on (BR2_INSTALL_LIBSTDCPP \
 		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
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
