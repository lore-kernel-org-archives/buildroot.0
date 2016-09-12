From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:44:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-11
In-Reply-To: <CAKmqyKOAaZYPwd3GwvBsz7CwiF93-m=5rh=z6vv9o4RTsHod0A@mail.gmail.com>
References: <20160912063028.65AFB103B93@stock.ovh.net>
 <CAKmqyKOAaZYPwd3GwvBsz7CwiF93-m=5rh=z6vv9o4RTsHod0A@mail.gmail.com>
Message-ID: <20160912234452.38288933@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 14:39:43 -0700, Alistair Francis wrote:

> >      aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/9e733b8afb51add44fcf675fb25c05fe52773de7
> >          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/fc39051eb0c466493a69bd9a320e6046a66db51e
> >          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/65096ed770f89da2c928f504d84fc811619037d5
> >          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/051d916bb12f1a0a0bfc5e2362e7a9b1488717f1
> >          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/bcd784b22c0335c04960e1a5601e1925134f5edf
> >          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/563f086f127b2a59edbe2adcfd730378d1a5d5f0  
> 
> Xen 4.7 has started failing and it looks to be related to a lack of
> gettext. I can't see any recent changes that should have broken this.
> 
> Does anyone have any idea what has changed with gettext?

I don't see anything gettext related in there. What I see is:

/usr/bin/gcc -Wp,-MD,tools/kconfig/.zconf.tab.o.d -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -Wdeclaration-after-statement     -DCURSES_LOC="<ncurses.h>" -DLOCALE -DKBUILD_NO_NLS -Itools/kconfig -c -o tools/kconfig/zconf.tab.o tools/kconfig/zconf.tab.c
In file included from tools/kconfig/zconf.tab.c:2576:0:
tools/kconfig/confdata.c: In function 'conf_set_all_new_symbols':
tools/kconfig/confdata.c:1167:2: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
cc1: all warnings being treated as errors

I.e, the built-in kconfig copy of the Xen sources doesn't build with
the host compiler on this machine. All issues appear on gcc20, where
the host compiler is gcc 4.7.

I guess the easiest fix here is to remove -Werror from the compile
command line. Can you look at how to do this inside the Xen source code?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
