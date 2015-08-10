From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Aug 2015 18:49:37 +0000
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150810180849.GV8475@waldemar-brodkorb.de>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
 <1439205989.4848.16.camel@synopsys.com>
 <20150810133656.53b015a1@free-electrons.com>
 <1439207692.4848.27.camel@synopsys.com>
 <20150810180849.GV8475@waldemar-brodkorb.de>
Message-ID: <1439232577.4848.55.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Mon, 2015-08-10 at 20:08 +0200, Waldemar Brodkorb wrote:
> Hi Alexey, Hi Thomas,
> Alexey Brodkin wrote,
> 
> > Hi Thomas,
> > 
> > On Mon, 2015-08-10 at 13:36 +0200, Thomas Petazzoni wrote:
> > > Dear Alexey Brodkin,
> > > 
> > > On Mon, 10 Aug 2015 11:26:29 +0000, Alexey Brodkin wrote:
> > > 
> > > > On Thu, 2015-08-06 at 11:30 +0200, Thomas Petazzoni wrote:
> > > > > Hello all,
> > > > >          arc |                 gnuradio-3.7.5 | NOK | 
> > > > > > http://autobuild.buildroot.net/results/d44aec8c82ed6a315322726dd698e6b48990ba76/
> > > > > 
> > > > > ARC toolchain problem:
> > > > > 
> > > > >    error: '__NR_eventfd' was not declared in this scope
> > > > > 
> > > > > Alexey, I don't remember, do you have a fix for this one?
> > > > 
> > > > I already commented on that one.
> > > > Basically gnuradio includes source from boost and in boost itself they
> > > > use syscall directly if (__GLIBC__ == 2 && __GLIBC_MINOR__ < 8) which
> > > > is the case for uClibc, see http://git.uclibc.org/uClibc/tree/include/features.h#n395
> > > > -------------->8--------------
> > > > #define	__GLIBC__	2
> > > > #define	__GLIBC_MINOR__	2
> > > > -------------->8--------------
> > > > 
> > > > From Boost standpoint this looks like some sort of backward compatibility for older
> > > > glibc that didn;'t have eventfd() defined.
> > > > 
> > > > So probably  the best option here is to bump __GLIBC__/__GLIBC_MINOR__ in uClibc.
> > > > Maybe Waldemar may comment on that?
> > > 
> > > Can't we instead patch boost to use a || defined(__UCLIBC__) or
> > > something like that?
> > 
> > Well we may try but grep for __GLIBC_MINOR__ returns at least 10 files with matches.
> > That's why I'd prefer to just reuse existing code with __GLIBC__/__GLIBC_MINOR__.
> > 
> > If we may just say that  we're on par with say __GLIBC__=2 __GLIBC_MINOR__=10 that
> > will cure a problem with Boost.
> > 
> > Let's get Waldemar's opinion on that and if he says __UCLIBC__ is the way to go we'll
> > figure out who's going to create that patch :)
> > 
> > See I sent 2 emails to Boost mailing list:
> > http://lists.boost.org/Archives/boost/2015/07/224257.php
> > http://lists.boost.org/Archives/boost/2015/07/224404.php
> > and haven't heard back.
> > 
> > So it might take a while until these guys accept our patch if at all.
> 
> May be we should do both. I can add __GLIBC_MINOR__=10 to uClibc-ng
> and Alexey tries to get the || defined(__UCLIBC__) included into
> boost.
> 
> Alexey, do you think we will get any regression by incrementing the
> minor number for other architectures? I will try some boost compiles
> later.

If I knew this for sure I wouldn't ask you :)
That's why I'm not sure which is a good MINOR number to bump to.
I'm not sure if 2.2 was intentionally used in the first place in uClibc,
did that mean that all [important?] features of glibc 2.2 were supported
in uClibc back in the day?

This is a commit that bumped from 2.1 to 2.2:
http://git.uclibc.org/uClibc/commit/?id=e83a36ce9f97ac0f59117b3a62fd2dd8461b1fd5

Frankly I may barely see a rationale for that last bump.
So there're IMHO 3 options for uClibc:

 [1] Leave __GLIBC__ versions as they are today (2.2)
 [2] Bump those versions to something that is supposed to fix existing issue
     with Boost and see if it breaks more than fixes
 [3] Do good analysis of glibc features, compare to what we have in uClibc and
     with that knowledge set __GLIBC__ versions in uClibc

> But do not forget, buildroot uses ARC specific uClibc fork, so it
> will not fix the problem, until we switch to uClibc-ng for ARC.

Well our intention is to drop ARC-specific git repo in favor to upstream
distributions of uClibc. Even today uClibc in ARC's GitHub is just a mirror
of master @ git.uclibc.org. But the problem with goode olde uClibc is there're
no releases so it is useless for us as a method of distribution.

That said for Buildroot I'm about to discontinue uClibc from ARC git and use
your uClibc-ng instead. So one Buildroot v2015.08 is cut I'll send a patch with
removal of BR2_UCLIBC_VERSION_ARC_GIT.

-Alexey
