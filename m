From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Feb 2020 18:45:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/ogre: fix build with RELRO
Message-ID: <20200210174511.719351-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b64dfcd8e576666e8a4a52da81a2f5a92b779dc7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ompiledHeader.cmake-Add-c-argument-t.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch

diff --git a/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch b/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
new file mode 100644
index 0000000000..0971df2c09
--- /dev/null
+++ b/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
@@ -0,0 +1,57 @@
+From f480ac538eb69086d4b7db855c2a457d5d6420d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Feb 2020 14:05:12 +0100
+Subject: [PATCH] CMake/Utils/PrecompiledHeader.cmake: Add -c argument to build
+ precompiled headers
+
+Add "-c" argument when building precompiled headers to fix build with
+RELRO.
+
+More information on a similar issue with domoticz can be found here:
+https://patchwork.ozlabs.org/patch/1187328:
+
+"The problem AFAICS is that if no -c or similar option is given, GCC
+decides what needs to be done based on the rest of the arguments. If the
+rest of the arguments include a -Wl,... option, it decides that linking
+needs to be done. If the rest of the arguments are just header files, it
+decides to create a precompiled header."
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8fabf8d270b9257c3a9db6a2f17f1c08ec9428d3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OGRECave/ogre/pull/1454]
+---
+ CMake/Utils/PrecompiledHeader.cmake | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMake/Utils/PrecompiledHeader.cmake b/CMake/Utils/PrecompiledHeader.cmake
+index a02d99acd..bfb0059db 100644
+--- a/CMake/Utils/PrecompiledHeader.cmake
++++ b/CMake/Utils/PrecompiledHeader.cmake
+@@ -133,11 +133,11 @@ MACRO(_PCH_GET_COMPILE_COMMAND out_command _input _output)
+             STRING(REGEX REPLACE "^ +" "" pchsupport_compiler_cxx_arg1 ${CMAKE_CXX_COMPILER_ARG1})
+ 
+             SET(${out_command}
+-              ${CMAKE_CXX_COMPILER} ${pchsupport_compiler_cxx_arg1} ${_compile_FLAGS} -x c++-header -o ${_output} ${_input}
++              ${CMAKE_CXX_COMPILER} ${pchsupport_compiler_cxx_arg1} ${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}
+               )
+         ELSE(CMAKE_CXX_COMPILER_ARG1)
+             SET(${out_command}
+-              ${CMAKE_CXX_COMPILER}  ${_compile_FLAGS} -x c++-header -o ${_output} ${_input}
++              ${CMAKE_CXX_COMPILER}  ${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}
+               )
+         ENDIF(CMAKE_CXX_COMPILER_ARG1)
+     ELSE(CMAKE_COMPILER_IS_GNUCXX)
+@@ -291,7 +291,7 @@ MACRO(ADD_PRECOMPILED_HEADER _targetName _input)
+     set_target_properties(${_targetName}_pch_dephelp PROPERTIES INCLUDE_DIRECTORIES "${DIRINC}")
+ 
+     #MESSAGE("_compile_FLAGS: ${_compile_FLAGS}")
+-    #message("COMMAND ${CMAKE_CXX_COMPILER}	${_compile_FLAGS} -x c++-header -o ${_output} ${_input}")
++    #message("COMMAND ${CMAKE_CXX_COMPILER}	${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}")
+ 
+     ADD_CUSTOM_COMMAND(
+       OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${_name}"
+-- 
+2.24.1
+
-- 
2.24.1
