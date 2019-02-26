From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Feb 2019 08:32:25 +0100
Subject: [Buildroot] [PATCH 1/3] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <87o96zeapq.fsf@dell.be.48ers.dk>
References: <20190219223530.15956-1-christian@paral.in>
 <20190220090108.6e2d1e9a@windsurf>
 <87o96zeapq.fsf@dell.be.48ers.dk>
Message-ID: <20190226083225.2b23e850@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Feb 2019 23:59:13 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Indeed, O_TMPFILE support was only added to glibc in 2.19 with the
> following commit:
> 
> commit ffdd31816a67f48697ea4d6b852e58d2886d42ca
> Author: Andreas Schwab <schwab@suse.de>
> Date:   Wed Sep 11 11:15:45 2013 +0200
> 
>     Add O_TMPFILE to <fcntl.h>
> 
> And to musl in 0.9.15 with the following commit:
> 
> commit f7d348ec39ce31efdc4963eb4a8f16f48e5ef095
> Author: Szabolcs Nagy <nsz@port70.net>
> Date:   Sat Nov 23 23:47:48 2013 +0000
> 
>     add O_TMPFILE flag, new in linux 3.11
> 
>     definition in linux:
>      #define O_TMPFILE (__O_TMPFILE | O_DIRECTORY)
>     where __O_TMPFILE and O_DIRECTORY are arch specific
> 
> We have already dropped support for glibc <= 2.17 back in 2017.08,
> perhaps we should bump that to <= 2.18 now?
> 
> A number of our preconfigured toolchains do use glibc 2.18 though,
> E.G. the codesourcery / mentor ARM toolchain and a number of the
> toolchains we use on the autobuilders.

While I understand the maintenance burden that it causes, I would like
to try to keep support for fairly old toolchains. Even if it seems
crazy, a number of companies are still using oldish toolchains
(typically provided by SoC vendors) to build stuff with relatively
recent Buildroot versions. It is becoming more and more difficult due
to the use of C++11 in many userspace components (which requires gcc >=
4.8), but still. So we should be careful about bumping our glibc
version requirements in a global way, when only a package like "runc"
is affected, which serves some very specific purpose.

Can we work around the lack of O_TMPFILE in the C library directly in
the package source code, and then rely on a >= 3.11 kernel headers
dependency ?

Systemd has this logic in missing_fcntl.h:

/* The precise definition of __O_TMPFILE is arch specific; use the
 * values defined by the kernel (note: some are hexa, some are octal,
 * duplicated as-is from the kernel definitions):
 * - alpha, parisc, sparc: each has a specific value;
 * - others: they use the "generic" value.
 */

#ifndef __O_TMPFILE
#if defined(__alpha__)
#define __O_TMPFILE     0100000000
#elif defined(__parisc__) || defined(__hppa__)
#define __O_TMPFILE     0400000000
#elif defined(__sparc__) || defined(__sparc64__)
#define __O_TMPFILE     0x2000000
#else
#define __O_TMPFILE     020000000
#endif
#endif

/* a horrid kludge trying to make sure that this will fail on old kernels */
#ifndef O_TMPFILE
#define O_TMPFILE (__O_TMPFILE | O_DIRECTORY)
#endif

I suppose the first part, that defines __O_TMPFILE is only needed if
you have kernel headers < 3.11, so we would not need that. Only the
second part would be needed ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
