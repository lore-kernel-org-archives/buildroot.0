From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon,  6 Jul 2020 17:33:55 +0200
Subject: [Buildroot] [PATCH] package/dbus-cpp: new patch to fix dbus c++
 threading issue
Message-ID: <20200706153355.429941-1-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: https://sourceforge.net/p/dbus-cplusplus/patches/18/

dispatcher.h has invalid template code. When DBUS_HAS_RECURSIVE_MUTEX is
MutexFreeFn and MutexLockFn become of type void and the code is valid.
See lines 232-235.
However, when a user #includes dispatcher.h directly or indirectly the
macro DBUS_HAS_RECURSIVE_MUTEX is undefined. This makes the above
function pointers defined of type bool and but then _init_threading
function call in line 259 becomes invalid, as it passes function
pointers to mutex_free and mutex_lock which or of type void.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 .../dbus-cpp/0004-dbus-c++-threading.patch    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/dbus-cpp/0004-dbus-c++-threading.patch

diff --git a/package/dbus-cpp/0004-dbus-c++-threading.patch b/package/dbus-cpp/0004-dbus-c++-threading.patch
new file mode 100644
index 0000000000..502320ad09
--- /dev/null
+++ b/package/dbus-cpp/0004-dbus-c++-threading.patch
@@ -0,0 +1,45 @@
+--- libdbus-c++-0.9.0/include/dbus-c++/dispatcher.h.threading	2017-02-15 13:40:53.796004263 +0000
++++ libdbus-c++-0.9.0/include/dbus-c++/dispatcher.h	2017-02-15 13:40:46.907000493 +0000
+@@ -188,6 +188,7 @@
+ /* classes for multithreading support
+ */
+
++#if 0
+ class DXXAPI Mutex
+ {
+ public:
+@@ -243,9 +244,11 @@
+ typedef bool (*CondVarWaitTimeoutFn)(CondVar *cv, Mutex *mx, int timeout);
+ typedef void (*CondVarWakeOneFn)(CondVar *cv);
+ typedef void (*CondVarWakeAllFn)(CondVar *cv);
++#endif
+
+ void DXXAPI _init_threading();
+
++#if 0
+ void DXXAPI _init_threading(
+   MutexNewFn, MutexFreeFn, MutexLockFn, MutexUnlockFn,
+   CondVarNewFn, CondVarFreeFn, CondVarWaitFn, CondVarWaitTimeoutFn, CondVarWakeOneFn, CondVarWakeAllFn
+@@ -312,6 +315,7 @@
+     cv->wake_all();
+   }
+ };
++#endif
+
+ } /* namespace DBus */
+
+--- libdbus-c++-0.9.0/src/dispatcher.cpp.threading	2017-02-15 13:48:22.627249868 +0000
++++ libdbus-c++-0.9.0/src/dispatcher.cpp	2017-02-15 13:48:29.164253445 +0000
+@@ -253,6 +253,7 @@
+ #endif//DBUS_HAS_THREADS_INIT_DEFAULT
+ }
+
++#if 0
+ void DBus::_init_threading(
+   MutexNewFn m1,
+   MutexFreeFn m2,
+@@ -318,3 +319,4 @@
+ #endif//DBUS_HAS_RECURSIVE_MUTEX
+   dbus_threads_init(&functions);
+ }
++#endif
-- 
2.26.2
