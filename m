From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 17 Aug 2016 19:19:34 +0300
Subject: [Buildroot] [PATCH] uclibc: ARC: Support syscall ABI v4
Message-ID: <1471450774-8666-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using with GCC 6 ABIv4 is required.
Missing this patch leads to numerous runtime errors.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 ...ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch

diff --git a/package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch b/package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch
new file mode 100644
index 0000000..14e24d0
--- /dev/null
+++ b/package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch
@@ -0,0 +1,21 @@
+diff --git a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
+index 51607240cd82..94e089d5dfa8 100755
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
-- 
2.5.5
