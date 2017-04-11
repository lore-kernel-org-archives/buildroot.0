From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:38 +0200
Subject: [Buildroot] [PATCH 09/14] package/minetest: enable sound support
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-9-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/minetest/Config.in   | 8 ++++++++
 package/minetest/minetest.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index ac6c954..b151905 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -55,4 +55,12 @@ config BR2_PACKAGE_MINETEST_CLIENT_SERVER
 
 endchoice
 
+config BR2_PACKAGE_MINETEST_SOUND
+	bool "enable sound"
+	depends on BR2_PACKAGE_MINETEST_CLIENT
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+
 endif
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index fe6e015..29f804e 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -13,7 +13,6 @@ MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
-	-DENABLE_SOUND=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
 	-DENABLE_POSTGRESQL=OFF \
@@ -37,6 +36,13 @@ else
 MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MINETEST_SOUND),y)
+MINETEST_DEPENDENCIES += libvorbis openal
+MINETEST_CONF_OPTS += -DENABLE_SOUND=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_SOUND=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 MINETEST_DEPENDENCIES += freetype
 MINETEST_CONF_OPTS += -DENABLE_FREETYPE=ON
-- 
2.9.3
