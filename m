From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 29 Jun 2020 13:17:33 +0200
Subject: [Buildroot] BR2_ARCH_IS_64 and MIPS64n32
Message-ID: <CAAXf6LWdY7BxNCVkZNtEs0yS98Yhqgs8gcDr0qpPHBsj0N4NjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Triggered by a recent fix in libopenssl, Thomas Petazzoni wrote:
http://lists.busybox.net/pipermail/buildroot/2020-June/285265.html

> However, I am wondering if we shouldn't make BR2_MIPS_NABI32 *not*
> select BR2_ARCH_IS_64. Indeed, for most packages (which are running
> userspace code), mips64n32 *is* a 32-bit architecture.

> We could make that even clearer by having a BR2_KERNEL_ARCH_IS_64, if
> there's anything that needs to know at the kernel level the bitness.

> But it overall feels incorrect for BR2_MIPS_NABI32 to select
> BR2_ARCH_IS_64.


I had a look at the use of BR2_ARCH_IS_64 in the code base and how it would
impact builds for MIPS64 n32.
I assume that the package-specific usages will be fine, even though I'm not
using these packages so can't be really sure.

Below is the list of references where we at least need some discussion or
solution:


- menuconfig: currently, you first select the architecture as MIPS64 (which
is the logical choice even for n32), and this option selects
BR2_ARCH_IS_64. So if we want BR2_ARCH_IS_64 disabled for n32, then either
we cannot use the arch choice "MIPS64", or we should not let it select
BR2_ARCH_IS_64 but select that based on the combination arch/ABI.

- BR2_TOOLCHAIN_HAS_SYNC_8: Currently set by default on 64-bit archs, to be
checked whether MIPS64n32 has them

- BR2_TOOLCHAIN_HAS_ATOMIC: Idem, to be checked

- BR2_GCC_TARGET_FP32_MODE: Idem, to be checked. For 64-bit archs, this
value is not filled so no -mfpXXXX is passed. If we change the case for
n32, suddenly such option would be passed and needs to be checked whether
it is ok, and which value it should then be.

- ThomasP mentioned a possible need for BR2_KERNEL_ARCH_IS_64, but such
option already exists as: BR2_KERNEL_64_USERLAND_32 , e.g. used by ebtables.

This mail is not yet intended to give answers, just raising the questions
:-)

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200629/438f0eba/attachment.html>
