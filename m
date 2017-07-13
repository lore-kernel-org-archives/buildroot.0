From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 14:40:43 +0200
Subject: [Buildroot] [PATCH v3 01/10] package/minetest: new package
Message-ID: <20170713124052.13708-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: Simplify Config.in entry (ThomasP)
    fix Alphabetic ordering (ThomasP)
    Improve license informations (ThomasP)
    jpeg removed from mendatory dependencies (minetest client only)
    Drop Intl patch that was required before BR2_SYSTEM_ENABLE_NLS.
    Add license hash.
v2: add package dependencies comments
    add hash file (Bernd)
    bump to 0.4.16 (Bernd)
    version 0.4.15 Tested-by Bernd
    Add a new patch fixing linking with libintl when necessary
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/minetest/Config.in     | 53 ++++++++++++++++++++++++++++++++++++++++++
 package/minetest/minetest.hash |  4 ++++
 package/minetest/minetest.mk   | 44 +++++++++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+)
 create mode 100644 package/minetest/Config.in
 create mode 100644 package/minetest/minetest.hash
 create mode 100644 package/minetest/minetest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f392838..ace8058 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1437,6 +1437,7 @@ F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
+F:	package/minetest/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index b48ab5e..cb1cdb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -228,6 +228,7 @@ menu "Games"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
+	source "package/minetest/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
new file mode 100644
index 0000000..a76c319
--- /dev/null
+++ b/package/minetest/Config.in
@@ -0,0 +1,53 @@
+config BR2_PACKAGE_MINETEST
+	bool "minetest"
+	depends on BR2_INSTALL_LIBSTDCPP # irrlicht
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_XORG7 # irrlicht
+	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	select BR2_PACKAGE_IRRLICHT
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	# At least one option must be enabled
+	select BR2_PACKAGE_MINETEST_CLIENT if !BR2_PACKAGE_MINETEST_SERVER
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
+	bool "minetest client"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	help
+	  Build Minetest client.
+
+config BR2_PACKAGE_MINETEST_SERVER
+	bool "minetest server"
+	help
+	  Build Minetest server.
+
+endif
+
+comment "minetest needs a toolchain w/ C++, gcc >= 4.7, threads"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "minetest needs X11 and an OpenGL provider"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on (BR2_INSTALL_LIBSTDCPP \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		&& BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
new file mode 100644
index 0000000..5e6aeff
--- /dev/null
+++ b/package/minetest/minetest.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 0ef3793de9f569746ea78af7a66fe96ef65400019e5e64a04a5c3fa26a707655  minetest-0.4.16.tar.gz
+
+sha256 e48121374512b8f2fada00ac1c8e100a767e2a2edd2853557ccf1995e35a4be0  README.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
new file mode 100644
index 0000000..df9c00d
--- /dev/null
+++ b/package/minetest/minetest.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# minetest
+#
+################################################################################
+
+MINETEST_VERSION = 0.4.16
+MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
+MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
+MINETEST_LICENSE_FILES = README.txt
+
+MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
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
2.9.4
