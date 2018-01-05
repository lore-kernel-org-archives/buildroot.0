From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 5 Jan 2018 07:23:34 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180104201958.GB5130@waldemar-brodkorb.de>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180104101927.oexxtwusya3wppyk@tarshish>
 <20180104113336.6b7ed00a@windsurf.lan>
 <20180104105154.l24rvscxbsliquv3@tarshish>
 <20180104112815.GD18339@airbook.vandijck-laurijssen.be>
 <20180104155213.GC3684@scaer>
 <20180104172352.k6u2i3bkfmovgwgm@tarshish>
 <20180104201958.GB5130@waldemar-brodkorb.de>
Message-ID: <20180105052334.mc3fabifliw7gzqn@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wldemar,

On Thu, Jan 04, 2018 at 09:19:59PM +0100, Waldemar Brodkorb wrote:
> Baruch Siach wrote,
> > On Thu, Jan 04, 2018 at 04:52:13PM +0100, Yann E. MORIN wrote:

[...]

> > > > Yann, do you remember the reason why "clock_nanosleep() is only 
> > > > availabe with NPTL" as commit ec875d9bf9b183 says?
> > > 
> > > No, I am not sure, but the current code of uClibc-ng has:
> > > 
> > >     $ cat librt/Makefile.in
> > >     [...]
> > >     17 ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
> > >     18 librt_filter_SRC += mq_notify.c timer_create.c timer_delete.c \
> > >     19 	timer_getoverr.c timer_gettime.c timer_settime.c
> > >     20 else
> > >     21 librt_filter_SRC += clock_nanosleep.c clock_getcpuclockid.c clock_gettime.c
> > >     22 endif
> > >     [...]
> > > 
> > > So, if I read that correctly, the clock_*.c files are excluded (filtered)
> > > if there is no support for native threads.
> > > 
> > > Now, since glibc and musl always have NPTL and always have clock_nanosleep,
> > > and only uClibc has a conditional NPTL, we made clock_nanosleep et al.
> > > depend on NPTL.
> > > 
> > > Q.E.D.
> > 
> > This contradicts the UCLIBC_HAS_ADVANCED_REALTIME help text that lists 
> > clock_nanosleep() with the API it enables. I guess it is the code the needs 
> > fixing here.
> > 
> > Waldemar?
> 
> Hmm. I do not exactly understand what you mean.
> It seems some extra advanced realtime functions where added in
> commit a202cf6f119f41532b60ad28bc48746b535fd34c, because at this
> time NPTL was available. A user can disable these extra functions if
> it is unused in his usecase.
> 
> So I believe, when an application is using clock_nanosleep, Buildroot
> should depend on NPTL for it.

The UCLIBC_HAS_ADVANCED_REALTIME help text says that this options enables 
clock_nanosleep(). But with current code you must have NPTL enabled for 
clock_nanosleep(). So the help text is not correct.

This also means that architectures lack NPTL support can't have 
clock_nanosleep() at all. Is there a reason for that?

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
