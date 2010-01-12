From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:39:16 +0100
Subject: [Buildroot] Issue for the integration of Codesourcery external
 toolchains
In-Reply-To: <201001122309.41946.yann.morin.1998@anciens.enib.fr>
References: <20100104162422.5b7e7bf6@surf>
	<1262647415.23193.99.camel@coalu.atr>
	<20100112115228.6f81f471@surf>
	<201001122309.41946.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100113003916.295401a2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2010 23:09:41 +0100
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> 1) do not copy the sysroot to staging, trust gcc to find it properly
> 2) add a kind of wrapper to gcc (et al.) that basically does the
> following:
> 
> ---8<---
> #!/bin/sh
> exec real-gcc -L "${STAGING_DIR}"{,/usr}/lib    \
>                   -I "${STAGING_DIR}"/usr/include   \
>                   "$@"
> ---8<---
> 
> That way, we always have out staging/lib and staging/usr/lib in the
> library search path; ditto for the include search path.

This is the approach we tried first to support external toolchains,
before switching to the current solution using --sysroot.

If you look at my original mail in this thread, the second solution I
was proposing is:

 * Reconsider the solution of copying the sysroot, and try harder with
   the more traditionnal -L/-I solutions.

As it says, we had some difficulties with the -L/-I solutions that
couldn't be solved easily, and --sysroot was easier. But we can decide
to go backward and try to fix the problems encountered with the -L/-I
solution. Even with -L/-I, gcc was sometimes not finding libraries, and
we had to start using things such as --rpath-link, which proved to be
very complicated. I don't remember the exact packages and cases that
were causing problems.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
