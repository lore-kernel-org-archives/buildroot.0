From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:48:57 +0200
Subject: [Buildroot] [git commit] ola: remove package
Message-ID: <20170529194936.9D86A828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e692e1f2b2285c18057e2c70cc1d9d0cfdb15d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ola does not build with current protobuf. Upstream bug report is still open.

https://github.com/OpenLightingProject/ola/issues/1192

Cc: Dave Skok <blanco.ether@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |   3 -
 package/Config.in                                  |   1 -
 .../0001-Remove-fvisibiliy-inlines-hidden.patch    |  26 ---
 .../ola/0002-Remove-replacing-I-with-isystem.patch | 106 ------------
 package/ola/Config.in                              | 138 ----------------
 package/ola/ola.hash                               |   2 -
 package/ola/ola.mk                                 | 180 ---------------------
 7 files changed, 456 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f80b89f..cd1efef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -404,9 +404,6 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
-N:	Dave Skok <blanco.ether@gmail.com>
-F:	package/ola/
-
 N:	David Bachelart <david.bachelart@bbright.com>
 F:	package/ccrypt/
 F:	package/dos2unix/
diff --git a/package/Config.in b/package/Config.in
index d57813c..9da2c43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -440,7 +440,6 @@ endmenu
 	source "package/odroid-mali/Config.in"
 	source "package/odroid-scripts/Config.in"
 	source "package/ofono/Config.in"
-	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
 	source "package/openipmi/Config.in"
diff --git a/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch b/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
deleted file mode 100644
index f2bf247..0000000
--- a/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From cd4f5d9d8a10c368584e8e714ebb0f9695267063 Mon Sep 17 00:00:00 2001
-From: Simon Marchi <simon.marchi@polymtl.ca>
-Date: Mon, 10 Aug 2015 15:01:42 -0400
-Subject: [PATCH] Remove -fvisibiliy-inlines-hidden
-
-Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 714e435..17a23e2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -32,7 +32,7 @@ AM_DISTCHECK_CONFIGURE_FLAGS = --enable-python-libs
- COMMON_CXXFLAGS_ONLY_WARNINGS = \
-     -I$(top_srcdir)/include \
-     -I$(top_builddir)/include \
--    -Wall -Wformat -W -fvisibility-inlines-hidden \
-+    -Wall -Wformat -W \
-     $(libprotobuf_CFLAGS)
- 
- COMMON_CXXFLAGS = $(COMMON_CXXFLAGS_ONLY_WARNINGS)
--- 
-2.5.0
-
diff --git a/package/ola/0002-Remove-replacing-I-with-isystem.patch b/package/ola/0002-Remove-replacing-I-with-isystem.patch
deleted file mode 100644
index 010c99a..0000000
--- a/package/ola/0002-Remove-replacing-I-with-isystem.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From bbb03794def326c2e8ad2de523c5a61a4c8cb464 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Thu, 22 Sep 2016 00:58:58 +0200
-Subject: [PATCH] Remove replacing -I with -isystem
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Building OLA with a GCC 6 cross-toolchain fails:
-
-```
-/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE
--D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include -I./include
--Wall -Wformat -W -isystem
-/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -pthread
--D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
--pthread -c -o libs/acn/e131_transmit_test.o
-libs/acn/e131_transmit_test.cpp
-/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE
--D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include -I./include
--Wall -Wformat -W -isystem
-/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -pthread
--D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
--pthread -c -o libs/acn/E131TestFramework.o
-libs/acn/E131TestFramework.cpp
-In file included from
-/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/ext/string_conversions.h:41:0,
-                 from
-/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/bits/basic_string.h:5402,
-                 from
-/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/string:52,
-                 from ./tools/ola_trigger/config.ypp:2:
-/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/cstdlib:75:25:
-fatal error: stdlib.h: No such file or directory
- #include_next <stdlib.h>
-                         ^
-compilation terminated.
-```
-
-The C++ library in GCC 6 now provides its own `<stdlib.h>` header that
-wraps the C library header of the same name, so in `<cstdlib>` the
-header include
-
-```
-#include <stdlib.h>
-```
-
-has become
-
-```
-#include_next <stdlib.h>
-```
-
-`#include_next` is sensitive to the order of directories in the
-preprocessor's search path, so if that order is changed with `-isystem`
-then the compiler can't find the right header:
-
-```
-[1] /usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-[2] /opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0
-[..]
-End of search list.
-```
-
-`<cstdlib>` is located in [2] whereas `<stdlib.h>` (C library header) is
-in [1]. In this case, the `#include_next <stdlib.h>` statement in
-`<cstdlib>`, located in [2], is evaluated **after** the search path [1],
-so the compiler does not find the right system header.
-
-The problem is that the OLA build system replaces the `-I` in the CFLAGS
-from libprotobuf with `-isystem` to fix some warnings treated as errors
-in the libprotobuf header files.
-
-`-isystem` should be used to suppress warnings in system headers only
-and the libprotobuf header files are not system files.
-
-The correct fix is to compile with less restrictions and remove
-`-Werror` for the build.
-
-As using `-isystem` is reordering GCCs search path and using `-isystem`
-is really not necessary, remove the faulty replacement of `-I`.
-
-Upstream status: https://github.com/OpenLightingProject/ola/pull/1126
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- config/ola.m4 | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/config/ola.m4 b/config/ola.m4
-index 2796cfb..d3b8cc8 100644
---- a/config/ola.m4
-+++ b/config/ola.m4
-@@ -24,9 +24,6 @@ AC_DEFUN([PROTOBUF_SUPPORT],
- AC_REQUIRE_CPP()
- PKG_CHECK_MODULES(libprotobuf, [protobuf >= $1])
- 
--# We want to replace -I with -isystem here to disable errors in the .h files
--# See https://groups.google.com/forum/#!topic/open-lighting/39Mj0KXlCIk
--libprotobuf_CFLAGS=`echo $libprotobuf_CFLAGS | sed 's/-I/-isystem /'`
- AC_SUBST([libprotobuf_CFLAGS])
- 
- AC_ARG_WITH([protoc],
--- 
-2.10.0
-
diff --git a/package/ola/Config.in b/package/ola/Config.in
deleted file mode 100644
index 45e8f8f..0000000
--- a/package/ola/Config.in
+++ /dev/null
@@ -1,138 +0,0 @@
-comment "ola needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.5"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_5 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	depends on BROKEN
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-
-menuconfig BR2_PACKAGE_OLA
-	bool "ola (open lighting architecture)"
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX
-	# Build fails with current protobuf
-	# https://github.com/OpenLightingProject/ola/issues/1192
-	depends on BROKEN
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on !BR2_STATIC_LIBS # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # protobuf
-	help
-	  Open Lighting Architecture provides applications
-	  with a mechanism to send and receive DMX512 & RDM
-	  commands using hardware devices and DMX over IP protocols.
-
-	  http://www.opendmx.net/index.php/OLA
-
-if BR2_PACKAGE_OLA
-
-comment "bindings and interface"
-
-config BR2_PACKAGE_OLA_WEB
-	bool "http interface"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
-	select BR2_PACKAGE_LIBMICROHTTPD
-	help
-	  Build OLA with browser interface.
-
-config BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	bool "python bindings"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_PROTOBUF
-	help
-	  Build OLA with support for the Python language.
-
-config BR2_PACKAGE_OLA_SLP
-	bool "slp tools"
-	help
-	  Build OLA with slp tools.
-
-comment "tests and examples"
-
-config BR2_PACKAGE_OLA_EXAMPLES
-	bool "examples"
-	select BR2_PACKAGE_NCURSES
-	help
-	  Build OLA examples.
-
-config BR2_PACKAGE_OLA_RDM_TESTS
-	bool "rdm tests"
-	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	select BR2_PACKAGE_PYTHON_NUMPY
-	help
-	  Build OLA RDM tests.
-
-comment "plugin selections"
-
-config BR2_PACKAGE_OLA_PLUGIN_E131
-	bool "acn E131"
-	help
-	  Build ACN E131 plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_ARTNET
-	bool "artnet"
-	help
-	  Build Artnet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
-	bool "DMX4Linux"
-	help
-	  Build DMX4Linux plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_DUMMY
-	bool "dummy"
-	help
-	  Build Dummy plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_ESPNET
-	bool "espnet"
-	help
-	  Build EspNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_KINET
-	bool "kinet"
-	help
-	  Build KiNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_MILINT
-	bool "Milford Instruments"
-	help
-	  Build Milford Instruments 1-463 plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_OSC
-	bool "osc"
-	select BR2_PACKAGE_LIBLO
-	help
-	  Build Open Sound Control plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_PATHPORT
-	bool "pathport"
-	help
-	  Build Pathport plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_SANDNET
-	bool "sandnet"
-	help
-	  Build SandNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_SHOWNET
-	bool "shownet"
-	help
-	  Build ShowNet plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
-	bool "stageprofi"
-	select BR2_PACKAGE_LIBUSB
-	help
-	  Build StageProfi plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_USBPRO
-	bool "usbpro"
-	select BR2_PACKAGE_LIBUSB
-	help
-	  Build UsbPro plugin for OLA.
-
-endif
diff --git a/package/ola/ola.hash b/package/ola/ola.hash
deleted file mode 100644
index a791e9c..0000000
--- a/package/ola/ola.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  986e61874bc80db3b23cf201af2dafa39e3412cc50cddf1cd449c869110bfd27  ola-0.10.2.tar.gz
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
deleted file mode 100644
index 9348d70..0000000
--- a/package/ola/ola.mk
+++ /dev/null
@@ -1,180 +0,0 @@
-################################################################################
-#
-# ola
-#
-################################################################################
-
-OLA_VERSION = 0.10.2
-OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
-OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
-OLA_LICENSE_FILES = LICENCE GPL LGPL
-OLA_INSTALL_STAGING = YES
-OLA_AUTORECONF = YES
-
-# util-linux provides uuid lib
-OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
-
-OLA_CONF_OPTS = \
-	ac_cv_have_pymod_google_protobuf=yes \
-	--disable-gcov \
-	--disable-tcmalloc \
-	--disable-unittests \
-	--disable-root-check \
-	--disable-java-libs \
-	--disable-fatal-warnings \
-	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
-
-HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
-
-# When building the host part, disable as much as possible to speed up
-# the configure step and avoid missing host dependencies.
-HOST_OLA_CONF_OPTS = \
-	--disable-all-plugins \
-	--disable-slp \
-	--disable-osc \
-	--disable-uart \
-	--disable-libusb \
-	--disable-libftdi \
-	--disable-http \
-	--disable-examples \
-	--disable-unittests \
-	--disable-doxygen-html \
-	--disable-doxygen-doc \
-	--disable-fatal-warnings
-
-# On the host side, we only need ola_protoc_plugin, so build and install this
-# only.
-HOST_OLA_MAKE_OPTS = protoc/ola_protoc_plugin
-define HOST_OLA_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/usr/bin/ola_protoc_plugin
-endef
-
-# sets where to find python libs built for target and required by ola
-OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-OLA_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-
-## OLA Bindings and Interface selections
-
-ifeq ($(BR2_PACKAGE_OLA_WEB),y)
-OLA_CONF_OPTS += --enable-http
-OLA_DEPENDENCIES += libmicrohttpd
-else
-OLA_CONF_OPTS += --disable-http
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_SLP),y)
-OLA_CONF_OPTS += --enable-slp
-else
-OLA_CONF_OPTS += --disable-slp
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
-OLA_CONF_OPTS += --enable-python-libs
-OLA_DEPENDENCIES += python python-protobuf
-else
-OLA_CONF_OPTS += --disable-python-libs
-endif
-
-## OLA Examples and Tests
-
-ifeq ($(BR2_PACKAGE_OLA_EXAMPLES),y)
-OLA_CONF_OPTS += --enable-examples
-OLA_DEPENDENCIES += ncurses
-else
-OLA_CONF_OPTS += --disable-examples
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
-OLA_CONF_OPTS += --enable-rdm-tests
-OLA_DEPENDENCIES += python-numpy
-# needed as numpy builds some shared libraries and ola checks for
-# numpy using a host python test program which fails with 'wrong ELF
-# class'.
-OLA_CONF_ENV = ac_cv_have_pymod_numpy=yes
-else
-OLA_CONF_OPTS += --disable-rdm-tests
-endif
-
-## OLA Plugin selections
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
-OLA_CONF_OPTS += --enable-e131
-else
-OLA_CONF_OPTS += --disable-e131
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
-OLA_CONF_OPTS += --enable-artnet
-else
-OLA_CONF_OPTS += --disable-artnet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
-OLA_CONF_OPTS += --enable-opendmx
-else
-OLA_CONF_OPTS += --disable-opendmx
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
-OLA_CONF_OPTS += --enable-dummy
-else
-OLA_CONF_OPTS += --disable-dummy
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
-OLA_CONF_OPTS += --enable-espnet
-else
-OLA_CONF_OPTS += --disable-espnet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
-OLA_CONF_OPTS += --enable-kinet
-else
-OLA_CONF_OPTS += --disable-kinet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
-OLA_CONF_OPTS += --enable-osc
-OLA_DEPENDENCIES += liblo
-else
-OLA_CONF_OPTS += --disable-osc
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_MILINT),y)
-OLA_CONF_OPTS += --enable-milinst
-else
-OLA_CONF_OPTS += --disable-milinst
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
-OLA_CONF_OPTS += --enable-pathport
-else
-OLA_CONF_OPTS += --disable-pathport
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SANDNET),y)
-OLA_CONF_OPTS += --enable-sandnet
-else
-OLA_CONF_OPTS += --disable-sandnet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SHOWNET),y)
-OLA_CONF_OPTS += --enable-shownet
-else
-OLA_CONF_OPTS += --disable-shownet
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
-OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
-else
-OLA_CONF_OPTS += --disable-stageprofi
-endif
-
-ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
-OLA_CONF_OPTS += --enable-usbpro --enable-libusb
-else
-OLA_CONF_OPTS += --disable-usbpro
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
