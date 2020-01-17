From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 17 Jan 2020 12:02:29 +0100
Subject: [Buildroot] [PATCH v2 3/6] package/gnuradio: bump to version 3.8.0.0
In-Reply-To: <20200117110232.31336-1-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
Message-ID: <20200117110232.31336-3-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since 2019/08/09 a new version of gnuradio is available.
This patch bump to this version with some modifications:
- suppress the applied patch 0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
- backport patch to have boost unit_test_framework optional instead of mandatory:
  https://github.com/gnuradio/gnuradio/pull/2927
- backport patch to fix neon version detection:
  https://github.com/gnuradio/volk/pull/319
- add boost atomic (used by pmt), log4cpp (now mandatory) and gmp as dependencies
- suppress the no more available BR2_PACKAGE_GNURADIO_LOG, since log4cpp is mandatory. Since this
  option is now always true no need to add an entry in legacy.
- suppress all workaround for neon. Now volk is able to detect correctly neon
  version.
- add explictly path to python interpreter

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * add backported patch (Arnout)
 * explain why BR2_PACKAGE_GNURADIO_LOG is not added to legacy (Arnout)
 * suppress everything about neon (Arnout)
---
 ...est_framework-required-only-when-ENA.patch | 92 +++++++++++++++++++
 ..._impl.cc-fix-build-with-boost-1.70.0.patch | 42 ---------
 ...MakeLists-fix-neon-version-detection.patch | 50 ++++++++++
 package/gnuradio/Config.in                    | 10 +-
 package/gnuradio/gnuradio.hash                |  2 +-
 package/gnuradio/gnuradio.mk                  | 31 ++-----
 6 files changed, 153 insertions(+), 74 deletions(-)
 create mode 100644 package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch
 delete mode 100644 package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
 create mode 100644 package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch

diff --git a/package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch b/package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch
new file mode 100644
index 0000000000..e00ed226cf
--- /dev/null
+++ b/package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch
@@ -0,0 +1,92 @@
+From d6647680612276f2321cc6a83964e9264fca42a1 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Wed, 15 Jan 2020 17:23:08 +0100
+Subject: [PATCH] add boost unit_test_framework required only when
+ ENABLE_TESTING=ON
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ CMakeLists.txt                        |  7 +++----
+ cmake/Modules/GnuradioConfig.cmake.in | 16 +++++++++++++---
+ cmake/Modules/GrBoost.cmake           |  5 ++++-
+ 3 files changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a47a945f9..58add6136 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,6 +46,9 @@ GR_CHECK_BUILD_TYPE(${CMAKE_BUILD_TYPE})
+ SET(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "")
+ message(STATUS "Build type set to ${CMAKE_BUILD_TYPE}.")
+ 
++include(GrComponent)
++GR_REGISTER_COMPONENT("testing-support" ENABLE_TESTING)
++
+ # Set the version information here
+ SET(VERSION_MAJOR 3)
+ SET(VERSION_API   8)
+@@ -377,10 +380,6 @@ GR_REGISTER_COMPONENT("python-support" ENABLE_PYTHON
+     SIX_FOUND
+ )
+ 
+-GR_REGISTER_COMPONENT("testing-support" ENABLE_TESTING
+-    Boost_FOUND
+-)
+-
+ if(${CMAKE_BUILD_TYPE} STREQUAL "Coverage")
+   include(CodeCoverage)
+   setup_target_for_coverage(coverage "ctest || exit 0" coverage)
+diff --git a/cmake/Modules/GnuradioConfig.cmake.in b/cmake/Modules/GnuradioConfig.cmake.in
+index 1e5ad20ec..f59e74b8b 100644
+--- a/cmake/Modules/GnuradioConfig.cmake.in
++++ b/cmake/Modules/GnuradioConfig.cmake.in
+@@ -24,15 +24,25 @@ list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_LIST_DIR}")
+ 
+ find_dependency(LOG4CPP)
+ find_dependency(MPLIB)
+-find_dependency(Boost "@Boost_MAJOR_VERSION at .@Boost_MINOR_VERSION at .@Boost_SUBMINOR_VERSION@" COMPONENTS
++
++set(BOOST_REQUIRED_COMPONENTS
+     date_time
+     program_options
+     filesystem
+     system
+     regex
+     thread
+-    unit_test_framework
+-    )
++)
++
++if (NOT ENABLE_TESTING)
++  set(ENABLE_TESTING @ENABLE_TESTING@ CACHE BOOL "Enable testing support")
++endif()
++
++if(ENABLE_TESTING)
++  list(APPEND BOOST_REQUIRED_COMPONENTS unit_test_framework)
++endif(ENABLE_TESTING)
++
++find_dependency(Boost "@Boost_MAJOR_VERSION at .@Boost_MINOR_VERSION at .@Boost_SUBMINOR_VERSION@" COMPONENTS ${BOOST_REQUIRED_COMPONENTS})
+ find_dependency(Volk)
+ set(ENABLE_PYTHON @ENABLE_PYTHON@ CACHE BOOL "Enable Python & SWIG")
+ if(${ENABLE_PYTHON})
+diff --git a/cmake/Modules/GrBoost.cmake b/cmake/Modules/GrBoost.cmake
+index cd4b120f7..670e61054 100644
+--- a/cmake/Modules/GrBoost.cmake
++++ b/cmake/Modules/GrBoost.cmake
+@@ -33,9 +33,12 @@ set(BOOST_REQUIRED_COMPONENTS
+     system
+     regex
+     thread
+-    unit_test_framework
+ )
+ 
++if(ENABLE_TESTING)
++    list(APPEND BOOST_REQUIRED_COMPONENTS unit_test_framework)
++endif(ENABLE_TESTING)
++
+ if(UNIX AND NOT BOOST_ROOT AND EXISTS "/usr/lib64")
+     list(APPEND BOOST_LIBRARYDIR "/usr/lib64") #fedora 64-bit fix
+ endif(UNIX AND NOT BOOST_ROOT AND EXISTS "/usr/lib64")
+-- 
+2.24.1
+
diff --git a/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch b/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
deleted file mode 100644
index 2047cdd036..0000000000
--- a/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 6b450f36c14dd16d476f10f3e4eb1c5c26a78daa Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 18 Apr 2019 09:40:15 +0200
-Subject: [PATCH] socket_pdu_impl.cc: fix build with boost 1.70.0
-
-Fix #2446
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/2451]
----
- gr-blocks/lib/socket_pdu_impl.cc | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/gr-blocks/lib/socket_pdu_impl.cc b/gr-blocks/lib/socket_pdu_impl.cc
-index e20f1478f..d9dd1edd6 100644
---- a/gr-blocks/lib/socket_pdu_impl.cc
-+++ b/gr-blocks/lib/socket_pdu_impl.cc
-@@ -29,6 +29,12 @@
- #include <gnuradio/io_signature.h>
- #include <gnuradio/blocks/pdu.h>
- 
-+#if BOOST_VERSION >= 107000
-+#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s)->get_executor().context())
-+#else
-+#define GET_IO_SERVICE(s) ((s)->get_io_service())
-+#endif
-+
- namespace gr {
-   namespace blocks {
- 
-@@ -165,7 +171,7 @@ namespace gr {
-     void
-     socket_pdu_impl::start_tcp_accept()
-     {
--      tcp_connection::sptr new_connection = tcp_connection::make(d_acceptor_tcp->get_io_service(), d_rxbuf.size(), d_tcp_no_delay);
-+      tcp_connection::sptr new_connection = tcp_connection::make(GET_IO_SERVICE(d_acceptor_tcp), d_rxbuf.size(), d_tcp_no_delay);
- 
-       d_acceptor_tcp->async_accept(new_connection->socket(),
-         boost::bind(&socket_pdu_impl::handle_tcp_accept, this,
--- 
-2.20.1
-
diff --git a/package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch b/package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch
new file mode 100644
index 0000000000..aa160ea41a
--- /dev/null
+++ b/package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch
@@ -0,0 +1,50 @@
+From 08f335450b9809acdbe88d894449ccd6d4a9ec75 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Wed, 15 Jan 2020 17:27:15 +0100
+Subject: [PATCH] lib/CMakeLists: fix neon version detection
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ volk/lib/CMakeLists.txt | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index f969f2e..b85a22b 100644
+--- a/volk/lib/CMakeLists.txt
++++ b/volk/lib/CMakeLists.txt
+@@ -144,7 +144,7 @@ set(HAVE_AVX_CVTPI32_PS 0)
+ if(CPU_IS_x86)
+     # check to see if the compiler/linker works with xgetb instruction
+     if (NOT MSVC)
+-        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/test_xgetbv.c "unsigned long long _xgetbv(unsigned int index) { unsigned int eax, edx; __asm__ __volatile__(\"xgetbv\" : \"=a\"(eax), \"=d\"(edx) : \"c\"(index)); return ((unsigned long long)edx << 32) | eax; } int main (void) { (void) _xgetbv(0); return (0); }")
++        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/test_xgetbv.c "#include <volk/volk_common.h>\n unsigned long long _xgetbv(unsigned int index) { unsigned int eax, edx; __VOLK_ASM __volatile__(\"xgetbv\" : \"=a\"(eax), \"=d\"(edx) : \"c\"(index)); return ((unsigned long long)edx << 32) | eax; } int main (void) { (void) _xgetbv(0); return (0); }")
+     else (NOT MSVC)
+         #MSVC defines an intrinsic
+         file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/test_xgetbv.c "#include <stdio.h> \n #include <intrin.h> \n int main() { int avxSupported = 0; \n#if (_MSC_FULL_VER >= 160040219) \nint cpuInfo[4]; __cpuid(cpuInfo, 1);\nif ((cpuInfo[2] & (1 << 27) || 0) && (cpuInfo[2] & (1 << 28) || 0)) \n{\nunsigned long long xcrFeatureMask = _xgetbv(_XCR_XFEATURE_ENABLED_MASK);\n   avxSupported = (xcrFeatureMask & 0x6) == 6;}\n#endif \n return 1- avxSupported; }")
+@@ -263,17 +263,17 @@ check_c_source_compiles("#include <arm_neon.h>\nint main(){ uint8_t *dest; uint8
+ 	                neon_compile_result)
+ 
+ if(neon_compile_result)
+-    check_c_source_compiles("int main(){asm volatile(\"vrev32.8 q0, q0\");}"
++    check_c_source_compiles("#include <volk/volk_common.h>\n int main(){__VOLK_ASM volatile(\"vrev32.8 q0, q0\");}"
+                             have_neonv7_result )
+-    check_c_source_compiles("int main(){asm volatile(\"sub v1.4s,v1.4s,v1.4s\");}"
++    check_c_source_compiles("#include <volk/volk_common.h>\n int main(){__VOLK_ASM volatile(\"sub v1.4s,v1.4s,v1.4s\");}"
+                             have_neonv8_result )
+ 
+-    if (have_neonv7_result)
+-        OVERRULE_ARCH(neonv8 "CPU is armv7")
++    if (NOT have_neonv7_result)
++        OVERRULE_ARCH(neonv7 "Compiler doesn't support neonv7")
+     endif()
+ 
+-    if (have_neonv8_result)
+-        OVERRULE_ARCH(neonv7 "CPU is armv8")
++    if (NOT have_neonv8_result)
++        OVERRULE_ARCH(neonv8 "Compiler doesn't support neonv8")
+     endif()
+ else(neon_compile_result)
+     OVERRULE_ARCH(neon "Compiler doesn't support NEON")
+-- 
+2.24.1
+
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 442b86c692..72458f0961 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -17,12 +17,15 @@ config BR2_PACKAGE_GNURADIO
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_LOG4CPP
+	select BR2_PACKAGE_GMP
 	help
 	  GNU Radio is a free & open-source software development
 	  toolkit that provides signal processing blocks to implement
@@ -60,12 +63,6 @@ config BR2_PACKAGE_GNURADIO_FEC
 	help
 	  FEC signal processing blocks
 
-config BR2_PACKAGE_GNURADIO_LOG
-	bool "gr-log support"
-	select BR2_PACKAGE_LOG4CPP
-	help
-	  Enable logger component
-
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	depends on BR2_PACKAGE_PYTHON
@@ -73,6 +70,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Enable python component
 
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index e47984e360..7c38110772 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f14e1f8efbcbe04336b6981da207ada3306a8f08af2c0b4e9bb6f8b93036bbb9  gnuradio-3.7.13.5.tar.gz
+sha256 3a9c90111f22f2f6f30450731dc671ad28ce824fc1a7bc8ea0783da9b95a7092  gnuradio-3.8.0.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 7ee44f26ae..a1dbb78e6e 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.7.13.5
+GNURADIO_VERSION = 3.8.0.0
 GNURADIO_SITE = https://gnuradio.org/releases/gnuradio
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
@@ -16,12 +16,16 @@ GNURADIO_DEPENDENCIES = \
 	host-python-mako \
 	host-python-six \
 	host-swig \
-	boost
+	boost \
+	log4cpp \
+	gmp
 
 GNURADIO_CONF_OPTS = \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
+	-DENABLE_TESTING=OFF \
 	-DENABLE_GR_QTGUI=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
 
@@ -33,22 +37,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-# Yes, this is silly, because -march is already known by the compiler
-# with the internal toolchain, and passed by the external wrapper for
-# external toolchains. Nonetheless, gnuradio does some matching on the
-# CFLAGS to decide whether to build the NEON functions or not, and
-# wants to see the string 'armv7' in the CFLAGS.
-ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
-GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a"
-endif
-
-# As soon as -mfpu=neon is supported by the compiler, gnuradio will try
-# to use it. But having NEON support in the compiler doesn't necessarily
-# mean we have NEON support in our CPU.
-ifeq ($(BR2_ARM_CPU_HAS_NEON),)
-GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
-endif
-
 ifeq ($(BR2_PACKAGE_ORC),y)
 GNURADIO_DEPENDENCIES += orc
 GNURADIO_CONF_OPTS += -DENABLE_ORC=ON
@@ -118,13 +106,6 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GNURADIO_LOG),y)
-GNURADIO_DEPENDENCIES += log4cpp
-GNURADIO_CONF_OPTS += -DENABLE_GR_LOG=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_GR_LOG=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
-- 
2.24.1
