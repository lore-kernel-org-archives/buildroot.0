From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 09:41:44 +0100
Subject: [Buildroot] [git commit] package/piglit: fix GL tests
Message-ID: <20200308083115.647BC8FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba3c50f592b96253000d6aef31f946d647d8a4cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/3355e4dc02b07ccfd9fe9b5cafb70c01fc88c158

Add an upstream patch to ensure tests needing GLESv3 are only built when
that is available.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-tests-fix-test-build-requiring-gles3.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/piglit/0001-tests-fix-test-build-requiring-gles3.patch b/package/piglit/0001-tests-fix-test-build-requiring-gles3.patch
new file mode 100644
index 0000000000..4183f23432
--- /dev/null
+++ b/package/piglit/0001-tests-fix-test-build-requiring-gles3.patch
@@ -0,0 +1,49 @@
+From 8417ca1725d523493d8f6782699273dc056888ac Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+Date: Thu, 1 Aug 2019 20:51:55 +0300
+Subject: [PATCH] tests: fix test build requiring gles3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This should be built only on gles3.
+
+Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+Reported-by: Krzysztof Raszkowski <krzysztof.raszkowski@intel.com>
+Fixes: ef761094be ("tests: Reproducer for 110796")
+Reviewed-by: Tapani P??lli <tapani.palli@intel.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/mesa/piglit/commit/8417ca1725d523493d8f6782699273dc056888ac]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tests/shaders/CMakeLists.gl.txt    | 1 -
+ tests/shaders/CMakeLists.gles3.txt | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/shaders/CMakeLists.gl.txt b/tests/shaders/CMakeLists.gl.txt
+index f1512f9cf..a299001cb 100644
+--- a/tests/shaders/CMakeLists.gl.txt
++++ b/tests/shaders/CMakeLists.gl.txt
+@@ -43,7 +43,6 @@ IF (UNIX)
+ ENDIF (UNIX)
+ piglit_add_executable (glsl-arb-fragment-coord-conventions glsl-arb-fragment-coord-conventions.c)
+ piglit_add_executable (glsl-bindattriblocation glsl-bindattriblocation.c)
+-piglit_add_executable (glsl-bug-110796 glsl-bug-110796.c)
+ piglit_add_executable (glsl-bug-22603 glsl-bug-22603.c)
+ piglit_add_executable (glsl-dlist-getattriblocation glsl-dlist-getattriblocation.c)
+ piglit_add_executable (glsl-explicit-location-01 glsl-explicit-location-01.c)
+diff --git a/tests/shaders/CMakeLists.gles3.txt b/tests/shaders/CMakeLists.gles3.txt
+index 18b8c3534..c8ccfad42 100644
+--- a/tests/shaders/CMakeLists.gles3.txt
++++ b/tests/shaders/CMakeLists.gles3.txt
+@@ -3,6 +3,7 @@ link_libraries(
+ )
+ 
+ piglit_add_executable (built-in-constants_${piglit_target_api} built-in-constants.c parser_utils.c)
++piglit_add_executable (glsl-bug-110796 glsl-bug-110796.c)
+ piglit_add_executable(shader_runner_${piglit_target_api} shader_runner.c parser_utils.c)
+ 
+ # vim: ft=cmake:
+-- 
+2.24.1
+
