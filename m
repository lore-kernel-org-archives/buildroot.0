From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:03:22 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] kvm-unit-tests: fix build
	on x86-64 with specific gcc versions
Message-ID: <20170515125327.B32D482901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=521274cd60300ed6cf4143012495960853d80a39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

kvm-unit-tests uses the following code on x86/x86-64:

static inline u64 scale_delta(u64 delta, u64 mul_frac)
{
        u64 product, unused;

        __asm__ (
                "mul %3"
                : "=d" (product), "=a" (unused) : "1" (delta), "rm" ((u64)mul_frac) );

        return product;
}

The "mul" instruction does not have a suffix that indicates the width of
the data being multiplied. When the data is passed in a register, there
is no need to specify the width, but with some gcc versions, the data is
passed as a memory reference, and therefore the assembler does not know
the width of the data to be multiplied. It causes the following build
failure:

x86/hyperv_clock.c: Assembler messages:
x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction

Since the data being multiplied is 64 bit, we explicitly specify the
instruction as being "mulq".

Fixes:

  http://autobuild.buildroot.net/results/a4a65d01f049db83a93de92660f228dd18532625/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit bdadcf593d5308fcc1c8e767b7c2af8ae5aa9144)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...clock-be-explicit-about-mul-instruction-d.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch b/package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch
new file mode 100644
index 0000000..c8ee6b1
--- /dev/null
+++ b/package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch
@@ -0,0 +1,35 @@
+From 022ae220d6e7b5bd064bc8698c271dca4dac7d8c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 8 May 2017 22:27:25 +0200
+Subject: [PATCH] x86/hyperv_clock: be explicit about mul instruction data size
+
+With gcc 4.7.2, the build fails with:
+
+x86/hyperv_clock.c: Assembler messages:
+x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction
+
+In order to avoid this, make the mul instruction data size explicit by
+adding the appropriate suffix. It operates on 64-bit data, so use
+"mulq".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ x86/hyperv_clock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/x86/hyperv_clock.c b/x86/hyperv_clock.c
+index 8b1deba..6c4dd56 100644
+--- a/x86/hyperv_clock.c
++++ b/x86/hyperv_clock.c
+@@ -19,7 +19,7 @@ static inline u64 scale_delta(u64 delta, u64 mul_frac)
+ 	u64 product, unused;
+ 
+ 	__asm__ (
+-		"mul %3"
++		"mulq %3"
+ 		: "=d" (product), "=a" (unused) : "1" (delta), "rm" ((u64)mul_frac) );
+ 
+ 	return product;
+-- 
+2.7.4
+
