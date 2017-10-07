From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Oct 2017 12:26:16 +0200
Subject: [Buildroot] [PATCH 1/8] arch: introduce minimal required gcc
 version
In-Reply-To: <e500946f-2c07-e7a5-99ee-68b5611cc14d@gmail.com>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
 <8de5375c8ca0110ebd5baaec946fed002cc7eb80.1504431850.git.yann.morin.1998@free.fr>
 <e500946f-2c07-e7a5-99ee-68b5611cc14d@gmail.com>
Message-ID: <20171007102616.GF21901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-10-07 11:59 +0200, Romain Naour spake thusly:
> Le 03/09/2017 ? 11:44, Yann E. MORIN a ?crit?:
> > Some CPU variants require that a recent-enough gcc be selected. For
> > example, ARM's cortex-a35 requires gcc-5, while cortex-a73 requires
> > gcc-7. Same goes for other architectures, of course.
> > 
> > Currently, we hard-code every such conditions in the gcc version choice,
> > as well as in the individual external toolchains.
> > 
> > However, as we add even more CPU variants, the conditions are getting
> > more and more complex to write and maintain.
> > 
> > Introduce new symbols, that architectures can select if they have a
> > specific requirement on the gcc version. gcc and external toolchains
> > can then properly depend on those symbols.
> > 
> > The burden of maintaining the requirements on the gcc version now falls
> > down to the architeture, instead of being split up in gcc and all the
> > external toolchains.
> > 
> > As the oldest gcc version to handle, we can either choose gcc-4.9, as
> > the odlest version we support in our internal toolchain, or choose
> > gcc-4.8, as the oldest external toolchain we support (except for the
> > custom ones, but they'll be handled specifically in upcoming changes).
> > We choose to go back up to gcc-4.8.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  arch/Config.in | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/arch/Config.in b/arch/Config.in
> > index c10bf16809..607da36c1d 100644
> > --- a/arch/Config.in
> > +++ b/arch/Config.in
> > @@ -261,6 +261,27 @@ config BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
> >  	bool
> >  	default y if !BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
> >  
> > +# The following symbols are selected by the individual
> > +# Config.in.$ARCH files
> 
> I believe something is missing from this patch.

Nope, this patch only adds the symbols. The follow-up patches convert
the individual architectures, one by one, over to using them.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> > +config BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> > +	bool
> > +
> > +config BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
> > +	bool
> > +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> > +
> > +config BR2_ARCH_NEEDS_GCC_AT_LEAST_5
> > +	bool
> > +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
> > +
> > +config BR2_ARCH_NEEDS_GCC_AT_LEAST_6
> > +	bool
> > +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
> > +
> > +config BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> > +	bool
> > +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
> > +
> >  # The following string values are defined by the individual
> >  # Config.in.$ARCH files
> >  config BR2_ARCH
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
