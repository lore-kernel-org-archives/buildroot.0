From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Feb 2018 10:57:44 +0100
Subject: [Buildroot] [2018.02] check-bin-arch fails for PowerPC 32-bit
 userland, 64-bit kernel
In-Reply-To: <20180220094115.GD11289@australia>
References: <20180220085638.GB11289@australia>
 <20180220100508.5c71fa1c@windsurf.home>
 <20180220094115.GD11289@australia>
Message-ID: <20180220105744.67bcd8cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Feb 2018 10:41:15 +0100, Thomas De Schampheleire wrote:

> > How would the value of BR2_READELF_ARCH_NAME_KERNEL be defined? How
> > would Buildroot know that despite the architecture being PowerPC, the
> > Linux kernel image and modules being built are PowerPC64 ?  
> 
> With the knowledge about whether an architecture is really 64-bit, despite the
> setting of BR2_ARCH="powerpc" and not "powerpc64", and the assumption/fact that
> the kernel always is built for the native bitness of the architecture, this
> could be done.
> 
> In my case, the CPU is e6500 which is 64-bit, thus the kernel will be 64-bit.
> For MIPS64n32 it's the same, although that readelf does not seem to make a
> difference here in the architecture name, it's always 'MIPS R3000'.

I'm not sure that's true on ARM. I believe you can build an ARM 32-bit
kernel, and run it on a 64-bit capable ARM platform. Therefore, the
fact that Cortex-A53 is selected but the architecture is ARM (and not
AArch64) doesn't imply that the kernel will be 64-bit.

But that doesn't necessarily matter: we can always a different logic to
define BR2_READELF_ARCH_NAME_KERNEL for each architecture.

> > Another alternative is to simply blacklist /lib/modules from
> > check-bin-arch, like we're already doing
> > for /lib/firmware, /usr/lib/firmware and /usr/share. It's unlikely that
> > there will be an architecture mismatch on kernel modules.  
> 
> This is indeed the simplest solution.
> 
> It would fail to catch a problem where a package ships binary modules in the
> wrong architecture, but this may be enough of an edge case to not consider it.

Binary modules anyway don't really work well in a context where the
kernel is anyway being built from source.

> Thanks for the pointer.
> I wonder how he'd get into that situation. The recommended approach for a mixed
> 32/64-bit system is with two separate defconfigs, and check-bin-arch will check
> for each one separately.

You can look at the cover letter of the series for more details about
the use case, which IMO is really a corner case: their toolchain is
multilib, and they want to be able to install the 32-bit libraries of
the toolchain along with the 64-bit libraries. It doesn't solve the
problem of building some packages 32-bit, some packages 64-bit and some
both, which IMO is unsolvable with the current Buildroot architecture.

However, they pointed out that the lib64 symlinks to lib that we have
cause problems when you want to combine two separate defconfigs. If you
have already done something like combining two builds (one 32-bit, one
64-bit), then it'd be great if you could participate to that thread of
discussion.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
