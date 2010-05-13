From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 May 2010 22:08:51 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <201005131921.50472.yann.morin.1998@anciens.enib.fr>
References: <4BEAE23A.2000906@carallon.com> <20100513172202.3c3539f7@surf>
	<201005131921.50472.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100513220851.6ad92e7e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 May 2010 19:21:50 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> >  1. Make BR2_PTHREADS_NATIVE depends on BR2_UCLIBC_VERSION_SNAPSHOT
> >     *OR* BR2_TOOLCHAIN EXTERNAL
> 
> Not really needed in fact, as what packages really want to know is whether
> the toolchain supports threads or not. The threading model (LinuxThreads
> or native) does not really matter, in fact.

Yeah, in theory, yes. However, I have seen packages such as Webkit that
did compile with a NPTL-powered libc and not with a
linuxthreads-powered libc. See 596bcb63fb26052b86c1271913747e701883dbfa
and https://bugs.busybox.net/show_bug.cgi?id=1405. But, admitted, it's
more a bug in uClibc than a real issue.

> > We should probably :
> > 
> >  *) Hide the option to build the cross-gdb in Buildroot in external
> >     toolchain mode, making the assumption that the external toolchain
> >     should provide its own cross gdb.
> 
> With a purely external toolchain, we can't make this assumption sanely.
> So in this case, it's better to keep the option to build cross-gdb (and
> gdbserver).

Why not, but then we should properly handle the case where the
toolchain has a cross-gdb and the user has selected to build one. How
should we handle this ?

> >  *) Add an option to ask Buildroot to either build a new gdbserver, or
> >     copy the one available for the external toolchain (so that we are
> >     sure its version matches the version of the cross-gdb in the
> >     external toolchain)
> 
> In the work I'm doing, I'm preparing the fact that cross-gdb + gdbserver
> can be built with crosstool-NG *or* buildroot:
>  - if buildroot builds them, then they get disabled in crosstool-NG.
>  - if crosstool-NG builds them, then gdbserver is copied to staging/target,
>    and the crossgdb is in the toolchain path.
> 
> Only the first is currently handled, not the second part.

Yes, this is ok, but even if we're going to add Crosstool-NG as a
backend, I would like to keep the external toolchain support, and thus
improve it to fix those issues.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
