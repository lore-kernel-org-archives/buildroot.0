From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Apr 2016 19:58:17 +0200
Subject: [Buildroot] [PATCH v4 3/3] core/pkg-kconfig: Use oldnoconfig
 when possible
In-Reply-To: <20160419174050.GA3505@free.fr>
References: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
 <1460971383-10595-4-git-send-email-romain.izard.pro@gmail.com>
 <20160418210802.GE3495@free.fr>
 <CAGkQfmNbbsv4e0iCyOC1-ti2wJ677RL9j3HXqh_Z7e4BmciCfg@mail.gmail.com>
 <20160419174050.GA3505@free.fr>
Message-ID: <20160419175817.GC3505@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-04-19 19:40 +0200, Yann E. MORIN spake thusly:
> On 2016-04-19 11:11 +0200, Romain Izard spake thusly:
> > 2016-04-18 23:08 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
[--SNIP--]
> > > What I would have loved however, would be a way to detect whether
> > > oldnoconfig (better, olddefconfig) was supported before calling it.
> > > Maybe something along the lines of:
> > >
> > >     if [ -n "`$$($(2)_KCONFIG_MAKE) -pqn .DEFAULT 2>/dev/null |grep -E '^olddefconfig'`" ]; then \
> > >         $$($(2)_KCONFIG_MAKE) olddefconfig || exit 1; \
> > >     elif [ -n "`$$($(2)_KCONFIG_MAKE) -pqn .DEFAULT |grep -E '^oldnoconfig'`" ]; then \
> > >         $$($(2)_KCONFIG_MAKE) oldnoconfig || exit 1; \
> > >     else
> > >         (yes "" | $$($(2)_KCONFIG_MAKE) oldconfig) || exit 1; \
> > >     fi
> > >
> > > Yes, this is more code, less compact, but it is more systematic. At
> > > the very least, it would not fallback to the yes|oldconfig trick in
> > > case old{def,no}config do exist but fail, which we do want to catch.
> > >
> > > BTW, the make trick above is highly (as in: almost identical) from the
> > > bash-autocompletion package.
> > 
> > I see the idea, but the specific implementation is not working: the
> > kernel's Makefile targets are dynamic, and the targets we want to check
> > are only present when the target we try to build matches %config.
> 
> I just checked, and it works on the current master on the kernel tree:
> 
>     $ make -pqn .DEFAULT 2>/dev/null |grep -E '^olddefconfig:'
>     olddefconfig: scripts/kconfig/conf
> 
>     $ make -pqn .DEFAULT 2>/dev/null |grep -E '^oldnoconfig:'
>     oldnoconfig: olddefconfig

I also checked on v3.6 (which is missing olddefconfig) and v3.7 (which
introduced olddefconfig), and the tests above still work: oldnconfig is
found, olddefconfig is not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
