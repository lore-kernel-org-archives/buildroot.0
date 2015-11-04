From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 22:18:52 +0100
Subject: [Buildroot] [git commit] fastd: add new package
Message-ID: <20151104212030.7B4A480109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6cb1dd8247d40a3071f9b6d9963d80dd0df031e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a new package for the fastd "Fast and Secure Tunneling Daemon"
which was developed for the Freifunk Gluon project in the first place.

It includes a patch to allow cross compiling with toolchains without
LTO support which fails with the unpatched version due to some ugly
cmake hacks in fastd v17, details in the patch.

[Thomas:
 - Get rid of trailing spaces in Config.in
 - Remove the BR2_PACKAGE_FASTD_OPENSSL, and simply rely on
   BR2_PACKAGE_OPENSSL
 - Remove -DWITH_CAPABILITIES=TRUE, since libcap support is anyway
   mandatory.
 - Use ON/OFF instead of TRUE/FALSE.]

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...NTERPROCEDURAL_OPTIMIZATION-target-proper.patch |   84 ++++++++++++++++++++
 package/fastd/Config.in                            |   24 ++++++
 package/fastd/fastd.mk                             |   40 +++++++++
 4 files changed, 149 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 98411b3..bdc3063 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1251,6 +1251,7 @@ endif
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
+	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
 	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
diff --git a/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch b/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
new file mode 100644
index 0000000..99d20c6
--- /dev/null
+++ b/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
@@ -0,0 +1,84 @@
+From: Alexander Dahl <alex@netz39.de>
+Date: Wed, 28 Oct 2015 16:04:13 +0100
+Subject: [PATCH] cmake: use INTERPROCEDURAL_OPTIMIZATION target property
+
+Instead of hacking on compiler flags use the cmake way for handling
+interprocedural optimization. Tests showed cmake currently ignores this
+for gcc and clang, at least on Debian Wheezy and Jessie. This actually
+results in no interprocedural optimization for the moment. However it
+allows to compile fastd against a toolchain without LTO support, which
+was broken because of a hack included here for finding binutils.
+
+According to the upstream author of fastd the main reason for enabling
+LTO was binary size on an OpenWRT target for Freifunk Gluon, where they
+have very few space left on devices with only 4 MB flash memory.
+
+Signed-off-by: Alexander Dahl <post@lespocky.de>
+---
+ cmake/CMakeFindBinUtils.cmake |  7 -------
+ cmake/checks.cmake            | 14 --------------
+ src/CMakeLists.txt            |  9 +++++++++
+ 3 files changed, 9 insertions(+), 21 deletions(-)
+ delete mode 100644 cmake/CMakeFindBinUtils.cmake
+
+diff --git a/cmake/CMakeFindBinUtils.cmake b/cmake/CMakeFindBinUtils.cmake
+deleted file mode 100644
+index 753577a..0000000
+--- a/cmake/CMakeFindBinUtils.cmake
++++ /dev/null
+@@ -1,7 +0,0 @@
+-if(CMAKE_COMPILER_IS_GNUCC)
+-  find_program(CMAKE_AR NAMES ${_CMAKE_TOOLCHAIN_PREFIX}gcc-ar HINTS ${_CMAKE_TOOLCHAIN_LOCATION})
+-  find_program(CMAKE_NM NAMES ${_CMAKE_TOOLCHAIN_PREFIX}gcc-nm HINTS ${_CMAKE_TOOLCHAIN_LOCATION})
+-  find_program(CMAKE_RANLIB NAMES ${_CMAKE_TOOLCHAIN_PREFIX}gcc-ranlib HINTS ${_CMAKE_TOOLCHAIN_LOCATION})
+-endif(CMAKE_COMPILER_IS_GNUCC)
+-
+-include(${CMAKE_ROOT}/Modules/CMakeFindBinUtils.cmake)
+diff --git a/cmake/checks.cmake b/cmake/checks.cmake
+index f9f0399..3c1f38b 100644
+--- a/cmake/checks.cmake
++++ b/cmake/checks.cmake
+@@ -10,20 +10,6 @@ if(ARCH_X86 OR ARCH_X86_64)
+ endif(ARCH_X86 OR ARCH_X86_64)
+ 
+ 
+-
+-if(ENABLE_LTO)
+-  set(CFLAGS_LTO "-flto")
+-  set(CFLAGS_NO_LTO "-fno-lto")
+-
+-  check_c_compiler_flag("-fwhole-program" HAVE_FLAG_WHOLE_PROGRAM)
+-  if(HAVE_FLAG_WHOLE_PROGRAM)
+-    set(LDFLAGS_LTO "-flto -fwhole-program")
+-  else(HAVE_FLAG_WHOLE_PROGRAM)
+-    set(LDFLAGS_LTO "-flto")
+-  endif(HAVE_FLAG_WHOLE_PROGRAM)
+-endif(ENABLE_LTO)
+-
+-
+ check_c_source_compiles("
+ #include <sys/types.h>
+ #include <sys/socket.h>
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index e7dd5d1..4991656 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -47,6 +47,15 @@ add_executable(fastd
+ set_property(TARGET fastd PROPERTY COMPILE_FLAGS "${FASTD_CFLAGS}")
+ set_property(TARGET fastd PROPERTY LINK_FLAGS "${PTHREAD_LDFLAGS} ${UECC_LDFLAGS_OTHER} ${NACL_LDFLAGS_OTHER} ${OPENSSL_CRYPTO_LDFLAGS_OTHER} ${JSONC_LDFLAGS_OTHER} ${LDFLAGS_LTO}")
+ set_property(TARGET fastd APPEND PROPERTY INCLUDE_DIRECTORIES ${CAP_INCLUDE_DIR} ${NACL_INCLUDE_DIRS} ${JSONC_INCLUDE_DIRS})
++if(ENABLE_LTO)
++	set_target_properties(fastd PROPERTIES
++		INTERPROCEDURAL_OPTIMIZATION ON
++	)
++else(ENABLE_LTO)
++	set_target_properties(fastd PROPERTIES
++		INTERPROCEDURAL_OPTIMIZATION OFF
++	)
++endif(ENABLE_LTO)
+ target_link_libraries(fastd protocols methods ciphers macs ${RT_LIBRARY} ${CAP_LIBRARY} ${UECC_LIBRARIES} ${NACL_LIBRARIES} ${OPENSSL_CRYPTO_LIBRARIES} ${JSONC_LIBRARIES})
+ 
+ add_dependencies(fastd version)
+-- 
+2.1.4
+
diff --git a/package/fastd/Config.in b/package/fastd/Config.in
new file mode 100644
index 0000000..15451f0
--- /dev/null
+++ b/package/fastd/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_FASTD
+	bool "fastd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUECC
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Fast and Secure Tunneling Daemon
+
+	  https://projects.universe-factory.net/projects/fastd/wiki
+
+if BR2_PACKAGE_FASTD
+
+config BR2_PACKAGE_FASTD_STATUS_SOCKET
+	bool "status socket support"
+	default y
+	select BR2_PACKAGE_JSON_C
+	help
+	  Enable support for a socket to get fastd's status.
+
+endif
+
+comment "fastd needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
new file mode 100644
index 0000000..afaa27b
--- /dev/null
+++ b/package/fastd/fastd.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# fastd
+#
+################################################################################
+
+FASTD_VERSION = v17
+FASTD_SITE = git://git.universe-factory.net/fastd
+FASTD_LICENSE = BSD-2c
+FASTD_LICENSE_FILES = COPYRIGHT
+FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
+FASTD_DEPENDENCIES = libuecc libsodium libcap
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON
+FASTD_DEPENDENCIES += openssl
+else
+FASTD_CONF_OPTS += -DENABLE_OPENSSL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FASTD_STATUS_SOCKET),y)
+FASTD_CONF_OPTS += -DWITH_STATUS_SOCKET=ON
+FASTD_DEPENDENCIES += json-c
+else
+FASTD_CONF_OPTS += -DWITH_STATUS_SOCKET=OFF
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+FASTD_CONF_OPTS += -DENABLE_SYSTEMD=ON
+else
+FASTD_CONF_OPTS += -DENABLE_SYSTEMD=OFF
+endif
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+FASTD_CONF_OPTS += -DENABLE_LTO=ON
+else
+FASTD_CONF_OPTS += -DENABLE_LTO=OFF
+endif
+
+$(eval $(cmake-package))
