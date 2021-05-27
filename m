From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 May 2021 23:04:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: fix build on riscv32
Message-ID: <20210527210402.555334-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1c1cd4775241ee57d878cad5c978413d4b4a8736

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...it-architectures-using-64-bit-time_t.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch

diff --git a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
new file mode 100644
index 0000000000..ce70ab8f29
--- /dev/null
+++ b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
@@ -0,0 +1,37 @@
+From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 12:10:28 -0800
+Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
+
+mutex code uses SYS_futex, which it expects from system C library.
+in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
+rv32 is using 64bit time_t from get go unlike other 32bit architectures
+in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
+this aliases it to NR_futex so that SYS_futex is then defined for rv32
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Retrieved from:
+https://github.com/capnproto/capnproto/commit/e2a05a19e9dc51287e19cc9f11fd91449219e361]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ c++/src/kj/mutex.c++ | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
+index c81cead7b..e1594b117 100644
+--- a/c++/src/kj/mutex.c++
++++ b/c++/src/kj/mutex.c++
+@@ -39,7 +39,13 @@
+ 
+ #ifndef SYS_futex
+ // Missing on Android/Bionic.
++#ifdef __NR_futex
+ #define SYS_futex __NR_futex
++#elif defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#else
++#error "Need working SYS_futex"
++#endif
+ #endif
+ 
+ #ifndef FUTEX_WAIT_PRIVATE
-- 
2.30.2
