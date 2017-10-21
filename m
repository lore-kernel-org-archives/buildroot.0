From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: enable sound support
Message-ID: <20171021151212.20E007FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cce9887f85d57d61327504567764d289fbc97a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minetest/Config.in   | 13 +++++++++++++
 package/minetest/minetest.mk |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index a76c319..4e8b1d0 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -37,6 +37,19 @@ config BR2_PACKAGE_MINETEST_SERVER
 	help
 	  Build Minetest server.
 
+config BR2_PACKAGE_MINETEST_SOUND
+	bool "enable sound"
+	depends on BR2_PACKAGE_MINETEST_CLIENT
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+
+comment "sound support needs a toolchain w/ threads NPTL"
+	depends on BR2_PACKAGE_MINETEST_CLIENT
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 endif
 
 comment "minetest needs a toolchain w/ C++, gcc >= 4.7, threads"
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 528f140..44a28ce 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -13,7 +13,6 @@ MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
-	-DENABLE_SOUND=OFF \
 	-DENABLE_GLES=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
@@ -38,6 +37,13 @@ else
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
