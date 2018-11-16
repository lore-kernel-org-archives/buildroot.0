From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 09:53:28 +0100
Subject: [Buildroot] [PATCH next v4 4/6] Makefile: move .NOTPARALLEL
 statement after including .config file
In-Reply-To: <20181115213758.GS10271@scaer>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-5-thomas.petazzoni@bootlin.com>
 <20181115213758.GS10271@scaer>
Message-ID: <20181116095328.283584ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 22:37:58 +0100, Yann E. MORIN wrote:

> Ultimately, I don't see why we do need a config option to turn top-level
> parallel build on/off. It will ultimately be the user's choice to do so
> when calling 'make -jN' no?
> 
> However, what we do need for now, is a config option that enabled
> per-package directories (PPD, formerly known as PPS, per-package
> staging). When that is turned off, we must not allow top-level
> parallel build.
> 
> I was thinking that we would not need that option either, because we
> would enable PPD when we detect that the user is doing top-level parllel
> build, by inspecting $(MAKEFLAGS) to see if they contained -j.
> 
> However, make is our fiend here, because it does not include -j in the
> MAKFLAGS variable, but the one that is exported:
> 
>     $ cat Makefile
>     $(info var MAKEFLAGS='$(MAKEFLAGS)')
>     all:
>         @echo "env MAKEFLAGS='$${MAKEFLAGS}'"
> 
>     $ make -j1
>     var MAKEFLAGS=''
>     env MAKEFLAGS=''
> 
>     $ make -j3
>     var MAKEFLAGS=''
>     env MAKEFLAGS=' -j --jobserver-fds=3,4'
> 
>     $ make -j
>     var MAKEFLAGS=''
>     env MAKEFLAGS=' -j'
> 
> And there is no other variable in make that specifies that either...
> 
> So yes, this means we have no way from the Makefile to detect whether
> we're parallel or not. Sigh. :-(
> 
> So we do need that option for PPD.
> 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for this research and the review. I think there is another
reason to have an option, at least for the moment: I'm pretty sure a
number of people not aware of top-level parallel build issues use
Buildroot with "make -jN" today, as they have learned that using make
-jN will "speed up their build" (I mean in general, not specifically
for Buildroot).

If we were to use make -jN as the criteria to decide if PPD should be
used or not, then suddenly all such users would start using PPD, which
is still way too experimental to expose it without the user's explicit
consent.

My plan is rather the following:

 (1) Have it under an explicit option for now.

 (2) Once we consider it stable, drop the option entirely, and always
     use PPD, even if the user doesn't use top-level parallel build.
     There's a slight additional cost, but there's also a huge benefit
     in terms of dependency checking/isolation.

Note that we might stay on step (1) for a little while, I think it will
take time to really make it fully usable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
