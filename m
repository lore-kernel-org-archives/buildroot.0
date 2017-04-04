From: Paul Cercueil <paul.cercueil@analog.com>
Date: Tue, 4 Apr 2017 11:43:26 +0200
Subject: [Buildroot] [PATCH] libiio: Fix tools not linked with pthreads
Message-ID: <20170404094326.28344-1-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch cherry-picked from the upstream libiio project.

Fixes:
http://autobuild.buildroot.net/results/595/595dfd7a17e2bba71844536c9071f7608879e319
http://autobuild.buildroot.net/results/693/69390ba1f7b1460c3217ef88125faeeeda445f20
http://autobuild.buildroot.net/results/71e/71ecc80e891a36305b3dacbd12bf8130fe4fd31f
http://autobuild.buildroot.net/results/4d1/4d1d798ac740403e814b843083b14c9a890dfd54
http://autobuild.buildroot.net/results/00f/00ffdfce0e7780a0f5a5dfadf6bfd63e51c7bbb8
http://autobuild.buildroot.net/results/863/863fa72f443c45793df4837992c5c8dc65590c48

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 .../0002-CMake-Test-tools-require-threads.patch    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libiio/0002-CMake-Test-tools-require-threads.patch

diff --git a/package/libiio/0002-CMake-Test-tools-require-threads.patch b/package/libiio/0002-CMake-Test-tools-require-threads.patch
new file mode 100644
index 0000000000..32c20236db
--- /dev/null
+++ b/package/libiio/0002-CMake-Test-tools-require-threads.patch
@@ -0,0 +1,32 @@
+From 6e5a40566ee44694b186d4c2cbcf5f8690d8bba4 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul.cercueil@analog.com>
+Date: Tue, 4 Apr 2017 11:25:37 +0200
+Subject: [PATCH] CMake: Test tools require threads
+
+If libiio was compiled without any backend enabled the build of the
+tools would fail with undefined references to libpthread, at least on
+Buildroot (strangely not on my Debian PC).
+
+Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9c17273..cf92de3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -36,6 +36,10 @@ endif()
+ option(WITH_NETWORK_BACKEND "Enable the network backend" ON)
+ option(WITH_TESTS "Build the test programs" ON)
+ 
++if (WITH_TESTS)
++	set(NEED_THREADS 1)
++endif()
++
+ if (MSVC)
+ 	# Avoid annoying warnings from Visual Studio
+ 	add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
+-- 
+2.11.0
+
-- 
2.11.0
