From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:20:39 +0100
Subject: [Buildroot] [PATCH 1/8] libunwind: fix C library dependency
In-Reply-To: <56A69ACC.1030505@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A69ACC.1030505@gmail.com>
Message-ID: <20160125232039.2ef30ef9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, 25 Jan 2016 22:59:40 +0100, Romain Naour wrote:

> > diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
> > index 85cb472..6f747ae 100644
> > --- a/package/libunwind/Config.in
> > +++ b/package/libunwind/Config.in
> > @@ -1,15 +1,32 @@
> > +# libunwind is only available for a certain subset of the
> > +# architectures (as visible in the list of architectures supported
> > +# with the glibc C library below).
> > +#
> > +# In addition to this, on some architectures libunwind requires the
> > +# *context() function from the C library, which are only available on
> > +# certain architectures in uClibc, and not available at all on
> > +# musl. But on some other architectures, libunwind works without using
> > +# the *context() functions, which allows it to be built with musl.
> > +config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> > +	bool
> > +	default y if BR2_TOOLCHAIN_USES_GLIBC && \
> > +		(BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
> > +		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64)
> > +	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
> > +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
> > +		 BR2_x86_64)
> > +	default y if BR2_TOOLCHAIN_USES_MUSL && \
> > +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64)
> > +
> >  config BR2_PACKAGE_LIBUNWIND
> >  	bool "libunwind"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> > -	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # {g,s}etcontext
> > -	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
> > -		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
> > +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS

Thanks for reviewing!

> Build tested on musl and x86_64.
> Checked that libunwind doesn't build with uClibc-snapshot and uClibc-ng.

I don't get this sentence however. libunwind should build with
uClibc-ng on the architectures listed in
BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
