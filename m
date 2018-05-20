From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 May 2018 16:41:41 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180520143139.GA14607@x230>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf> <20180520142311.GA3453@scaer>
 <20180520143139.GA14607@x230>
Message-ID: <20180520144141.GB3453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, all,

On 2018-05-20 16:31 +0200, Petr Vorel spake thusly:
> > On 2018-05-19 23:03 +0200, Thomas Petazzoni spake thusly:
> > > If we were to drop the *shipped files, it means we would have to build
> > > host-flex and host-bison prior to running any "make *config" command.
> > > This would be really annoying.
> 
> > And would requier quite a rework of the main Makefile, since we do not
> > include that pcakge .mk files until we do have a .coinfig file. So
> > currently, we can't have host-{flex,bison} before we have a .config.
> Thank you for investigation. IMHO keeping *shipped files is the best
> option, I'd keep it for a start.

Agreed.

> Later we can switch to require flex and bison, as Thomas suggested (works quite well
> in linux kernel, I suppose it'd be working for Buildroot as well):
> > > Alternatively, we could decide to make
> > > "flex" and "bison" mandatory dependencies of Buildroot, and rely on the
> > > user to install them on the system rather than building them ourselves.
> > > The drawback of this is that we would no longer control which version
> > > of flex/bison gets used.

I initially did not reply further to this part, becuase I seem to
remember that there was a change in behavious with certain versions of
flex/bison, that made the output change drastically, and I was afraid we
could be bitten by this...

But in the end, this is not a problem, because we would not care to
mix-n-match files built with different versions of said tools, as they
would be those from the distro, always, and never those we ship, since
we would no longer ship them.

And eventually, I now remember that the issue was with gperf changing
its API (a function prototype changed), and that was causing pain. But
now, kconfig no longer uses gperf to start with, so no incompatibility
anymore anyway.

Which would allow us to drop the dependency of linux on host-{flex,bison}
that we had to add recently.

But this is definitely for later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
