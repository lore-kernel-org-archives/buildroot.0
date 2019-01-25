From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 25 Jan 2019 17:04:17 +0100
Subject: [Buildroot] [PATCH 07/10] package/thrift: bump to 0.12.0,
 add support for openssl 1.1.x
In-Reply-To: <20190125160420.10932-1-patrick.havelange@essensium.com>
References: <20190125160420.10932-1-patrick.havelange@essensium.com>
Message-ID: <20190125160420.10932-7-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switching to CMake as the autotools are not crosscompiler compatible.
Removed the patches related to autotools as no longer used.
Added patch to avoid linker issue.
Added license hash.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes v6:
  - Commit msg
  - Use SHA256 instead of md5
---
 ...ipedTransport-peek-to-avoid-linker-e.patch | 31 +++++++
 package/thrift/0001-libevent-cross.patch      | 16 ----
 package/thrift/0002-autoreconf.patch          | 28 -------
 package/thrift/0003-zlib-cross.patch          | 16 ----
 ...k-minimum-required-version-of-automa.patch | 47 -----------
 .../0005-configure.ac-C-11-is-optional.patch  | 28 -------
 package/thrift/thrift.hash                    |  6 +-
 package/thrift/thrift.mk                      | 84 +++++++++----------
 8 files changed, 73 insertions(+), 183 deletions(-)
 create mode 100644 package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
 delete mode 100644 package/thrift/0001-libevent-cross.patch
 delete mode 100644 package/thrift/0002-autoreconf.patch
 delete mode 100644 package/thrift/0003-zlib-cross.patch
 delete mode 100644 package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
 delete mode 100644 package/thrift/0005-configure.ac-C-11-is-optional.patch

diff --git a/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch b/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
new file mode 100644
index 0000000000..92c55d05a4
--- /dev/null
+++ b/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
@@ -0,0 +1,31 @@
+From f87ae3963e651fe9f4b3125192c77aae86c007e0 Mon Sep 17 00:00:00 2001
+From: Patrick Havelange <patrick.havelange@essensium.com>
+Date: Mon, 21 Jan 2019 09:49:23 +0100
+Subject: [PATCH] Force to keep TPipedTransport::peek() to avoid linker error.
+
+Otherwise got the "defined in discarded section" linker error
+with x86-64-musl toolchain. This is probably a toolchain issue - the
+compiler shouldn't remove that function.
+
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+Upstream-status: Not Applicable
+---
+ lib/cpp/src/thrift/transport/TTransportUtils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/cpp/src/thrift/transport/TTransportUtils.h b/lib/cpp/src/thrift/transport/TTransportUtils.h
+index f3b4c5a..7589182 100644
+--- a/lib/cpp/src/thrift/transport/TTransportUtils.h
++++ b/lib/cpp/src/thrift/transport/TTransportUtils.h
+@@ -114,7 +114,7 @@ public:
+ 
+   bool isOpen() { return srcTrans_->isOpen(); }
+ 
+-  bool peek() {
++  bool __attribute__ ((used)) peek() {
+     if (rPos_ >= rLen_) {
+       // Double the size of the underlying buffer if it is full
+       if (rLen_ == rBufSize_) {
+-- 
+2.17.1
+
diff --git a/package/thrift/0001-libevent-cross.patch b/package/thrift/0001-libevent-cross.patch
deleted file mode 100644
index f07caa762a..0000000000
--- a/package/thrift/0001-libevent-cross.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Make it cross-compile happy the hard way, there's no clean way.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura thrift-0.9.1.orig/aclocal/ax_lib_event.m4 thrift-0.9.1/aclocal/ax_lib_event.m4
---- thrift-0.9.1.orig/aclocal/ax_lib_event.m4	2013-08-15 11:04:29.000000000 -0300
-+++ thrift-0.9.1/aclocal/ax_lib_event.m4	2013-10-07 20:40:44.076435613 -0300
-@@ -75,7 +75,7 @@
-           AC_LANG_PUSH([C])
-           dnl This can be changed to AC_LINK_IFELSE if you are cross-compiling,
-           dnl but then the version cannot be checked.
--          AC_RUN_IFELSE([AC_LANG_PROGRAM([[
-+          AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-           #include <sys/types.h>
-           #include <event.h>
-           ]], [[
diff --git a/package/thrift/0002-autoreconf.patch b/package/thrift/0002-autoreconf.patch
deleted file mode 100644
index 1a52f7c70d..0000000000
--- a/package/thrift/0002-autoreconf.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fillers to make autoreconf (automake) happy.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura thrift-0.9.2.orig/AUTHORS thrift-0.9.2/AUTHORS
---- thrift-0.9.2.orig/AUTHORS	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.2/AUTHORS	2014-12-05 14:46:20.431211224 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura thrift-0.9.2.orig/ChangeLog thrift-0.9.2/ChangeLog
---- thrift-0.9.2.orig/ChangeLog	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.2/ChangeLog	2014-12-05 14:46:34.290686170 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura thrift-0.9.2.orig/NEWS thrift-0.9.2/NEWS
---- thrift-0.9.2.orig/NEWS	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.2/NEWS	2014-12-05 14:46:32.308618241 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura thrift-0.9.2.orig/README thrift-0.9.2/README
---- thrift-0.9.2.orig/README	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.2/README	2014-12-05 14:46:28.305481028 -0300
-@@ -0,0 +1,2 @@
-+
-+
diff --git a/package/thrift/0003-zlib-cross.patch b/package/thrift/0003-zlib-cross.patch
deleted file mode 100644
index 3af39c4691..0000000000
--- a/package/thrift/0003-zlib-cross.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Make zlib version detection cross-compile happy.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura thrift-0.9.1.orig/aclocal/ax_lib_zlib.m4 thrift-0.9.1/aclocal/ax_lib_zlib.m4
---- thrift-0.9.1.orig/aclocal/ax_lib_zlib.m4	2013-08-15 11:04:29.000000000 -0300
-+++ thrift-0.9.1/aclocal/ax_lib_zlib.m4	2013-10-07 20:47:44.523177973 -0300
-@@ -73,7 +73,7 @@
-           #   (defined in the library).
-           AC_LANG_PUSH([C])
-           dnl This can be changed to AC_LINK_IFELSE if you are cross-compiling.
--          AC_RUN_IFELSE([AC_LANG_PROGRAM([[
-+          AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-           #include <zlib.h>
-           #if ZLIB_VERNUM >= 0x$WANT_ZLIB_VERSION
-           #else
diff --git a/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
deleted file mode 100644
index ec2e22566c..0000000000
--- a/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9b03d2b02d32302008d2bd0218b31b9a0ca5a748 Mon Sep 17 00:00:00 2001
-From: Jens Geyer <jensg@apache.org>
-Date: Fri, 3 Apr 2015 12:37:03 +0200
-Subject: [PATCH] THRIFT-3071 check minimum required version of automake in bootstrap.sh
-Client: Build process
-Patch: James E. King, III <jim.king@simplivity.com>
-
-This closes #421
-
-- remove a warning when using libtool
-
-"libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([./aclocal])' to configure.ac,"
-
-[Romain:
-  - This is upstream commit 4aa95df383bfa13c46a4dc0b41672ec29d476300
-  - remove the part for bootstrap.sh which is not
-    bundled in thrift archive.
-  - fix the commit log accordingly]
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 5fa611e..8daeb03 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,6 +18,7 @@
- #
- 
- AC_PREREQ(2.65)
-+AC_CONFIG_MACRO_DIR([./aclocal])
- 
- AC_INIT([thrift], [0.9.2])
- 
-@@ -540,6 +541,7 @@ AC_CHECK_FUNCS([memset])
- AC_CHECK_FUNCS([mkdir])
- AC_CHECK_FUNCS([realpath])
- AC_CHECK_FUNCS([select])
-+AC_CHECK_FUNCS([setlocale])
- AC_CHECK_FUNCS([socket])
- AC_CHECK_FUNCS([strchr])
- AC_CHECK_FUNCS([strdup])
--- 
-1.9.3
-
diff --git a/package/thrift/0005-configure.ac-C-11-is-optional.patch b/package/thrift/0005-configure.ac-C-11-is-optional.patch
deleted file mode 100644
index 9ed7e0a691..0000000000
--- a/package/thrift/0005-configure.ac-C-11-is-optional.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9c3a7e79b256730dd85a7acadbaf57ab018b3127 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 7 Apr 2015 07:37:26 +0200
-Subject: [PATCH] configure.ac: C++11 is optional
-
-Thrift build fine whitout c++11 support.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8daeb03..bfd49ae 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -99,7 +99,7 @@ AC_PROG_AWK
- AC_PROG_RANLIB
- 
- AC_LANG([C++])
--AX_CXX_COMPILE_STDCXX_11([noext])
-+AX_CXX_COMPILE_STDCXX_11([noext], [optional])
- 
- AC_ARG_ENABLE([libs],
-   AS_HELP_STRING([--enable-libs], [build the Apache Thrift libraries [default=yes]]),
--- 
-1.9.3
-
diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 811aa988e3..7aca8b5a7e 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,2 +1,4 @@
-# From https://www.apache.org/dist/thrift/0.9.2/thrift-0.9.2.tar.gz.md5
-md5	89f63cc4d0100912f4a1f8a9dee63678	thrift-0.9.2.tar.gz
+# From https://www.apache.org/dist/thrift/0.12.0/thrift-0.12.0.tar.gz.sha256
+sha256  c336099532b765a6815173f62df0ed897528a9d551837d627c1f87fadad90428	thrift-0.12.0.tar.gz
+# License files, locally calculated
+sha256  23df881cec3192d1f4474633c14eb2ec30a45b84f8daeb82b9de5d2bd3ac8218        LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 741d33f571..8a284229a1 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,75 +4,67 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.9.2
+THRIFT_VERSION = 0.12.0
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
-THRIFT_DEPENDENCIES = host-autoconf-archive host-pkgconf host-thrift boost \
+THRIFT_LICENSE = Apache-2.0
+THRIFT_LICENSE_FILES = LICENSE
+
+THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost \
 	libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
-HOST_THRIFT_DEPENDENCIES = host-autoconf-archive host-bison host-boost \
+HOST_THRIFT_DEPENDENCIES = host-bison host-boost \
 	host-flex host-libevent host-openssl host-pkgconf host-zlib
 
-THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
-	--with-boost \
-	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
-	--disable-tests \
-	--disable-tutorial
-HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
-	--disable-tests \
-	--disable-tutorial
-THRIFT_AUTORECONF = YES
-THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive
-THRIFT_LICENSE = Apache-2.0
-THRIFT_LICENSE_FILES = LICENSE
+THRIFT_COMMON_CONF_OPTS = -DBUILD_TUTORIALS=OFF \
+	-DBUILD_TESTING=OFF \
+	-DWITH_PYTHON=OFF \
+	-DWITH_JAVA=OFF \
+	-DWITH_QT5=OFF
+
+THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=OFF
+HOST_THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=ON
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 THRIFT_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mxgot"
 endif
 
+# thrift doesn't use the regular flags BUILD_{STATIC,SHARED}_LIBS
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 THRIFT_CONF_ENV += LIBS=-lz
+THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=ON -DWITH_BOOST_STATIC=ON -DWITH_SHARED_LIB=OFF
+else ifeq ($(BR2_SHARED_LIBS),y)
+THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=OFF -DWITH_BOOST_STATIC=OFF -DWITH_SHARED_LIB=ON
+else
+# BR2_SHARED_STATIC_LIBS
+THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=ON -DWITH_BOOST_STATIC=OFF -DWITH_SHARED_LIB=ON
 endif
 
-# Language selection
-# The generator (host tool) works with all of them regardless
-# This is just for the libraries / bindings
-THRIFT_LANG_CONF_OPTS += --without-csharp --without-java --without-erlang \
-	--without-python --without-perl --without-php --without-php_extension \
-	--without-ruby --without-haskell --without-go --without-d \
-	--without-qt4 --without-lua
-HOST_THRIFT_CONF_OPTS += $(THRIFT_LANG_CONF_OPTS) --without-c_glib
-THRIFT_CONF_OPTS += $(THRIFT_LANG_CONF_OPTS)
+# Language selection for the compiler
+HOST_THRIFT_CONF_OPTS += -DTHRIFT_COMPILER_CSHARP=OFF \
+	-DTHRIFT_COMPILER_JAVA=OFF \
+	-DTHRIFT_COMPILER_ERL=OFF \
+	-DTHRIFT_COMPILER_PY=OFF \
+	-DTHRIFT_COMPILER_PERL=OFF \
+	-DTHRIFT_COMPILER_PHP=OFF \
+	-DTHRIFT_COMPILER_RB=OFF \
+	-DTHRIFT_COMPILER_HS=OFF \
+	-DTHRIFT_COMPILER_GO=OFF \
+	-DTHRIFT_COMPILER_D=OFF \
+	-DTHRIFT_COMPILER_LUA=OFF \
+	-DBUILD_C_GLIB=OFF
 
 # C bindings
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 THRIFT_DEPENDENCIES += libglib2
+THRIFT_CONF_OPTS += -DBUILD_C_GLIB=ON
 else
-THRIFT_CONF_OPTS += --without-c_glib
+THRIFT_CONF_OPTS += -DBUILD_C_GLIB=OFF
 endif
 
-# De-hardcode THRIFT for cross compiling
-define THRIFT_TOOL_NO_HARDCODE
-	for f in `find $(@D) -name Makefile.am -type f`; do \
-		$(SED) "/^THRIFT =/d" $$f; \
-	done
-	$(SED) "s:top_builddir)/compiler/cpp/thrift:THRIFT):" $(@D)/tutorial/Makefile.am
-endef
-
-THRIFT_POST_PATCH_HOOKS += THRIFT_TOOL_NO_HARDCODE
-
-define THRIFT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/bin/thrift -C $(@D)
-endef
-
-# Install runtime only
-define THRIFT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/lib DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
 
 # to be used by other packages
 THRIFT = $(HOST_DIR)/bin/thrift
-- 
2.17.1
