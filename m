From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 09:26:10 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-11-09
In-Reply-To: <20191110071632.380E787DAA@hemlock.osuosl.org>
References: <20191110071632.380E787DAA@hemlock.osuosl.org>
Message-ID: <20191110082610.GV3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2019-11-10 07:16 -0000, Thomas Petazzoni spake thusly:
> Results for branch 'master'
>   riscv64    |   systemd-243-78-gef677436aa   | NOK | http://autobuild.buildroot.net/results/65c6741d812efe86398982d667a28199ea06d0f9 |     
> 
> Results for branch 'next'
>  powerpc64   |   systemd-243-78-gef677436aa   | NOK | http://autobuild.buildroot.net/results/f1e5dbe21685195dc43bf9e6e25425f8a4ec940b |     

That's because systemd v243 introduced a call to realpath(1), which is
not available on "old" distros (Ubuntu 14.04 does not have it, like it
does not have 'ln --relative').

This is strating to be slightly annoying, especially since upstreaam is
really unreceptive about supporting such old-ish build environments...

We now have two packages (as I know of) that have workarounds: systemd
and cups-filters.

So I've looked at adding host-coreutils as a dependency for those
packages. All the depednencies of host-coreutils are already (direct or
indirect) dependencies of systemd or cups-filters, so the overhead is
just the time it takes to build host-coreutils, which is about 1min
here, most of which is spent in configure. Since the build time of all
the dependencies is already large, this is not too bad.

I'll send a patch later today...

The alternative would be that we do systematically install wrappers for
ln and realpath (like the one use for cups-filters, but more generic),
that could be provided with host-skeleton for example...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
