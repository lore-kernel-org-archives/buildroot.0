From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Feb 2020 21:55:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeek: new package
Message-ID: <20200204205559.3621390-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Zeek Network Security Monitor

Zeek is a powerful network analysis framework that is much different
from the typical IDS you may know. (Zeek is the new name for the
long-established Bro system.)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...rdinator.hpp-check-for-RUSAGE_THREAD.patch | 31 ++++++++
 ...xt-fix-cross-compilation-with-binpac.patch | 33 ++++++++
 ...on-t-check-for-sqlite3-python-module.patch | 44 +++++++++++
 package/zeek/Config.in                        | 44 +++++++++++
 package/zeek/zeek.hash                        |  6 ++
 package/zeek/zeek.mk                          | 79 +++++++++++++++++++
 8 files changed, 239 insertions(+)
 create mode 100644 package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch
 create mode 100644 package/zeek/0002-CMakeLists.txt-fix-cross-compilation-with-binpac.patch
 create mode 100644 package/zeek/0003-CMakeLists.txt-don-t-check-for-sqlite3-python-module.patch
 create mode 100644 package/zeek/Config.in
 create mode 100644 package/zeek/zeek.hash
 create mode 100644 package/zeek/zeek.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 72ed295170..d7319fbd87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -897,6 +897,7 @@ F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
+F:	package/zeek/
 
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
diff --git a/package/Config.in b/package/Config.in
index ad93e61f9e..8001fac56e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2199,6 +2199,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zeek/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch b/package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch
new file mode 100644
index 0000000000..52b04acc70
--- /dev/null
+++ b/package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch
@@ -0,0 +1,31 @@
+From af299e7ef8650be6b05152e91ca7a2a6fac3eb14 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 31 Jan 2020 16:46:48 +0100
+Subject: [PATCH] profiled_coordinator.hpp: check for RUSAGE_THREAD
+
+RUSAGE_THREAD is not defined on uclibc, so use RUSAGE_SELF if
+RUSAGE_THREAD is undefined
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/actor-framework/actor-framework/commit/af299e7ef8650be6b05152e91ca7a2a6fac3eb14]
+---
+ aux/broker/3rdparty/caf/libcaf_core/caf/scheduler/profiled_coordinator.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libcaf_core/caf/scheduler/profiled_coordinator.hpp b/libcaf_core/caf/scheduler/profiled_coordinator.hpp
+index 3e091321f..7d7b8bad2 100644
+--- a/aux/broker/3rdparty/caf/libcaf_core/caf/scheduler/profiled_coordinator.hpp
++++ b/aux/broker/3rdparty/caf/libcaf_core/caf/scheduler/profiled_coordinator.hpp
+@@ -113,7 +113,11 @@ class profiled_coordinator : public coordinator<Policy> {
+       m.mem = 0;
+ #else
+       ::rusage ru;
++#ifdef RUSAGE_THREAD
+       ::getrusage(RUSAGE_THREAD, &ru);
++#else
++      ::getrusage(RUSAGE_SELF, &ru);
++#endif
+       m.usr = to_usec(ru.ru_utime);
+       m.sys = to_usec(ru.ru_stime);
+       m.mem = ru.ru_maxrss;
diff --git a/package/zeek/0002-CMakeLists.txt-fix-cross-compilation-with-binpac.patch b/package/zeek/0002-CMakeLists.txt-fix-cross-compilation-with-binpac.patch
new file mode 100644
index 0000000000..005b83917e
--- /dev/null
+++ b/package/zeek/0002-CMakeLists.txt-fix-cross-compilation-with-binpac.patch
@@ -0,0 +1,33 @@
+From 63344b32f59d47d3b1a52519979aa8584ba5bff5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Feb 2020 14:28:43 +0100
+Subject: [PATCH] CMakeLists.txt: fix cross-compilation with binpac
+
+When cross-compiling, BINPAC_EXE_PATH will be set by the user to the
+host binpac binary which is fine however aux/binpac won't be built which
+will raise a build failure as target binpac (headers, library) won't be
+installed or built
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zeek/zeek/pull/768]
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 53c6d4fac..f4401d05c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -178,8 +178,7 @@ FindRequiredPackage(OpenSSL)
+ FindRequiredPackage(BIND)
+ FindRequiredPackage(ZLIB)
+ 
+-if (NOT BINPAC_EXE_PATH AND
+-    EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/aux/binpac/CMakeLists.txt)
++if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/aux/binpac/CMakeLists.txt)
+ 
+     set(ENABLE_STATIC_ONLY_SAVED ${ENABLE_STATIC_ONLY})
+ 
+-- 
+2.24.1
+
diff --git a/package/zeek/0003-CMakeLists.txt-don-t-check-for-sqlite3-python-module.patch b/package/zeek/0003-CMakeLists.txt-don-t-check-for-sqlite3-python-module.patch
new file mode 100644
index 0000000000..da4ee5836c
--- /dev/null
+++ b/package/zeek/0003-CMakeLists.txt-don-t-check-for-sqlite3-python-module.patch
@@ -0,0 +1,44 @@
+From d9b14245430a266f5bdd303143d25e9977c565b9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 4 Feb 2020 19:49:56 +0100
+Subject: [PATCH] CMakeLists.txt: don't check for sqlite3 python module when
+ cross-compiling
+
+Don't check for sqlite3 python module support by calling
+"${PYTHON_EXECUTABLE}" -c "import sqlite3" when cross-compiling as this
+will check sqlite3 support on the host python interpreter and not the
+target python interpreter.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zeek/zeekctl/pull/23]
+---
+ aux/zeekctl/CMakeLists.txt | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/aux/zeekctl/CMakeLists.txt b/aux/zeekctl/CMakeLists.txt
+index f3f197a..395d683 100644
+--- a/aux/zeekctl/CMakeLists.txt
++++ b/aux/zeekctl/CMakeLists.txt
+@@ -52,12 +52,14 @@ if (MISSING_PREREQS)
+     message(FATAL_ERROR "Configuration aborted due to missing prerequisites")
+ endif ()
+ 
+-execute_process(COMMAND "${PYTHON_EXECUTABLE}" -c "import sqlite3"
+-                RESULT_VARIABLE PYSQLITE3_IMPORT_RESULT)
++if (NOT CMAKE_CROSSCOMPILING)
++    execute_process(COMMAND "${PYTHON_EXECUTABLE}" -c "import sqlite3"
++                    RESULT_VARIABLE PYSQLITE3_IMPORT_RESULT)
+ 
+-if ( NOT PYSQLITE3_IMPORT_RESULT EQUAL 0 )
+-    message(FATAL_ERROR "The sqlite3 python module is required to use "
+-            "ZeekControl, but was not found.  Configuration aborted.")
++    if ( NOT PYSQLITE3_IMPORT_RESULT EQUAL 0 )
++        message(FATAL_ERROR "The sqlite3 python module is required to use "
++                "ZeekControl, but was not found.  Configuration aborted.")
++    endif ()
+ endif ()
+ 
+ if (NOT ZEEK_ROOT_DIR)
+-- 
+2.24.1
+
diff --git a/package/zeek/Config.in b/package/zeek/Config.in
new file mode 100644
index 0000000000..13c62252a9
--- /dev/null
+++ b/package/zeek/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_ZEEK
+	bool "zeek"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  The Zeek Network Security Monitor
+
+	  Zeek is a powerful network analysis framework that is much
+	  different from the typical IDS you may know. (Zeek is the new
+	  name for the long-established Bro system.)
+
+	  https://www.zeek.org
+
+if BR2_PACKAGE_ZEEK
+
+config BR2_PACKAGE_ZEEK_ZEEKCTL
+	bool "zeekctl"
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_HASHLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Tool for managing Zeek deployments
+
+endif
+
+comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
new file mode 100644
index 0000000000..41f9df3f29
--- /dev/null
+++ b/package/zeek/zeek.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 79f4f3efd883c9c2960295778dc290372d10874380fd88450271652e829811d2  zeek-3.0.1.tar.gz
+
+# Hash for license files:
+sha256 690b4eee9a01fe94edd5710a0bc026df96bb3b2403d26dc923921ec0116908b2  COPYING
+sha256 aba5d9a5ff1b66265adcfe5f9f02294de52d70d97d4f4a2cb01b5c227d6ecae9  COPYING.3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
new file mode 100644
index 0000000000..862096ca21
--- /dev/null
+++ b/package/zeek/zeek.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# zeek
+#
+################################################################################
+
+ZEEK_VERSION = 3.0.1
+ZEEK_SITE = https://www.zeek.org/downloads
+ZEEK_LICENSE = \
+	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
+	Public Domain (sqlite, siphash24.c), \
+	MIT (json-for-modern-cpp, tsl-ordered-map, bro_inet_ntop.c), \
+	LGPL-3.0+ (Multifast Project), \
+	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
+	Apache-2.0 (folly), \
+	MPL-2.0 (mozilla-ca-list.zeek)
+ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
+ZEEK_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_PYTHON),host-python,host-python3) \
+	host-zeek \
+	$(if $(BR2_PACKAGE_LIBKRB5),libkrb5) \
+	$(if $(BR2_PACKAGE_LIBMAXMINDDB),libmaxminddb) \
+	libpcap \
+	openssl \
+	$(if $(BR2_PACKAGE_ROCKSDB),rocksdb) \
+	zlib
+
+ZEEK_CONF_OPTS = \
+	-DBIFCL_EXE_PATH=$(HOST_ZEEK_BUILDDIR)/aux/bifcl/bifcl \
+	-DBINPAC_EXE_PATH=$(HOST_ZEEK_BUILDDIR)/aux/binpac/src/binpac \
+	-DBROKER_DISABLE_DOCS=ON \
+	-DBROKER_DISABLE_TESTS=ON \
+	-DINSTALL_AUX_TOOLS=ON \
+	-DZEEK_ETC_INSTALL_DIR=/etc
+
+HOST_ZEEK_MAKE_OPTS = binpac bifcl
+# Don't install host-zeek. We just need to build binpac and bifcl.
+# Therefore only run 'true' and do nothing, not even the default action.
+HOST_ZEEK_INSTALL_CMDS = true
+
+define ZEEK_FIX_PYTHON_PATH
+	$(SED) 's, at PYTHON_EXECUTABLE@,/usr/bin/python,' \
+		$(@D)/aux/zeekctl/ZeekControl/ssh_runner.py
+endef
+
+ZEEK_POST_CONFIGURE_HOOKS += ZEEK_FIX_PYTHON_PATH
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+ZEEK_DEPENDENCIES += jemalloc
+ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=ON
+else
+ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZEEK_ZEEKCTL),y)
+ZEEK_DEPENDENCIES += \
+	host-swig \
+	$(if $(BR2_PACKAGE_PYTHON),python,python3)
+ZEEK_CONF_OPTS += \
+	-DDISABLE_PYTHON_BINDINGS=OFF \
+	-DINSTALL_ZEEKCTL=ON \
+	-DPY_MOD_INSTALL_DIR=/usr/lib/zeekctl
+else
+ZEEK_CONF_OPTS += \
+	-DDISABLE_PYTHON_BINDINGS=ON \
+	-DINSTALL_ZEEKCTL=OFF
+endif
+
+ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+ZEEK_DEPENDENCIES += musl-fts
+ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.24.1
