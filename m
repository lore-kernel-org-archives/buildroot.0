From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Feb 2018 21:59:28 +0100
Subject: [Buildroot] [RFC 0/6] Support 32-bit binaries on a 64-bit
 architecture
In-Reply-To: <20180216064557.d6zfemlr7c2zj4x3@tarshish>
References: <20180216005612.69593-1-mmayer@broadcom.com>
 <20180216064557.d6zfemlr7c2zj4x3@tarshish>
Message-ID: <20180216215928.4ada222c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Feb 2018 08:45:57 +0200, Baruch Siach wrote:

> On Thu, Feb 15, 2018 at 04:56:06PM -0800, Markus Mayer wrote:
> > This series contains a proposal for supporting 32-bit libraries and
> > binaries on a 64-bit platform.
> > 
> > There are some limitations and prerequisites as to the scope this has
> > been tested.
> > 
> > - It has only been tested on ARM/ARM64.
> > - It has only been tested with an external toolchain
> >   (https://github.com/Broadcom/stbgcc-6.3/releases).
> > - It requires that the Aarch64 compiler be compiled with "multi-lib"
> >   enabled. This ensures that the sysroot doesn't contain a lib64 ->
> >   lib symlink. Instead, lib and lib64 are separate directories.
> > - It has only been tested with a fairly limited number of packages.
> >   There might be other packages that don't correctly pass --libdir,
> >   similar to bzip2 as mentioned below.  
> 
> There is one thing I am missing here. AFAICS, this series does not add support 
> for building 32-bit libraries in addition to their 64-bit versions. So the 
> 32-bit binaries that are to run on target must have their dependencies 
> satisfied from the toolchain provided libraries. Is that correct?

Yes, indeed, I'm interested in understanding that part as well. It
seems like the assumption is that the external toolchain has a 32-bit
sysroot, and only the libraries from this sysroot are necessary.

This feels very limited/restricted to very specific use cases and
therefore not very usable in a broader context.

And extending that to building packages is really difficult with
Buildroot:

 (1) Kconfig has no way to easily allow to select for each and every
     package whether it should be built 32-bit, 64-bit or both.

 (2) Our package infrastructure is entirely based on the fact that a
     given package is built only once. So if you assume that you
     solved problem (1) by adding gazillions of Config.in options to
     each and every package, there is still no way the zlib package
     will be built two times, once 32-bit and 64-bit. No without major
     changes to the package infrastructure.

So supporting multilib has already been discussed several times, but
nobody ever came up with a proposal that could reasonably solve
problems (1) and (2). Unfortunately, unless there are some proposals to
solve those problems, I don't think we want to have some very limited
and highly specific multilib support, that only works with external
toolchains and that only works for 32-bit libraries provided by the
external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
