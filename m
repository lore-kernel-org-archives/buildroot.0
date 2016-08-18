From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 00:08:24 +0200
Subject: [Buildroot] [git commit] uclibc: ARC: Support syscall ABI v4
Message-ID: <20160818220938.13C4F81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9914215d8992b66bf7ccedf0befb31581955fae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When used with GCC 6 ABIv4 is used.
Missing this patch leads to numerous runtime errors.

The patch has already been accepted in uclibc-ng:
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3e40f9669279f005f7154892539166f5081fbcb2

So the patch should be removed after update to a new version of uclibc-ng.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uclibc/0003-ARC-Support-syscall-ABI-v4.patch   | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch b/package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch
new file mode 100644
index 0000000..058adca
--- /dev/null
+++ b/package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch
@@ -0,0 +1,54 @@
+From 3e40f9669279f005f7154892539166f5081fbcb2 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
+Date: Tue, 16 Aug 2016 15:04:27 -0700
+Subject: [PATCH] ARC: Support syscall ABI v4
+
+The syscall ABI includes the gcc functional calling ABI since a syscall
+implies userland caller and kernel callee.
+
+The current gcc ABI (v3) for ARCv2 ISA required 64-bit data be passed in
+even-odd register pairs, (potentially punching reg holes when passing such
+values as args). This was partly driven by the fact that the double-word
+LDD/STD instructions in ARCv2 expect the register alignment and thus gcc
+forcing this avoids extra MOV at the cost of a few unused register (which we
+have plenty anyways).
+
+This however was rejected as part of upstreaming gcc port to HS. So the new
+ABI v4 doesn't enforce the even-odd reg restriction.
+
+Do note that for ARCompact ISA builds v3 and v4 are practically the same in
+terms of gcc code generation.
+
+This change is dormant for now (gcc 4.8.x based tools) and will only kick
+in with switch to gcc 6.x based tools.
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+---
+ libc/sysdeps/linux/arc/bits/uClibc_arch_features.h | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
+index 5160724..94e089d 100755
+--- a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
++++ b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
+@@ -41,8 +41,14 @@
+ /* The default ';' is a comment on ARC. */
+ #define __UCLIBC_ASM_LINE_SEP__ `
+ 
+-/* does your target align 64bit values in register pairs ? (32bit arches only) */
+-#if defined(__A7__)
++/* does your target align 64bit values in register pairs ? (32bit arches only)
++ *  - ARC700 never had any constraint on reg pairs (even if ABI v3)
++ *  - Inital HS ABI (v3: non upstream gcc) had 64-bit data aligned in even-odd
++ *     reg pairs (thus allowed reg holes when passing such args to calls)
++ *  - Upstream gcc (6.x) HS ABI doesn't have that restriction
++ */
++
++#if defined(__A7__) || (__GNUC__ > 4)
+ #undef __UCLIBC_SYSCALL_ALIGN_64BIT__
+ #else
+ #define __UCLIBC_SYSCALL_ALIGN_64BIT__
+-- 
+2.7.4
+
