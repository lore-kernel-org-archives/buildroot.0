From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 May 2014 15:07:43 +0200
Subject: [Buildroot] [git commit] libwebsockets: disable checks for C++
	compiler
Message-ID: <20140502131010.D537F9CA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26132bac8dc4c2d3130c0d239ab4e174dd8b221c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since libwesockets in written in pure C, no C++, there is no reason to
disable it or make the configuration failed when the toolchain has no
C++ support.

Unfortunately, CMake defaults sets C and C++ as languages used by the
project. This makes the configuration failed if no C++ compiler is found.

This patch just make the CMake code of libwebsockets reflecting the real
status of the project with regard to the languages used.

Should fix:
  http://autobuild.buildroot.org/results/fef/fef98ef289d44d13ec61025c50febba1e835b421/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ckets-0001-cmake-set-the-project-language.patch |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/libwebsockets/libwebsockets-0001-cmake-set-the-project-language.patch b/package/libwebsockets/libwebsockets-0001-cmake-set-the-project-language.patch
new file mode 100644
index 0000000..7b017a7
--- /dev/null
+++ b/package/libwebsockets/libwebsockets-0001-cmake-set-the-project-language.patch
@@ -0,0 +1,34 @@
+From 6ab441e0509a9fda179fd1febf73d0f9fae321d6 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 2 May 2014 14:24:58 +0200
+Subject: [PATCH] cmake: set the project language
+
+By default, CMake sets C and C++ as languages used by the project.
+This makes the configuration failed if no C++ compiler is found.
+
+Since libwesockets in written in pure C, no C++, there is no reason to
+disable it when the toolchain has no C++ support.
+
+This patch just make the CMake code reflecting the real status of the
+project with regard to the languages used.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f1b6ace..72391b0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 2.6)
+ 
+-project(libwebsockets)
++project(libwebsockets C)
+ 
+ set(PACKAGE "libwebsockets")
+ set(CPACK_PACKAGE_NAME "${PACKAGE}")
+-- 
+1.9.2
+
