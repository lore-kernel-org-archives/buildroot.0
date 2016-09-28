From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Sep 2016 16:33:14 +0200
Subject: [Buildroot] [PATCH] lzop: unbreak powerpc build with GCC >= 5
Message-ID: <20160928143314.16109-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c60/c60554f7b84d5050b86c1735fb857856ddfa4dff/
http://autobuild.buildroot.net/results/888/888ea1aea200a71d0887754e2afabdc6b260bf2f/
http://autobuild.buildroot.net/results/219/219194d269d7f3cf4c3db120e6d8079085916bd3/

GCC >= 5 changed the behaviour of 'extern inline', causing linking errors
when the powerpc inline functions are used in multiple compilation units:

https://gcc.gnu.org/gcc-5/porting_to.html

Add a patch from openembedded to change it to use static inline (which has
the correct behaviour in both old/new GCC versions) to fix it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...inlines-as-the-external-inline-definition.patch | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch

diff --git a/package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch b/package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch
new file mode 100644
index 0000000..f6d076a
--- /dev/null
+++ b/package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch
@@ -0,0 +1,102 @@
+From ecccbcf66da53779d88e38e2af7f82eff8dde7f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Aug 2015 10:35:47 -0700
+Subject: [PATCH] use static inlines as the external inline definition has
+ changed with gcc5
+
+[Patch from https://raw.githubusercontent.com/openembedded/openembedded-core/master/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+Upstream-Status: Pending
+
+ src/miniacc.h | 24 ++++++++----------------
+ 1 file changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/src/miniacc.h b/src/miniacc.h
+index 09e6f0c..cae98d1 100644
+--- a/src/miniacc.h
++++ b/src/miniacc.h
+@@ -2880,8 +2880,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE16)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -2890,8 +2889,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
+ #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE16)
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
+     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+@@ -2916,8 +2914,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE32)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -2926,8 +2923,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
+ #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE32)
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
+     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+@@ -3307,8 +3303,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE16)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -3317,8 +3312,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
+ #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE16)
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
+     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+@@ -3343,8 +3337,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE32)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -3353,8 +3346,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
+ #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE32)
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
+     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+-- 
+2.5.0
+
-- 
2.9.3
