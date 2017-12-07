From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  6 Dec 2017 22:36:31 -0600
Subject: [Buildroot] [PATCH] kvm-unit-test: revert use of RDSEED and RDRAND
Message-ID: <20171207043631.9312-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removing this commit in buildroot as it causes
build failures when the host binutils isn't
at least 2.23 (2.22.x introduced RDSEED).

The host toolchain is used for x86_64 target
builds where we need to do a 32bit build.

Fixes:
http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch

diff --git a/package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch b/package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch
new file mode 100644
index 0000000000..1d3fb1ca6a
--- /dev/null
+++ b/package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch
@@ -0,0 +1,66 @@
+From ff6ee5c5345e5a55827d657d8d862237338b6edb Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Wed, 6 Dec 2017 22:30:04 -0600
+Subject: [PATCH] Revert "x86: vmx: test RDRAND and RDSEED"
+
+Removing this commit in buildroot as it causes
+build failures when the host binutils isn't
+at least 2.23 (2.22.x introduced RDSEED).
+The host toolchain is used for x86_64 target
+builds where we need to do a 32bit build.
+
+Fixes:
+http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
+
+This reverts commit a88205d14320d2f681a6c220f1d08711b9ce3885.
+---
+ x86/vmx.h       | 1 -
+ x86/vmx_tests.c | 6 ------
+ 2 files changed, 7 deletions(-)
+
+diff --git a/x86/vmx.h b/x86/vmx.h
+index f0b8776..7a1937e 100644
+--- a/x86/vmx.h
++++ b/x86/vmx.h
+@@ -396,7 +396,6 @@ enum Ctrl1 {
+ 	CPU_URG			= 1ul << 7,
+ 	CPU_VINTD		= 1ul << 9,
+ 	CPU_RDRAND		= 1ul << 11,
+-	CPU_RDSEED		= 1ul << 16,
+ 	CPU_PML                 = 1ul << 17,
+ };
+ 
+diff --git a/x86/vmx_tests.c b/x86/vmx_tests.c
+index e8c97f2..3619e0c 100644
+--- a/x86/vmx_tests.c
++++ b/x86/vmx_tests.c
+@@ -772,8 +772,6 @@ asm(
+ 	"insn_sldt: sldt %ax;ret\n\t"
+ 	"insn_lldt: xor %eax, %eax; lldt %ax;ret\n\t"
+ 	"insn_str: str %ax;ret\n\t"
+-	"insn_rdrand: rdrand %rax;ret\n\t"
+-	"insn_rdseed: rdseed %rax;ret\n\t"
+ );
+ extern void insn_hlt();
+ extern void insn_invlpg();
+@@ -798,8 +796,6 @@ extern void insn_lldt();
+ extern void insn_str();
+ extern void insn_cpuid();
+ extern void insn_invd();
+-extern void insn_rdrand();
+-extern void insn_rdseed();
+ 
+ u32 cur_insn;
+ u64 cr3;
+@@ -855,8 +851,6 @@ static struct insn_table insn_table[] = {
+ 	{"DESC_TABLE (LLDT)", CPU_DESC_TABLE, insn_lldt, INSN_CPU1, 47, 0, 0, 0},
+ 	{"DESC_TABLE (STR)", CPU_DESC_TABLE, insn_str, INSN_CPU1, 47, 0, 0, 0},
+ 	/* LTR causes a #GP if done with a busy selector, so it is not tested.  */
+-	{"RDRAND", CPU_RDRAND, insn_rdrand, INSN_CPU1, VMX_RDRAND, 0, 0, 0},
+-	{"RDSEED", CPU_RDSEED, insn_rdseed, INSN_CPU1, VMX_RDSEED, 0, 0, 0},
+ 	// Instructions always trap
+ 	{"CPUID", 0, insn_cpuid, INSN_ALWAYS_TRAP, 10, 0, 0, 0},
+ 	{"INVD", 0, insn_invd, INSN_ALWAYS_TRAP, 13, 0, 0, 0},
+-- 
+2.14.2
+
-- 
2.14.2
