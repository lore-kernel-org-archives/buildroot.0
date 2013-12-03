From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 3 Dec 2013 12:32:52 -0600
Subject: [Buildroot] [RFC] makefile ?= behavior
In-Reply-To: <20131203182316.GA3633@free.fr>
References: <20131203073003.0FA7E1014F4@stock.ovh.net>
 <529DE4FE.8020900@imgtec.com> <529DE716.1000205@zacarias.com.ar>
 <20131203152541.47e942be@skate>
 <OF1C1194FC.E790AAF4-ON86257C36.00633887-86257C36.00640499@rockwellcollins.com>
 <20131203182316.GA3633@free.fr>
Message-ID: <OFA7CC1B55.44D07B4B-ON86257C36.0065657C-86257C36.0065E310@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@gmail.com> wrote on 12/03/2013 12:23:16 
PM:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Matthew Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 12/03/2013 12:24 PM
> Subject: Re: [Buildroot] [RFC] makefile ?= behavior
> Sent by: "Yann E. MORIN" <yann.morin.1998@gmail.com>
> 
> Matthew, All,
> 
> On 2013-12-03 12:12 -0600, Matthew Weber spake thusly:
> > I'd like to make sure I'm not loosing it :-)
> > 
> > So I have the package smcroute(https://github.com/troglobit/smcroute) 
(new 
> > package not yet in buildroot) and it is autotools based.  I do a 
configure 
> > with all the toolchain info and it sets up the Makefile to have the 
> > following CC definition.  This is the only location in the package 
> > Makefiles that set CC.
> >     CC ?= /opt/linux/linaro4.7/usr/bin/arm-linux-gnueabihf-gcc 
> 
> That's because it's not a complete autotools-based package: the
> configure is from autoconf, but the Makefile is hand-written, so you
> won't be able to use the autotools-package infrastructure.
> 
> Instead, use the generic-package infrastructure, and provide the
> adequate CONFIGURE_CMDS, BUILD_CMDS and INSTALL_TARGET_CMDS.

Completely agree, initially I was hoping to go the autotools route.

> 
> > I believe that the ?= should just be a =, but in what cases would the 
?= 
> > actually work?  I'm trying to put the story together to convince 
someone 
> > that believes it's just a environment issue...
> 
> ?= means to assign the value if it is not already set.

So how I understand it is that no CC is being set through the cmdline, 
so the ?= value should get set as the CC, however the make default "cc" is 

what actually ends up as the value. That is what was confusing to me, 
since I assumed the ?= value should be used since there is no provided CC
value.

> 
> When you switch to generic-package, you have those variables available
> to pass to configure and make:
>     TARGET_CONFIGURE_OPTS
>     TARGET_MAKE_ENV
> 
> Those variables are defined in package/Makefile.in and contain the
> necessary definitions for CC et al.
Agreed.

> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> 
.-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___    |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/ 
> There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v 
> conspiracy.  |
> '------------------------------^-------^------------------
> ^--------------------'
