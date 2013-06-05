From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 20:52:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-06-04
In-Reply-To: <20130605184836.6ea2b205@skate> (Thomas Petazzoni's message of
 "Wed, 5 Jun 2013 18:48:36 +0200")
References: <20130605063004.4425352C13E@lolut.humanoidz.org>
 <20130605182924.71a07679@skate> <20130605184836.6ea2b205@skate>
Message-ID: <87txlccrum.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Wed, 5 Jun 2013 18:29:24 +0200, Thomas Petazzoni wrote:

 >> >              host-libftdi-0.19 | 20
 >> 
 >> Those issues are caused by the bump of libtool, from the testing I
 >> could do. Reverting libtool to the previous version "solves" the
 >> problem.
 >> 
 >> The thing that happens is that libftdi (for the target) has
 >> AUTORECONF=YES, but not host-libftdi. So libftdi gets autoreconfigured,
 >> and then when host-libftdi is being built, even though we don't have
 >> AUTORECONF=YES, when starting the build, it does execute
 >> 'CDPATH="${ZSH_VERSION+.}:" && cd .
 >> && /bin/bash /home/test/outputs/libftdi/build/host-libftdi-0.19/missing
 >> --run aclocal-1.11 ' and it ends up failing.

 Thomas> Ok, the reason it does execute "missing" and does a kind of automatic
 Thomas> autoreconf is because we have one patch that modifies configure.in. So
 Thomas> configure.in is more recent than the configure script itself. When
 Thomas> libtool/autoconf/automake has not been built before host-libftdi, then
 Thomas> this automatic autoreconf cannot proceed:

That makes more sense. I didn't get how a target build (in a different
directory) could affect it.

So the fix is just HOST_LIBFTDI_AUTORECONF = YES?

 Thomas> and it in facts makes the thing work.

 Thomas> However, when this "automatic autoreconf" is done, and an
 Thomas> automake/autoconf/libtool set of tools, with the latest libtool, has
 Thomas> already been built and installed, then it generates some wrong stuff.

 Thomas> An easy fix is to add:

 Thomas> HOST_LIBFTDI_AUTORECONF = YES

 Thomas> to libftdi.mk. It doesn't really explain why it was working with
 Thomas> libtool 2.2 and no longer with libtool 2.4, but it works.

Indeed, odd. Well, having <pkg>_AUTORECONF = YES without
HOST_<pkg>_AUTORECONF = YES is obviously wrong, so let's just fix that.

-- 
Bye, Peter Korsgaard
