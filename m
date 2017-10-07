From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Oct 2017 14:27:07 +0200
Subject: [Buildroot] [PATCH 3/8] toolchain/external-custom: hide
 versions too old for the current arch
In-Reply-To: <8dbdd051-e288-fd2d-433b-a441a9e4e6bc@gmail.com>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
 <a9dc18ece6b62e3ac4ce274b708081a9d16bb6aa.1504431850.git.yann.morin.1998@free.fr>
 <8dbdd051-e288-fd2d-433b-a441a9e4e6bc@gmail.com>
Message-ID: <20171007122707.GI21901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-10-07 11:27 +0200, Romain Naour spake thusly:
> Le 03/09/2017 ? 11:44, Yann E. MORIN a ?crit?:
[--SNIP--]
> > Note: this implies that it is no longer possible to use a custom
> > external toolchain in which a specific core has been back-ported
> > Thus, this patch may cause regressions in very specific and rare
> > corner cases. Do we want to support those cases? If yes, then we
> > should drop this patch.
> 
> This can be a problem for Linaro toolchains [1] where the GCC support for some
> new cpu are backported. (Ok this example is moot since Buildroot doesn't support
> these cpu).

On the other hand, we could get a non-working configuration for other
external toolchains.

And that is not nice to let the user generate a configuration we know if
invalid.

> Also since BR2_TOOLCHAIN_EXTERNAL_GCC_XXX is an user choice, we can print a
> warning instead of completely disabling the gcc version ?

I'll see if I can do something about that.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> [1] https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/
> 
> > ---
> >  .../toolchain-external-custom/Config.in.options           | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > index ae343ddad5..eb7c30f171 100644
> > --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > @@ -18,6 +18,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
> >  
> >  choice
> >  	bool "External toolchain gcc version"
> > +	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> > +	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
> > +	default BR2_TOOLCHAIN_EXTERNAL_GCC_5   if BR2_ARCH_NEEDS_GCC_AT_LEAST_5
> > +	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_9 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
> > +	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_8 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
> >  	help
> >  	  Set to the gcc version that is used by your external
> > @@ -29,42 +34,52 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_7
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_6
> >  	bool "6.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_5
> >  	bool "5.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
> >  	bool "4.9.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
> >  	bool "4.8.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
> >  	bool "4.7.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
> >  	bool "4.6.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
> >  	bool "4.5.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
> >  	bool "4.4.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
> >  	bool "4.3.x"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
> >  	bool "older"
> > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
> >  	help
> >  	  Use this option if your GCC version is older than any of the
> >  	  above.
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
