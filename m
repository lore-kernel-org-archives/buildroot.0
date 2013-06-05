From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 18:48:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-06-04
In-Reply-To: <20130605182924.71a07679@skate>
References: <20130605063004.4425352C13E@lolut.humanoidz.org>
 <20130605182924.71a07679@skate>
Message-ID: <20130605184836.6ea2b205@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jun 2013 18:29:24 +0200, Thomas Petazzoni wrote:

> >              host-libftdi-0.19 | 20
> 
> Those issues are caused by the bump of libtool, from the testing I
> could do. Reverting libtool to the previous version "solves" the
> problem.
> 
> The thing that happens is that libftdi (for the target) has
> AUTORECONF=YES, but not host-libftdi. So libftdi gets autoreconfigured,
> and then when host-libftdi is being built, even though we don't have
> AUTORECONF=YES, when starting the build, it does execute
> 'CDPATH="${ZSH_VERSION+.}:" && cd .
> && /bin/bash /home/test/outputs/libftdi/build/host-libftdi-0.19/missing
> --run aclocal-1.11 ' and it ends up failing.

Ok, the reason it does execute "missing" and does a kind of automatic
autoreconf is because we have one patch that modifies configure.in. So
configure.in is more recent than the configure script itself. When
libtool/autoconf/automake has not been built before host-libftdi, then
this automatic autoreconf cannot proceed:

CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/bash /home/test/outputs/toto/build/host-libftdi-0.19/missing --run aclocal-1.11 
/home/test/outputs/toto/build/host-libftdi-0.19/missing: line 52: aclocal-1.11: command not found
WARNING: `aclocal-1.11' is missing on your system.  You should only need it if
         you modified `acinclude.m4' or `configure.in'.  You might want
         to install the `Automake' and `Perl' packages.  Grab them from
         any GNU archive site.
CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/bash /home/test/outputs/toto/build/host-libftdi-0.19/missing --run autoconf
 cd . && /bin/bash /home/test/outputs/toto/build/host-libftdi-0.19/missing --run automake-1.11 --foreign
/home/test/outputs/toto/build/host-libftdi-0.19/missing: line 52: autoconf: command not found
/home/test/outputs/toto/build/host-libftdi-0.19/missing: line 52: automake-1.11: command not found
WARNING: `autoconf' is missing on your system.  You should only need it if
         you modified `configure.in'.  You might want to install the
         `Autoconf' and `GNU m4' packages.  Grab them from any GNU
         archive site.

and it in facts makes the thing work.

However, when this "automatic autoreconf" is done, and an
automake/autoconf/libtool set of tools, with the latest libtool, has
already been built and installed, then it generates some wrong stuff.

An easy fix is to add:

HOST_LIBFTDI_AUTORECONF = YES

to libftdi.mk. It doesn't really explain why it was working with
libtool 2.2 and no longer with libtool 2.4, but it works.

Thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
