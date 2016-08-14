From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 02:37:08 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <8c55e415-cdc4-96ab-f264-a23f728c0442@mind.be>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <87lh00z80r.fsf@ketchup.mtl.sfl> <20160813215502.GC5734@free.fr>
 <20160813221431.GD5734@free.fr>
 <8c55e415-cdc4-96ab-f264-a23f728c0442@mind.be>
Message-ID: <20160814003708.GF5734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-14 02:17 +0200, Arnout Vandecappelle spake thusly:
> On 14-08-16 00:14, Yann E. MORIN wrote:
> > Vivien, All,
> > 
> > On 2016-08-13 23:55 +0200, Yann E. MORIN spake thusly:
> >> On 2016-08-13 17:14 -0400, Vivien Didelot spake thusly:
> >>> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> >>>
> >>>>>     mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8a6001f437701ecc75f6c9252935645bda8a8c8/
> > [--SNIP--]
> >>> And this works. What am I doing wrong the reproduce the issue?
> >>
> >> I was not able to reproduce it either, and all build failures occur on
> >> Peter's machine:
> >>     http://autobuild.buildroot.org/?reason=lldpd-0.9.4
> >>
> >> However, the libevent issue is nto the real issue. The config.log hints
> >> at a much earlier issue:
> > 
> > And just because I don;t know how to read... Therer *is* an error...
> > 
> >>     [--SNIP--]
> >>     configure:22887: checking for library containing res_init
> >>     configure:22913: /home/peko/autobuild/instance-2/output/host/usr/bin/mips64el-linux-gcc -std=gnu99 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -isystem /usr/include/bsd -DLIBBSD_OVERLAY   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  -L/home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib -lbsd   >&5
> >                                                                                                                                                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^
> > On the line above     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->    this is libssd being stupid...
> > 
> > We must fix it, obviously. Yet, that does not eventually prevent the
> > configure to finish for me.
> 
>  Seems to me that it's because libbsd-overlay uses -isystem instead of -I, so it
> doesn't get munged with the sysroot by pkgconf. Either pkgconf should learn to
> deal with -isystem, or ... we have to hack libbsd-overlay.pc manually.

Exactly. Except that libbsd-overlay really wants to get before
/usr/include because it wants to provide overrides for standard headers.
Beark... :-(

>  BTW, lldpd should of course also encode this optional dependency on libbsd.

We discussed with lldpd's author on IRC, and after his explanations it
looks better to simply disable use of libbsd in lldpd: it is only ever
used for a few functions that anyway have replacement in lldpd, and the
setproctitle() (which does what its names means).

setproctitle has not replacement, but is not a mandatory requirement, so
it can be disabled, which happens when libbsd is not enabled.

So, I'm doing a patch to just disable use of libbsd by lldpd.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
