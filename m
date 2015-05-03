From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 19:33:31 +0200
Subject: [Buildroot] [git commit] libfreeimage: add patch to fix x86 build
	problem
Message-ID: <20150503173426.01B9B80836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21c656bc47e8f042e4eee52c285baa0e778fd07c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix an x86 build problem caused by invalid register
usage when -fPIC is used.

Fixes:

  http://autobuild.buildroot.org/results/fe7/fe72243a84a91b68ef3138847294674b36f16c58/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreeimage/0002-fix-cpuid-x86.patch |   67 +++++++++++++++++++++++++
 1 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/libfreeimage/0002-fix-cpuid-x86.patch b/package/libfreeimage/0002-fix-cpuid-x86.patch
new file mode 100644
index 0000000..98b0e9c
--- /dev/null
+++ b/package/libfreeimage/0002-fix-cpuid-x86.patch
@@ -0,0 +1,67 @@
+Fix build issue caused by invalid register usage on x86
+
+Patch taken from https://github.com/openexr/openexr/issues/128.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp
+===================================================================
+--- a/Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp
++++ b/Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp
+@@ -40,21 +40,19 @@
+ 
+ namespace {
+ #if defined(IMF_HAVE_SSE2) &&  defined(__GNUC__)
+-
++#include <cpuid.h>
+     // Helper functions for gcc + SSE enabled
+-    void cpuid(int n, int &eax, int &ebx, int &ecx, int &edx)
++    void cpuid(unsigned int n, unsigned int &eax, unsigned int &ebx,
++					unsigned int &ecx, unsigned int &edx)
+     {
+-        __asm__ __volatile__ (
+-            "cpuid"
+-            : /* Output  */ "=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx) 
+-            : /* Input   */ "a"(n)
+-            : /* Clobber */);
++		__get_cpuid(n, &eax, &ebx, &ecx, &edx);
+     }
+ 
+ #else // IMF_HAVE_SSE2 && __GNUC__
+ 
+     // Helper functions for generic compiler - all disabled
+-    void cpuid(int n, int &eax, int &ebx, int &ecx, int &edx)
++    void cpuid(unsigned int n, unsigned int &eax, unsigned int &ebx,
++					unsigned int &ecx, unsigned int &edx)
+     {
+         eax = ebx = ecx = edx = 0;
+     }
+@@ -64,7 +62,7 @@
+ 
+ #ifdef OPENEXR_IMF_HAVE_GCC_INLINE_ASM_AVX
+ 
+-    void xgetbv(int n, int &eax, int &edx)
++    void xgetbv(unsigned int n, unsigned int &eax, unsigned int &edx)
+     {
+         __asm__ __volatile__ (
+             "xgetbv"
+@@ -75,7 +73,7 @@
+ 
+ #else //  OPENEXR_IMF_HAVE_GCC_INLINE_ASM_AVX
+ 
+-    void xgetbv(int n, int &eax, int &edx)
++    void xgetbv(unsigned int n, unsigned int &eax, unsigned int &edx)
+     {
+         eax = edx = 0;
+     }
+@@ -94,8 +92,8 @@
+     f16c(false)
+ {
+     bool osxsave = false;
+-    int  max     = 0;
+-    int  eax, ebx, ecx, edx;
++    unsigned int  max     = 0;
++    unsigned int  eax, ebx, ecx, edx;
+ 
+     cpuid(0, max, ebx, ecx, edx);
+     if (max > 0)
