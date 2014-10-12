From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 16:16:57 +0200
Subject: [Buildroot] [git commit] package/opencv: fix build failure on x86
Message-ID: <20141012142330.7B29AB26AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b581cc04f3b106928f3d0c3b7fb6c44e50c8a61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a patch fixing some opencv asm causing build failures on
i*86 with PIC.

This patch has been sent upstream [1].

Fixes:
  http://autobuild.buildroot.org/results/483/4838285b25d6293a5cf0bb9eadd5040a7c75d766/
  http://autobuild.buildroot.org/?reason=opencv-2.4.10&&arch=i686

[1] https://github.com/Itseez/opencv/pull/3331

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cv-0001-core-fix-x86-PIC-code-compilation.patch |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv-0001-core-fix-x86-PIC-code-compilation.patch b/package/opencv/opencv-0001-core-fix-x86-PIC-code-compilation.patch
new file mode 100644
index 0000000..9e8c2e9
--- /dev/null
+++ b/package/opencv/opencv-0001-core-fix-x86-PIC-code-compilation.patch
@@ -0,0 +1,49 @@
+From ea50be0529c248961e1b66293f8a9e4b807294a6 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 12 Oct 2014 10:17:23 +0200
+Subject: [PATCH] core: fix x86 PIC code compilation
+
+This bug was triggered by Buildroot autobuilders [1,2], causing this
+kind of failures [3,4]:
+
+  [ 14%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o
+  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp: In function '(static initializers for /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp)':
+  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp:280:10: error: inconsistent operand constraints in an 'asm'
+  make[3]: *** [modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o] Error 1
+
+[1] http://buildroot.org/
+[2] http://autobuild.buildroot.org/
+[3] http://autobuild.buildroot.org/?reason=opencv-2.4.10
+[4] http://autobuild.buildroot.org/results/483/4838285b25d6293a5cf0bb9eadd5040a7c75d766/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ modules/core/src/system.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
+index 5a970d5..e9ffdc7 100644
+--- a/modules/core/src/system.cpp
++++ b/modules/core/src/system.cpp
+@@ -267,14 +267,17 @@ struct HWFeatures
+          : "cc"
+         );
+         #else
++        // We need to preserve ebx since we are compiling PIC code.
++        // This means we cannot use "=b" for the 2nd output register.
+         asm volatile
+         (
+          "pushl %%ebx\n\t"
+          "movl $7,%%eax\n\t"
+          "movl $0,%%ecx\n\t"
+          "cpuid\n\t"
++         "movl %%ebx,%1\n\t"
+          "popl %%ebx\n\t"
+-         : "=a"(cpuid_data[0]), "=b"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
++         : "=a"(cpuid_data[0]), "=r"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
+          :
+          : "cc"
+         );
+-- 
+2.1.2
+
