From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  9 Jan 2018 06:04:47 -0600
Subject: [Buildroot] [PATCH v2] kvm-unit-tests: test for rdseed/rdrand
Message-ID: <1515499487-29937-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build fails when the host binutils isn't at least 2.23
(2.22.x introduced RDSEED).

The host toolchain is used for x86_64 target builds where
we need to do a 32bit build. Most other buildroot builds
are using a much newer binutils unless it's a external
older toolchain.

Fixes:
http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/

Upstream:
https://www.spinics.net/lists/kvm/msg161542.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Thomas/Peter could you test this on one of your builders?
I've requested a gcc farm account but still waiting at this
point.  Here's the builders which can reproduce the failure
(ie have old enough host binutils).
http://autobuild.buildroot.net/?reason=kvm-unit-tests-kvm-unit-tests-20171020

Changes v1 -> v2
[Thomas
 - Suggested a configure check vs the original revert of
   the upstream commit which added these instructions to the package.
---
 ...0002-x86-vmx_tests-test-for-rdseed-rdrand.patch | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/kvm-unit-tests/0002-x86-vmx_tests-test-for-rdseed-rdrand.patch

diff --git a/package/kvm-unit-tests/0002-x86-vmx_tests-test-for-rdseed-rdrand.patch b/package/kvm-unit-tests/0002-x86-vmx_tests-test-for-rdseed-rdrand.patch
new file mode 100644
index 0000000..5fc15b4
--- /dev/null
+++ b/package/kvm-unit-tests/0002-x86-vmx_tests-test-for-rdseed-rdrand.patch
@@ -0,0 +1,82 @@
+From 9a8ddd7fdde14f4f1085fe89a2e2dfba6b291aa3 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 8 Jan 2018 22:39:29 -0600
+Subject: [PATCH] x86/vmx_tests: test for rdseed/rdrand
+
+A binutils of at least 2.23 is required
+(2.22.x introduced RDSEED).
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ configure       | 17 +++++++++++++++++
+ x86/vmx_tests.c |  6 ++++++
+ 2 files changed, 23 insertions(+)
+
+diff --git a/configure b/configure
+index dd9d361..4912582 100755
+--- a/configure
++++ b/configure
+@@ -171,6 +171,23 @@ mkdir -p lib
+ ln -sf "$asm" lib/asm
+ 
+ 
++cat > rd_test.c <<EOF
++#include <stdint.h>
++int main() {
++   uint16_t seed=0;
++   unsigned char ok;
++   asm volatile ("rdseed %0; setc %1"
++                 : "=r" (seed), "=qm" (ok));
++   return ok;
++}
++EOF
++if $cross_prefix$cc -o /dev/null rd_test.c &> /dev/null; then
++  echo "Checking for rdseed/rdrand... Yes."
++else
++  CFLAGS="${CFLAGS} -DNO_RDSEEDRAND"
++  echo "Checking for rdseed/rdrand... No."
++fi
++
+ # create the config
+ cat <<EOF > config.mak
+ SRCDIR=$srcdir
+diff --git a/x86/vmx_tests.c b/x86/vmx_tests.c
+index 4a3e94b..2cbe3eb 100644
+--- a/x86/vmx_tests.c
++++ b/x86/vmx_tests.c
+@@ -770,8 +770,10 @@ asm(
+ 	"insn_sldt: sldt %ax;ret\n\t"
+ 	"insn_lldt: xor %eax, %eax; lldt %ax;ret\n\t"
+ 	"insn_str: str %ax;ret\n\t"
++#ifndef NO_RDSEEDRAND
+ 	"insn_rdrand: rdrand %rax;ret\n\t"
+ 	"insn_rdseed: rdseed %rax;ret\n\t"
++#endif
+ );
+ extern void insn_hlt();
+ extern void insn_invlpg();
+@@ -796,8 +798,10 @@ extern void insn_lldt();
+ extern void insn_str();
+ extern void insn_cpuid();
+ extern void insn_invd();
++#ifndef NO_RDSEEDRAND
+ extern void insn_rdrand();
+ extern void insn_rdseed();
++#endif
+ 
+ u32 cur_insn;
+ u64 cr3;
+@@ -853,8 +857,10 @@ static struct insn_table insn_table[] = {
+ 	{"DESC_TABLE (LLDT)", CPU_DESC_TABLE, insn_lldt, INSN_CPU1, 47, 0, 0, 0},
+ 	{"DESC_TABLE (STR)", CPU_DESC_TABLE, insn_str, INSN_CPU1, 47, 0, 0, 0},
+ 	/* LTR causes a #GP if done with a busy selector, so it is not tested.  */
++#ifndef NO_RDSEEDRAND
+ 	{"RDRAND", CPU_RDRAND, insn_rdrand, INSN_CPU1, VMX_RDRAND, 0, 0, 0},
+ 	{"RDSEED", CPU_RDSEED, insn_rdseed, INSN_CPU1, VMX_RDSEED, 0, 0, 0},
++#endif
+ 	// Instructions always trap
+ 	{"CPUID", 0, insn_cpuid, INSN_ALWAYS_TRAP, 10, 0, 0, 0},
+ 	{"INVD", 0, insn_invd, INSN_ALWAYS_TRAP, 13, 0, 0, 0},
+-- 
+1.9.1
+
-- 
1.9.1
