From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Mar 2017 17:03:15 +0000
Subject: [Buildroot] [PATCH v2] qt5base: fix compilation error with gcc-4.8
Message-ID: <20170309170315.18299-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix a compilation error when using gcc-4.8.

Bug report: https://bugreports.qt.io/browse/QTBUG-59399
Patch sent upstream: https://codereview.qt-project.org/#/c/187980/

Fixes:
  http://autobuild.buildroot.net/results/2ac/2ac16335d16cd53cceeabda8f963c9b288a9a1c8/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1->v2: fix typo in commit message.

 ...s-explicit-failure-mode-to-std-atomic-com.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch

diff --git a/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch b/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
new file mode 100644
index 0000000..c05388d
--- /dev/null
+++ b/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
@@ -0,0 +1,71 @@
+QAtomic: pass explicit failure mode to std::atomic::compare_exchange_strong
+
+This patch fixes a compilation error when building qt5base with gcc-4.8.
+
+Bug report: https://bugreports.qt.io/browse/QTBUG-59399
+Patch sent upstream: https://codereview.qt-project.org/#/c/187980/
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.org>
+
+From c5d7425f8ad391112758db161e3e08f18dc9d299 Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@kdab.com>
+Date: Thu, 26 May 2016 08:30:26 +0200
+Subject: [PATCH] QAtomic: pass explicit failure mode to
+ std::atomic::compare_exchange_strong
+
+... in an attempt to avoid GCC 4.8 errors such as
+
+  bits/atomic_base.h:577:70: error: failure memory model cannot be stronger than success memory model for '__atomic_compare_exchange'
+  return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);
+                                                                      ^
+
+as seen on Android.
+
+Change-Id: If046e735888cf331d2d6506d8d5ca9aa7402f9ad
+---
+ src/corelib/arch/qatomic_cxx11.h |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/corelib/arch/qatomic_cxx11.h b/src/corelib/arch/qatomic_cxx11.h
+index bb49aae..d6731ec 100644
+--- a/src/corelib/arch/qatomic_cxx11.h
++++ b/src/corelib/arch/qatomic_cxx11.h
+@@ -153,7 +153,7 @@ template <typename X> struct QAtomicOps
+     template <typename T>
+     static bool testAndSetRelaxed(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
+     {
+-        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_relaxed);
++        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_relaxed, std::memory_order_relaxed);
+         if (currentValue)
+             *currentValue = expectedValue;
+         return tmp;
+@@ -162,7 +162,7 @@ template <typename X> struct QAtomicOps
+     template <typename T>
+     static bool testAndSetAcquire(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
+     {
+-        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acquire);
++        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acquire, std::memory_order_acquire);
+         if (currentValue)
+             *currentValue = expectedValue;
+         return tmp;
+@@ -171,7 +171,7 @@ template <typename X> struct QAtomicOps
+     template <typename T>
+     static bool testAndSetRelease(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
+     {
+-        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_release);
++        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_release, std::memory_order_relaxed);
+         if (currentValue)
+             *currentValue = expectedValue;
+         return tmp;
+@@ -180,7 +180,7 @@ template <typename X> struct QAtomicOps
+     template <typename T>
+     static bool testAndSetOrdered(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
+     {
+-        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acq_rel);
++        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acq_rel, std::memory_order_acquire);
+         if (currentValue)
+             *currentValue = expectedValue;
+         return tmp;
+-- 
+1.7.10.4
+
-- 
2.10.2
