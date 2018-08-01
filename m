From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Aug 2018 17:48:32 +0200
Subject: [Buildroot] [PATCH] linux: kconfig needs the toolchain
In-Reply-To: <20180801083541.653e1abc@windsurf>
References: <20180731201617.20829-1-yann.morin.1998@free.fr>
 <d703b5fb-a3e9-6398-c5e8-bf63c25ba106@mind.be>
 <20180801083541.653e1abc@windsurf>
Message-ID: <20180801154832.GB2294@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-01 08:35 +0200, Thomas Petazzoni spake thusly:
> On Wed, 1 Aug 2018 00:21:18 +0200, Arnout Vandecappelle wrote:
> > > Like is done in the kconfig-package infra for the dependency on
> > > $(1)-patch, we use an order-only prerequisites on the toolchain,
> > > to guarantee the compiler is available before we can display the
> > > kconfig of the kernel.  
> >  You actually want to say here why an order-only dependency and not a normal
> > dependency: "Since 'toolchain' is a phony target and therefore always out of
> > date, a normal dependency would cause the .config target to be rebuilt on each
> > invocation of make."
> 
> When looking at the patch, my initial reaction was: why is the
> dependency on the .config file, rather than on the
> -menuconfig/-xconfig/-nconfig/... targets. Those are phony targets, so
> a normal dependency would work.

We need the toolchain to generate the .config file, even in a nromal
build, i.e. not just for the menuconfig et al.

I.e. running 'make clean; make' should also build the toolchain before
the linux configuration, which is part of the kconfig infra.

Agreed that it would not happen in practice, but for theoretical
correctness, it is also needed in this case.

> This could even be pushed one level up to the pkg-kconfig
> infrastructure, as we're pretty likely to see other packages go down
> this route in the future maybe ? Of course, it should be optional.

Well, I also thought about that, but decided against, because we don't
want to generalise a behaviour based on a single case.

As for the configurability, I would have gone with:

    FOO_KCONFIG_NEEDS_CC = YES

because that is actually what it wants currently.

But in the future, it might also want to call 'dtc' to check whether it
supports overlays, or call 'openssl' to check if a cypher is available.
So we'd have to expand this to:

    FOO_KCONFIG_DEPENDENCIES = toolchain host-dtc host-openssl

Or whatev'...

So I'd prefer waiting, and hard-coding that one peculiarity within the
only user so far, the linux kernel.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
