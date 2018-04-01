From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 12:45:13 +0200
Subject: [Buildroot] [git commit] openblas: bump version to v0.2.20
Message-ID: <20180401104615.568DA7FD6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dae0d7b3caae25246882455e6204fea9b367ab24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0001-Complete-support-for-MIPS-n32-ABI.patch as it is now upstream and rebase
0002-Makefile.arm-remove-march-flags.patch.

Also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Complete-support-for-MIPS-n32-ABI.patch   | 116 ---------------------
 .../0001-Makefile.arm-remove-march-flags.patch     |  55 ++++++++++
 .../0002-Makefile.arm-remove-march-flags.patch     |  73 -------------
 package/openblas/openblas.hash                     |   3 +-
 package/openblas/openblas.mk                       |   2 +-
 5 files changed, 58 insertions(+), 191 deletions(-)

diff --git a/package/openblas/0001-Complete-support-for-MIPS-n32-ABI.patch b/package/openblas/0001-Complete-support-for-MIPS-n32-ABI.patch
deleted file mode 100644
index 6e6c5a68bc..0000000000
--- a/package/openblas/0001-Complete-support-for-MIPS-n32-ABI.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 7f28cd1f88145a701e5dbbf50558bb65fce79f61 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 14 Jul 2016 17:20:51 +0100
-Subject: [PATCH] Complete support for MIPS n32 ABI
-
-Pull request: https://github.com/xianyi/OpenBLAS/pull/926
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- Makefile.system | 27 +++++++++------------------
- c_check         |  9 +++++++--
- f_check         |  7 ++++++-
- 3 files changed, 22 insertions(+), 21 deletions(-)
-
-diff --git a/Makefile.system b/Makefile.system
-index 24a7a64..bbcdb82 100644
---- a/Makefile.system
-+++ b/Makefile.system
-@@ -502,13 +502,16 @@ endif
- 
- ifdef NO_BINARY_MODE
- 
--ifeq ($(ARCH), $(filter $(ARCH),mips64 mips))
-+ifeq ($(ARCH), $(filter $(ARCH),mips64))
- ifdef BINARY64
- CCOMMON_OPT += -mabi=64
- else
--CCOMMON_OPT += -mabi=32
-+CCOMMON_OPT += -mabi=n32
- endif
- BINARY_DEFINED = 1
-+else ifeq ($(ARCH), $(filter $(ARCH),mips))
-+CCOMMON_OPT += -mabi=32
-+BINARY_DEFINED = 1
- endif
- 
- ifeq ($(CORE), LOONGSON3A)
-@@ -599,12 +602,14 @@ ifneq ($(NO_LAPACK), 1)
- EXTRALIB += -lgfortran
- endif
- ifdef NO_BINARY_MODE
--ifeq ($(ARCH), $(filter $(ARCH),mips64 mips))
-+ifeq ($(ARCH), $(filter $(ARCH),mips64))
- ifdef BINARY64
- FCOMMON_OPT += -mabi=64
- else
--FCOMMON_OPT += -mabi=32
-+FCOMMON_OPT += -mabi=n32
- endif
-+else ifeq ($(ARCH), $(filter $(ARCH),mips))
-+FCOMMON_OPT += -mabi=32
- endif
- else
- ifdef BINARY64
-@@ -688,20 +693,6 @@ endif
- endif
- endif
- 
--ifeq ($(filter $(ARCH),mips64 mips))
--ifndef BINARY64
--FCOMMON_OPT += -m32
--else
--FCOMMON_OPT += -m64
--endif
--else
--ifdef BINARY64
--FCOMMON_OPT += -mabi=64
--else
--FCOMMON_OPT += -mabi=32
--endif
--endif
--
- ifeq ($(USE_OPENMP), 1)
- FCOMMON_OPT += -mp
- endif
-diff --git a/c_check b/c_check
-index 50ff360..9f457df 100644
---- a/c_check
-+++ b/c_check
-@@ -79,8 +79,13 @@ if ($os eq "AIX") {
-     $defined = 1;
- }
- 
--if (($architecture eq "mips") || ($architecture eq "mips64")) {
--    $compiler_name .= " -mabi=32" if ($binary eq "32");
-+if ($architecture eq "mips") {
-+    $compiler_name .= " -mabi=32";
-+    $defined = 1;
-+}
-+
-+if ($architecture eq "mips64") {
-+    $compiler_name .= " -mabi=n32" if ($binary eq "32");
-     $compiler_name .= " -mabi=64" if ($binary eq "64");
-     $defined = 1;
- }
-diff --git a/f_check b/f_check
-index 4c03ac7..3520e8b 100644
---- a/f_check
-+++ b/f_check
-@@ -223,7 +223,12 @@ if (!$?) {
- 	}
-        #For gfortran MIPS
- 	if ($?) {
--	    $link = `$compiler $openmp -mabi=32 -v ftest2.f 2>&1 && rm -f a.out a.exe`;
-+            $mips_data = `$compiler_bin -E -dM - < /dev/null`;
-+            if ($mips_data =~ /_MIPS_ISA_MIPS64/) {
-+	        $link = `$compiler $openmp -mabi=n32 -v ftest2.f 2>&1 && rm -f a.out a.exe`;
-+	    } else {
-+	        $link = `$compiler $openmp -mabi=32 -v ftest2.f 2>&1 && rm -f a.out a.exe`;
-+	    }
- 	}
- 	$binary = "" if ($?);
-     }
--- 
-2.7.3
-
diff --git a/package/openblas/0001-Makefile.arm-remove-march-flags.patch b/package/openblas/0001-Makefile.arm-remove-march-flags.patch
new file mode 100644
index 0000000000..db975de59d
--- /dev/null
+++ b/package/openblas/0001-Makefile.arm-remove-march-flags.patch
@@ -0,0 +1,55 @@
+From e6c498f68b61057fb5505e41c3858c2b5d223227 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 Aug 2016 23:20:00 +0200
+Subject: [PATCH] Makefile.arm: remove -march flags
+
+The provided -march flags, especially for ARMv5 and ARMv6 may not
+necessarily match the needed ones: for ARMv5, it might be armv5,
+armv5te, armv5t, etc. If the wrong one is used, the incorrect toolchain
+sysroot can be used in a multilib toolchain.
+
+Therefore, let the user building OpenBLAS pass the appropriate -march
+flag.
+
+The other flags, such as -mfpu=vfp or -mfloat-abi=hard are kept, as they
+are actually required for the build to proceed (OpenBLAS uses VFP
+instructions, and assume an EABIhf ABI).
+
+[Peter: update for v0.2.20]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile.arm | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile.arm b/Makefile.arm
+index eedd39b7..b5d80f8e 100644
+--- a/Makefile.arm
++++ b/Makefile.arm
+@@ -1,7 +1,7 @@
+ ifeq ($(CORE), $(filter $(CORE),ARMV7 CORTEXA9 CORTEXA15))
+ ifeq ($(OSNAME), Android)
+-CCOMMON_OPT += -mfpu=neon  -march=armv7-a
+-FCOMMON_OPT += -mfpu=neon  -march=armv7-a
++CCOMMON_OPT += -mfpu=neon
++FCOMMON_OPT += -mfpu=neon
+ else
+ CCOMMON_OPT += -mfpu=vfpv3 -march=armv7-a
+ FCOMMON_OPT += -mfpu=vfpv3 -march=armv7-a
+@@ -9,11 +9,6 @@ endif
+ endif
+ 
+ ifeq ($(CORE), ARMV6)
+-CCOMMON_OPT += -mfpu=vfp -march=armv6
+-FCOMMON_OPT += -mfpu=vfp -march=armv6
+-endif
+-
+-ifeq ($(CORE), ARMV5)
+-CCOMMON_OPT += -march=armv5
+-FCOMMON_OPT += -march=armv5
++CCOMMON_OPT += -mfpu=vfp
++FCOMMON_OPT += -mfpu=vfp
+ endif
+-- 
+2.11.0
+
diff --git a/package/openblas/0002-Makefile.arm-remove-march-flags.patch b/package/openblas/0002-Makefile.arm-remove-march-flags.patch
deleted file mode 100644
index 39058f7dfc..0000000000
--- a/package/openblas/0002-Makefile.arm-remove-march-flags.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 71b9e9b7f080c464777d07bd1a917a1c449d2ef8 Mon Sep 17 00:00:00 2001
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
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.arm | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/Makefile.arm b/Makefile.arm
-index 62bf275..c0d6ab8 100644
---- a/Makefile.arm
-+++ b/Makefile.arm
-@@ -1,31 +1,31 @@
- # ifeq logical or
- ifeq ($(CORE), $(filter $(CORE),CORTEXA9 CORTEXA15))
- ifeq ($(OSNAME), Android)
--CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a
--FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a
-+CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard
-+FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard
- else
--CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
--FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
-+CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
-+FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
- endif
- endif
- 
- ifeq ($(CORE), ARMV7)
- ifeq ($(OSNAME), Android)
--CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a -Wl,--no-warn-mismatch
--FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a -Wl,--no-warn-mismatch
-+CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -Wl,--no-warn-mismatch
-+FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -Wl,--no-warn-mismatch
- else
--CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
--FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
-+CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
-+FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
- endif
- endif
- 
- ifeq ($(CORE), ARMV6)
--CCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard  -march=armv6
--FCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard  -march=armv6
-+CCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard
-+FCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard
- endif
- 
- 
- ifeq ($(CORE), ARMV5)
--CCOMMON_OPT += -marm -march=armv5
--FCOMMON_OPT += -marm -march=armv5
-+CCOMMON_OPT += -marm
-+FCOMMON_OPT += -marm
- endif
--- 
-2.7.4
-
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index b402cac522..e4a3989f67 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2ad0270a39dbaf891b439baacf198ea4ab149cd6ed39a5f50c494723f1936be5  openblas-f04af36ad0e85b64f12a7c38095383192cc52345.tar.gz
+sha256 5ef38b15d9c652985774869efd548b8e3e972e1e99475c673b25537ed7bcf394  openblas-v0.2.20.tar.gz
+sha256 190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 93dbc1f932..e9a87b0262 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = f04af36ad0e85b64f12a7c38095383192cc52345
+OPENBLAS_VERSION = v0.2.20
 OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
