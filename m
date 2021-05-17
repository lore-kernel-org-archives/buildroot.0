From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 May 2021 21:40:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/cutelyst: fix linking with -latomic
Message-ID: <20210517194008.1128801-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build is broken since commit 7333207eaf2900076185cba6641c6406d61c235e
because upstream overrides CMAKE_EXE_LINKER_FLAGS when building with
jemalloc:
https://github.com/cutelyst/cutelyst/commit/7d73eba273be365f15f1ffcb3d3ee7f1d44e10fb

Fixes:
 - http://autobuild.buildroot.org/results/ba9bccaae2cad487a66b6eb9851fc206c32d7c82

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...s.txt-don-t-override-CMAKE_EXE_LINKE.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch

diff --git a/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch b/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
new file mode 100644
index 0000000000..45b1fcd146
--- /dev/null
+++ b/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
@@ -0,0 +1,31 @@
+From c347aeb43775109cbc2824b99cb10b1b3440c191 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 17 May 2021 21:27:11 +0200
+Subject: [PATCH] server/CMakeLists.txt: don't override CMAKE_EXE_LINKER_FLAGS
+
+Don't override CMAKE_EXE_LINKER_FLAGS as this could break the build if
+CMAKE_EXE_LINKER_FLAGS is already set by the user (for example to pass
+-latomic)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cutelyst/cutelyst/pull/312]
+---
+ wsgi/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/CMakeLists.txt b/server/CMakeLists.txt
+index ec5689f7..1ed56859 100644
+--- a/wsgi/CMakeLists.txt
++++ b/wsgi/CMakeLists.txt
+@@ -95,7 +95,7 @@ install(TARGETS Cutelyst${PROJECT_VERSION_MAJOR}Qt${QT_VERSION_MAJOR}Server
+     cxx_generalized_initializers
+ )
+ if (JEMALLOC_FOUND)
+-    set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} " -Wl,--no-as-needed")
++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed")
+     target_link_libraries(cutelyst-wsgi2 PRIVATE ${JEMALLOC_LIBRARIES})
+ endif()
+ 
+-- 
+2.30.2
+
-- 
2.30.2
