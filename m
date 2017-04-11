From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:33 +0200
Subject: [Buildroot] [PATCH 04/14] package/minetest: new package
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/minetest/Config.in   | 58 ++++++++++++++++++++++++++++++++++++++++++++
 package/minetest/minetest.mk | 44 +++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 package/minetest/Config.in
 create mode 100644 package/minetest/minetest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 64fe583..2c25281 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1343,6 +1343,7 @@ F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
+F:	package/minetest/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 58b196b..23d2c5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -225,6 +225,7 @@ menu "Games"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
+	source "package/minetest/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
new file mode 100644
index 0000000..ac6c954
--- /dev/null
+++ b/package/minetest/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_MINETEST
+	bool "minetest"
+	depends on BR2_INSTALL_LIBSTDCPP # irrlicht
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_XORG7 # irrlicht
+	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_IRRLICHT
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	help
+	  Minetest is a near-infinite-world block sandbox game and a
+	  game engine, inspired by InfiniMiner, Minecraft, and the
+	  like.
+
+	  http://www.minetest.net
+
+if BR2_PACKAGE_MINETEST
+
+config BR2_PACKAGE_MINETEST_CLIENT
+	bool
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+
+config BR2_PACKAGE_MINETEST_SERVER
+	bool
+
+choice
+	prompt "minetest build"
+
+config BR2_PACKAGE_MINETEST_CLIENT_ONLY
+	bool "client only"
+	select BR2_PACKAGE_MINETEST_CLIENT
+	help
+	  Build Minetest client only.
+
+config BR2_PACKAGE_MINETEST_SERVER_ONLY
+	bool "server only"
+	select BR2_PACKAGE_MINETEST_SERVER
+	help
+	  Build Minetest server only.
+
+config BR2_PACKAGE_MINETEST_CLIENT_SERVER
+	bool "client and server"
+	select BR2_PACKAGE_MINETEST_CLIENT
+	select BR2_PACKAGE_MINETEST_SERVER
+	help
+	  Build Minetest client and server.
+
+endchoice
+
+endif
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
new file mode 100644
index 0000000..f110f7c
--- /dev/null
+++ b/package/minetest/minetest.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# minetest
+#
+################################################################################
+
+MINETEST_VERSION = 0.4.15
+MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
+MINETEST_LICENSE = LGPL-2.1+, CC-BY-SA-3.0
+MINETEST_LICENSE_FILES = README.txt
+
+MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib
+
+MINETEST_CONF_OPTS = \
+	-DDEFAULT_RUN_IN_PLACE=OFF \
+	-DENABLE_CURL=OFF \
+	-DENABLE_GETTEXT=OFF \
+	-DENABLE_SOUND=OFF \
+	-DENABLE_GLES=OFF \
+	-DENABLE_FREETYPE=OFF \
+	-DENABLE_LUAJIT=ON \
+	-DENABLE_CURSES=OFF \
+	-DENABLE_POSTGRESQL=OFF \
+	-DENABLE_LEVELDB=OFF \
+	-DENABLE_REDIS=OFF \
+	-DENABLE_SPATIAL=OFF \
+	-DAPPLY_LOCALE_BLACKLIST=OFF \
+	-DENABLE_SYSTEM_GMP=ON \
+	-DENABLE_SYSTEM_JSONCPP=ON
+
+ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
+MINETEST_DEPENDENCIES += bzip2 jpeg libgl libpng xlib_libXxf86vm
+MINETEST_CONF_OPTS += -DBUILD_CLIENT=ON
+else
+MINETEST_CONF_OPTS += -DBUILD_CLIENT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MINETEST_SERVER),y)
+MINETEST_CONF_OPTS += -DBUILD_SERVER=ON
+else
+MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.9.3
