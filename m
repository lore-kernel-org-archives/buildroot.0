From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:54:46 +0200
Subject: [Buildroot] [git commit] package/linknx: bump version to 0.0.1.33
Message-ID: <20170731191607.2BF4B82144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b56083099f113817edc6811e2cdd820df1c80450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch _SITE to github:
https://github.com/linknx/linknx/commit/80264a26318820e5864196aefe3af093071b90b8

Mysql support was fixed with
https://github.com/linknx/linknx/commit/83d1d88dc4cec422e13e0c2baa34a828a3f67270
there 0001-fix-static-build-with-mysql.patch can be removed.

Build-tested using this defconfig
http://autobuild.buildroot.net/results/2df/2dfcbd30079d13997de37e2d1c4643653e200be6
mentioned in
https://git.buildroot.net/buildroot/commit/package/linknx?id=f35f54585f9e63400bdbd9c9ba2b9fd67be538ea

After removing the mysql patch autoreconf is not needed anymore,
therefore we can remove the libcurl dependency which was only added to
fix autoreconf:
https://git.buildroot.net/buildroot/commit/package/linknx?id=e1c9a2349006e657e76dff35706a774376921fb7

LINKNX_CREATE_MISSING_FILES is also not needed anymore after commit
https://github.com/linknx/linknx/commit/ef04c6d12846800fa1554d2fe31813dd09c5f29b

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../linknx/0001-fix-static-build-with-mysql.patch  | 47 ----------------------
 ...1-src-suncalc.cpp-fix-build-with-gcc-6.x.patch} |  0
 package/linknx/Config.in                           |  1 -
 package/linknx/linknx.hash                         |  2 +-
 package/linknx/linknx.mk                           | 19 +++------
 5 files changed, 6 insertions(+), 63 deletions(-)

diff --git a/package/linknx/0001-fix-static-build-with-mysql.patch b/package/linknx/0001-fix-static-build-with-mysql.patch
deleted file mode 100644
index c26bef7..0000000
--- a/package/linknx/0001-fix-static-build-with-mysql.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fix static build with mysql
-
-When building static binaries, the order of libraries in the link command line
-is significant. Use $LIBS for mysql libraries, so that mysql appear after the
-object files that depends on it. This fixes build failures like the following.
-
-/home/buildroot/build/instance-1/output/host/usr/bin/arm-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static -static -I/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/mysql  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static   -DUNIV_LINUX -DUNIV_LINUX  -static -static -rdynamic -L/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lmysqlclient_r -lz -lpthread -lcrypt -lnsl -lm -lpthread -o linknx linknx.o logger.o ruleserver.o objectcontroller.o eibclient.o threads.o timermanager.o persistentstorage.o xmlserver.o smsgateway.o emailgateway.o knxconnection.o services.o suncalc.o luacondition.o ioport.o ../ticpp/libticpp.a -L/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lpthsem    -lm -largp
-persistentstorage.o: In function `MysqlPersistentStorage::~MysqlPersistentStorage()':
-persistentstorage.cpp:(.text+0x2c): undefined reference to `mysql_close'
-persistentstorage.o: In function `MysqlPersistentStorage::MysqlPersistentStorage(ticpp::Element*)':
-persistentstorage.cpp:(.text+0x518): undefined reference to `mysql_init'
-persistentstorage.cpp:(.text+0x570): undefined reference to `mysql_options'
-persistentstorage.cpp:(.text+0x5a8): undefined reference to `mysql_real_connect'
-persistentstorage.cpp:(.text+0x5c0): undefined reference to `mysql_options'
-persistentstorage.cpp:(.text+0x618): undefined reference to `mysql_error'
-persistentstorage.cpp:(.text+0x6c0): undefined reference to `mysql_options'
-persistentstorage.o: In function `MysqlPersistentStorage::write(std::string const&, std::string const&)':
-persistentstorage.cpp:(.text+0xb70): undefined reference to `mysql_real_query'
-persistentstorage.cpp:(.text+0xbcc): undefined reference to `mysql_error'
-persistentstorage.o: In function `MysqlPersistentStorage::read(std::string const&, std::string const&)':
-persistentstorage.cpp:(.text+0xd14): undefined reference to `mysql_real_query'
-persistentstorage.cpp:(.text+0xd38): undefined reference to `mysql_store_result'
-persistentstorage.cpp:(.text+0xd40): undefined reference to `mysql_num_rows'
-persistentstorage.cpp:(.text+0xd50): undefined reference to `mysql_fetch_row'
-persistentstorage.cpp:(.text+0xd68): undefined reference to `mysql_free_result'
-persistentstorage.cpp:(.text+0xdc8): undefined reference to `mysql_error'
-persistentstorage.o: In function `MysqlPersistentStorage::writelog(std::string const&, std::string const&)':
-persistentstorage.cpp:(.text+0xf74): undefined reference to `mysql_real_query'
-persistentstorage.cpp:(.text+0xfd0): undefined reference to `mysql_error'
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: sent to jef2000 at users.sourceforge.net
-
-diff -Nuar linknx-0.0.1.32-orig/acinclude.m4 linknx-0.0.1.32/acinclude.m4
---- linknx-0.0.1.32-orig/acinclude.m4	2011-01-09 16:47:32.000000000 +0200
-+++ linknx-0.0.1.32/acinclude.m4	2016-03-15 12:41:19.983861719 +0200
-@@ -36,7 +36,7 @@
-     CFLAGS="$CFLAGS $ADDFLAGS"    
-     CXXFLAGS="$CXXFLAGS $ADDFLAGS"    
- 
--    LDFLAGS="$LDFLAGS "`$MYSQL_CONFIG --libs_r`
-+    LIBS="$LIBS "`$MYSQL_CONFIG --libs_r`
-     
-     AC_MSG_RESULT($MYSQL_CONFIG)
- 	AC_DEFINE([HAVE_MYSQL], [1], [Build with MySQL support.])
diff --git a/package/linknx/0002-src-suncalc.cpp-fix-build-with-gcc-6.x.patch b/package/linknx/0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch
similarity index 100%
rename from package/linknx/0002-src-suncalc.cpp-fix-build-with-gcc-6.x.patch
rename to package/linknx/0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 6657107..97fdaff 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LINKNX
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libpthsem
 	select BR2_PACKAGE_LIBPTHSEM
-	select BR2_PACKAGE_LIBCURL # for autoreconf
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
index d1be6d2..40e2676 100644
--- a/package/linknx/linknx.hash
+++ b/package/linknx/linknx.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f161d3c8da3b8c6969e9c02d84d3cd26eb5e7fb4f3a3efbaaede8acdaaf11700  linknx-0.0.1.32.tar.gz
+sha256 635b8fbd3477fd7d85a95955b93f327cd5a389db80dc18cdae04de19a3a8a972  linknx-0.0.1.33.tar.gz
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index b9fa5fc..fcef475 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -4,31 +4,22 @@
 #
 ################################################################################
 
-LINKNX_VERSION = 0.0.1.32
-LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
+LINKNX_VERSION = 0.0.1.33
+LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_INSTALL_STAGING = YES
-# Patching acinclude.m4
-LINKNX_AUTORECONF = YES
 LINKNX_CONF_OPTS = \
 	--without-lua \
 	--without-log4cpp \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr \
-	--disable-smtp \
-	--with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
+	--disable-smtp
 
-LINKNX_DEPENDENCIES = libpthsem libcurl \
+LINKNX_DEPENDENCIES = libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
-# This is needed to make autoreconf happy
-define LINKNX_CREATE_MISSING_FILES
-	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/README
-endef
-LINKNX_POST_EXTRACT_HOOKS += LINKNX_CREATE_MISSING_FILES
-
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 LINKNX_DEPENDENCIES += mysql
 else
 LINKNX_CONF_OPTS += --without-mysql
