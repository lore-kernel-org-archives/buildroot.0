From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:12:23 +0200
Subject: [Buildroot] [git commit] package/gnuradio: bump version to 3.7.11
Message-ID: <20170605091231.C2BD47FF2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1925c9b1803ad04efd64e7aa166b1443740ac48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:

0002-fix_cmake_3_5_0_build_failure.patch
https://github.com/gnuradio/volk/commit/9aa0f07693053d44aaaad8e54dd5250909705c02

0003-fix_compilation_in_gcc-6.patch
https://github.com/gnuradio/gnuradio/commit/a1cf11937665392bcfa223a5095ff903eb44c69b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-fix_cmake_3_5_0_build_failure.patch       | 175 ---------------------
 .../gnuradio/0003-fix_compilation_in_gcc-6.patch   |  36 -----
 package/gnuradio/gnuradio.hash                     |   2 +-
 package/gnuradio/gnuradio.mk                       |   2 +-
 4 files changed, 2 insertions(+), 213 deletions(-)

diff --git a/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch b/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch
deleted file mode 100644
index 15d7dea..0000000
--- a/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-Changing CMAKE_{SOURCE,BINARY}_DIR like volk does in its top-level
-CMakeLists.txt no longer works with CMake 3.5.0.
-
-Use PROJECT_{BINARY,SOURCE}_DIR instead.
-
-Obtained from: http://pkgs.fedoraproject.org/cgit/rpms/gnuradio.git/commit/?id=b50c7e66f6e3a1e6a84e25505d3fd873756c2027
-Upstream patch and discussion: https://github.com/gnuradio/volk/pull/65
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- apps/CMakeLists.txt | 12 ++++++------
- lib/CMakeLists.txt  | 48 ++++++++++++++++++++++++------------------------
- 2 files changed, 30 insertions(+), 30 deletions(-)
-
-diff --git a/volk/apps/CMakeLists.txt b/volk/apps/CMakeLists.txt
-index 74ed18d..f9ef6e0 100644
---- a/volk/apps/CMakeLists.txt
-+++ b/volk/apps/CMakeLists.txt
-@@ -19,23 +19,23 @@
- # Setup profiler
- ########################################################################
- if(MSVC)
--    include_directories(${CMAKE_SOURCE_DIR}/cmake/msvc)
-+    include_directories(${PROJECT_SOURCE_DIR}/cmake/msvc)
- endif(MSVC)
- 
- include_directories(
-     ${CMAKE_CURRENT_SOURCE_DIR}
-     ${CMAKE_CURRENT_BINARY_DIR}
--    ${CMAKE_SOURCE_DIR}/include
--    ${CMAKE_BINARY_DIR}/include
--    ${CMAKE_SOURCE_DIR}/lib
--    ${CMAKE_BINARY_DIR}/lib
-+    ${PROJECT_SOURCE_DIR}/include
-+    ${PROJECT_BINARY_DIR}/include
-+    ${PROJECT_SOURCE_DIR}/lib
-+    ${PROJECT_BINARY_DIR}/lib
-     ${Boost_INCLUDE_DIRS}
- )
- 
- # MAKE volk_profile
- add_executable(volk_profile
-     ${CMAKE_CURRENT_SOURCE_DIR}/volk_profile.cc
--    ${CMAKE_SOURCE_DIR}/lib/qa_utils.cc
-+    ${PROJECT_SOURCE_DIR}/lib/qa_utils.cc
- )
- 
- 
-diff --git a/volk/lib/CMakeLists.txt b/volk/lib/CMakeLists.txt
-index 35b67dc..f00200a 100644
---- a/volk/lib/CMakeLists.txt
-+++ b/volk/lib/CMakeLists.txt
-@@ -90,7 +90,7 @@ endif()
- ########################################################################
- execute_process(
-     COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
--    ${CMAKE_SOURCE_DIR}/gen/volk_compile_utils.py
-+    ${PROJECT_SOURCE_DIR}/gen/volk_compile_utils.py
-     --mode "arch_flags" --compiler "${COMPILER_NAME}"
-     OUTPUT_VARIABLE arch_flag_lines OUTPUT_STRIP_TRAILING_WHITESPACE
- )
-@@ -278,7 +278,7 @@ message(STATUS "Available architectures: ${available_archs}")
- ########################################################################
- execute_process(
-     COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
--    ${CMAKE_SOURCE_DIR}/gen/volk_compile_utils.py
-+    ${PROJECT_SOURCE_DIR}/gen/volk_compile_utils.py
-     --mode "machines" --archs "${available_archs}"
-     OUTPUT_VARIABLE available_machines OUTPUT_STRIP_TRAILING_WHITESPACE
- )
-@@ -310,9 +310,9 @@ message(STATUS "Available machines: ${available_machines}")
- ########################################################################
- 
- #dependencies are all python, xml, and header implementation files
--file(GLOB xml_files ${CMAKE_SOURCE_DIR}/gen/*.xml)
--file(GLOB py_files ${CMAKE_SOURCE_DIR}/gen/*.py)
--file(GLOB h_files ${CMAKE_SOURCE_DIR}/kernels/volk/*.h)
-+file(GLOB xml_files ${PROJECT_SOURCE_DIR}/gen/*.xml)
-+file(GLOB py_files ${PROJECT_SOURCE_DIR}/gen/*.py)
-+file(GLOB h_files ${PROJECT_SOURCE_DIR}/kernels/volk/*.h)
- 
- macro(gen_template tmpl output)
-     list(APPEND volk_gen_sources ${output})
-@@ -320,21 +320,21 @@ macro(gen_template tmpl output)
-         OUTPUT ${output}
-         DEPENDS ${xml_files} ${py_files} ${h_files} ${tmpl}
-         COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
--        ${CMAKE_SOURCE_DIR}/gen/volk_tmpl_utils.py
-+        ${PROJECT_SOURCE_DIR}/gen/volk_tmpl_utils.py
-         --input ${tmpl} --output ${output} ${ARGN}
-     )
- endmacro(gen_template)
- 
--make_directory(${CMAKE_BINARY_DIR}/include/volk)
-+make_directory(${PROJECT_BINARY_DIR}/include/volk)
- 
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk.tmpl.h              ${CMAKE_BINARY_DIR}/include/volk/volk.h)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk.tmpl.c              ${CMAKE_BINARY_DIR}/lib/volk.c)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_typedefs.tmpl.h     ${CMAKE_BINARY_DIR}/include/volk/volk_typedefs.h)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_cpu.tmpl.h          ${CMAKE_BINARY_DIR}/include/volk/volk_cpu.h)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_cpu.tmpl.c          ${CMAKE_BINARY_DIR}/lib/volk_cpu.c)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_config_fixed.tmpl.h ${CMAKE_BINARY_DIR}/include/volk/volk_config_fixed.h)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_machines.tmpl.h     ${CMAKE_BINARY_DIR}/lib/volk_machines.h)
--gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_machines.tmpl.c     ${CMAKE_BINARY_DIR}/lib/volk_machines.c)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk.tmpl.h              ${PROJECT_BINARY_DIR}/include/volk/volk.h)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk.tmpl.c              ${PROJECT_BINARY_DIR}/lib/volk.c)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_typedefs.tmpl.h     ${PROJECT_BINARY_DIR}/include/volk/volk_typedefs.h)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_cpu.tmpl.h          ${PROJECT_BINARY_DIR}/include/volk/volk_cpu.h)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_cpu.tmpl.c          ${PROJECT_BINARY_DIR}/lib/volk_cpu.c)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_config_fixed.tmpl.h ${PROJECT_BINARY_DIR}/include/volk/volk_config_fixed.h)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_machines.tmpl.h     ${PROJECT_BINARY_DIR}/lib/volk_machines.h)
-+gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_machines.tmpl.c     ${PROJECT_BINARY_DIR}/lib/volk_machines.c)
- 
- set(BASE_CFLAGS NONE)
- string(TOUPPER ${CMAKE_BUILD_TYPE} CBTU)
-@@ -362,12 +362,12 @@ set(COMPILER_INFO "${CMAKE_C_COMPILER}:::${CMAKE_C_FLAGS_${GRCBTU}} ${CMAKE_C_FL
- foreach(machine_name ${available_machines})
-     #generate machine source
-     set(machine_source ${CMAKE_CURRENT_BINARY_DIR}/volk_machine_${machine_name}.c)
--    gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_machine_xxx.tmpl.c ${machine_source} ${machine_name})
-+    gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_machine_xxx.tmpl.c ${machine_source} ${machine_name})
- 
-     #determine machine flags
-     execute_process(
-         COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
--        ${CMAKE_SOURCE_DIR}/gen/volk_compile_utils.py
-+        ${PROJECT_SOURCE_DIR}/gen/volk_compile_utils.py
-         --mode "machine_flags" --machine "${machine_name}" --compiler "${COMPILER_NAME}"
-         OUTPUT_VARIABLE ${machine_name}_flags OUTPUT_STRIP_TRAILING_WHITESPACE
-     )
-@@ -393,9 +393,9 @@ string(REPLACE "\n" " \\n" COMPILER_INFO ${COMPILER_INFO})
- # Set local include directories first
- ########################################################################
- include_directories(
--    ${CMAKE_BINARY_DIR}/include
--    ${CMAKE_SOURCE_DIR}/include
--    ${CMAKE_SOURCE_DIR}/kernels
-+    ${PROJECT_BINARY_DIR}/include
-+    ${PROJECT_SOURCE_DIR}/include
-+    ${PROJECT_SOURCE_DIR}/kernels
-     ${CMAKE_CURRENT_BINARY_DIR}
-     ${CMAKE_CURRENT_SOURCE_DIR}
- )
-@@ -420,8 +420,8 @@ if(${CMAKE_VERSION} VERSION_GREATER "2.8.9")
-       # setup architecture specific assembler flags
-       set(ARCH_ASM_FLAGS "-mfpu=neon -g")
-       # then add the files
--      include_directories(${CMAKE_SOURCE_DIR}/kernels/volk/asm/neon)
--      file(GLOB asm_files ${CMAKE_SOURCE_DIR}/kernels/volk/asm/neon/*.s)
-+      include_directories(${PROJECT_SOURCE_DIR}/kernels/volk/asm/neon)
-+      file(GLOB asm_files ${PROJECT_SOURCE_DIR}/kernels/volk/asm/neon/*.s)
-       foreach(asm_file ${asm_files})
-         list(APPEND volk_sources ${asm_file})
-         message(STATUS "Adding source file: ${asm_file}")
-@@ -453,7 +453,7 @@ if(ORC_FOUND)
-     list(APPEND volk_libraries ${ORC_LIBRARIES})
- 
-     #setup orc functions
--    file(GLOB orc_files ${CMAKE_SOURCE_DIR}/kernels/volk/asm/orc/*.orc)
-+    file(GLOB orc_files ${PROJECT_SOURCE_DIR}/kernels/volk/asm/orc/*.orc)
-     foreach(orc_file ${orc_files})
- 
-         #extract the name for the generated c source from the orc file
-@@ -511,7 +511,7 @@ PROPERTIES COMPILE_DEFINITIONS "${machine_defs}")
- 
- if(MSVC)
-     #add compatibility includes for stdint types
--    include_directories(${CMAKE_SOURCE_DIR}/cmake/msvc)
-+    include_directories(${PROJECT_SOURCE_DIR}/cmake/msvc)
-     add_definitions(-DHAVE_CONFIG_H)
-     #compile the sources as C++ due to the lack of complex.h under MSVC
-     set_source_files_properties(${volk_sources} PROPERTIES LANGUAGE CXX)
--- 
-2.7.3
-
diff --git a/package/gnuradio/0003-fix_compilation_in_gcc-6.patch b/package/gnuradio/0003-fix_compilation_in_gcc-6.patch
deleted file mode 100644
index f50af85..0000000
--- a/package/gnuradio/0003-fix_compilation_in_gcc-6.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-commit a1cf11937665392bcfa223a5095ff903eb44c69b
-Author: Jaroslav #karvada <jskarvad@redhat.com>
-Date:   Fri Feb 12 18:29:13 2016 +0100
-
-Backport patch from
-http://gnuradio.org/redmine/projects/gnuradio/repository/revisions/a1cf11937665392bcfa223a5095ff903eb44c69b
-
-Fix compilation in gcc-6
-	    
-Signed-off-by: Jaroslav #karvada <jskarvad@redhat.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
-diff --git a/gr-fec/include/gnuradio/fec/polar_decoder_common.h b/gr-fec/include/gnuradio/fec/polar_decoder_common.h
-index b0ecb85..a39ee4f 100644
---- a/gr-fec/include/gnuradio/fec/polar_decoder_common.h
-+++ b/gr-fec/include/gnuradio/fec/polar_decoder_common.h
-@@ -28,6 +28,10 @@
- #include <gnuradio/fec/generic_decoder.h>
- #include <gnuradio/fec/polar_common.h>
- 
-+#ifndef BOOST_CONSTEXPR_OR_CONST
-+#define BOOST_CONSTEXPR_OR_CONST const
-+#endif
-+
- namespace gr {
-   namespace fec {
-     namespace code {
-@@ -64,7 +68,7 @@ namespace gr {
-         bool set_frame_size(unsigned int frame_size){return false;};
- 
-       private:
--        static const float D_LLR_FACTOR = -2.19722458f;
-+        static BOOST_CONSTEXPR_OR_CONST float D_LLR_FACTOR = -2.19722458f;
-         unsigned int d_frozen_bit_counter;
- 
-       protected:
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index bb934e2..86944f4 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,2 +1,2 @@
 # From http://gnuradio.org/releases/gnuradio/sha256sums
-sha256	9c06f0f1ec14113203e0486fd526dd46ecef216dfe42f12d78d9b781b1ef967e	gnuradio-3.7.9.1.tar.gz
+sha256 87d9ba3183858efdbb237add3f9de40f7d65f25e16904a9bc8d764a7287252d4  gnuradio-3.7.11.tar.gz
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index dbd8ee2..6407dd4 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.7.9.1
+GNURADIO_VERSION = 3.7.11
 GNURADIO_SITE = http://gnuradio.org/releases/gnuradio
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
