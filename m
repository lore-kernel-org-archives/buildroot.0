From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:59:15 +0200
Subject: [Buildroot] [git commit] package/gerbera: add upstream patch to fix
 find_program with taglib-config
Message-ID: <20190610221729.B661A8F7AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d527683153c3c1ac341fa3a8002b71e3393a680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an from from upstream to fix linking Gerbera with taglib. The patch
fixes the following issue:

When cross-compiling CMakes `find_program()` will search for binaries on the
host. This is typically correct, e.g. when search for compilers or shells.

When cross-compiling, searching for `taglib-config` using `find_program` should
not find the binary on the host, instead it should find the binary in the sysroot
directory, as the host `taglib-config` will output the wrong host paths
and libs, whereas the sysroot `taglib-config` will output the correct sysroot
paths and libs.

Therefore, use the `CMAKE_FIND_ROOT_PATH_MODE_PROGRAM` variable when
cross-compiling. This variable controls whether the `CMAKE_FIND_ROOT_PATH`
and `CMAKE_SYSROOT` are used by find_program().

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rogram-taglib-config-when-cross-compiling.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch b/package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch
new file mode 100644
index 0000000000..d5cc908e22
--- /dev/null
+++ b/package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch
@@ -0,0 +1,46 @@
+From 0f78b883f02651bd15a96a7294e01f94b28c20f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 13 May 2019 13:42:14 +0200
+Subject: [PATCH] Fix find_program taglib-config when cross-compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When cross-compiling Gerbera CMakes `find_program()` will search for
+binaries on the host. This is typically correct, e.g. when search for
+compilers or shells.
+
+When cross-compiling searching for `taglib-config` should not find the
+binary on the host, instead it should find the binary in the sysroot
+directory, as the host `taglib-config` will output the wrong host paths
+and libs, whereas the sysroot `taglib-config` will output the correct sysroot
+paths and libs.
+
+Therefore, use the `CMAKE_FIND_ROOT_PATH_MODE_PROGRAM` variable when
+cross-compiling. This variable controls whether the `CMAKE_FIND_ROOT_PATH`
+and `CMAKE_SYSROOT` are used by find_program().
+
+Backported from: 0f78b883f02651bd15a96a7294e01f94b28c20f8
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ cmake/FindTaglib.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/cmake/FindTaglib.cmake b/cmake/FindTaglib.cmake
+index 46a20ff2..7135d766 100644
+--- a/cmake/FindTaglib.cmake
++++ b/cmake/FindTaglib.cmake
+@@ -19,6 +19,9 @@ ELSE()
+ 	endif(NOT TAGLIB_MIN_VERSION)
+ 
+ 	if(NOT WIN32)
++            if (CMAKE_CROSSCOMPILING)
++              set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
++            endif(CMAKE_CROSSCOMPILING)
+             find_program(TAGLIBCONFIG_EXECUTABLE NAMES taglib-config PATHS
+ 		   ${BIN_INSTALL_DIR}
+             )
+-- 
+2.22.0
+
