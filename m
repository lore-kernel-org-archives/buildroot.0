From: Allan Clark <allanc@chickenandporn.com>
Date: Tue, 31 Jul 2007 10:27:59 -0400
Subject: [Buildroot] Qtopia4 fails building - target stage tries to run
	target binaries on build machine
In-Reply-To: <1185885318.24720.3.camel@localhost.localdomain>
References: <1185796725.27015.7.camel@localhost.localdomain>
	<20070730185416.GA23362@zelow.no>
	<1185870123.14026.4.camel@localhost.localdomain>
	<20070731093827.GA18869@zelow.no>
	<37c712e0707310526n3e3a8c64v33b7717bad6fd464@mail.gmail.com>
	<1185885318.24720.3.camel@localhost.localdomain>
Message-ID: <37c712e0707310727r2870246ei3cdeb275c7e21bb4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Private reply reposted

On 7/31/07, Hans-Christian Egtvedt <hcegtvedt@atmel.com> wrote:
>
> On Tue, 2007-07-31 at 08:26 -0400, Allan Clark wrote:
> > On 7/31/07, Thomas Lundquist <lists@zelow.no> wrote:
> > > On Tue, Jul 31, 2007 at 10:22:03AM +0200, Hans-Christian Egtvedt wrote:
> > > >
> > > > As I said, it tries to execute moc, but moc is compiled for the target.
> > >
> > > Weird.
> > >
> > > > The problem arises when building the target Qtopia, it tries to use moc
> > > > et.al compiled for the target architecture. And when running a
> > > > big-endian AVR32 binary on my little-endian x86 laptop, it fails ;)
> > >
> > > But of course.
> > >
> > > the weird part is that the makefile was made for compiling qtopia on
> > > ARM, which means moc & co was compiled for the right platform(s).
> >
> > ...but qmake and moc are supposed to run on the build host, not on the
> > target.  They are only used during development, not during runtime.
>
> Then why is Qtopia a two stage build? Then only a normal cross-compile
> is needed.

Not sure what you mean; perhaps I need to build the qtopia4 to check it.

Qmake is an "automake/autoconf" replacement, so any Qtopia4 app needs
to be built with the qmake app, or the builder has to go track down
the platform differences (like porting before automake and autoconf
existed, or before Imake existed).  ince Qmake has to build the
makefile for the target, it needs to run on the build host.

MOC creates the C++ base classes for the signal/event-passing in any
QObject; it generates code that needs to be cross-compiled, but MOC
runs on the buildhost.

MOC and Qmake link against Qtopia libraries -- they are themselves
Qtopia applications.

Does that make sense?  Perhaps the two-stage is:
1) building libqt, qmake, and tools for host apps
2) running qmake and moc for the target
3) building libqt for the target

In the end, 2 libqts are needed, plus a host-qmake, plus a host-moc.

I did this for Qt/E pre-2.2.0, but that's outdated now, and it's
probably much more complex.

Allan
