From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 13 May 2010 22:26:34 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <20100513220851.6ad92e7e@surf>
References: <4BEAE23A.2000906@carallon.com>
	<201005131921.50472.yann.morin.1998@anciens.enib.fr>
	<20100513220851.6ad92e7e@surf>
Message-ID: <201005132226.34501.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 13 May 2010 22:08:51 Thomas Petazzoni wrote:
> On Thu, 13 May 2010 19:21:50 +0200
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:
> > Not really needed in fact, as what packages really want to know is whether
> > the toolchain supports threads or not. The threading model (LinuxThreads
> > or native) does not really matter, in fact.
> Yeah, in theory, yes. However, I have seen packages such as Webkit that
> did compile with a NPTL-powered libc and not with a
> linuxthreads-powered libc.

Ah... Webkit...

> See 596bcb63fb26052b86c1271913747e701883dbfa 
> and https://bugs.busybox.net/show_bug.cgi?id=1405. But, admitted, it's
> more a bug in uClibc than a real issue.

I see. Thanks for the pointer. I guess that we then need to get the NPTL
selection with external toolchain as well.

> > With a purely external toolchain, we can't make this assumption sanely.
> > So in this case, it's better to keep the option to build cross-gdb (and
> > gdbserver).
> Why not, but then we should properly handle the case where the
> toolchain has a cross-gdb and the user has selected to build one. How
> should we handle this ?

Keep config options as-is, and then add the coherency check, that is if the
user did select to build cross-gdb, but it is already present alongside the
cross-gcc, then bail out.

> > In the work I'm doing, I'm preparing the fact that cross-gdb + gdbserver
> > can be built with crosstool-NG *or* buildroot:
> >  - if buildroot builds them, then they get disabled in crosstool-NG.
> >  - if crosstool-NG builds them, then gdbserver is copied to staging/target,
> >    and the crossgdb is in the toolchain path.
> > 
> > Only the first is currently handled, not the second part.
> 
> Yes, this is ok, but even if we're going to add Crosstool-NG as a
> backend, I would like to keep the external toolchain support, and thus
> improve it to fix those issues.

Oh, I'm not removing external toolchain at all! In fact, I even build upon
the existing code. So we can share as much as possible (because, after all,
using crostool-NG as a backend is just a kind of external toolchain, but
one that we can force some options of, rather than checking afterwards).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
