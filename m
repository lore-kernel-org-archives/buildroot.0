From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 23:34:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version 0.3.7
Message-ID: <20191222223443.3982071-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove both patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Makefile.arm-remove-march-flags.patch | 55 -------------------
 ...-argument-of-CPU_ISSET-for-glibc-2-5.patch | 36 ------------
 package/openblas/openblas.hash                |  2 +-
 package/openblas/openblas.mk                  |  2 +-
 4 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 package/openblas/0001-Makefile.arm-remove-march-flags.patch
 delete mode 100644 package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch

diff --git a/package/openblas/0001-Makefile.arm-remove-march-flags.patch b/package/openblas/0001-Makefile.arm-remove-march-flags.patch
deleted file mode 100644
index db975de59d..0000000000
--- a/package/openblas/0001-Makefile.arm-remove-march-flags.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From e6c498f68b61057fb5505e41c3858c2b5d223227 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Aug 2016 23:20:00 +0200
-Subject: [PATCH] Makefile.arm: remove -march flags
-
-The provided -march flags, especially for ARMv5 and ARMv6 may not
-necessarily match the needed ones: for ARMv5, it might be armv5,
-armv5te, armv5t, etc. If the wrong one is used, the incorrect toolchain
-sysroot can be used in a multilib toolchain.
-
-Therefore, let the user building OpenBLAS pass the appropriate -march
-flag.
-
-The other flags, such as -mfpu=vfp or -mfloat-abi=hard are kept, as they
-are actually required for the build to proceed (OpenBLAS uses VFP
-instructions, and assume an EABIhf ABI).
-
-[Peter: update for v0.2.20]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.arm | 13 ++++---------
- 1 file changed, 4 insertions(+), 9 deletions(-)
-
-diff --git a/Makefile.arm b/Makefile.arm
-index eedd39b7..b5d80f8e 100644
---- a/Makefile.arm
-+++ b/Makefile.arm
-@@ -1,7 +1,7 @@
- ifeq ($(CORE), $(filter $(CORE),ARMV7 CORTEXA9 CORTEXA15))
- ifeq ($(OSNAME), Android)
--CCOMMON_OPT += -mfpu=neon  -march=armv7-a
--FCOMMON_OPT += -mfpu=neon  -march=armv7-a
-+CCOMMON_OPT += -mfpu=neon
-+FCOMMON_OPT += -mfpu=neon
- else
- CCOMMON_OPT += -mfpu=vfpv3 -march=armv7-a
- FCOMMON_OPT += -mfpu=vfpv3 -march=armv7-a
-@@ -9,11 +9,6 @@ endif
- endif
- 
- ifeq ($(CORE), ARMV6)
--CCOMMON_OPT += -mfpu=vfp -march=armv6
--FCOMMON_OPT += -mfpu=vfp -march=armv6
--endif
--
--ifeq ($(CORE), ARMV5)
--CCOMMON_OPT += -march=armv5
--FCOMMON_OPT += -march=armv5
-+CCOMMON_OPT += -mfpu=vfp
-+FCOMMON_OPT += -mfpu=vfp
- endif
--- 
-2.11.0
-
diff --git a/package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch b/package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch
deleted file mode 100644
index cf15c6b8ed..0000000000
--- a/package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b43c8382c885551b0f230c8493e79bf04d94e366 Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Wed, 1 May 2019 10:46:46 +0200
-Subject: [PATCH] Correct argument of CPU_ISSET for glibc <2.5
-
-fixes #2104
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/xianyi/OpenBLAS/commit/b43c8382c885551b0f230c8493e79bf04d94e366]
----
- driver/others/memory.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/driver/others/memory.c b/driver/others/memory.c
-index ac8545f35..db14cde02 100644
---- a/driver/others/memory.c
-+++ b/driver/others/memory.c
-@@ -229,7 +229,7 @@ int get_num_procs(void) {
-   n=0;
-   #if !__GLIBC_PREREQ(2, 6)
-   for (i=0;i<nums;i++)
--     if (CPU_ISSET(i,cpuset)) n++;
-+     if (CPU_ISSET(i,&cpuset)) n++;
-   nums=n;
-   #else
-   nums = CPU_COUNT(sizeof(cpuset),&cpuset);
-@@ -1772,7 +1772,7 @@ int get_num_procs(void) {
-   n=0;
-   #if !__GLIBC_PREREQ(2, 6)
-   for (i=0;i<nums;i++)
--     if (CPU_ISSET(i,cpuset)) n++;
-+     if (CPU_ISSET(i,&cpuset)) n++;
-   nums=n;
-   #else
-   nums = CPU_COUNT(sizeof(cpuset),&cpuset);
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a167d88fa9..5b1fb17fa7 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e64c8fe083832ffbc1459ab6c72f71d53afd3b36e8497c922a15a06b72e9002f  openblas-0.3.6.tar.gz
+sha256 bde136122cef3dd6efe2de1c6f65c10955bbb0cc01a520c2342f5287c28f9379  openblas-0.3.7.tar.gz
 sha256 190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index c2e9e77794..f068402269 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.6
+OPENBLAS_VERSION = 0.3.7
 OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,v$(OPENBLAS_VERSION))
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.24.0
