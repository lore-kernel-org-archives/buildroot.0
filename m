From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 23:13:54 +0200
Subject: [Buildroot] [git commit] luacrypto: refactor with autotools
Message-ID: <20130917212245.8A0EB9B7BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=549c09b6270c1e940d23c3d7feed86a84b9f6048
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

some CMake stuff comes from LuaDist, but CMake is not the primary build infrastructure of LuaCrypto.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luacrypto/Config.in                    |    1 -
 package/luacrypto/luacrypto-01-autotools.patch |   30 ++++++++++++++++++++++++
 package/luacrypto/luacrypto.mk                 |    6 ++--
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
index f4587c3..8d13eec 100644
--- a/package/luacrypto/Config.in
+++ b/package/luacrypto/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LUASOCKET
 	help
 	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
 	  library.
diff --git a/package/luacrypto/luacrypto-01-autotools.patch b/package/luacrypto/luacrypto-01-autotools.patch
new file mode 100644
index 0000000..e8befb0
--- /dev/null
+++ b/package/luacrypto/luacrypto-01-autotools.patch
@@ -0,0 +1,30 @@
+autotools: fix install directories
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,7 @@
+ SUBDIRS = src \
+ 	  doc
+ 
+-pkgconfigdir = $(libdir)/pkgconfig
++pkgconfigdir = $(prefix)/lib/pkgconfig
+ pkgconfig_DATA = luacrypto.pc
+ 
+ test: all
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,7 +31,7 @@
+ PKG_CHECK_MODULES([LUA], [lua])
+ 
+ # lua libdir
+-LUALIBDIR="`$PKGCONFIG --variable=libdir lua`"
++LUALIBDIR="`$PKGCONFIG --variable=INSTALL_CMOD lua`"
+ 
+ # dest of headers
+ CRYPTOINC="${includedir}/${PACKAGE_NAME}"
diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index ca57c65..f6fcc78 100644
--- a/package/luacrypto/luacrypto.mk
+++ b/package/luacrypto/luacrypto.mk
@@ -8,7 +8,7 @@ LUACRYPTO_VERSION = 0.3.2
 LUACRYPTO_SITE = http://github.com/mkottman/luacrypto/tarball/$(LUACRYPTO_VERSION)
 LUACRYPTO_LICENSE = MIT
 LUACRYPTO_LICENSE_FILES = COPYING
-LUACRYPTO_DEPENDENCIES = lua openssl
-LUACRYPTO_CONF_OPT = "-DLUA_LIBRARIES=\"$(STAGING_DIR)/usr/lib/liblua.so\""
+LUACRYPTO_DEPENDENCIES = lua openssl host-pkgconf
+LUACRYPTO_AUTORECONF = YES
 
-$(eval $(cmake-package))
+$(eval $(autotools-package))
