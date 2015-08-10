From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 13:36:56 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <1439205989.4848.16.camel@synopsys.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
 <1439205989.4848.16.camel@synopsys.com>
Message-ID: <20150810133656.53b015a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 10 Aug 2015 11:26:29 +0000, Alexey Brodkin wrote:

> On Thu, 2015-08-06 at 11:30 +0200, Thomas Petazzoni wrote:
> > Hello all,
> >          arc |                 gnuradio-3.7.5 | NOK | 
> > > http://autobuild.buildroot.net/results/d44aec8c82ed6a315322726dd698e6b48990ba76/
> > 
> > ARC toolchain problem:
> > 
> >    error: '__NR_eventfd' was not declared in this scope
> > 
> > Alexey, I don't remember, do you have a fix for this one?
> 
> I already commented on that one.
> Basically gnuradio includes source from boost and in boost itself they
> use syscall directly if (__GLIBC__ == 2 && __GLIBC_MINOR__ < 8) which
> is the case for uClibc, see http://git.uclibc.org/uClibc/tree/include/features.h#n395
> -------------->8--------------
> #define	__GLIBC__	2
> #define	__GLIBC_MINOR__	2
> -------------->8--------------
> 
> From Boost standpoint this looks like some sort of backward compatibility for older
> glibc that didn;'t have eventfd() defined.
> 
> So probably  the best option here is to bump __GLIBC__/__GLIBC_MINOR__ in uClibc.
> Maybe Waldemar may comment on that?

Can't we instead patch boost to use a || defined(__UCLIBC__) or
something like that?

> > >          arc |              libselinux-2.1.13 | NOK | 
> > > http://autobuild.buildroot.net/results/2fdea2bbcdff4a70ffaac1eecbc8faa81a44e90c/
> > 
> > ARC toolchain problem:
> > 
> >    Error: internal error: fixup not contained within frag
> > 
> > Alexey?
> 
> On my to investigate list.

Thanks!

> Libsodium attempts to build as PIE.
> Should be fixed by http://patchwork.ozlabs.org/patch/505568/

Seen the patch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
