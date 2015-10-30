From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 18:17:09 +0100
Subject: [Buildroot] [RFC PATCH] dpdk: new package
In-Reply-To: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <5633A615.90408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jan,

 I didn't do a detailed review, just some general remarks.

On 30-10-15 12:05, Jan Viktorin wrote:
> This patch introduces support of the DPDK library (www.dpdk.org) into
> Buildroot. It compiles and installs DPDK libraries on the target and
> staging and allows to compiler other applications depending on the DPDK
> library. It can also install some basic tools the DPDK provides
> (testpmd, python scripts, test suite).

 Explanation of what DPDK stands for would be nice :-)

> 
> The patch assumes DPDK 2.2 which is not out at the moment (scheduled
> to the end of November). However, this version will contain support for
> the ARM architecture that is currently being reviewed.
> 
> Testing of DPDK on ARM is possible by cloning
> 
>  https://github.com/RehiveTech/dpdk arm-support-v5
> 
> as the package allows customization of the download process.

 We try to avoid adding options to select a version or different source. For
instance, we recently removed the version selection from busybox. If you need
for instance this arm-support branch, you can still use the _OVERRIDE_SRCDIR
approach. Is there any good reason why you need multi-version support for this
package?

 Same for custom patches, we have BR2_GLOBAL_PATCH_DIR.

> 
> The ARM ports can be tested by
> 
>  qemu_aarch64_virt_defconfig
>  qemu_arm_vexpress_defconfig
> 
> I did not test, how it works with x86 as I do not use Buildroot
> for this.
> 
> The included hashes are calculated locally by downloading the tar.gz
> archives by hand.
> 
> There are unfortunately some pitfalls:
> 
> * it may require to enable PCI, MSIX, UIO in the Linux Kernel
>   (some defconfigs does not include as default and it is platform
>   dependent as ARMv7 almost does not use PCI)

 We had a similar situation recently but I don't remember which package it was
and what the conclusion was. But basically, if you don't have PCI, then the
build will end with an error saying that you don't have PCI, so it's not rocket
science to discover that PCI should be enabled.

 UIO I think you could enable explicitly in linux.mk however.

> 
> * when building PCAP PMD driver, the libpcap is required (however,
>   this dependency is difficult to express in Buildroot as this depends
>   on the DPDK configuration file - similar to the issue above)

 Yeah, we have a similar situation with swupdate, and no resolution so far. We
also had a similar situation with the crosstool-NG support before that was removed.

 What you definitely can do is

ifeq ($(BR2_PACKAGE_LIBPCAP),y)
DPDK_DEPENDENCIES += libpcap
endif

and add in the helptext that you need to enable libpcap manually if required.

> 
> * some tools the DPDK provides depend on Python(2) so the user has
>   to enable it to install those
> 
> I assume, the user knows what he is doing in those cases and configures
> the Buildroot in the right way. Or any ideas? Yann?
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>


 Generic other remarks:

- Why not use the kernel-module infra?
- Shouldn't it be a kconfig-package as well?
- Help text line wrapping is not OK.
- Instead of the configuration choice which always has only two options, just
allow to leave the config string empty and default to the arch-appropriate one then.
- pyscripts should probably not require an option; just install automatically if
python is enabled.
- License is probably not correct, if the files are called LICENSE.LGPL LICENSE.GPL
- For enabling kconfig opts, there are helper functions.
- Never put comments in command blocks; put them before the define.
- Don't put empty assignments (DPDK_INSTALL_TARGET_LIBS)



 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
