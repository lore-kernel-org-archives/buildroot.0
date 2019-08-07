From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Aug 2019 07:40:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.10.0
Message-ID: <20190807054006.18254-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://freeswitch.org/confluence/display/FREESWITCH/FreeSWITCH+1.10.x+Release+notes

Rebased 0001-Fix-cross-compiling-libvpx.patch.

Add mod_pgsql replacing PostgreSQL support in the core:
https://freeswitch.org/jira/browse/FS-11880

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../freeswitch/0001-Fix-cross-compiling-libvpx.patch |  6 +++---
 package/freeswitch/freeswitch.hash                   | 12 ++++++------
 package/freeswitch/freeswitch.mk                     | 10 +++-------
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
index 1d4b97a7a0..db4607e28b 100644
--- a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
+++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
@@ -18,12 +18,12 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
 --- freeswitch-1.6.7.org/Makefile.in	2016-04-01 18:09:54.000000000 +0200
 +++ freeswitch-1.6.7/Makefile.in	2016-04-22 20:11:37.938961730 +0200
-@@ -4025,7 +4025,7 @@
+@@ -4182,7 +4182,7 @@
  	cd libs/libzrtp && $(MAKE)
  
- libs/libvpx/Makefile:
+ libs/libvpx/Makefile: libs/libvpx/.update
 -	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
 +	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
  
- libs/libvpx/libvpx.a: libs/libvpx/Makefile
+ libs/libvpx/libvpx.a: libs/libvpx/Makefile libs/libvpx/.update
  	@cd libs/libvpx && $(MAKE)
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index e8fb81dd47..4014aa3c56 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,9 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.7.tar.xz.md5
-md5 40a065c9b597256b1636fa4b7470a73a freeswitch-1.8.7.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.7.tar.xz.sha1
-sha1 5ada2dbc365f368639f22375b41afe6f06bc2ffb freeswitch-1.8.7.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.7.tar.xz.sha256
-sha256 7d3cee32713db5f65e3d4703c6420038872d8f6efab8be4d58fbf66ffa993008 freeswitch-1.8.7.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.0.tar.xz.md5
+md5 f874e0168bb3f2aa59be18818cc6d825 freeswitch-1.10.0.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.0.tar.xz.sha1
+sha1 8c4f9582e50d84b03ef61e769014ac610aadd247 freeswitch-1.10.0.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.0.tar.xz.sha256
+sha256 932992c6fed2ede1173cc6f25fe45017291afa1a8e1d97a9c5b65b44b6e67452 freeswitch-1.10.0.-release.tar.xz
 # Locally computed
 sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256 c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index d266d11863..030fd566e1 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.8.7
-FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
+FREESWITCH_VERSION = 1.10.0
+FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
 FREESWITCH_INSTALL_STAGING = YES
@@ -285,12 +285,8 @@ endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 FREESWITCH_CONF_ENV += \
 	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
-FREESWITCH_CONF_OPTS += \
-	--enable-core-pgsql-pkgconfig \
-	--enable-core-pgsql-support
 FREESWITCH_DEPENDENCIES += postgresql
-else
-FREESWITCH_CONF_OPTS += --disable-core-pgsql-support
+FREESWITCH_ENABLED_MODULES += databases/mod_pgsql
 endif
 
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
-- 
2.20.1
