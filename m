From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 20:57:14 +0100
Subject: [Buildroot] [git commit] linknx: fix static build with mysql client
Message-ID: <20160315200033.D42367FA1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f35f54585f9e63400bdbd9c9ba2b9fd67be538ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch correcting the libraries order in the link command to fix static
mysql libraries link.

Fixes:
http://autobuild.buildroot.net/results/2df/2dfcbd30079d13997de37e2d1c4643653e200be6/
http://autobuild.buildroot.net/results/4cc/4cc9c8bd223d1c9d604322ba04060dd35fc8aa45/
http://autobuild.buildroot.net/results/4bd/4bd04b7a3ca0092b50ad5c5212830d8935f54d48/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../linknx/0001-fix-static-build-with-mysql.patch  | 47 ++++++++++++++++++++++
 package/linknx/linknx.mk                           |  8 ++++
 2 files changed, 55 insertions(+)

diff --git a/package/linknx/0001-fix-static-build-with-mysql.patch b/package/linknx/0001-fix-static-build-with-mysql.patch
new file mode 100644
index 0000000..c26bef7
--- /dev/null
+++ b/package/linknx/0001-fix-static-build-with-mysql.patch
@@ -0,0 +1,47 @@
+Fix static build with mysql
+
+When building static binaries, the order of libraries in the link command line
+is significant. Use $LIBS for mysql libraries, so that mysql appear after the
+object files that depends on it. This fixes build failures like the following.
+
+/home/buildroot/build/instance-1/output/host/usr/bin/arm-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static -static -I/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/mysql  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static   -DUNIV_LINUX -DUNIV_LINUX  -static -static -rdynamic -L/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lmysqlclient_r -lz -lpthread -lcrypt -lnsl -lm -lpthread -o linknx linknx.o logger.o ruleserver.o objectcontroller.o eibclient.o threads.o timermanager.o persistentstorage.o xmlserver.o smsgateway.o emailgateway.o knxconnection.o services.o suncalc.o luacondition.o ioport.o ../ticpp/libticpp.a -L/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lpthsem    -lm -largp
+persistentstorage.o: In function `MysqlPersistentStorage::~MysqlPersistentStorage()':
+persistentstorage.cpp:(.text+0x2c): undefined reference to `mysql_close'
+persistentstorage.o: In function `MysqlPersistentStorage::MysqlPersistentStorage(ticpp::Element*)':
+persistentstorage.cpp:(.text+0x518): undefined reference to `mysql_init'
+persistentstorage.cpp:(.text+0x570): undefined reference to `mysql_options'
+persistentstorage.cpp:(.text+0x5a8): undefined reference to `mysql_real_connect'
+persistentstorage.cpp:(.text+0x5c0): undefined reference to `mysql_options'
+persistentstorage.cpp:(.text+0x618): undefined reference to `mysql_error'
+persistentstorage.cpp:(.text+0x6c0): undefined reference to `mysql_options'
+persistentstorage.o: In function `MysqlPersistentStorage::write(std::string const&, std::string const&)':
+persistentstorage.cpp:(.text+0xb70): undefined reference to `mysql_real_query'
+persistentstorage.cpp:(.text+0xbcc): undefined reference to `mysql_error'
+persistentstorage.o: In function `MysqlPersistentStorage::read(std::string const&, std::string const&)':
+persistentstorage.cpp:(.text+0xd14): undefined reference to `mysql_real_query'
+persistentstorage.cpp:(.text+0xd38): undefined reference to `mysql_store_result'
+persistentstorage.cpp:(.text+0xd40): undefined reference to `mysql_num_rows'
+persistentstorage.cpp:(.text+0xd50): undefined reference to `mysql_fetch_row'
+persistentstorage.cpp:(.text+0xd68): undefined reference to `mysql_free_result'
+persistentstorage.cpp:(.text+0xdc8): undefined reference to `mysql_error'
+persistentstorage.o: In function `MysqlPersistentStorage::writelog(std::string const&, std::string const&)':
+persistentstorage.cpp:(.text+0xf74): undefined reference to `mysql_real_query'
+persistentstorage.cpp:(.text+0xfd0): undefined reference to `mysql_error'
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: sent to jef2000 at users.sourceforge.net
+
+diff -Nuar linknx-0.0.1.32-orig/acinclude.m4 linknx-0.0.1.32/acinclude.m4
+--- linknx-0.0.1.32-orig/acinclude.m4	2011-01-09 16:47:32.000000000 +0200
++++ linknx-0.0.1.32/acinclude.m4	2016-03-15 12:41:19.983861719 +0200
+@@ -36,7 +36,7 @@
+     CFLAGS="$CFLAGS $ADDFLAGS"    
+     CXXFLAGS="$CXXFLAGS $ADDFLAGS"    
+ 
+-    LDFLAGS="$LDFLAGS "`$MYSQL_CONFIG --libs_r`
++    LIBS="$LIBS "`$MYSQL_CONFIG --libs_r`
+     
+     AC_MSG_RESULT($MYSQL_CONFIG)
+ 	AC_DEFINE([HAVE_MYSQL], [1], [Build with MySQL support.])
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 7ecd947..9d1f75e 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -8,6 +8,8 @@ LINKNX_VERSION = 0.0.1.32
 LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
 LINKNX_LICENSE = GPLv2+
 LINKNX_INSTALL_STAGING = YES
+# Patching acinclude.m4
+LINKNX_AUTORECONF = YES
 LINKNX_CONF_OPTS = \
 	--without-lua \
 	--without-log4cpp \
@@ -17,6 +19,12 @@ LINKNX_CONF_OPTS = \
 
 LINKNX_DEPENDENCIES = libpthsem $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
+# This is needed to make autoreconf happy
+define LINKNX_CREATE_MISSING_FILES
+	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/README
+endef
+LINKNX_POST_EXTRACT_HOOKS += LINKNX_CREATE_MISSING_FILES
+
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
 LINKNX_DEPENDENCIES += mysql
