From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Oct 2018 22:05:10 +0200
Subject: [Buildroot] [PATCH 1/1] opencv3: fix build on sparc64
Message-ID: <20181021200510.16171-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d27fa3eb3ea600698571837981a3a15d556724ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...otobuf-fix-compilation-issue-on-s390.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch

diff --git a/package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch b/package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch
new file mode 100644
index 0000000000..7743eae533
--- /dev/null
+++ b/package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch
@@ -0,0 +1,38 @@
+From ac9ec55b37b2dd3b224144b4f20857a80719b750 Mon Sep 17 00:00:00 2001
+From: Loic Devulder <ldevulder@suse.de>
+Date: Fri, 28 Sep 2018 15:33:18 +0200
+Subject: [PATCH] 3rdparty/protobuf: fix compilation issue on s390
+
+This commit fixes an issue while trying to compile
+on s390x architecture.
+
+This is simply a backport of a fixe already applied
+in official protobuf code:
+- https://github.com/protocolbuffers/protobuf/pull/3955
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/opencv/opencv/commit/ac9ec55b37b2dd3b224144b4f20857a80719b750]
+---
+ .../protobuf/stubs/atomicops_internals_generic_gcc.h      | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h b/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
+index 0b0b06ce6cf..075c406abab 100644
+--- a/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
++++ b/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
+@@ -146,6 +146,14 @@ inline Atomic64 NoBarrier_Load(volatile const Atomic64* ptr) {
+   return __atomic_load_n(ptr, __ATOMIC_RELAXED);
+ }
+ 
++inline Atomic64 Release_CompareAndSwap(volatile Atomic64* ptr,
++                                       Atomic64 old_value,
++                                       Atomic64 new_value) {
++  __atomic_compare_exchange_n(ptr, &old_value, new_value, false,
++                              __ATOMIC_RELEASE, __ATOMIC_ACQUIRE);
++  return old_value;
++}
++
+ #endif // defined(__LP64__)
+ 
+ }  // namespace internal
-- 
2.17.1
