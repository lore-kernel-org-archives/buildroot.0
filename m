From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 2 Nov 2015 11:34:08 +0100
Subject: [Buildroot] [RFC PATCH] dpdk: new package
In-Reply-To: <5633A615.90408@mind.be>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <5633A615.90408@mind.be>
Message-ID: <20151102113408.5aaf26bb@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

thanks for your quick review...

On Fri, 30 Oct 2015 18:17:09 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Jan,
> 
>  I didn't do a detailed review, just some general remarks.
> 
> On 30-10-15 12:05, Jan Viktorin wrote:
> > This patch introduces support of the DPDK library (www.dpdk.org) into
> > Buildroot. It compiles and installs DPDK libraries on the target and
> > staging and allows to compiler other applications depending on the DPDK
> > library. It can also install some basic tools the DPDK provides
> > (testpmd, python scripts, test suite).  
> 
>  Explanation of what DPDK stands for would be nice :-)

OK, will improve ;).

> 
> > 
> > The patch assumes DPDK 2.2 which is not out at the moment (scheduled
> > to the end of November). However, this version will contain support for
> > the ARM architecture that is currently being reviewed.
> > 
> > Testing of DPDK on ARM is possible by cloning
> > 
> >  https://github.com/RehiveTech/dpdk arm-support-v5
> > 
> > as the package allows customization of the download process.  
> 
>  We try to avoid adding options to select a version or different source. For
> instance, we recently removed the version selection from busybox. If you need
> for instance this arm-support branch, you can still use the _OVERRIDE_SRCDIR
> approach.

Thanks for this hint. It is a little complication (I like when
everything is in the defconfig - a single file) for some internal
things. But I'll go this way in the next version.

> Is there any good reason why you need multi-version support for this
> package?

Probably not. all these were just for my comfort during develpoment,
patch management, etc.

> 
>  Same for custom patches, we have BR2_GLOBAL_PATCH_DIR.

Of course, I don't need this because of git...

> 
> > 
> > The ARM ports can be tested by
> > 
> >  qemu_aarch64_virt_defconfig
> >  qemu_arm_vexpress_defconfig
> > 
> > I did not test, how it works with x86 as I do not use Buildroot
> > for this.
> > 
> > The included hashes are calculated locally by downloading the tar.gz
> > archives by hand.
> > 
> > There are unfortunately some pitfalls:
> > 
> > * it may require to enable PCI, MSIX, UIO in the Linux Kernel
> >   (some defconfigs does not include as default and it is platform
> >   dependent as ARMv7 almost does not use PCI)  
> 
>  We had a similar situation recently but I don't remember which package it was
> and what the conclusion was. But basically, if you don't have PCI, then the
> build will end with an error saying that you don't have PCI, so it's not rocket
> science to discover that PCI should be enabled.

Yes, it's just annoying.

> 
>  UIO I think you could enable explicitly in linux.mk however.

You probably mean something like(?):

linux.mk:
$(if $(BR_PACKAGE_DPDK),
    $(call KCONFIG_ENABLE_OPT,CONFIG_XXX_UIO,$(@D)/.config))

> 
> > 
> > * when building PCAP PMD driver, the libpcap is required (however,
> >   this dependency is difficult to express in Buildroot as this depends
> >   on the DPDK configuration file - similar to the issue above)  
> 
>  Yeah, we have a similar situation with swupdate, and no resolution so far. We
> also had a similar situation with the crosstool-NG support before that was removed.
> 
>  What you definitely can do is
> 
> ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> DPDK_DEPENDENCIES += libpcap
> endif
> 
> and add in the helptext that you need to enable libpcap manually if required.

OK.

> 
> > 
> > * some tools the DPDK provides depend on Python(2) so the user has
> >   to enable it to install those
> > 
> > I assume, the user knows what he is doing in those cases and configures
> > the Buildroot in the right way. Or any ideas? Yann?
> > 
> > Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>  
> 
> 
>  Generic other remarks:
> 
> - Why not use the kernel-module infra?

The DPDK project has a specific build system which is better to not
touch :). I tried several approaches and finally, I finished with the
proposed patch as the one that is clean and working.

> - Shouldn't it be a kconfig-package as well?

Unfortunately, the DPDK project does not use kconfig at the moment (it
probably will in the future but...). So the kconfig-package cannot be
used here.

> - Help text line wrapping is not OK.
> - Instead of the configuration choice which always has only two options, just
> allow to leave the config string empty and default to the arch-appropriate one then.
> - pyscripts should probably not require an option; just install automatically if
> python is enabled.
> - License is probably not correct, if the files are called LICENSE.LGPL LICENSE.GPL

The DPDK itself is under BSD (however, I did not find the license
file there). The included kernel drivers are GPL. I have no idea about
the purpose of LGPL at the moment (probably dual-licensing, will
check...).

> - For enabling kconfig opts, there are helper functions.
> - Never put comments in command blocks; put them before the define.

OK, will fix.

> - Don't put empty assignments (DPDK_INSTALL_TARGET_LIBS)

OK. I wanted to make obvious that it is empty. I will remove it.

> 
> 
> 
>  Regards,
>  Arnout
> 
> [snip]



-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
