From: Mischa Jonker <mischa.jonker@synopsys.com>
Date: Sun,  4 Nov 2012 12:16:14 +0100
Subject: [Buildroot] [PATCH] QT: Fix build for architectures using generic
	atomics
Message-ID: <1352027774-27536-1-git-send-email-mischa.jonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem has to do with const-correctness. This has been resolved
for various architectures, but not for the generic case.

    Signed-off-by: Mischa Jonker <mischa.jonker@synopsys.com>
---
 package/qt/qt-fix-const-atomics.patch |   50 +++++++++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/qt/qt-fix-const-atomics.patch

diff --git a/package/qt/qt-fix-const-atomics.patch b/package/qt/qt-fix-const-atomics.patch
new file mode 100644
index 0000000..6485356
--- /dev/null
+++ b/package/qt/qt-fix-const-atomics.patch
@@ -0,0 +1,50 @@
+From d4d07dac01796b2aa0fb501c14865cab7e42b3a9 Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mischa.jonker@synopsys.com>
+Date: Sun, 4 Nov 2012 11:42:04 +0100
+Subject: [PATCH] Fix const-related build error in generic atomic ops
+
+It's still not entirely const-correct though. In all other architectures
+this is obfuscated through the use of inline asm (which the compiler
+doesn't check). This patch obfuscates through const_cast
+---
+ src/corelib/arch/generic/qatomic_generic_unix.cpp |    8 ++++----
+ src/corelib/arch/qatomic_generic.h                |    2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/corelib/arch/generic/qatomic_generic_unix.cpp b/src/corelib/arch/generic/qatomic_generic_unix.cpp
+index 1c6cbf0..6fce81d 100644
+--- a/src/corelib/arch/generic/qatomic_generic_unix.cpp
++++ b/src/corelib/arch/generic/qatomic_generic_unix.cpp
+@@ -85,13 +85,13 @@ int QBasicAtomicInt_fetchAndAddOrdered(volatile int *_q_value, int valueToAdd)
+ 
+ Q_CORE_EXPORT
+ bool QBasicAtomicPointer_testAndSetOrdered(void * volatile *_q_value,
+-                                           void *expectedValue,
+-                                           void *newValue)
++                                           const void *expectedValue,
++                                           const void *newValue)
+ {
+     bool returnValue = false;
+     pthread_mutex_lock(&qAtomicMutex);
+     if (*_q_value == expectedValue) {
+-        *_q_value = newValue;
++        *_q_value = const_cast<void*>(newValue);
+         returnValue = true;
+     }
+     pthread_mutex_unlock(&qAtomicMutex);
+diff --git a/src/corelib/arch/qatomic_generic.h b/src/corelib/arch/qatomic_generic.h
+index 621a767..4c14679 100644
+--- a/src/corelib/arch/qatomic_generic.h
++++ b/src/corelib/arch/qatomic_generic.h
+@@ -105,7 +105,7 @@ Q_CORE_EXPORT bool QBasicAtomicInt_testAndSetOrdered(volatile int *, int, int);
+ Q_CORE_EXPORT int QBasicAtomicInt_fetchAndStoreOrdered(volatile int *, int);
+ Q_CORE_EXPORT int QBasicAtomicInt_fetchAndAddOrdered(volatile int *, int);
+ 
+-Q_CORE_EXPORT bool QBasicAtomicPointer_testAndSetOrdered(void * volatile *, void *, void *);
++Q_CORE_EXPORT bool QBasicAtomicPointer_testAndSetOrdered(void * volatile *, const void *, const void *);
+ Q_CORE_EXPORT void *QBasicAtomicPointer_fetchAndStoreOrdered(void * volatile *, void *);
+ Q_CORE_EXPORT void *QBasicAtomicPointer_fetchAndAddOrdered(void * volatile *, qptrdiff);
+ 
+-- 
+1.7.0.4
+
-- 
1.7.0.4
