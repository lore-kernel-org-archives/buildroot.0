From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 3 Dec 2016 16:18:00 +0100
Subject: [Buildroot] [PATCH v1 1/3] efivar: bump to version 30
In-Reply-To: <20161203143405.0e4a8a54@free-electrons.com>
References: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
 <20161128163553.173811-2-andriy.shevchenko@linux.intel.com>
 <20161203143405.0e4a8a54@free-electrons.com>
Message-ID: <CAK4VdL2kw5N2R1GukCnRLLe7brJEB9gO1XcOWpn9sgxjw6J3qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sat, Dec 3, 2016 at 2:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This update is causing a large number of build failures, see:
>
>    http://autobuild.buildroot.net/?reason=efivar-30
>
> Could you have a look?

I took a look at them and it seems that there are two kinds of
failures. The first is that efivar uses dynamic linking as it uses
dlfcn.h and this has been exposed now that we no longer restrict to
glibc, so we should probably restrict it in Config.in for non-static
builds.
The other failures related to blackfin are weirder, I don't fully
understand what is going on there yet, but I wonder if it makes sense
to invest more effort in debugging that.
I think we could consider limiting efivar/efibootmgr to architectures
that can actually run EFI. That is, x86_64, aarch64, x86, arm,
possibly allow in a few other experimental ones (there is a summary at
https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Processor_compatibility
), and only allow little-endian variations as well. I would prefer if
we didn't have to add architecture restrictions for building, however
with this we are already maintaining a number of hacks in efivar for
architectures that will probably never use it anytime soon.

By the way, there is a mention to "since we depend on glibc" in
efivar.mk which was not removed when the uclibc compatibility patch
was introduced, so we should update that as well.

If you agree with solving that by limiting architectures, I can submit
these fixes.

Erico
