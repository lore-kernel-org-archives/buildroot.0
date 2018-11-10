From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Nov 2018 15:20:41 +0100
Subject: [Buildroot] [PATCH 1/1] supertuxkart: fix build on bdver3
Message-ID: <20181110142041.17651-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Retrieve upstream patch to fix build failure in
lib/graphics_utils/mipmap/cpusimd.h due to direct inclusion of
intrinsics headers:
https://github.com/supertuxkart/stk-code/issues/3091

Fixes:
 - http://autobuild.buildroot.org/results/52bd5c45b0d04a863a2530d388899b3e46494ee9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supertuxkart/0001-Fix-3091.patch | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/supertuxkart/0001-Fix-3091.patch

diff --git a/package/supertuxkart/0001-Fix-3091.patch b/package/supertuxkart/0001-Fix-3091.patch
new file mode 100644
index 0000000000..dae2a37ce1
--- /dev/null
+++ b/package/supertuxkart/0001-Fix-3091.patch
@@ -0,0 +1,59 @@
+From 813b08bc73e4e93714b972ee56c64b4771735e01 Mon Sep 17 00:00:00 2001
+From: Benau <Benau@users.noreply.github.com>
+Date: Sun, 14 Jan 2018 10:19:37 +0800
+Subject: [PATCH] Fix #3091
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com
+[Retrieved from:
+https://github.com/supertuxkart/stk-code/commit/813b08bc73e4e93714b972ee56c64b4771735e01]
+---
+ lib/graphics_utils/mipmap/cpusimd.h | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/graphics_utils/mipmap/cpusimd.h b/lib/graphics_utils/mipmap/cpusimd.h
+index 1dc2c730b2..5e2cf30e5f 100644
+--- a/lib/graphics_utils/mipmap/cpusimd.h
++++ b/lib/graphics_utils/mipmap/cpusimd.h
+@@ -38,11 +38,11 @@
+  #include <mmintrin.h>
+  #define CPU_MMX_SUPPORT (1)
+ #endif
+-#if __SSE__ || _M_X64 || _M_IX86_FP >= 1  || CPU_ENABLE_SSE
++#if __SSE__ || defined(_M_X64) || ( defined(_M_IX86_FP) && ( _M_IX86_FP >= 1 ) ) || CPU_ENABLE_SSE
+  #include <xmmintrin.h>
+  #define CPU_SSE_SUPPORT (1)
+ #endif
+-#if __SSE2__ || _M_X64 || _M_IX86_FP >= 2  || CPU_ENABLE_SSE2
++#if __SSE2__ || defined(_M_X64) || ( defined(_M_IX86_FP) && ( _M_IX86_FP >= 2 ) ) || CPU_ENABLE_SSE2
+  #include <emmintrin.h>
+  #define CPU_SSE2_SUPPORT (1)
+ #endif
+@@ -95,23 +95,23 @@
+  #define CPU_POPCNT_SUPPORT (1)
+ #endif
+ #if __LZCNT__ || CPU_ENABLE_LZCNT
+- #include <lzcntintrin.h>
++ #include <x86intrin.h>
+  #define CPU_LZCNT_SUPPORT (1)
+ #endif
+ #if __F16C__ || CPU_ENABLE_F16C
+- #include <f16cintrin.h>
++ #include <x86intrin.h>
+  #define CPU_F16C_SUPPORT (1)
+ #endif
+ #if __BMI__ || CPU_ENABLE_BMI
+- #include <bmiintrin.h>
++ #include <x86intrin.h>
+  #define CPU_BMI_SUPPORT (1)
+ #endif
+ #if __BMI2__ || CPU_ENABLE_BMI2
+- #include <bmi2intrin.h>
++ #include <x86intrin.h>
+  #define CPU_BMI2_SUPPORT (1)
+ #endif
+ #if __TBM__ || CPU_ENABLE_TBM
+- #include <tbmintrin.h>
++ #include <x86intrin.h>
+  #define CPU_TBM_SUPPORT (1)
+ #endif
+ 
-- 
2.17.1
