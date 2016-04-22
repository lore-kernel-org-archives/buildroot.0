From: Romain Izard <romain.izard.pro@gmail.com>
Date: Fri, 22 Apr 2016 15:51:57 +0200
Subject: [Buildroot] [PATCH v6] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <20160421224719.GA3426@free.fr>
References: <1461146052-13261-1-git-send-email-romain.izard.pro@gmail.com>
 <20160421224719.GA3426@free.fr>
Message-ID: <CAGkQfmN+a=ZOxM94uOdK_EK-LM1B0W9Crji8oA4Fjq2mEZUPEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

2016-04-22 0:47 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
>
> Ok, so... Well... Err...
>
> Could you respin v4 of the patch, the one that used something like:
>
>     make oldnoconfig || (yes "" |make oldconfig)
>
> please? ;-)
>
> OK, what's wrong with my proposal? It works in an unconfigured tree.
> But as soon as the tree is configured, it breaks, notably with older
> kernels, like 3.0.
>
>     $ cd linux-3.0
>     $ make -qpn oldefconfig 2>/dev/null |grep olddefconfig
>     [nothing]
>     $ touch .config
>     $ make -qpn oldefconfig 2>/dev/null |grep olddefconfig
>     olddefconfig: scripts_basic outputmakefile FORCE
>
> But 3.0 does not have olddefconfig. It's jsut the %config generic rule
> kicking in. So we'd believe there would be support for olddefconfig
> (or oldnoconfig) when there isn't.
>
> So, I have to apologise for the delusion. Your v4 is the best we can
> do.

After some more testing, I believe it should work. I've tested the
following command on the latest commit for all stable branches since
2.6.11, and I can reliably detect which targets are supported. Moreover,
I have the same output whether I touched .config or not.

make -pn O=dir config 2>/dev/null | grep -oE '^old(no|def)config:'

I believe the problem with your tests is that you try to use both '-q'
and '-n', while GNU Make's manual states (Chapter 9.3, Instead of
executing recipes) that:

"It is an error to use more than one of these three flags [-t -q -n] in
the same invocation of 'make'."

Best regards,
-- 
Romain Izard
