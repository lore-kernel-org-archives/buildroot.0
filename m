From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 16:34:24 +0100
Subject: [Buildroot] [PATCH v1 1/3] efivar: bump to version 30
In-Reply-To: <CAK4VdL2kw5N2R1GukCnRLLe7brJEB9gO1XcOWpn9sgxjw6J3qg@mail.gmail.com>
References: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
 <20161128163553.173811-2-andriy.shevchenko@linux.intel.com>
 <20161203143405.0e4a8a54@free-electrons.com>
 <CAK4VdL2kw5N2R1GukCnRLLe7brJEB9gO1XcOWpn9sgxjw6J3qg@mail.gmail.com>
Message-ID: <20161203163424.515d4605@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Dec 2016 16:18:00 +0100, Erico Nunes wrote:

> I took a look at them and it seems that there are two kinds of
> failures. The first is that efivar uses dynamic linking as it uses
> dlfcn.h and this has been exposed now that we no longer restrict to
> glibc, so we should probably restrict it in Config.in for non-static
> builds.

ACK.

> The other failures related to blackfin are weirder, I don't fully
> understand what is going on there yet, but I wonder if it makes sense
> to invest more effort in debugging that.
> I think we could consider limiting efivar/efibootmgr to architectures
> that can actually run EFI. That is, x86_64, aarch64, x86, arm,
> possibly allow in a few other experimental ones (there is a summary at
> https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Processor_compatibility
> ), and only allow little-endian variations as well. I would prefer if
> we didn't have to add architecture restrictions for building, however
> with this we are already maintaining a number of hacks in efivar for
> architectures that will probably never use it anytime soon.
> 
> By the way, there is a mention to "since we depend on glibc" in
> efivar.mk which was not removed when the uclibc compatibility patch
> was introduced, so we should update that as well.

OK.

> If you agree with solving that by limiting architectures, I can submit
> these fixes.

Limiting architectures is normally OK when there is a fundamental
reason why it cannot be built/used on a given architecture, so I'm
generally not too happy when we limit architectures just because we
want to avoid build failures and not investigate the real reason.

But since I agree that EFI is very architecture specific, and most
likely never used on Blackin/m68k/etc., I'm fine with a patch limiting
the architectures.

Please introduce a BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS hidden boolean, and
use it in BR2_PACKAGE_EFIVAR, in the comment, in
BR2_PACKAGE_EFIBOOTMGR and its comment.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
