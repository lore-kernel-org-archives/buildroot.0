From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun, 12 Apr 2020 17:26:10 +0200
Subject: [Buildroot] [PATCH] package/gnuradio: bump to 3.8.1.0
Message-ID: <20200412152610.18332-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

- use github url
- suppress all patches (applied in mainline)
- add DGR_PYTHON_DIR option to force install in site-packages instead of
  dist-packages

fix (at least):
- http://autobuild.buildroot.net/results/ff29b01f41c7d2e139a319aac1406dc00185fcae/
- http://autobuild.buildroot.net/results/cae9ad5b746bfd728688ab655c23087a6f70fd50/
- http://autobuild.buildroot.net/results/333fd49196d71ea68f64ad046c38e480593f127e/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ...est_framework-required-only-when-ENA.patch | 92 -------------------
 ...MakeLists-fix-neon-version-detection.patch | 50 ----------
 ....h-drop-boost-cstdint.hpp-and-use-cs.patch | 39 --------
 package/gnuradio/gnuradio.hash                |  2 +-
 package/gnuradio/gnuradio.mk                  | 16 +++-
 5 files changed, 15 insertions(+), 184 deletions(-)
 delete mode 100644 package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch
 delete mode 100644 package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch
 delete mode 100644 package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch

diff --git a/package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch b/package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch
deleted file mode 100644
index e00ed226cf..0000000000
--- a/package/gnuradio/0001-add-boost-unit_test_framework-required-only-when-ENA.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From d6647680612276f2321cc6a83964e9264fca42a1 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Wed, 15 Jan 2020 17:23:08 +0100
-Subject: [PATCH] add boost unit_test_framework required only when
- ENABLE_TESTING=ON
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- CMakeLists.txt                        |  7 +++----
- cmake/Modules/GnuradioConfig.cmake.in | 16 +++++++++++++---
- cmake/Modules/GrBoost.cmake           |  5 ++++-
- 3 files changed, 20 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a47a945f9..58add6136 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -46,6 +46,9 @@ GR_CHECK_BUILD_TYPE(${CMAKE_BUILD_TYPE})
- SET(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "")
- message(STATUS "Build type set to ${CMAKE_BUILD_TYPE}.")
- 
-+include(GrComponent)
-+GR_REGISTER_COMPONENT("testing-support" ENABLE_TESTING)
-+
- # Set the version information here
- SET(VERSION_MAJOR 3)
- SET(VERSION_API   8)
-@@ -377,10 +380,6 @@ GR_REGISTER_COMPONENT("python-support" ENABLE_PYTHON
-     SIX_FOUND
- )
- 
--GR_REGISTER_COMPONENT("testing-support" ENABLE_TESTING
--    Boost_FOUND
--)
--
- if(${CMAKE_BUILD_TYPE} STREQUAL "Coverage")
-   include(CodeCoverage)
-   setup_target_for_coverage(coverage "ctest || exit 0" coverage)
-diff --git a/cmake/Modules/GnuradioConfig.cmake.in b/cmake/Modules/GnuradioConfig.cmake.in
-index 1e5ad20ec..f59e74b8b 100644
---- a/cmake/Modules/GnuradioConfig.cmake.in
-+++ b/cmake/Modules/GnuradioConfig.cmake.in
-@@ -24,15 +24,25 @@ list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_LIST_DIR}")
- 
- find_dependency(LOG4CPP)
- find_dependency(MPLIB)
--find_dependency(Boost "@Boost_MAJOR_VERSION at .@Boost_MINOR_VERSION at .@Boost_SUBMINOR_VERSION@" COMPONENTS
-+
-+set(BOOST_REQUIRED_COMPONENTS
-     date_time
-     program_options
-     filesystem
-     system
-     regex
-     thread
--    unit_test_framework
--    )
-+)
-+
-+if (NOT ENABLE_TESTING)
-+  set(ENABLE_TESTING @ENABLE_TESTING@ CACHE BOOL "Enable testing support")
-+endif()
-+
-+if(ENABLE_TESTING)
-+  list(APPEND BOOST_REQUIRED_COMPONENTS unit_test_framework)
-+endif(ENABLE_TESTING)
-+
-+find_dependency(Boost "@Boost_MAJOR_VERSION at .@Boost_MINOR_VERSION at .@Boost_SUBMINOR_VERSION@" COMPONENTS ${BOOST_REQUIRED_COMPONENTS})
- find_dependency(Volk)
- set(ENABLE_PYTHON @ENABLE_PYTHON@ CACHE BOOL "Enable Python & SWIG")
- if(${ENABLE_PYTHON})
-diff --git a/cmake/Modules/GrBoost.cmake b/cmake/Modules/GrBoost.cmake
-index cd4b120f7..670e61054 100644
---- a/cmake/Modules/GrBoost.cmake
-+++ b/cmake/Modules/GrBoost.cmake
-@@ -33,9 +33,12 @@ set(BOOST_REQUIRED_COMPONENTS
-     system
-     regex
-     thread
--    unit_test_framework
- )
- 
-+if(ENABLE_TESTING)
-+    list(APPEND BOOST_REQUIRED_COMPONENTS unit_test_framework)
-+endif(ENABLE_TESTING)
-+
- if(UNIX AND NOT BOOST_ROOT AND EXISTS "/usr/lib64")
-     list(APPEND BOOST_LIBRARYDIR "/usr/lib64") #fedora 64-bit fix
- endif(UNIX AND NOT BOOST_ROOT AND EXISTS "/usr/lib64")
--- 
-2.24.1
-
diff --git a/package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch b/package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch
deleted file mode 100644
index aa160ea41a..0000000000
--- a/package/gnuradio/0002-lib-CMakeLists-fix-neon-version-detection.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 08f335450b9809acdbe88d894449ccd6d4a9ec75 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Wed, 15 Jan 2020 17:27:15 +0100
-Subject: [PATCH] lib/CMakeLists: fix neon version detection
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- volk/lib/CMakeLists.txt | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index f969f2e..b85a22b 100644
---- a/volk/lib/CMakeLists.txt
-+++ b/volk/lib/CMakeLists.txt
-@@ -144,7 +144,7 @@ set(HAVE_AVX_CVTPI32_PS 0)
- if(CPU_IS_x86)
-     # check to see if the compiler/linker works with xgetb instruction
-     if (NOT MSVC)
--        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/test_xgetbv.c "unsigned long long _xgetbv(unsigned int index) { unsigned int eax, edx; __asm__ __volatile__(\"xgetbv\" : \"=a\"(eax), \"=d\"(edx) : \"c\"(index)); return ((unsigned long long)edx << 32) | eax; } int main (void) { (void) _xgetbv(0); return (0); }")
-+        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/test_xgetbv.c "#include <volk/volk_common.h>\n unsigned long long _xgetbv(unsigned int index) { unsigned int eax, edx; __VOLK_ASM __volatile__(\"xgetbv\" : \"=a\"(eax), \"=d\"(edx) : \"c\"(index)); return ((unsigned long long)edx << 32) | eax; } int main (void) { (void) _xgetbv(0); return (0); }")
-     else (NOT MSVC)
-         #MSVC defines an intrinsic
-         file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/test_xgetbv.c "#include <stdio.h> \n #include <intrin.h> \n int main() { int avxSupported = 0; \n#if (_MSC_FULL_VER >= 160040219) \nint cpuInfo[4]; __cpuid(cpuInfo, 1);\nif ((cpuInfo[2] & (1 << 27) || 0) && (cpuInfo[2] & (1 << 28) || 0)) \n{\nunsigned long long xcrFeatureMask = _xgetbv(_XCR_XFEATURE_ENABLED_MASK);\n   avxSupported = (xcrFeatureMask & 0x6) == 6;}\n#endif \n return 1- avxSupported; }")
-@@ -263,17 +263,17 @@ check_c_source_compiles("#include <arm_neon.h>\nint main(){ uint8_t *dest; uint8
- 	                neon_compile_result)
- 
- if(neon_compile_result)
--    check_c_source_compiles("int main(){asm volatile(\"vrev32.8 q0, q0\");}"
-+    check_c_source_compiles("#include <volk/volk_common.h>\n int main(){__VOLK_ASM volatile(\"vrev32.8 q0, q0\");}"
-                             have_neonv7_result )
--    check_c_source_compiles("int main(){asm volatile(\"sub v1.4s,v1.4s,v1.4s\");}"
-+    check_c_source_compiles("#include <volk/volk_common.h>\n int main(){__VOLK_ASM volatile(\"sub v1.4s,v1.4s,v1.4s\");}"
-                             have_neonv8_result )
- 
--    if (have_neonv7_result)
--        OVERRULE_ARCH(neonv8 "CPU is armv7")
-+    if (NOT have_neonv7_result)
-+        OVERRULE_ARCH(neonv7 "Compiler doesn't support neonv7")
-     endif()
- 
--    if (have_neonv8_result)
--        OVERRULE_ARCH(neonv7 "CPU is armv8")
-+    if (NOT have_neonv8_result)
-+        OVERRULE_ARCH(neonv8 "Compiler doesn't support neonv8")
-     endif()
- else(neon_compile_result)
-     OVERRULE_ARCH(neon "Compiler doesn't support NEON")
--- 
-2.24.1
-
diff --git a/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
deleted file mode 100644
index 532bebcf2e..0000000000
--- a/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f643bc12100c67288adda3699a9e61d6a66fb529 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Fri, 7 Feb 2020 16:49:30 +0100
-Subject: [PATCH] gr-digital:glfsr.h: drop boost/cstdint.hpp and use cstdint
-
-gr-digital/glfsr.h include boost/cstdint.hpp to have uintxx_t.
-These types are in boost namespace but nor using namespace xxx, nor boost:: are used.
-The result is :
-In file included from /home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/glfsr.cc:23:
-/home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/../include/gnuradio/digital/glfsr.h:42:5: error: 'uint32_t' does not name a type; did you mean 'u_int32_t'?
-uint32_t d_shift_register;
-^~~~~~~~
-u_int32_t
-
-Since Gnuradio policy is Less boost == better and C++11 is used, use cstdint
-instead of boost/cstdint.hpp.
-
-[backported from 475e4a156b516c089175afb998acdc80b740b437]
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gr-digital/include/gnuradio/digital/glfsr.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gr-digital/include/gnuradio/digital/glfsr.h b/gr-digital/include/gnuradio/digital/glfsr.h
-index 0b5141f1f..1003bcd01 100644
---- a/gr-digital/include/gnuradio/digital/glfsr.h
-+++ b/gr-digital/include/gnuradio/digital/glfsr.h
-@@ -24,7 +24,7 @@
- #define INCLUDED_DIGITAL_GLFSR_H
- 
- #include <gnuradio/digital/api.h>
--#include <boost/cstdint.hpp>
-+#include <cstdint>
- 
- namespace gr {
- namespace digital {
--- 
-2.24.1
-
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 7c38110772..2f147761d8 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3a9c90111f22f2f6f30450731dc671ad28ce824fc1a7bc8ea0783da9b95a7092  gnuradio-3.8.0.0.tar.gz
+sha256 e15311e7da9fe2bb790cc36321d7eb2d93b9dfa0c1552fa5d534dd99d22873be  gnuradio-3.8.1.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 41d4619f72..235dc297d8 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,13 +4,21 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.8.0.0
-GNURADIO_SITE = https://gnuradio.org/releases/gnuradio
+GNURADIO_VERSION = 3.8.1.0
+GNURADIO_SOURCE = gnuradio-$(GNURADIO_VERSION).tar.gz
+GNURADIO_SITE = https://github.com/gnuradio/gnuradio/releases/download/v$(GNURADIO_VERSION)
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
+# needed to determine site-packages path
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+GNURADIO_PYVER = $(PYTHON_VERSION_MAJOR)
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GNURADIO_PYVER = $(PYTHON3_VERSION_MAJOR)
+endif
+
 # host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
@@ -110,6 +118,10 @@ endif
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
+# mandatory to install python stuf in site-packages
+# and to use correct path for python libraries
+GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
+	-DGR_PYTHON_DIR=lib/python$(GNURADIO_PYVER)/site-packages
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
-- 
2.20.1
