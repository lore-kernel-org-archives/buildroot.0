From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue, 22 Mar 2016 09:21:56 +0100
Subject: [Buildroot] [PATCH 1/1] gnuradio: fix compilation with cmake-3.5
Message-ID: <1458634916-12300-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Volk is a submodule of gnuradio, consequently PROJECT_{BINARY,SOURCE}_DIR must
be used instead of CMAKE_{BINARY,SOURCE}_DIR.

Patch backported from https://github.com/gnuradio/volk/pull/65

fix:

http://autobuild.buildroot.net/results/9a2c5ba503345d2d295b943776882c33f4f0f1d9/
http://autobuild.buildroot.net/results/17d1292adaaca5025bffb42191d9b2172246a514/
http://autobuild.buildroot.net/results/71f97ac20ea41a66daaadea5738b636bc45e805c/
http://autobuild.buildroot.net/results/0277af68c363af733c3e6f3197d3ef97597c5d7b/
http://autobuild.buildroot.net/results/ad5bccd2c4496859824f84327038eba5f6206d97/
http://autobuild.buildroot.net/results/f3dc0c224174cd8beddeaa8ea089320ddff621b5/
http://autobuild.buildroot.net/results/8b79a1e597d5f3f73d0534e90523692c6b8a18d2/
http://autobuild.buildroot.net/results/c0ee1bf791618da28e9faec9db30e7114475f211/
http://autobuild.buildroot.net/results/b44383ca61e1a235ba2be0f2d2e47ced7391798a/
http://autobuild.buildroot.net/results/ddee04bf8c477fb8ae6fe7f15b112485797dd96e/

fix partially :

http://autobuild.buildroot.net/results/33748edd3555296c1d8a8b49c83bca6003781993/
http://autobuild.buildroot.net/results/eb099fcfc5f98daa9c06e24d45dbc97df19b0d4f/
http://autobuild.buildroot.net/results/4469c2ba7e4611c7841ebac980a2fb17720b0433/
http://autobuild.buildroot.net/results/71960b94efdfc3c00990315ceac9b6e871a1f076/
http://autobuild.buildroot.net/results/a40486033a535dd11a90eceec80b41fd350bb394/
http://autobuild.buildroot.net/results/415d8475aadfd2bdd8feeac973c11b51b0bd1f80/
http://autobuild.buildroot.net/results/11024182df6b604d558cba07f2f3898edcdf5a06/
http://autobuild.buildroot.net/results/c6c1bb98eb42ee1d23183e275ea02343b5753846/
http://autobuild.buildroot.net/results/046a0ecc4b6b0d6df60b4ce3e279123e1c15123f/
http://autobuild.buildroot.net/results/6cc844e7bd7761e2238f55989e71520b91dd2a9f/
http://autobuild.buildroot.net/results/c958d9a11a3ec1c6c3a5792193c3b0df0529c812/
http://autobuild.buildroot.net/results/c3f186ebfef53e60dc2c4c7c8a27e6b3771f001a/
http://autobuild.buildroot.net/results/1399e81c32ea60f9ba37e9b5c1e6bf07541fba81/
http://autobuild.buildroot.net/results/8e038ac8b6e43abc4c7d437f267e497d7f808926/
http://autobuild.buildroot.net/results/f7b4fb5d8a65ecf45361cded2572eaeba1ea4302/
http://autobuild.buildroot.net/results/aa08901dfd81f6845dc632462bc32d921130c6b1/
http://autobuild.buildroot.net/results/30d4322e0a9fc3d8b04c1ad779e63cf17196fd5c/
http://autobuild.buildroot.net/results/1402de7f2d7ab36bf92cf5abdcb7ae90f0d13604/
http://autobuild.buildroot.net/results/5b644a88f457a8c5dda7961c8ae8b7299a774e8f/
http://autobuild.buildroot.net/results/c264cc6a5266b2703e58e0222f5b79d67ca3d450/
http://autobuild.buildroot.net/results/6b5cbf50a9c7c1f275ad876c77892c72358f23b5/
http://autobuild.buildroot.net/results/8ee3626e2523032218e17d9e6644403e64768f2d/
http://autobuild.buildroot.net/results/ae330a15a579b0d26d801ebbeaa1abcd896df177/
http://autobuild.buildroot.net/results/c814797698adb4bba7044c2edbe0ca3655d94fd5/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 .../0002-fix_cmake_3_5_0_build_failure.patch       | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch

diff --git a/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch b/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch
new file mode 100644
index 0000000..95a959a
--- /dev/null
+++ b/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch
@@ -0,0 +1,162 @@
+Changing CMAKE_{SOURCE,BINARY}_DIR like volk does in its top-level
+CMakeLists.txt no longer works with CMake 3.5.0.
+
+Use PROJECT_{BINARY,SOURCE}_DIR instead.
+
+Obtained from: http://pkgs.fedoraproject.org/cgit/rpms/gnuradio.git/commit/?id=b50c7e66f6e3a1e6a84e25505d3fd873756c2027
+Upstream patch and discussion: https://github.com/gnuradio/volk/pull/65
+--- a/volk/apps/CMakeLists.txt.cmake35	2016-02-07 10:09:12.000000000 -0700
++++ b/volk/apps/CMakeLists.txt	2016-02-23 20:47:31.513538541 -0700
+@@ -19,23 +19,23 @@
+ # Setup profiler
+ ########################################################################
+ if(MSVC)
+-    include_directories(${CMAKE_SOURCE_DIR}/cmake/msvc)
++    include_directories(${PROJECT_SOURCE_DIR}/cmake/msvc)
+ endif(MSVC)
+ 
+ include_directories(
+     ${CMAKE_CURRENT_SOURCE_DIR}
+     ${CMAKE_CURRENT_BINARY_DIR}
+-    ${CMAKE_SOURCE_DIR}/include
+-    ${CMAKE_BINARY_DIR}/include
+-    ${CMAKE_SOURCE_DIR}/lib
+-    ${CMAKE_BINARY_DIR}/lib
++    ${PROJECT_SOURCE_DIR}/include
++    ${PROJECT_BINARY_DIR}/include
++    ${PROJECT_SOURCE_DIR}/lib
++    ${PROJECT_BINARY_DIR}/lib
+     ${Boost_INCLUDE_DIRS}
+ )
+ 
+ # MAKE volk_profile
+ add_executable(volk_profile
+     ${CMAKE_CURRENT_SOURCE_DIR}/volk_profile.cc
+-    ${CMAKE_SOURCE_DIR}/lib/qa_utils.cc
++    ${PROJECT_SOURCE_DIR}/lib/qa_utils.cc
+ )
+ 
+ 
+--- a/volk/lib/CMakeLists.txt.cmake35	2016-02-07 10:09:12.000000000 -0700
++++ b/volk/lib/CMakeLists.txt	2016-02-23 20:47:31.516538564 -0700
+@@ -90,7 +90,7 @@ endif()
+ ########################################################################
+ execute_process(
+     COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
+-    ${CMAKE_SOURCE_DIR}/gen/volk_compile_utils.py
++    ${PROJECT_SOURCE_DIR}/gen/volk_compile_utils.py
+     --mode "arch_flags" --compiler "${COMPILER_NAME}"
+     OUTPUT_VARIABLE arch_flag_lines OUTPUT_STRIP_TRAILING_WHITESPACE
+ )
+@@ -278,7 +278,7 @@ message(STATUS "Available architectures:
+ ########################################################################
+ execute_process(
+     COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
+-    ${CMAKE_SOURCE_DIR}/gen/volk_compile_utils.py
++    ${PROJECT_SOURCE_DIR}/gen/volk_compile_utils.py
+     --mode "machines" --archs "${available_archs}"
+     OUTPUT_VARIABLE available_machines OUTPUT_STRIP_TRAILING_WHITESPACE
+ )
+@@ -310,9 +310,9 @@ message(STATUS "Available machines: ${av
+ ########################################################################
+ 
+ #dependencies are all python, xml, and header implementation files
+-file(GLOB xml_files ${CMAKE_SOURCE_DIR}/gen/*.xml)
+-file(GLOB py_files ${CMAKE_SOURCE_DIR}/gen/*.py)
+-file(GLOB h_files ${CMAKE_SOURCE_DIR}/kernels/volk/*.h)
++file(GLOB xml_files ${PROJECT_SOURCE_DIR}/gen/*.xml)
++file(GLOB py_files ${PROJECT_SOURCE_DIR}/gen/*.py)
++file(GLOB h_files ${PROJECT_SOURCE_DIR}/kernels/volk/*.h)
+ 
+ macro(gen_template tmpl output)
+     list(APPEND volk_gen_sources ${output})
+@@ -320,21 +320,21 @@ macro(gen_template tmpl output)
+         OUTPUT ${output}
+         DEPENDS ${xml_files} ${py_files} ${h_files} ${tmpl}
+         COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
+-        ${CMAKE_SOURCE_DIR}/gen/volk_tmpl_utils.py
++        ${PROJECT_SOURCE_DIR}/gen/volk_tmpl_utils.py
+         --input ${tmpl} --output ${output} ${ARGN}
+     )
+ endmacro(gen_template)
+ 
+-make_directory(${CMAKE_BINARY_DIR}/include/volk)
++make_directory(${PROJECT_BINARY_DIR}/include/volk)
+ 
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk.tmpl.h              ${CMAKE_BINARY_DIR}/include/volk/volk.h)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk.tmpl.c              ${CMAKE_BINARY_DIR}/lib/volk.c)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_typedefs.tmpl.h     ${CMAKE_BINARY_DIR}/include/volk/volk_typedefs.h)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_cpu.tmpl.h          ${CMAKE_BINARY_DIR}/include/volk/volk_cpu.h)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_cpu.tmpl.c          ${CMAKE_BINARY_DIR}/lib/volk_cpu.c)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_config_fixed.tmpl.h ${CMAKE_BINARY_DIR}/include/volk/volk_config_fixed.h)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_machines.tmpl.h     ${CMAKE_BINARY_DIR}/lib/volk_machines.h)
+-gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_machines.tmpl.c     ${CMAKE_BINARY_DIR}/lib/volk_machines.c)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk.tmpl.h              ${PROJECT_BINARY_DIR}/include/volk/volk.h)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk.tmpl.c              ${PROJECT_BINARY_DIR}/lib/volk.c)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_typedefs.tmpl.h     ${PROJECT_BINARY_DIR}/include/volk/volk_typedefs.h)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_cpu.tmpl.h          ${PROJECT_BINARY_DIR}/include/volk/volk_cpu.h)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_cpu.tmpl.c          ${PROJECT_BINARY_DIR}/lib/volk_cpu.c)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_config_fixed.tmpl.h ${PROJECT_BINARY_DIR}/include/volk/volk_config_fixed.h)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_machines.tmpl.h     ${PROJECT_BINARY_DIR}/lib/volk_machines.h)
++gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_machines.tmpl.c     ${PROJECT_BINARY_DIR}/lib/volk_machines.c)
+ 
+ set(BASE_CFLAGS NONE)
+ string(TOUPPER ${CMAKE_BUILD_TYPE} CBTU)
+@@ -362,12 +362,12 @@ set(COMPILER_INFO "${CMAKE_C_COMPILER}::
+ foreach(machine_name ${available_machines})
+     #generate machine source
+     set(machine_source ${CMAKE_CURRENT_BINARY_DIR}/volk_machine_${machine_name}.c)
+-    gen_template(${CMAKE_SOURCE_DIR}/tmpl/volk_machine_xxx.tmpl.c ${machine_source} ${machine_name})
++    gen_template(${PROJECT_SOURCE_DIR}/tmpl/volk_machine_xxx.tmpl.c ${machine_source} ${machine_name})
+ 
+     #determine machine flags
+     execute_process(
+         COMMAND ${PYTHON_EXECUTABLE} ${PYTHON_DASH_B}
+-        ${CMAKE_SOURCE_DIR}/gen/volk_compile_utils.py
++        ${PROJECT_SOURCE_DIR}/gen/volk_compile_utils.py
+         --mode "machine_flags" --machine "${machine_name}" --compiler "${COMPILER_NAME}"
+         OUTPUT_VARIABLE ${machine_name}_flags OUTPUT_STRIP_TRAILING_WHITESPACE
+     )
+@@ -393,9 +393,9 @@ string(REPLACE "\n" " \\n" COMPILER_INFO
+ # Set local include directories first
+ ########################################################################
+ include_directories(
+-    ${CMAKE_BINARY_DIR}/include
+-    ${CMAKE_SOURCE_DIR}/include
+-    ${CMAKE_SOURCE_DIR}/kernels
++    ${PROJECT_BINARY_DIR}/include
++    ${PROJECT_SOURCE_DIR}/include
++    ${PROJECT_SOURCE_DIR}/kernels
+     ${CMAKE_CURRENT_BINARY_DIR}
+     ${CMAKE_CURRENT_SOURCE_DIR}
+ )
+@@ -420,8 +420,8 @@ if(${CMAKE_VERSION} VERSION_GREATER "2.8
+       # setup architecture specific assembler flags
+       set(ARCH_ASM_FLAGS "-mfpu=neon -g")
+       # then add the files
+-      include_directories(${CMAKE_SOURCE_DIR}/kernels/volk/asm/neon)
+-      file(GLOB asm_files ${CMAKE_SOURCE_DIR}/kernels/volk/asm/neon/*.s)
++      include_directories(${PROJECT_SOURCE_DIR}/kernels/volk/asm/neon)
++      file(GLOB asm_files ${PROJECT_SOURCE_DIR}/kernels/volk/asm/neon/*.s)
+       foreach(asm_file ${asm_files})
+         list(APPEND volk_sources ${asm_file})
+         message(STATUS "Adding source file: ${asm_file}")
+@@ -453,7 +453,7 @@ if(ORC_FOUND)
+     list(APPEND volk_libraries ${ORC_LIBRARIES})
+ 
+     #setup orc functions
+-    file(GLOB orc_files ${CMAKE_SOURCE_DIR}/kernels/volk/asm/orc/*.orc)
++    file(GLOB orc_files ${PROJECT_SOURCE_DIR}/kernels/volk/asm/orc/*.orc)
+     foreach(orc_file ${orc_files})
+ 
+         #extract the name for the generated c source from the orc file
+@@ -511,7 +511,7 @@ PROPERTIES COMPILE_DEFINITIONS "${machin
+ 
+ if(MSVC)
+     #add compatibility includes for stdint types
+-    include_directories(${CMAKE_SOURCE_DIR}/cmake/msvc)
++    include_directories(${PROJECT_SOURCE_DIR}/cmake/msvc)
+     add_definitions(-DHAVE_CONFIG_H)
+     #compile the sources as C++ due to the lack of complex.h under MSVC
+     set_source_files_properties(${volk_sources} PROPERTIES LANGUAGE CXX)
+diff -up gnuradio-3.7.9.1/volk/python/volk_modtool/CMakeLists.txt.cmake35 gnuradio-3.7.9.1/volk/python/volk_modtool/CMakeLists.txt
-- 
2.7.3
