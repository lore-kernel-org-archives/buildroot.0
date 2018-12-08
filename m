From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:56:43 +0100
Subject: [Buildroot] [git commit] package/gcc: remove arm soft patch
Message-ID: <20181208200042.8D49B84339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=587eb69d97a4bef5694ec7b056bbd1e53a675464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch refers to [1] which says "Unfortuantely, arm-gcc defaults to
generating code for armv5t." Since we always explicitly pass the target
CPU for ARM, the default CPU shouldn't matter.

As suggested by Arnout [2], a test based on qemu_arm_versatile_defconfig
has been done without this patch and there is no regression.

[1] https://sourceware.org/ml/crossgcc/2008-05/msg00009.html
[2] http://lists.busybox.net/pipermail/buildroot/2018-May/222104.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/8.2.0/0002-arm-softfloat-libgcc.patch | 45 -----------------------
 1 file changed, 45 deletions(-)

diff --git a/package/gcc/8.2.0/0002-arm-softfloat-libgcc.patch b/package/gcc/8.2.0/0002-arm-softfloat-libgcc.patch
deleted file mode 100644
index a72e57dff4..0000000000
--- a/package/gcc/8.2.0/0002-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b05e2b0942d49f9611a92fd2bb2b292f3d486285 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2017 22:46:18 +0200
-Subject: [PATCH] arm softfloat libgcc
-
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/arm/linux-elf.h | 2 +-
- libgcc/config/arm/t-linux  | 7 ++++++-
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index cfcd9cb1a5c..b8a9a9ca4ae 100644
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -58,7 +58,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
-diff --git a/libgcc/config/arm/t-linux b/libgcc/config/arm/t-linux
-index 3d520decafb..e7bc042d4e4 100644
---- a/libgcc/config/arm/t-linux
-+++ b/libgcc/config/arm/t-linux
-@@ -1,6 +1,11 @@
- LIB1ASMSRC = arm/lib1funcs.S
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
-+	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
-+	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
-+	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
-+	_arm_fixsfsi _arm_fixunssfsi
- 
- # Just for these, we omit the frame pointer since it makes such a big
- # difference.
--- 
-2.14.3
-
