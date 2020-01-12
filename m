From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 11:33:32 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/opencv3: bump to
 version 3.4.6
Message-ID: <20200112104514.3FB578B4D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0f943cc55123db3771b0f59b6ccd7a01d4cd253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Remove patch (already in version)
- Update hash of license file (update in year:
  https://github.com/opencv/opencv/commit/14d943f588474cee3cdb8f91e8f7fb7e8af7ad8b)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc21a64386fba8b9dd6a0e7dbd2786d7a7ae82f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ty-protobuf-fix-compilation-issue-on-s390.patch | 38 ----------------------
 package/opencv3/opencv3.hash                       |  4 +--
 package/opencv3/opencv3.mk                         |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch b/package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch
deleted file mode 100644
index 7743eae533..0000000000
--- a/package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ac9ec55b37b2dd3b224144b4f20857a80719b750 Mon Sep 17 00:00:00 2001
-From: Loic Devulder <ldevulder@suse.de>
-Date: Fri, 28 Sep 2018 15:33:18 +0200
-Subject: [PATCH] 3rdparty/protobuf: fix compilation issue on s390
-
-This commit fixes an issue while trying to compile
-on s390x architecture.
-
-This is simply a backport of a fixe already applied
-in official protobuf code:
-- https://github.com/protocolbuffers/protobuf/pull/3955
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/opencv/opencv/commit/ac9ec55b37b2dd3b224144b4f20857a80719b750]
----
- .../protobuf/stubs/atomicops_internals_generic_gcc.h      | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h b/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
-index 0b0b06ce6cf..075c406abab 100644
---- a/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
-+++ b/3rdparty/protobuf/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
-@@ -146,6 +146,14 @@ inline Atomic64 NoBarrier_Load(volatile const Atomic64* ptr) {
-   return __atomic_load_n(ptr, __ATOMIC_RELAXED);
- }
- 
-+inline Atomic64 Release_CompareAndSwap(volatile Atomic64* ptr,
-+                                       Atomic64 old_value,
-+                                       Atomic64 new_value) {
-+  __atomic_compare_exchange_n(ptr, &old_value, new_value, false,
-+                              __ATOMIC_RELEASE, __ATOMIC_ACQUIRE);
-+  return old_value;
-+}
-+
- #endif // defined(__LP64__)
- 
- }  // namespace internal
diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 34baf260d4..0b88b52da5 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4eef85759d5450b183459ff216b4c0fa43e87a4f6aa92c8af649f89336f002ec  opencv3-3.4.3.tar.gz
-sha256 fea311907cb6271b05ff5843b238e0f2edb6f204a3432975211030d20704b321  LICENSE
+sha256 e7d311ff97f376b8ee85112e2b536dbf4bdf1233673500175ed7cf21a0089f6d  opencv3-3.4.6.tar.gz
+sha256 488b640f88bc72a1f9bbb985bde8352ed8826b863f0b3e14f7038c44bf95d6bc  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index f720464543..5bc6376ca3 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.3
+OPENCV3_VERSION = 3.4.6
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
