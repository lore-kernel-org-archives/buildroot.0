From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 24 Mar 2016 14:49:55 +0100
Subject: [Buildroot] [PATCH v2] qt5base: disable c++ standard compiler flags
	for the host build
Message-ID: <1458827395-24205-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Apply upstream patch, that disables c++ standard compiler flags
unconditionally for host builds.

Fixes:
http://autobuild.buildroot.net/results/895/8958cfb71efdd3ce32b2145237e865ca8a6a6a7f/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>
---
Changes:
	v2: rewrite patch subject text (Julien Corjon)

 ...tandard-compiler-flags-for-the-host-build.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/qt5/qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch

diff --git a/package/qt5/qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch b/package/qt5/qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch
new file mode 100644
index 0000000..54e4db8
--- /dev/null
+++ b/package/qt5/qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch
@@ -0,0 +1,44 @@
+From e69e69519661954716d59bfa5bbd0626515cfda9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 3 Mar 2016 15:17:31 +0100
+Subject: [PATCH] Disable c++ standard compiler flags for the host build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There is no test for c++ standard support for the host build
+(only for the target compiler/build) which leads to trouble
+in some cross compiling environments (old host compiler, new
+cross compiler):
+
+  g++: error: unrecognized command line option ?-std=c++1z?
+
+So disable c++ standard compiler flags unconditionally for host builds.
+
+Task-number: QTBUG-51644
+Change-Id: Ifb3042e125fe199a7e081740d1171d26ccacf0c5
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ mkspecs/features/default_post.prf | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/default_post.prf b/mkspecs/features/default_post.prf
+index cd8d885..561c8f4 100644
+--- a/mkspecs/features/default_post.prf
++++ b/mkspecs/features/default_post.prf
+@@ -95,7 +95,10 @@ breakpad {
+     !isEmpty(QMAKE_STRIP):QMAKE_POST_LINK = $$QMAKE_POST_LINK$$escape_expand(\\n\\t)$$quote($$QMAKE_STRIP $$DEBUGFILENAME)
+ }
+ 
+-c++11|c++14|c++1z {
++# Disable special compiler flags for host builds (needs to be changed for 5.7
++# to fall back to c++11 because since 5.7 c++11 is required everywhere,
++# including host builds).
++if(!host_build|!cross_compile):if(c++11|c++14|c++1z) {
+     c++1z:       cxxstd = CXX1Z
+     else: c++14: cxxstd = CXX14
+     else:        cxxstd = CXX11
+-- 
+2.1.4
+
-- 
2.1.4
