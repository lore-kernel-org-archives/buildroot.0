From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] openjpeg: fix build without C++ support
Message-ID: <20170923171328.645DB80FA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2911fec6a02cfd9324c96a4dada9c493929c26b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e2f/e2ff0a7fa2b911157edf6c43a8eed797b22edd46/
http://autobuild.buildroot.net/results/670/6706339e7df2f2e7d0d7a15663bed185ca55c2a1/

Openjpeg is written in C, but with the move to CMake the build system now
errors out if a C++ compiler isn't available.  Fix it by patching the
CMakeLists.txt to not require C++ support.

Patch submitted upstream:
https://github.com/uclouvain/openjpeg/pull/1027

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...CMakeLists.txt-Don-t-require-a-C-compiler.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/openjpeg/0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch b/package/openjpeg/0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch
new file mode 100644
index 0000000..13cceef
--- /dev/null
+++ b/package/openjpeg/0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch
@@ -0,0 +1,34 @@
+From 786ddcd1475adc6193c59d53e0d8ed2c502f2b00 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 23 Sep 2017 18:49:31 +0200
+Subject: [PATCH] CMakeLists.txt: Don't require a C++ compiler
+
+By default, CMake assumes that the project is using both C and C++.  By
+explicitly passing 'C' as argument of the project() macro, we tell CMake
+that only C is used, which prevents CMake from erroring out if a C++
+compiler doesn't exist.
+
+Submitted upstream:
+https://github.com/uclouvain/openjpeg/pull/1027
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ec42bc99..d80eb48b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@ endif()
+ #string(TOLOWER ${OPENJPEG_NAMESPACE} OPENJPEG_LIBRARY_NAME)
+ set(OPENJPEG_LIBRARY_NAME openjp2)
+ 
+-project(${OPENJPEG_NAMESPACE})
++project(${OPENJPEG_NAMESPACE} C)
+ 
+ # Do full dependency headers.
+ include_regular_expression("^.*$")
+-- 
+2.11.0
+
