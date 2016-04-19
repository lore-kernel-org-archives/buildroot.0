From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Apr 2016 19:40:50 +0200
Subject: [Buildroot] [PATCH v4 3/3] core/pkg-kconfig: Use oldnoconfig
	when possible
In-Reply-To: <CAGkQfmNbbsv4e0iCyOC1-ti2wJ677RL9j3HXqh_Z7e4BmciCfg@mail.gmail.com>
References: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
 <1460971383-10595-4-git-send-email-romain.izard.pro@gmail.com>
 <20160418210802.GE3495@free.fr>
 <CAGkQfmNbbsv4e0iCyOC1-ti2wJ677RL9j3HXqh_Z7e4BmciCfg@mail.gmail.com>
Message-ID: <20160419174050.GA3505@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-04-19 11:11 +0200, Romain Izard spake thusly:
> 2016-04-18 23:08 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Romain, All,
> >
> > On 2016-04-18 11:23 +0200, Romain Izard spake thusly:
> >
> >> +# The correct way to regenerate a .config file is to use 'make olddefconfig'.
> >> +# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
> >> +# versions 2.6.36 and 3.6, and remains as an alias in later versions.
> >> +# In older versions, and in some other projects that use kconfig, the target is
> >> +# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
> >> +# only, as this can fail in complex cases.
> >> +define $(2)_REGEN_DOT_CONFIG
> >> +     $$(Q)$$($(2)_KCONFIG_MAKE) oldnoconfig || \
> >> +             (yes "" | $$($(2)_KCONFIG_MAKE) oldconfig)
> >
> > What I don't much like here, is that we conflate two things:
> >   - a non-zero return code because of a missing oldnoconfig,
> >   - a non-zero return code because of an error found by olnoconfig.
> >
> > What I would have loved however, would be a way to detect whether
> > oldnoconfig (better, olddefconfig) was supported before calling it.
> > Maybe something along the lines of:
> >
> >     if [ -n "`$$($(2)_KCONFIG_MAKE) -pqn .DEFAULT 2>/dev/null |grep -E '^olddefconfig'`" ]; then \
> >         $$($(2)_KCONFIG_MAKE) olddefconfig || exit 1; \
> >     elif [ -n "`$$($(2)_KCONFIG_MAKE) -pqn .DEFAULT |grep -E '^oldnoconfig'`" ]; then \
> >         $$($(2)_KCONFIG_MAKE) oldnoconfig || exit 1; \
> >     else
> >         (yes "" | $$($(2)_KCONFIG_MAKE) oldconfig) || exit 1; \
> >     fi
> >
> > Yes, this is more code, less compact, but it is more systematic. At
> > the very least, it would not fallback to the yes|oldconfig trick in
> > case old{def,no}config do exist but fail, which we do want to catch.
> >
> > BTW, the make trick above is highly (as in: almost identical) from the
> > bash-autocompletion package.
> 
> I see the idea, but the specific implementation is not working: the
> kernel's Makefile targets are dynamic, and the targets we want to check
> are only present when the target we try to build matches %config.

I just checked, and it works on the current master on the kernel tree:

    $ make -pqn .DEFAULT 2>/dev/null |grep -E '^olddefconfig:'
    olddefconfig: scripts/kconfig/conf

    $ make -pqn .DEFAULT 2>/dev/null |grep -E '^oldnoconfig:'
    oldnoconfig: olddefconfig

Regards,
Yann E. MORIN.

> I will try to find a syntax that works for all projects that use the
> kconfig-package infrastructure.
> 
> Best regards,
> -- 
> Romain Izard

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
