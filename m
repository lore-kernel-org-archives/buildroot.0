From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 16:22:16 +0200
Subject: [Buildroot] [PATCH v3 01/14] toolchain/toolchain-common.in: add
 BR2_TOOLCHAIN_HAS_LIBQUADMATH hidden symbol
In-Reply-To: <7e95119d-44a7-dbf5-bc60-95b8a5bab77f@mind.be>
References: <20160703134750.7516-1-s.martin49@gmail.com>
 <20160703134750.7516-2-s.martin49@gmail.com>
 <7e95119d-44a7-dbf5-bc60-95b8a5bab77f@mind.be>
Message-ID: <20160704162216.272f1883@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 11:16:08 +0200, Arnout Vandecappelle wrote:

> > +# - libquadmath is not needed/available on all architectures (but gcc
> > +#   correctly handles this already).
> > +# - At least, libquadmath is available on:
> > +#   - i*86
> > +#   - x86_64
> > +# - When available, libquadmath requires wchar support.
> > +config BR2_TOOLCHAIN_HAS_LIBQUADMATH
> > +	bool
> > +	default y if BR2_i386 || BR2_x86_64  
> 
>  Wouldn't it make more sense to add here:
> 
> 	depends on BR2_USE_WCHAR
> 
> (and remove it from the .mk file)?

We thought about this, and discussed it with Samuel, but we had a good
reason not to do it. It was yesterday so I already forgot why.

Ah, there it is. Look at this option:

 config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
        bool "Enable Fortran support"
+       # on architecture building libquadmath, wchar is required
+       depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
+               (BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)

How would express the dependency of Fortran is
BR2_TOOLCHAIN_HAS_LIBQUADMATH handles the BR2_USE_WCHAR dependency?
libquadmath is only available on i386 and x86_64, and in *this* case
wchar is needed for Fortran support.

So, we want to show the Fortran option if:

 * We are on an architecture that does not need libquadmath

or

 * We are on an architecture that does need libquadmath, in which case
   we also need wchar.

Do you see a better solution ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
