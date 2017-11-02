From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 11:50:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-11-01
In-Reply-To: <27b962f2-9a22-bef6-3c51-b8e5da34cb67@free.fr>
References: <20171102070005.79F7021D67@mail.free-electrons.com>
 <27b962f2-9a22-bef6-3c51-b8e5da34cb67@free.fr>
Message-ID: <20171102115011.732d1d9f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 11:26:52 +0100, Julien Boibessot wrote:

> >          arc |                     gpm-1.20.7 | http://autobuild.buildroot.net/results/15e24f8c6a3ad2bfd198cc4fb094aeace7d1ee6a
> >          arc |                     gpm-1.20.7 | http://autobuild.buildroot.net/results/7c24edc1af7dabd2b401e750add1eccaaab8961a
> >  
> 
> Build failures are due to undefined __sigemptyset(). After quick
> investigation it seems that the include file defining this macro
> (include/bits/sigset.h) is no more present in glibc-2.26.
> From glibc Changelog, file seems deleted since 2017-05-20.
> 
> gpm builds fine with glibc-2.23 and uclibc-1.0.26.
> No one else is impacted ?

I believe __sigemptyset() should never have been used, it looks like an
internal function. sigemptyset() should have been used instead, and is
in fact used elsewhere in gpm:

$ grep -r sigemptyset *
src/lib/liblow.c:  sigemptyset (&new_sigset);
src/lib/liblow.c:  sigemptyset(&sa.sa_mask);
src/lib/liblow.c:      sigemptyset(&sa.sa_mask);
src/prog/gpm-root.y:   __sigemptyset(&childaction.sa_mask);

You can find some glibc 2.26 fixes for gpm at
http://lfs.phayoune.org/blfs/downloads/8.1/patches/gpm-1.20.7-glibc_2.26-1.patch.
We will probably want something more fine grained, i.e one patch per
change.

See also https://github.com/telmich/gpm/pull/20.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
