From: Ed Blake <ed.blake@sondrel.com>
Date: Tue, 26 Mar 2019 11:03:07 +0000
Subject: [Buildroot] [PATCH 1/2] toolchain-external: add option for
 OpenMP support
In-Reply-To: <20190325165727.GK2660@scaer>
References: <20190322165929.14306-1-ed.blake@sondrel.com>
 <20190322165929.14306-2-ed.blake@sondrel.com>	<20190322211534.GH2660@scaer>
 <20190325112550.56b40d7d@blake-linux>	<20190325165727.GK2660@scaer>
Message-ID: <20190326110306.3e90671e@blake-linux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Mar 2019 17:57:27 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2019-03-25 11:27 +0000, Ed Blake spake thusly:
> > Hi Yann,
> > 
> > On Fri, 22 Mar 2019 22:15:34 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >   
> > > Ed, All,
> > > 
> > > On 2019-03-22 16:59 +0000, Ed Blake spake thusly:  
> > > > Add new BR2_TOOLCHAIN_HAS_OPENMP option for toolchains with OpenMP
> > > > support.    
> > > 
> > > With your series, there is no user of libgomp in Buildroot, so I
> > > suppose this is for your own local packages, right?  
> > 
> > Yes, it's for a local package.
> >   
> > > Actually, if we have packages in Buildroot that may use OpenMP, then it
> > > is only optional for them, then. Do you know of such a package? The goal
> > > being to actually add a runtime-test that gomp works.  
> > 
> > The following packages *could* use OpenMP, but currently disable it:
> > 
> > imagemagick
> > beecrypt
> > libraw
> > gettext
> > 
> > And the following package uses OpenMP if BR2_GCC_ENABLE_OPENMP is enabled:
> > 
> > fftw
> > 
> > I wonder if BR2_GCC_ENABLE_OPENMP should select BR2_TOOLCHAIN_HAS_OPENMP, in
> > the same way that BR2_TOOLCHAIN_BUILDROOT_FORTRAN selects BR2_TOOLCHAIN_HAS_FORTRAN.  
> 
> Ah, yes, that would indeed be good.
> 
> > Then BR2_TOOLCHAIN_HAS_OPENMP would be checked in the fftw makefile instead of
> > BR2_GCC_ENABLE_OPENMP.  
> 
> Then yes, it would be nice if your series would do:
> 
>  1. introduce BR2_TOOLCHAIN_HAS_OPENMP
>  2. BR2_GCC_ENABLE_OPENMP select BR2_TOOLCHAIN_HAS_OPENMP
>  3. external toolchain select BR2_TOOLCHAIN_HAS_OPENMP
>  4. fftw switches to using BR2_TOOLCHAIN_HAS_OPENMP
> 
> Care to have a look and respin your series, please?

Will do.  I just noticed opencv3 and flann also reference BR2_GCC_ENABLE_OPENMP, so I will change those as well in patch 4.

Ed.

> 
> Regards,
> Yann E. MORIN.
> 
> > Regards,
> > 
> > Ed.
> >    
> > > > Signed-off-by: Ed Blake <ed.blake@sondrel.com>    
> > > 
> > > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > 
> > > Regards,
> > > Yann E. MORIN.
> > >   
> > > > ---
> > > >  toolchain/Config.in                                    | 3 +++
> > > >  toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
> > > >  2 files changed, 7 insertions(+)
> > > > 
> > > > diff --git a/toolchain/Config.in b/toolchain/Config.in
> > > > index bcbc3cf984..bf42e92e00 100644
> > > > --- a/toolchain/Config.in
> > > > +++ b/toolchain/Config.in
> > > > @@ -168,6 +168,9 @@ config BR2_TOOLCHAIN_HAS_SSP
> > > >  config BR2_TOOLCHAIN_HAS_UCONTEXT
> > > >  	bool
> > > >  
> > > > +config BR2_TOOLCHAIN_HAS_OPENMP
> > > > +	bool
> > > > +
> > > >  config BR2_TOOLCHAIN_SUPPORTS_PIE
> > > >  	bool
> > > >  
> > > > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > > > index db3570d96f..747837fdc6 100644
> > > > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > > > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > > > @@ -144,6 +144,10 @@ TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
> > > >  endif
> > > >  endif
> > > >  
> > > > +ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
> > > > +TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
> > > > +endif
> > > > +
> > > >  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
> > > >  
> > > >  
> > > > -- 
> > > > 2.17.1
> > > > 
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot    
> > >   
> >   
> 
