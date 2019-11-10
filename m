From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 21:35:36 +0100
Subject: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
In-Reply-To: <20191109144656.3da6a1b0@windsurf>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
Message-ID: <20191110203536.GE3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, Thomas, All,

On 2019-11-09 14:46 +0100, Thomas Petazzoni spake thusly:
> +Arnout for legacy handling.
> 
> On Fri,  8 Nov 2019 09:41:10 -0800
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 
> > This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)
> > 
> > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> > ---
> >  arch/Config.in.arc | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> > index c65bb01f1f4f..284951b82cee 100644
> > --- a/arch/Config.in.arc
> > +++ b/arch/Config.in.arc
> > @@ -11,13 +11,19 @@ config BR2_arc750d
> >  config BR2_arc770d
> >  	bool "ARC 770D"
> >  
> > -config BR2_archs38
> > +config BR2_archs
> >  	bool "ARC HS38"
> >  	help
> >  	  Generic ARC HS capable of running Linux, i.e. with MMU,
> > -	  caches and multiplier. Also it corresponds to the default
> > +	  caches and 32-bit multiplier. Also it corresponds to the default
> >  	  configuration in older GNU toolchain versions.
> >  
> > +config BR2_archs38
> 
> This re-use of an existing name is a bit annoying. Indeed, all existing
> users of Buildroot that have a configuration with BR2_archs38 will now
> be building for a ARC system with a 64-bit multiplier, while they were
> previously building for a 32-bit multiplier.
> 
> I see that what you have done is to try to be consistent between the
> BR2_ options and the gcc options. I'm hesitating between keeping the
> consistency but making the migration a bit annoying for users, or
> breaking the consistency to make the migration smooth for users.
> 
> Since I think the number of affected users will probably be quite
> small/limited, I think I would be fine with merging your patch as-is,
> but I'd like to hear from others.

I would prefer if we kept the existing name as-is, and introduce the new
variant under a different name, e.g.:

    config BR2_archs38
        bool "ARC HS38"

    config BR2_archs68_64mpy
        bool "ARC HS38 w/ 64-bit mpy"

Because, well, they both are HS38 cores, so we are not wrong in naming
both options with hs38.

It would have been good that the config names match the gcc option, of
course, but that is a minor detail I believe...

Regards,
Yann E. MORIN.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
