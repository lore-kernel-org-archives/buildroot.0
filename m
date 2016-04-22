From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Apr 2016 19:27:44 +0200
Subject: [Buildroot] [PATCH v6] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <CAGkQfmN+a=ZOxM94uOdK_EK-LM1B0W9Crji8oA4Fjq2mEZUPEg@mail.gmail.com>
References: <1461146052-13261-1-git-send-email-romain.izard.pro@gmail.com>
 <20160421224719.GA3426@free.fr>
 <CAGkQfmN+a=ZOxM94uOdK_EK-LM1B0W9Crji8oA4Fjq2mEZUPEg@mail.gmail.com>
Message-ID: <20160422172744.GA3416@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-04-22 15:51 +0200, Romain Izard spake thusly:
> 2016-04-22 0:47 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> >
> > Ok, so... Well... Err...
> >
> > Could you respin v4 of the patch, the one that used something like:
> >
> >     make oldnoconfig || (yes "" |make oldconfig)
> >
> > please? ;-)
> >
> > OK, what's wrong with my proposal? It works in an unconfigured tree.
> > But as soon as the tree is configured, it breaks, notably with older
> > kernels, like 3.0.
> >
> >     $ cd linux-3.0
> >     $ make -qpn oldefconfig 2>/dev/null |grep olddefconfig
> >     [nothing]
> >     $ touch .config
> >     $ make -qpn oldefconfig 2>/dev/null |grep olddefconfig
> >     olddefconfig: scripts_basic outputmakefile FORCE
> >
> > But 3.0 does not have olddefconfig. It's jsut the %config generic rule
> > kicking in. So we'd believe there would be support for olddefconfig
> > (or oldnoconfig) when there isn't.
> >
> > So, I have to apologise for the delusion. Your v4 is the best we can
> > do.
> 
> After some more testing, I believe it should work. I've tested the
> following command on the latest commit for all stable branches since
> 2.6.11, and I can reliably detect which targets are supported. Moreover,
> I have the same output whether I touched .config or not.
> 
> make -pn O=dir config 2>/dev/null | grep -oE '^old(no|def)config:'
> 
> I believe the problem with your tests is that you try to use both '-q'
> and '-n', while GNU Make's manual states (Chapter 9.3, Instead of
> executing recipes) that:
> 
> "It is an error to use more than one of these three flags [-t -q -n] in
> the same invocation of 'make'."

Weird, my make manpage does not state anything about that...

Anyway, I'll do some more testing following your input. Thanks for your
patience! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
