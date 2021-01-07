From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 22:14:55 +0100
Subject: [Buildroot] [git commit] package/open62541: add patch to allow
 building without a C++ compiler
Message-ID: <20210107211813.AF2B286528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efdc0cedc6433e4066900de69bddb0574e3344a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch was intended to be added in commit
b36ea68b5ad0f89ffd92cac3f91654e180683b1c ("package/open62541: new
package") but was missed, causing open62541 to not build on
configurations that lack a C++ compiler. This patch removes the need
for a C++ compiler by properly declaring the CMake project.

Fixes:

  http://autobuild.buildroot.net/results/86ca6a5a01ecfc7030c6be0da81924436b41d057/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...akeLists.txt-project-only-contains-C-code.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch b/package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch
new file mode 100644
index 0000000000..52a9cbaac5
--- /dev/null
+++ b/package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch
@@ -0,0 +1,27 @@
+From 61f9440dfeacad517965451773371aca0332d700 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 5 Jan 2021 23:08:53 +0100
+Subject: [PATCH] CMakeLists.txt: project only contains C code
+
+Make sure CMake doesn't check for a C++ compiler when it's not needed,
+as open62541 is in C.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 94ceb127..acc41ab2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 3.0...3.12)
+-project(open62541)
++project(open62541 C)
+ # set(CMAKE_VERBOSE_MAKEFILE ON)
+ if(${CMAKE_VERSION} VERSION_LESS 3.12)
+     cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
+-- 
+2.29.2
+
