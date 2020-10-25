From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 17:12:46 +0100
Subject: [Buildroot] [PATCH v3,2/2] package/zeek: new package
In-Reply-To: <20201025161246.1622486-1-fontaine.fabrice@gmail.com>
References: <20201025161246.1622486-1-fontaine.fabrice@gmail.com>
Message-ID: <20201025161246.1622486-2-fontaine.fabrice@gmail.com>
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
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Bump to version 3.2.2 (security fixes)
 - Add host-zeek dependencies
 - Install bifcl and binpac to HOST_DIR

Changes v1 -> v2:
 - Bump to version 3.2.0
 - Drop second and third patches (already in version)
 - Update ZEEK_SITE
 - Update indentation in hash file (two spaces)
 - Update third party licences

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...rdinator.hpp-check-for-RUSAGE_THREAD.patch | 31 +++++++
 package/zeek/Config.in                        | 44 ++++++++++
 package/zeek/zeek.hash                        |  6 ++
 package/zeek/zeek.mk                          | 86 +++++++++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch
 create mode 100644 package/zeek/Config.in
 create mode 100644 package/zeek/zeek.hash
 create mode 100644 package/zeek/zeek.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 123ffbf033..4b2b250b4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,6 +877,7 @@ F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
+F:	package/zeek/
 
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
diff --git a/package/Config.in b/package/Config.in
index ee05467479..08b379e08f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2289,6 +2289,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zeek/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch b/package/zeek/0001-profiled_coordinator.hpp-check-for-RUSAGE_THREAD.patch
new file mode 100644
index 0000000000..4b431a5a56
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
+ auxil/broker/caf/libcaf_core/caf/scheduler/profiled_coordinator.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libcaf_core/caf/scheduler/profiled_coordinator.hpp b/libcaf_core/caf/scheduler/profiled_coordinator.hpp
+index 3e091321f..7d7b8bad2 100644
+--- a/auxil/broker/caf/libcaf_core/caf/scheduler/profiled_coordinator.hpp
++++ b/auxil/broker/caf/libcaf_core/caf/scheduler/profiled_coordinator.hpp
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
index 0000000000..30411e4948
--- /dev/null
+++ b/package/zeek/zeek.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  6c5748c49207241977a0d9fcbac8ce3b6abbf866ff29469fd0c2dcd3d4f99d01  zeek-3.2.2.tar.gz
+
+# Hash for license files:
+sha256  690b4eee9a01fe94edd5710a0bc026df96bb3b2403d26dc923921ec0116908b2  COPYING
+sha256  f191fefe3f28a32e51499f57d700595946055518e00261ac398279639d5a5bea  COPYING.3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
new file mode 100644
index 0000000000..03450a053b
--- /dev/null
+++ b/package/zeek/zeek.mk
@@ -0,0 +1,86 @@
+################################################################################
+#
+# zeek
+#
+################################################################################
+
+ZEEK_VERSION = 3.2.2
+ZEEK_SITE = https://download.zeek.org
+ZEEK_LICENSE = \
+	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
+	Public Domain (sqlite), \
+	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
+	LGPL-3.0+ (Multifast Project), \
+	BSD-2-Clause (event.h), \
+	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
+	Apache-2.0 (highwayhash, folly), \
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
+HOST_ZEEK_DEPENDENCIES = \
+	host-bison host-flex host-pkgconf host-libpcap host-openssl host-zlib
+
+ZEEK_CONF_OPTS = \
+	-DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
+	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
+	-DBROKER_DISABLE_DOCS=ON \
+	-DBROKER_DISABLE_TESTS=ON \
+	-DINSTALL_AUX_TOOLS=ON \
+	-DZEEK_ETC_INSTALL_DIR=/etc
+
+define ZEEK_FIX_PYTHON_PATH
+	$(SED) 's, at PYTHON_EXECUTABLE@,/usr/bin/python,' \
+		$(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
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
+HOST_ZEEK_MAKE_OPTS = binpac bifcl
+
+define HOST_ZEEK_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
+		$(HOST_DIR)/bin/bifcl
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
+		$(HOST_DIR)/bin/binpac
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.28.0
