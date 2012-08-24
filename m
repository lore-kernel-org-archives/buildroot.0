From: Kevin Chadwick <ma1l1ists@yahoo.co.uk>
Date: Fri, 24 Aug 2012 16:58:20 +0100
Subject: [Buildroot] Best way of building for unknown architecture
In-Reply-To: <20120821093527.2dd03b31@skate>
References: <760828.46392.bm@smtp116.mail.ukl.yahoo.com>
 <20120817194310.25198340@skate>
 <12889.25157.bm@smtp148.mail.ukl.yahoo.com>
 <20120821093527.2dd03b31@skate>
Message-ID: <899492.90023.bm@smtp121.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Aug 2012 09:35:27 +0200
Thomas Petazzoni wrote:

> 
> -mthumb can be added to the BR2_TARGET_OPTIMIZATION option, though at
> some point, it might be good to add an option to build ARM code with
> the ARM instruction set, or the Thumb instruction set, or the Thumb-2
> instruction set.
> 

I tried it with -pipe -mthumb and just -mthumb but I don't think it
worked because I get the following error.
________________________________________________________________________

AS lib/crt1.o
libc/sysdeps/linux/arm/crt1.S:1:0: error: target CPU does not support
ARM mode
make[1]: *** [lib/crt1.o] Error 1
make[1]: Leaving directory
`/usr/src/buildroot-toolchain/output/toolchain/uClibc-0.9.33.2'
make: ***
[/usr/src/buildroot-toolchain/output/toolchain/uClibc-0.9.33.2/.configured]
Error 2
________________________________________________________________________

This is the same error as when using the appropriate -mtune=cortex-m3
-march=armv7-m flags manually on the commandline without -mthumb. With
-mthumb added it then compiles fine from the commandline without the
"target cpu does not support ARM mode" error.
 

Is this relevent?

http://lists.uclibc.org/pipermail/buildroot/2008-December/011988.html


> 
> > I wanted to test it so I extracted a fresh buildroot and pointed the
> > external chain to the already built uclibc internal toolchain
> > (built before patching with above) where I had selected NO_MMU before
> > building.
> > 
> > When I ran make I got
> > 
> > Checking external toolchain settings
> > MMU support available in C library, please enable BR2_USE_MMU
> > 
> > This chip has no MMU but does have an MPU, do I need to rebuild the
> > toolchain with this patch, bypass/fix this error or enable MMU and
> > select not to use MMU or something else?
> 
> It is due to the fact that the uClibc headers define __ARCH_USE_MMU__.
> This is because uClibc has been built with MMU support. In fact, the
> Buildroot toolchain backend for now doesn't support building non-MMU
> toolchains. But it could probably be added relatively easily.
> 
> In toolchain/uClibc/uclibc.mk, you would have to tweak the
> uClibc .config (like we already do for many options) so as to disable
> the ARCH_USE_MMU uClibc option when BR2_USE_MMU is disabled.
> 
> Something along the lines of (completely untested):
> 
> diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
> index 9d0b6db..0eb11c0 100644
> --- a/toolchain/uClibc/uclibc.mk
> +++ b/toolchain/uClibc/uclibc.mk
> @@ -245,6 +245,9 @@ ifneq ($(UCLIBC_TARGET_ENDIAN),)
>                 -e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
>                 $(UCLIBC_DIR)/.oldconfig
>  endif
> +ifeq ($(BR2_USE_MMU),)
> +       $(SED) 's,.*ARCH_USE_MMU.*,# ARCH_USE_MMU is not set,g' $(UCLIBC_DIR)/.oldconfig
> +endif
>  ifeq ($(BR2_LARGEFILE),y)
>         $(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.oldconfig
>  else
> 
> However, besides this option, you will also probably need to adjust the
> uClibc configuration to add support for FLAT binaries.
> 


Yep it worked but unfortunately I get

______________________________________________________________________

  CC libc/unistd/usleep.os
  AS libpthread/nptl/sysdeps/unix/sysv/linux/arm/clone.os
  AS libpthread/nptl/sysdeps/unix/sysv/linux/arm/vfork.os
  CC libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os
In file included from
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:31:0:
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:17: error:
  'fork' undeclared here (not in a function)
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: warning:
  type defaults to 'int' in declaration of '__libc_fork'
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:63:1: error:
  '__libc_fork' redeclared as different kind of symbol
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: note:
  previous declaration of '__libc_fork' was here
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:227:1: warning:
  type defaults to 'int' in declaration of 'fork'
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:228:1: error:
  'fork' redeclared as different kind of symbol
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:227:1: note:
  previous declaration of 'fork' was here
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:229:1: error:
  '__EI_fork' aliased to undefined symbol '__GI_fork'
  libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:229:1: error:
  '__EI_fork' aliased to undefined symbol '__GI_fork' make[1]: ***
  [libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os] Error 1
  make[1]: Leaving directory
  `/usr/src/buildroot-toolchain-nommu/output/toolchain/uClibc-0.9.33.2'
  make: ***
  [/usr/src/buildroot-toolchain-nommu/output/toolchain/uClibc-0.9.33.2/lib/libc.a]
  Error 2
________________________________________________________________________


This link suggests it may be the kernel headers.

http://old.nabble.com/uClibc-compilation-error-with-nommu-td22424490.html


> The no-MMU support for ARM is basically non-existent for now in
> Buildroot, but I'm interested in having that integrated, so I'll try to
> help you getting this working.
> 

With blackfin working and without major changes and with ucLinux
starting as nommu, I assumed the support was mostly there. Do you think
it will be fairly trivial for us to sort out or I would be better off
looking at ucLinux or Openembedded?

Thanks,

Kc
