From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 26 Aug 2020 15:16:13 +0200
Subject: [Buildroot] [PATCH v2] package/armadillo: allows to select
 between clapack, lapack or openblas
In-Reply-To: <20200824223618.67268f4e@windsurf.home>
References: <20200824132215.25517-1-gwenj@trabucayre.com>
 <20200824223618.67268f4e@windsurf.home>
Message-ID: <20200826151613.2c71f836@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all
On Mon, 24 Aug 2020 22:36:18 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Mon, 24 Aug 2020 15:22:15 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> > index b2b61a3233..0a65f5b966 100644
> > --- a/package/armadillo/Config.in
> > +++ b/package/armadillo/Config.in
> > @@ -1,3 +1,12 @@
> > +config BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> > +	bool
> > +	default y if (!BR2_m68k_cf && (!BR2_powerpc ||
> > BR2_TOOLCHAIN_USES_GLIBC))
> 
> Can we write this like this:
> 
> 	default y
> 	depends on !BR2_m68k
> 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
> 
> > +config BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> > +	bool
> > +	default y if BR2_TOOLCHAIN_HAS_FORTRAN && \
> > +		BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> 
> I am a bit confused here, why does it require
> BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS ? What is the relationship between
> lapack support and openblas ?
> 
typo...
> Also, the lapack package has a "depends on !CLAPACK" so if the user has
> clapack enabled, it should not be possible to enable the lapack "usage"
> in armadillo.
> 
> Also, don't you need to take into account the following dependency from
> lapack:
> 
>         # _fpu_control is used on PowerPC, but not available with uClibc
>         depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
> 
> > +
> >  comment "armadillo needs a toolchain w/ C++"
> >  	depends on !BR2_INSTALL_LIBSTDCPP
> >  	depends on !BR2_powerpc
> > @@ -10,11 +19,46 @@ comment "armadillo needs a glibc toolchain w/ C++"
> >  config BR2_PACKAGE_ARMADILLO
> >  	bool "armadillo"
> >  	depends on BR2_INSTALL_LIBSTDCPP
> > -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
> > -	depends on !BR2_m68k_cf # clapack
> > -	select BR2_PACKAGE_CLAPACK
> > +	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS || \
> > +		BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS || \
> > +		BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> >  	help
> >  	  Armadillo: An Open Source C++ Linear Algebra Library for
> >  	  Fast Prototyping and Computationally Intensive Experiments.
> >  
> >  	  http://arma.sourceforge.net/
> > +
> > +if BR2_PACKAGE_ARMADILLO
> > +
> > +choice
> 
> Do we really need this choice ? Isn't it possible in the .mk to prefer
> one solution if available, then another, and finally another ?
> 
> This is really an open question: if there are good reason to showing
> this choice to the user, we can keep it.
>
I'm agree, I'm not happy by using choice but applications maybe require
explicitly lapack (and segfault with clapack), or clapack. With an approach
based on prefer, it's difficult to respect these constraints. This is why I
used choice. 
>
> > +	prompt "blas library"
> > +	default BR2_PACKAGE_ARMADILLO_CLAPACK if \
> > +		BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> > +	default BR2_PACKAGE_ARMADILLO_LAPACK if \
> > +		BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS && \
> > +		!BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> 
> I think you can drop the !BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS,
> Kconfig will pickup the first "default" that has its dependencies met.
> In fact, you could simply drop all those default statements, and
> Kconfig would pick the first choice entry that has its dependencies met.
>
OK
> 
> > diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> > index 624b842ef6..1cc3d0c968 100644
> > --- a/package/armadillo/armadillo.mk
> > +++ b/package/armadillo/armadillo.mk
> > @@ -7,11 +7,20 @@
> >  ARMADILLO_VERSION = 9.900.2
> >  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
> >  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
> > -ARMADILLO_DEPENDENCIES = clapack
> >  ARMADILLO_INSTALL_STAGING = YES
> >  ARMADILLO_LICENSE = Apache-2.0
> >  ARMADILLO_LICENSE_FILES = LICENSE.txt
> >  
> > +ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
> > +ARMADILLO_DEPENDENCIES = openblas
> > +else
> > +ifeq ($(BR2_PACKAGE_ARMADILLO_CLAPACK), y)
> 
> put the "else" and following "ifeq" on the same line, so that you don't
> need an additional "endif".
> 
> I.e:
> 
> ifeq ...
> ...
> else ifeq ...
> ...
> else
> ...
> endif
> 
> > +ARMADILLO_DEPENDENCIES = clapack
> > +else
> > +ARMADILLO_DEPENDENCIES = lapack
> > +endif
> > +endif
> 
> With this logic, there is in fact nothing that guarantees which blas
> library will be used. If both openblas and clapack are available on the
> system, even if you select BR2_PACKAGE_ARMADILLO_CLAPACK, openblas
> might be used by armadillo...
>
I need to use  -DLAPACK_LIBRARIES and -DBLAS_LIBRARIES to avoid this.
But I seen another problem with openblas: all provides blas support but only
clapack and lapack are lapack providers. I'm not sure if I need to add one
choice for lapack and a second one for blas or simply disabling lapack when user
select openblas.
>
> Best regards,
> 
> Thomas
> -- 
Best regards,
Gwenhael
