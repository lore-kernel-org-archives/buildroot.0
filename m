From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  4 Oct 2011 10:02:03 +0200
Subject: [Buildroot] [PATCHv4] package: add the poco C++ libraries collection
Message-ID: <854bf06beba00ffd6f7db32329490f0374347b3d.1317715247.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the C++ Portable Components libraries.

The Data/ODBC components is disabled because its dependency (unixODBC) is not
in Buildroot.

The Data/MySQL component is build tested only. It probably requires an
additional RPATH to actually run, because libmysqlclient resides in a
non-standard location under /usr/lib/mysql.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Changes from v3:
	Fix circular dependency: BR2_INSTALL_LIBSTDCPP selects BR2_LARGEFILE
	Remove unused GENTARGETS parameters

Changes from v2:
	Add dependency on WCHAR and C++
	Move the toolchain requirement comment to the end of Config.in
	Update to version 1.4.2p1
	Disable FPENVIRONEMENT and std::wstring when linking against uClibc

Changes from v1:
	Rebase on version 2011.08
	Update to version 1.4.2
	Fix the changelog text

 package/Config.in                                  |    1 +
 package/poco/Config.in                             |   57 ++++++++++++++
 .../poco/poco-1.4.2p1-add-cross-build-config.patch |   82 ++++++++++++++++++++
 .../poco-1.4.2p1-add-staging-search-path.patch     |   22 +++++
 .../poco/poco-1.4.2p1-dont-build-debug-libs.patch  |   19 +++++
 package/poco/poco.mk                               |   57 ++++++++++++++
 6 files changed, 238 insertions(+), 0 deletions(-)
 create mode 100644 package/poco/Config.in
 create mode 100644 package/poco/poco-1.4.2p1-add-cross-build-config.patch
 create mode 100644 package/poco/poco-1.4.2p1-add-staging-search-path.patch
 create mode 100644 package/poco/poco-1.4.2p1-dont-build-debug-libs.patch
 create mode 100644 package/poco/poco.mk

diff --git a/package/Config.in b/package/Config.in
index 8b9c816..fd920c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,6 +353,7 @@ source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
 source "package/orc/Config.in"
+source "package/poco/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/poco/Config.in b/package/poco/Config.in
new file mode 100644
index 0000000..a815a09
--- /dev/null
+++ b/package/poco/Config.in
@@ -0,0 +1,57 @@
+config BR2_PACKAGE_POCO
+	bool "poco"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PCRE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_USE_WCHAR
+	help
+	  The C++ Portable Components Libraries
+
+	  http://pocoproject.org
+
+if BR2_PACKAGE_POCO
+
+comment "poco components"
+
+config BR2_PACKAGE_POCO_XML
+	bool "xml"
+	select BR2_PACKAGE_EXPAT
+
+config BR2_PACKAGE_POCO_UTIL
+	bool "util"
+	select BR2_PACKAGE_POCO_XML
+
+config BR2_PACKAGE_POCO_NET
+	bool "net"
+
+config BR2_PACKAGE_POCO_CRYPTO
+	bool "crypto"
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_POCO_NETSSL_OPENSSL
+	bool "netssl_openssl"
+	select BR2_PACKAGE_POCO_NET
+	select BR2_PACKAGE_POCO_CRYPTO
+	select BR2_PACKAGE_POCO_UTIL
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_POCO_ZIP
+	bool "zip"
+
+config BR2_PACKAGE_POCO_DATA
+	bool
+
+config BR2_PACKAGE_POCO_DATA_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_POCO_DATA
+	select BR2_PACKAGE_SQLITE
+
+config BR2_PACKAGE_POCO_DATA_MYSQL
+	bool "mysql"
+	select BR2_PACKAGE_POCO_DATA
+	select BR2_PACKAGE_MYSQL_CLIENT
+
+endif # BR2_PACKAGE_POCO
+
+comment "poco requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/poco/poco-1.4.2p1-add-cross-build-config.patch b/package/poco/poco-1.4.2p1-add-cross-build-config.patch
new file mode 100644
index 0000000..a087838
--- /dev/null
+++ b/package/poco/poco-1.4.2p1-add-cross-build-config.patch
@@ -0,0 +1,82 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Subject: [PATCH] poco: add Linux configuration file for generic cross build
+
+This patch adds the Linux-CrossEnv config file to poco. This file is identical
+to the Linux one, except the added CROSSENV variable that allows setting of
+the toolchain prefix.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar poco-1.4.1p1-dist/build/config/Linux-CrossEnv poco-1.4.1p1/build/config/Linux-CrossEnv
+--- poco-1.4.1p1-dist/build/config/Linux-CrossEnv	1970-01-01 02:00:00.000000000 +0200
++++ poco-1.4.1p1/build/config/Linux-CrossEnv	2011-08-02 18:51:03.682047719 +0300
+@@ -0,0 +1,69 @@
++#
++# Linux
++#
++# Make settings for cross compiled Linux
++#
++#
++
++#
++# General Settings
++#
++LINKMODE ?= SHARED
++
++#
++# Define Tools
++#
++CC      = $(CROSSENV)gcc
++CXX     = $(CROSSENV)g++
++LINK    = $(CXX)
++LIB     = $(CROSSENV)ar -cr
++RANLIB  = $(CROSSENV)ranlib
++SHLIB   = $(CXX) -shared -Wl,-soname,$(notdir $@) -o $@
++SHLIBLN = $(POCO_BASE)/build/script/shlibln
++STRIP   = $(CROSSENV)strip
++DEP     = $(POCO_BASE)/build/script/makedepend.gcc 
++SHELL   = sh
++RM      = rm -rf
++CP      = cp
++MKDIR   = mkdir -p
++
++#
++# Extension for Shared Libraries
++#
++SHAREDLIBEXT     = .so.$(target_version)
++SHAREDLIBLINKEXT = .so
++
++#
++# Compiler and Linker Flags
++#
++CFLAGS          = 
++CFLAGS32        =
++CFLAGS64        =
++CXXFLAGS        = -Wall -Wno-sign-compare
++CXXFLAGS32      =
++CXXFLAGS64      =
++LINKFLAGS       =
++LINKFLAGS32     =
++LINKFLAGS64     =
++STATICOPT_CC    =
++STATICOPT_CXX   =
++STATICOPT_LINK  = -static
++SHAREDOPT_CC    = -fPIC
++SHAREDOPT_CXX   = -fPIC
++SHAREDOPT_LINK  = -Wl,-rpath,$(LIBPATH)
++DEBUGOPT_CC     = -g -D_DEBUG
++DEBUGOPT_CXX    = -g -D_DEBUG
++DEBUGOPT_LINK   = -g
++RELEASEOPT_CC   = -O2 -DNDEBUG
++RELEASEOPT_CXX  = -O2 -DNDEBUG
++RELEASEOPT_LINK = -O2
++
++#
++# System Specific Flags
++#
++SYSFLAGS = -D_XOPEN_SOURCE=500 -D_REENTRANT -D_THREAD_SAFE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DPOCO_HAVE_FD_EPOLL
++
++#
++# System Specific Libraries
++#
++SYSLIBS  = -lpthread -ldl -lrt
diff --git a/package/poco/poco-1.4.2p1-add-staging-search-path.patch b/package/poco/poco-1.4.2p1-add-staging-search-path.patch
new file mode 100644
index 0000000..18ee076
--- /dev/null
+++ b/package/poco/poco-1.4.2p1-add-staging-search-path.patch
@@ -0,0 +1,22 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Subject: [PATCH] poco: add the staging path to search path
+
+Add the mysql headers and client libraries to the search path of the
+preprocessor and the linker. The $MYSQL_LIBDIR variable must be set from the
+make command line.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+--- 
+--- poco-1.4.1p1-all-dist/Data/MySQL/Makefile	2011-02-09 11:13:00.000000000 +0200
++++ poco-1.4.1p1-all/Data/MySQL/Makefile	2011-08-07 09:03:37.106161274 +0300
+@@ -8,8 +8,8 @@
+ 
+ include $(POCO_BASE)/build/rules/global
+ 
+-SYSLIBS += -L/usr/local/lib/mysql -L/usr/lib/mysql -L/usr/mysql/lib/mysql -L/usr/local/mysql/lib -lmysqlclient
+-INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql -I/usr/mysql/include/mysql -I/usr/local/mysql/include
++SYSLIBS += -L$(MYSQL_LIBDIR) -L/usr/local/lib/mysql -L/usr/lib/mysql -L/usr/mysql/lib/mysql -L/usr/local/mysql/lib -lmysqlclient
++INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql -I/usr/mysql/include/mysql -I/usr/local/mysql/include -I=/mysql
+ SYSFLAGS += -DTHREADSAFE -DNO_TCL
+ 
+ objects = Binder Extractor SessionImpl Connector \
diff --git a/package/poco/poco-1.4.2p1-dont-build-debug-libs.patch b/package/poco/poco-1.4.2p1-dont-build-debug-libs.patch
new file mode 100644
index 0000000..7480963
--- /dev/null
+++ b/package/poco/poco-1.4.2p1-dont-build-debug-libs.patch
@@ -0,0 +1,19 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Subject: [PATCH] poco: don't build debug libraries
+
+Remove the debug libraries build dependency from the default target.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+--- poco-1.4.1p1-dist/build/rules/compile	2011-02-09 11:12:24.000000000 +0200
++++ poco-1.4.1p1/build/rules/compile	2011-08-03 07:51:42.946044176 +0300
+@@ -14,7 +14,7 @@
+ 
+ all: $(DEFAULT_TARGET)
+ all_static: static_debug static_release
+-all_shared: shared_debug shared_release
++all_shared: shared_release
+ all_debug: static_debug shared_debug
+ all_release: static_release shared_release
+ 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
new file mode 100644
index 0000000..4823935
--- /dev/null
+++ b/package/poco/poco.mk
@@ -0,0 +1,57 @@
+#############################################################
+#
+# poco
+#
+#############################################################
+POCO_VERSION = 1.4.2p1
+POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
+POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
+POCO_INSTALL_STAGING = YES
+
+POCO_DEPENDENCIES = zlib pcre					\
+	$(if $(BR2_PACKAGE_POCO_XML),expat)			\
+	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl)		\
+	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl)	\
+	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite)		\
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql_client)
+
+POCO_OMIT = Data/ODBC PageCompiler					\
+	$(if $(BR2_PACKAGE_POCO_XML),,XML)				\
+	$(if $(BR2_PACKAGE_POCO_UTIL),,Util)				\
+	$(if $(BR2_PACKAGE_POCO_NET),,Net)				\
+	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL)	\
+	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto)			\
+	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)				\
+	$(if $(BR2_PACKAGE_POCO_DATA),,Data)				\
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL)		\
+	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
+
+ifeq ($(LIBC),uclibc)
+POCO_CONF_OPT += --no-fpenvironment --no-wstring
+endif
+
+define POCO_CONFIGURE_CMDS
+	(cd $(@D); ./configure \
+		--config=Linux-CrossEnv	\
+		--prefix=/usr		\
+		--omit="$(POCO_OMIT)"	\
+		$(POCO_CONF_OPT)	\
+		--unbundled		\
+		--no-tests		\
+		--no-samples)
+endef
+
+define POCO_BUILD_CMDS
+	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
+		MYSQL_LIBDIR=$(TARGET_DIR)/usr/lib/mysql -C $(@D)
+endef
+
+define POCO_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
+endef
+
+define POCO_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.6.3
