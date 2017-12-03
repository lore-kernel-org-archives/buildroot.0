From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat,  2 Dec 2017 21:33:20 -0600
Subject: [Buildroot] [PATCH 1/2] kvm-unit-tests: bump to
 kvm-unit-tests-20171020
Message-ID: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                         |  3 +-
 ...ile-remove-Werror-to-avoid-build-failures.patch | 29 +++++++++---------
 ...clock-be-explicit-about-mul-instruction-d.patch | 35 ----------------------
 package/kvm-unit-tests/kvm-unit-tests.hash         |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk           |  2 +-
 5 files changed, 19 insertions(+), 52 deletions(-)
 delete mode 100644 package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 27b22f4f0f..b6504210d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -443,7 +443,7 @@ F:	package/znc/
 
 N:	Cyril Bur <cyrilbur@gmail.com>
 F:	arch/Config.in.powerpc
-F:	package/kvm-unit-tests
+F:	package/kvm-unit-tests/
 
 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/libamcodec/
@@ -1084,6 +1084,7 @@ F:	package/iperf/
 F:	package/iperf3/
 F:	package/iputils/
 F:	package/iw/
+F:	package/kvm-unit-tests/
 F:	package/libcsv/
 F:	package/libcurl/
 F:	package/libfcgi/
diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
index b1ea09272e..699be171d0 100644
--- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
+++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
@@ -1,26 +1,27 @@
-From 08e14a662b9e75daec29722e49150869952ba1b6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 20 Nov 2017 22:09:39 +0100
+From e9490197169d146060a26e96eca2901375d5cd5e Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Sat, 2 Dec 2017 21:24:30 -0600
 Subject: [PATCH] Makefile: remove -Werror to avoid build failures
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Refactoring of Thomas Petazzoni's original.
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 ---
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 16ce297..909498e 100644
+index 7231334..d9ad42b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -45,7 +45,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
-               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
- 
- CFLAGS += -g
--CFLAGS += $(autodepend-flags) -Wall -Werror
-+CFLAGS += $(autodepend-flags) -Wall
+@@ -53,7 +53,6 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
+ COMMON_CFLAGS += -g $(autodepend-flags)
+ COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
+ COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
+-COMMON_CFLAGS += -Werror
  frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
  fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
  fnostack_protector := $(call cc-option, -fno-stack-protector, "")
 -- 
-2.13.6
+2.14.2
 
diff --git a/package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch b/package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch
deleted file mode 100644
index c8ee6b1ac4..0000000000
--- a/package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 022ae220d6e7b5bd064bc8698c271dca4dac7d8c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 8 May 2017 22:27:25 +0200
-Subject: [PATCH] x86/hyperv_clock: be explicit about mul instruction data size
-
-With gcc 4.7.2, the build fails with:
-
-x86/hyperv_clock.c: Assembler messages:
-x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction
-
-In order to avoid this, make the mul instruction data size explicit by
-adding the appropriate suffix. It operates on 64-bit data, so use
-"mulq".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- x86/hyperv_clock.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/x86/hyperv_clock.c b/x86/hyperv_clock.c
-index 8b1deba..6c4dd56 100644
---- a/x86/hyperv_clock.c
-+++ b/x86/hyperv_clock.c
-@@ -19,7 +19,7 @@ static inline u64 scale_delta(u64 delta, u64 mul_frac)
- 	u64 product, unused;
- 
- 	__asm__ (
--		"mul %3"
-+		"mulq %3"
- 		: "=d" (product), "=a" (unused) : "1" (delta), "rm" ((u64)mul_frac) );
- 
- 	return product;
--- 
-2.7.4
-
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 2a4cfe021a..bb827de939 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ccb9ff17a2c7d6c7d50b4b71b87381181b45484187100ae5b1ac54d9d61e8666  kvm-unit-tests-95062c20790d82713bfa7475b61a4adef3f3645a.tar.gz
+sha256 346c543de9e953db283072e1c591cab9d0eb775f7fb1fff3d7560f38bdf6bdf2  kvm-unit-tests-kvm-unit-tests-20171020.tar.gz
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index c630ec6270..54614e2643 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 95062c20790d82713bfa7475b61a4adef3f3645a
+KVM_UNIT_TESTS_VERSION = kvm-unit-tests-20171020
 KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
 KVM_UNIT_TESTS_LICENSE = LGPL-2.0
-- 
2.14.2
