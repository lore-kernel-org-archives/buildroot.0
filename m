From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Aug 2017 08:13:24 +0300
Subject: [Buildroot] defconfigs with upstream kernels
In-Reply-To: <a1c822f4-061c-527b-5ae2-2a82764159f4@mind.be>
References: <a1c822f4-061c-527b-5ae2-2a82764159f4@mind.be>
Message-ID: <20170814051324.fsb7vyp3pc2bcsnq@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Aug 14, 2017 at 01:44:27AM +0200, Arnout Vandecappelle wrote:
>  Currently, we want the defconfigs to have fixed versions of kernel and
> bootloader that have been tested on the target platform. However, we *don't*
> have fixed versions of GCC, uClibc, and even some bootloaders (grub and syslinux
> don't have a version selection).
> 
>  Therefore, I wonder if it doesn't make a lot more sense to use
> BR2_LINUX_KERNEL_LATEST_VERSION and BR2_TARGET_UBOOT_LATEST_VERSION for boards
> that are fully upstream (i.e. without patches).
> 
>  It's a divergence from our current philosophy, because the defconfigs are no
> longer fixed, but really currently they aren't either. In fact, we see constant
> build failures from the GCC bumps (*1) which would be avoided by just using the
> latest version (*2). We can assume that upstream does their homework and makes
> sure that supported boards remain supported (*3). And we anyway already see
> occasional failures due to grub or syslinux bumps.
> 
>  Any objections to switching all upstream boards to LATEST?

I don't think this is a good idea.

The kernel and bootloaders are special in that their correct operation depends 
on many little platform specific details that tend to break frequently between 
releases because of unrelated code changes. Even worse. Due to the time lag 
between the patch post time and merge time, a new config might be broken by 
merge time, not to mention Buildroot release time. In this case the Buildroot 
user will not have a chance to go back to see when things broke.

Now, I know you could say the same about gcc/binutils/libc. But I think there 
is a difference. The toolchain is far less platform specific. Toolchain 
components also see less frequent releases. As you noted, the breaks we have 
recently seen were mostly caused by the now reverted choice to hard-code 
specific gcc versions into the code.

In sum, I think that hardware specific config should refer to a specific known 
good and tested versions of the kernel and the bootloader (when applicable). 
Alternatively, at the very leasts, the commit log must include these details.

> (*1) Actually, this will be the last time this happens to such a degree, because
> both linux and u-boot removed their dependence on the GCC version number.
> 
> (*2) Actually, only 5 of the 13 defconfigs that currently fail because of this
> use an upstream kernel.
> 
> (*3) For the qemu builds, it turns out that we sometimes have to stick to an
> older kernel. But qemu is of course special.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
