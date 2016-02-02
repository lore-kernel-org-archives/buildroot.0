From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 16:31:20 +0100
Subject: [Buildroot] [PATCH v3 02/18] toolchain: add
	BR2_TOOLCHAIN_HAS_{SYNC_x, ATOMIC} hidden booleans
In-Reply-To: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1454427096-20967-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, Buildroot provides one BR2_ARCH_HAS_ATOMICS boolean option
to indicate whether the architecture supports atomic operations or
not. However, the reality of atomic operations support is much more
complicated and requires more than one option to be expressed
properly.

There are in fact two types of atomic built-ins provided by gcc:

 (1) The __sync_*() family of functions, which have been in gcc for a
     long time (probably gcc 4.1). They are available in variants
     operating on 1-byte, 2-byte, 4-byte and 8-byte integers. Some
     architectures implement a number of variants, some do not
     implement any, some implement all of them.

     They are now considered "legacy" by the gcc developers but are
     nonetheless still being used by a significant number of userspace
     libraries and applications.

     https://gcc.gnu.org/onlinedocs/gcc/_005f_005fsync-Builtins.html

 (2) The __atomic_*() family of functions, which have been introduced
     in gcc 4.7. They have been introduced in order to support C++11
     atomic operations. In gcc 4.8, they are available on all
     architectures, either built-in or in the libatomic library part
     of the gcc runtime (in which case the application needs to be
     linked with -latomic). In gcc 4.7, the __atomic_*() intrinsics
     are only supported on certain architectures, since libatomic did
     not exist at the time.

For (1), a single BR2_ARCH_HAS_ATOMICS is not sufficient, because
depending on the architecture, some variants may or may not be
available. Setting BR2_ARCH_HAS_ATOMICS to false as soon as one of the
variant is missing would cause a large number of packages to become
unavailable, even if they in fact use only more common variants
available on a large number of architectures. For this reason, we've
chosen to introduce four new Config.in options:

 - BR2_TOOLCHAIN_HAS_SYNC_1
 - BR2_TOOLCHAIN_HAS_SYNC_2
 - BR2_TOOLCHAIN_HAS_SYNC_3
 - BR2_TOOLCHAIN_HAS_SYNC_4

Which indicate whether the toolchain support 1-byte, 2-byte, 4-byte
and 8-byte __sync_*() built-ins respectively.

For (2), we introduce a BR2_TOOLCHAIN_HAS_ATOMIC, which indicates if
the __atomic_*() built-ins are available. Note that it is up to the
package to link with -latomic when gcc is >= 4.8. Since __atomic_*()
intrinsics for all sizes are supported starting

We conducted a fairly large analysis about various architectures
supported by Buildroot, as well as with a number of different
toolchains, to check which combinations support which variant. To do,
we linked the following program with various toolchains:

int main(void)
{
	uint8_t a;
	uint16_t b;
	uint32_t c;
	uint64_t d;

	__sync_fetch_and_add(&a, 3);
	__sync_fetch_and_add(&b, 3);
	__sync_fetch_and_add(&c, 3);
	__sync_fetch_and_add(&d, 3);

	__sync_val_compare_and_swap(&a, 1, 2);
	__sync_val_compare_and_swap(&b, 1, 2);
	__sync_val_compare_and_swap(&c, 1, 2);
	__sync_val_compare_and_swap(&d, 1, 2);

	__atomic_add_fetch(&a, 3, __ATOMIC_RELAXED);
	__atomic_add_fetch(&b, 3, __ATOMIC_RELAXED);
	__atomic_add_fetch(&c, 3, __ATOMIC_RELAXED);
	__atomic_add_fetch(&d, 3, __ATOMIC_RELAXED);

	__atomic_compare_exchange_n(&a, &a, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
	__atomic_compare_exchange_n(&b, &b, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
	__atomic_compare_exchange_n(&c, &c, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
	__atomic_compare_exchange_n(&d, &d, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);

	return 0;
}

And looked at which symbols were unresolved. For the __atomic_*()
ones, we tested with and without -latomic to see which variants are
built-in, which variants require libatomic. This testing effort has
led to the following results:

                __sync       __atomic    gcc
               1  2  4  8    1  2  4  8
ARC            Y  Y  Y  -    Y  Y  Y  L   4.8 [with BR2_ARC_ATOMIC_EXT]
ARC            -  -  -  -    L  L  L  L   4.8 [without BR2_ARC_ATOMIC_EXT]
ARM            Y  Y  Y  X    Y  Y  Y  Y   4.8, 4.7
ARM            Y  Y  Y  -                 4.5
AArch64        Y  Y  Y  Y    Y  Y  Y  Y   4.9, 5.1
Bfin           -  -  Y  -                 4.3
i386 (i386)    -  -  -  -    L  L  L  L   4.9
i386 (i486..)  Y  Y  Y  -    L  L  L  L   4.9 [i486, c3, winchip2, winchip-c6]
i386 (> i586)  Y  Y  Y  Y    L  L  L  L   4.9
Microblaze     -  -  Y  -    L  L  Y  L   4.9
MIPS           Y  Y  Y  -    Y  Y  Y  L   4.9
MIPS64         Y  Y  Y  Y    Y  Y  Y  Y   4.9
NIOS 2         Y  Y  Y  -    Y  Y  Y  L   4.9, 5.2
PowerPC        Y  Y  Y  -    Y  Y  Y  L   4.9
SuperH         Y  Y  Y  -    Y  Y  Y  L   4.9
SPARC          -  -  -  -    L  L  L  L   4.9
SPARC64        Y  Y  Y  Y    Y  Y  Y  Y   4.9
x86_64         Y  Y  Y  Y    Y  Y  Y  Y   4.7, 4.9
Xtensa         Y  Y  Y  -    Y  Y  Y  Y   4.9

Notes:

 * __atomic built-ins appeared in gcc 4.7, so for toolchais older than
   that, the __atomic column is empty.

 * Y means 'supported built-in'

 * L means 'supported via linking to libatomic' (only for __atomic
   functions)

 * X indicates a very special case for 8 bytes __sync built-ins on
   ARM. On ARMv7, there is no problem, starting from gcc 4.7, the
   __sync built-in for 8 bytes integers is implemented, fully in
   userspace. For cores < ARMv7, doing a 8 bytes atomic operation
   requires help from the kernel. Unfortunately, the libgcc code
   implementing this uses the __write() function to display an error,
   and this function is internal to glibc. Therefore, if you're using
   glibc everything is fine, but if you're using uClibc or musl, you
   cannot link an application that uses 8 bytes __sync
   operations. This has been fixed as part of gcc PR68095, merged in
   the gcc 5 branch but not yet part of any gcc release.

 * - means not supported

This commit only introduces the new options. Follow-up commits will
progressively change the packages using BR2_ARCH_HAS_ATOMICS to use
the appropriate BR2_TOOLCHAIN_HAS_SYNC_x or BR2_TOOLCHAIN_HAS_ATOMIC
until the point where BR2_ARCH_HAS_ATOMICS can be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 79 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 8408852..1b7b416 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -307,3 +307,82 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
 	default "4.5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+
+config BR2_TOOLCHAIN_HAS_SYNC_1
+	bool
+	default y
+	depends on !BR2_x86_i386
+	depends on !BR2_bfin
+	depends on !BR2_microblaze
+	depends on !BR2_sparc
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
+
+config BR2_TOOLCHAIN_HAS_SYNC_2
+	bool
+	default y if BR2_TOOLCHAIN_HAS_SYNC_1
+
+config BR2_TOOLCHAIN_HAS_SYNC_4
+	bool
+	default y
+	depends on !BR2_sparc
+	depends on !BR2_x86_i386
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
+
+# The availability of __sync for 8-byte types on ARM is somewhat
+# complicated:
+#
+#  - It appeared in gcc starting with gcc 4.7.
+#
+#  - On ARMv7, there is no problem, it can be directly implemented in
+#    userspace.
+#
+#  - On < ARMv7, it requires help from the kernel. Unfortunately, the
+#    libgcc code implementing 8-byte __sync with the help from the
+#    kernel calls __write() when a failure occurs, which is a function
+#    internal to glibc, not available in uClibc and musl. This means
+#    that the 8-byte __sync operations are not available on < ARMv7
+#    with uClibc and musl. This problem was fixed as part of gcc
+#    PR68059, which was backported to the gcc 5 branch, but isn't yet
+#    part of any gcc 5.x release.
+#
+config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
+	bool
+	default y
+	depends on BR2_arm || BR2_armeb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
+
+# 8-byte intrinsics available on most x86 CPUs, except a few old ones
+config BR2_TOOLCHAIN_X86_HAS_SYNC_8
+	bool
+	default y
+	depends on BR2_i386
+	depends on !BR2_x86_i386
+	depends on !BR2_x86_i486
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
+
+# 8-byte intrinsics available:
+#  - On all 64 bits architecture
+#  - On a certain combinations of ARM platforms
+#  - On certain x86 32 bits CPUs
+config BR2_TOOLCHAIN_HAS_SYNC_8
+	bool
+	default y if BR2_ARCH_IS_64
+	default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8
+	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
+
+# __atomic intrinsics are available:
+# - with gcc 4.8, either through built-ins or libatomic, on all
+#   architectures
+# - with gcc 4.7, libatomic did not exist, so only built-ins are
+#   available. This means that __atomic can only be used in a subset
+#   of the architectures
+config BR2_TOOLCHAIN_HAS_ATOMIC
+	bool
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_arm
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_armeb
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_xtensa
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_ARCH_IS_64
-- 
2.6.4
