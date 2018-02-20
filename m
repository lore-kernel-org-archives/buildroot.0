From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Feb 2018 10:05:08 +0100
Subject: [Buildroot] [2018.02] check-bin-arch fails for PowerPC 32-bit
 userland, 64-bit kernel
In-Reply-To: <20180220085638.GB11289@australia>
References: <20180220085638.GB11289@australia>
Message-ID: <20180220100508.5c71fa1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for taking the time to test 2018.02 in your setup!

On Tue, 20 Feb 2018 09:56:38 +0100, Thomas De Schampheleire wrote:

> I have a defconfig with a multilib toolchain for PowerPC e6500 which is a 64-bit
> architecture. The toolchain builds 32-bit by default, which is used for
> userland. The kernel forces 64-bit anyway.
> BR2_ARCH is set to "powerpc".
> 
> With the introduction of check-bin-arch, I now see failures after the kernel
> compilation:
>     ERROR: architecture for "/lib/modules/3.12.37-rt51/kernel/lib/libcrc32c.ko" is "PowerPC64", should be "PowerPC"
> and same for other modules.
> For actual userland binaries, readelf does show PowerPC as expected.
> 
> According to me, the situation is normal and check-bin-arch should accept it.
> However, how to deal with it?

Indeed.

> We could add a second variable BR2_READELF_ARCH_NAME_KERNEL.
> Its value would be the same as the existing BR2_READELF_ARCH_NAME in case we are
> dealing with a 32-bit arch, but the 64-bit equivalent in case of a 64-bit arch.
> However, we don't currently mark all 64-bit powerpc architectures as such, so
> we'd need some more knowledge about them (or could add them case by case as
> required).

How would the value of BR2_READELF_ARCH_NAME_KERNEL be defined? How
would Buildroot know that despite the architecture being PowerPC, the
Linux kernel image and modules being built are PowerPC64 ?

Another alternative is to simply blacklist /lib/modules from
check-bin-arch, like we're already doing
for /lib/firmware, /usr/lib/firmware and /usr/share. It's unlikely that
there will be an architecture mismatch on kernel modules.

Also, it is worth mentioning that Markus recently raised another issue
with check-bin-arch, when you're building a multilib system, mixing 32
bit and 64 bit binaries: http://patchwork.ozlabs.org/patch/874245/.
However, I don't think we will be able to support Markus use case,
since we don't have a good way to support multilib.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
