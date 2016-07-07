From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jul 2016 18:33:22 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160706175617.67b0e1ea@free-electrons.com>
References: <20160706175617.67b0e1ea@free-electrons.com>
Message-ID: <20160707163322.GA3827@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Paul, All,

On 2016-07-06 17:56 +0200, Thomas Petazzoni spake thusly:
> Today, Paul (in Cc) reported on IRC an interesting problem: on a
> configuration with systemd enabled (and acting as udev provider),
> pciutils would fail to build due to libudev.h being missing.
> 
> After some investigation, "make graph-depends" revealed the origin of
> the problem: a very interesting circular dependency. Here is what make
> graph-depends thinks of the situation:
> 
> Recursion detected for  : systemd
> which is a dependency of: udev
> which is a dependency of: pciutils
> which is a dependency of: linux
> which is a dependency of: cryptodev-linux
> which is a dependency of: openssl
> which is a dependency of: libcurl
> which is a dependency of: systemd

Hmmm... make itself should have spit a warning of its own. However, I
could not see a way to have make error out; it is a mere warning... :-(

> So, starting from the bottom:
> 
>  - When libcurl is enabled, systemd depends on it
> 
>  - When OpenSSL is enabled, obviously, libcurl will use it for SSL
>    support
> 
>  - When cryptodev-linux is enabled, OpenSSL will depend on it to use
>    crypto accelerators supported in the kernel via cryptodev-linux.
> 
>  - cryptodev-linux being a kernel module, it depends on linux
> 
>  - linux by itself (the kernel) does not depend on pciutils, but the
>    linux tool "cpupower" (managed in linux-tool-cpupower) depends on
>    pciutils
> 
>  - pciutils depends on udev when available
> 
>  - udev is provided by systemd.

Indeed. :-/

> So we have a dependency loop. This was not detected in the autobuilders
> because it requires the linux package to be enabled to trigger.

Maybe we could have some autobuilders use our defconfigs as starting
points for randpackageconfig? Most (all?) of our defconfigs have a
kernel enabled, so we could probably catch such a situation...

> I'm not sure where to break the dependency loop here. The real problem
> is that cryptodev-linux does *NOT* require cpupower, it only needs the
> kernel itself. Does this means that our current architecture for
> packaging "tools" whose source code is part of the kernel as part of
> the "linux" package is wrong ?
> 
> Do you have some suggestions or ideas on how to solve this ? The only
> two solutions that I can find is:
> 
>  - Arbitrarily break this dependency loop by removing some
>    functionality (but I'm not sure where)
> 
>  - Moving the cpupower build logic outside of the linux package.

I think this is the best solution. We could make the linux-tools be
built in their own package, vampirising the sources from the kernel (or
even building in there) by way of carefully crafted _PATCH_DEPENDENCIES
(but I'm afraid patch dependencies are still used to build the
dependency graph anyway... :-/ ).

I will look at it...

> The other question is how we can improve our autobuilder testing to
> detect such situations.

See above: have a randcom defconfig be picked and use it as a starting
point. We have almost all architectures covered, except maybe a few
corner cases for exotic stuff like bfin or arc...

Regards,
Yann E. MORIN.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
