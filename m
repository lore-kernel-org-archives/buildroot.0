From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Aug 2015 11:54:52 +0000
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150810133656.53b015a1@free-electrons.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
 <1439205989.4848.16.camel@synopsys.com>
 <20150810133656.53b015a1@free-electrons.com>
Message-ID: <1439207692.4848.27.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2015-08-10 at 13:36 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon, 10 Aug 2015 11:26:29 +0000, Alexey Brodkin wrote:
> 
> > On Thu, 2015-08-06 at 11:30 +0200, Thomas Petazzoni wrote:
> > > Hello all,
> > >          arc |                 gnuradio-3.7.5 | NOK | 
> > > > http://autobuild.buildroot.net/results/d44aec8c82ed6a315322726dd698e6b48990ba76/
> > > 
> > > ARC toolchain problem:
> > > 
> > >    error: '__NR_eventfd' was not declared in this scope
> > > 
> > > Alexey, I don't remember, do you have a fix for this one?
> > 
> > I already commented on that one.
> > Basically gnuradio includes source from boost and in boost itself they
> > use syscall directly if (__GLIBC__ == 2 && __GLIBC_MINOR__ < 8) which
> > is the case for uClibc, see http://git.uclibc.org/uClibc/tree/include/features.h#n395
> > -------------->8--------------
> > #define	__GLIBC__	2
> > #define	__GLIBC_MINOR__	2
> > -------------->8--------------
> > 
> > From Boost standpoint this looks like some sort of backward compatibility for older
> > glibc that didn;'t have eventfd() defined.
> > 
> > So probably  the best option here is to bump __GLIBC__/__GLIBC_MINOR__ in uClibc.
> > Maybe Waldemar may comment on that?
> 
> Can't we instead patch boost to use a || defined(__UCLIBC__) or
> something like that?

Well we may try but grep for __GLIBC_MINOR__ returns at least 10 files with matches.
That's why I'd prefer to just reuse existing code with __GLIBC__/__GLIBC_MINOR__.

If we may just say that  we're on par with say __GLIBC__=2 __GLIBC_MINOR__=10 that
will cure a problem with Boost.

Let's get Waldemar's opinion on that and if he says __UCLIBC__ is the way to go we'll
figure out who's going to create that patch :)

See I sent 2 emails to Boost mailing list:
http://lists.boost.org/Archives/boost/2015/07/224257.php
http://lists.boost.org/Archives/boost/2015/07/224404.php
and haven't heard back.

So it might take a while until these guys accept our patch if at all.

-Alexey
