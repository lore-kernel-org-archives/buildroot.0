From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Nov 2019 18:16:12 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/domoticz: fix
 build with RELRO
Message-ID: <20191109174734.CACCF8E9C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4a088d4f6b4af26c64a12841c103b71a19e8e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/5c1ca3083ad672401d1e050c6c3a07b8c33b851d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6d8c56f77627e594fb285a7c6f4245ed196ce392)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...txt-add-c-argument-to-build-precompiled-h.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch b/package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch
new file mode 100644
index 0000000000..b14f4c56c3
--- /dev/null
+++ b/package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch
@@ -0,0 +1,34 @@
+From 17107b876fb308e3ef3e759ab90f3d8e4755cdc4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 8 Nov 2019 14:17:58 +0100
+Subject: [PATCH] CMakeLists.txt: add -c argument to build precompiled headers
+
+Add "-c" argument when building precompiler headers as suggested
+by Arnout in https://patchwork.ozlabs.org/patch/1187328.
+
+This will fix the build with RELRO
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/17107b876fb308e3ef3e759ab90f3d8e4755cdc4]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 32a0dd2a8c..010cdf2db8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -277,10 +277,10 @@ MACRO(ADD_PRECOMPILED_HEADER _targetName _input)
+     ENDFOREACH(item)
+ 
+     SEPARATE_ARGUMENTS(_compiler_FLAGS)
+-    MESSAGE("${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -o ${_output} ${_source}")
++    MESSAGE("${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -c -o ${_output} ${_source}")
+     ADD_CUSTOM_COMMAND(
+       OUTPUT ${_output}
+-      COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -o ${_output} ${_source}
++      COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -c -o ${_output} ${_source}
+       DEPENDS ${_source} )
+     ADD_CUSTOM_TARGET(${_targetName}_gch DEPENDS ${_output})
+     ADD_DEPENDENCIES(${_targetName} ${_targetName}_gch)
