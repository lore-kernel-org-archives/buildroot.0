From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 17:29:11 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <20180605074932.668ae4e7@windsurf>
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
 <20180605074932.668ae4e7@windsurf>
Message-ID: <20180605152911.GB2503@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-06-05 07:49 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Tue, 5 Jun 2018 00:10:30 +0200, Arnout Vandecappelle wrote:
> 
> > >  comment "Linux kernel may fail to boot with binutils >= 2.29"
> > > -	depends on BR2_ARM_CPU_ARMV7M
> > > +	depends on BR2_arm || BR2_armeb  
> > 
> >  I have a bit of a problem with this patch. IMO it's rather unlikely that people
> > build the kernel in THUMB mode on non-M CPUs.
> 
> Are you sure ? There is definitely support for building a Thumb2 kernel
> on ARMv7-A, and I think it's a popular way to reduce a bit the size of
> the kernel, no?

Agreed.

> > But now we're always showing this
> > warning. I think it will confuse a number of people, and I don't think it's very
> > likely that it will actually help anyone.
> 
> Actually the warning should not have a:
> 	depends on BR2_arm || BR2_armeb
> 
> but instead a:
> 	depends on BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2
> 
> because that's actually what we do in binutils to decide whether we
> want to fall back on binutils 2.28 by default or not.

But as you can see in the commit log that introduced this change, what
you suggest is not correct, because it is also very valid that you have
a arm-mode userland running on a thumb-mode kernel (as Peter initially
pointed out on IRC).

So, the kernel warning should not be about he userland mode.

And 'BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2'
represent the userland mode, while we have, from our kconfig, no way to
know the kernel mode, because that is in the kernel .config file, which
we only get late.

As such, the only way is to depend on arm || armeb.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
