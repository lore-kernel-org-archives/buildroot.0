From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:33:27 +0200
Subject: [Buildroot] glib 2.40 on xtensa
In-Reply-To: <CAMo8BfKDFvct4=wDsFVObRMab9P-73LcMvJU2JaNozR=swbT2A@mail.gmail.com>
References: <20140719004023.4a71d4b8@free-electrons.com>
 <CAMo8BfKDFvct4=wDsFVObRMab9P-73LcMvJU2JaNozR=swbT2A@mail.gmail.com>
Message-ID: <20140719113327.5393bf25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sat, 19 Jul 2014 04:28:11 +0400, Max Filippov wrote:
> On Sat, Jul 19, 2014 at 2:40 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Baruch, Max,
> >
> > We have recently update glib to version 2.40, and this is causing
> > issues on Xtensa:
> >
> >   http://autobuild.buildroot.org/results/a1a/a1a1f97a2c54ba4f7f7e44cc094a55bd23ca0aa0/build-end.log
> >
> >   CC       gspawn.lo
> > gthread-posix.c: In function 'g_cond_impl_new':
> > gthread-posix.c:648:2: error: #error Cannot support GCond on your platform.
> >  #error Cannot support GCond on your platform.
> >   ^
> > gthread-posix.c: In function 'g_cond_wait_until':
> > gthread-posix.c:896:2: error: #error Cannot support GCond on your platform.
> >  #error Cannot support GCond on your platform.
> >   ^
> > gthread-posix.c:859:19: warning: unused variable 'ts' [-Wunused-variable]
> >    struct timespec ts;
> >                    ^
> >
> > Could you have a look and see what can be done to fix this problem?
> 
> It requires pthread_cond_timedwait_relative_np (not available on uclibc)

Well, libglib builds fine on ARM/uClibc.

> or pthread_condattr_setclock (only available with NPTL). Looks like we
> need NPTL to support this glib version.

Argh. There's no NPTL support for:

 - ARC (but I believe it's coming)
 - AVR32 (but we're deprecating this architecture, so we don't care)
 - Blackfin (and I don't think there's much hope to have NPTL one day,
   but glib is anyway disabled on !MMU platforms, so we don't care)
 - Xtensa (don't know)
 - i386 (because NPTL requires at least i486)

Should we patch glib to make the support of the GCond stuff optional,
and hope not too many programs will use it? Or simply add the NPTL
dependency to glib, but that would mean a huge number of packages
suddenly become unavailable for some architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
