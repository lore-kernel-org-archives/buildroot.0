From: Pkun <serj.kalichev@gmail.com>
Date: Thu, 9 Dec 2010 21:36:57 +0300
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <4D0112E5.301@zacarias.com.ar>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D00DFEE.7090103@zacarias.com.ar>
	<20101209105559.10305jzi16ub75cs@www.home.zuerker.org>
	<AANLkTi=T0idFP0k6fFXP3ex6dsupLxMGPgJwz+V4DCkM@mail.gmail.com>
	<4D0112E5.301@zacarias.com.ar>
Message-ID: <AANLkTi=X+CZ9+=yRjcvzfxUecteEGzTgm_6eB+OCGMbG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/12/9 Gustavo Zacarias <gustavo@zacarias.com.ar>

> On 12/09/10 14:28, Pkun wrote:
>
> > 2010/12/9 Heiko Zuerker <heiko at zuerker.org <mailto:heiko@zuerker.org>>
> >
> >     Quoting Gustavo Zacarias <gustavo@zacarias.com.ar
> >     <mailto:gustavo@zacarias.com.ar>>:
> >
> >         On 12/07/10 19:21, Heiko Zuerker wrote:
> >
> >             Hey,
> >
> >             the iproute2 compile fails with:
> >             -------------------
> >
> /data/devil-linux/../x-tools/x86_64-unknown-linux-gnu/bin/x86_64-unknown-linux-gnu-gcc
> >             --sysroot=/data/devil-linux/output/staging
> >             -Wl,-export-dynamic  ip.o
> >             ipaddress.o ipaddrlabel.o iproute.o iprule.o rtm_map.o
> >             iptunnel.o
> >             ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o ipmaddr.o
> >             ipmonitor.o
> >             ipmroute.o ipprefix.o iptuntap.o ipxfrm.o xfrm_state.o
> >             xfrm_policy.o
> >             xfrm_monitor.o iplink_vlan.o link_veth.o link_gre.o
> iplink_can.o
> >             iplink_macvlan.o ../lib/libnetlink.a ../lib/libutil.a
> >              -lresolv -L../lib
> >             -lnetlink -lutil -ldl -o ip
> >             ../lib/libnetlink.a: could not read symbols: Archive has no
> >             index; run
> >             ranlib to add one
> >             collect2: ld returned 1 exit status
> >             ------------------------
> >
> >
> >         Can you upload a full build log of the relevant (iproute2) part
> >         somewhere?
> >         Thanks.
> >
> >
> >     It's on pastebin: http://pastebin.com/hRhJKpkN
> >
> >
> >     --
> >
> >     Regards
> >      Heiko Zuerker
> >      http://www.devil-linux.org
> >
> >
> > I think that 'ar' is used from the host but not your
> > x86_64-unknown-linux-gnu-ar. It can be uncompatible I suppose.
>
> Yes, that's the problem, even if they were similar it shouldn't be used.
> Try changing...
> $(MAKE) CC="$(TARGET_CC)" -C $(@D)
> to
> $(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D)
> in package/iproute/iproute2.mk
>
> Regards.
>
>
There is a good variable TARGET_CONFIGURE_OPTS within buildroot. It contain
all possible AR="$(TARGET_AR) CC="$(TARGET_CC) etc. But it's long and
complex. Probably it will be right to use it for similar cases.

Now I'm making a big patch for iproute2. It has terrible build system that
don't support cross build. And iproute2's configure script is hand-made and
use 'gcc' instead $(CC) for example. It can't be build without IPv6. I wrote
about TARGET_CONFIGURE_OPTS but it can't be used for the current iproute2
because it will break the internal CFLAGS definitions.

The xtables.h belong to iptables package. But buildroot's iptables don't
install anything to the staging. The iproute2 uses libxtables.so also.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101209/3235326a/attachment.html>
