From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Aug 2016 00:06:28 +0200
Subject: [Buildroot] [PATCH 2/2] fwup: link in pthreads for static builds
In-Reply-To: <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
References: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
 <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160812000628.3fc05f4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 18:35:46 -0400, Frank Hunleth wrote:
> Both libconfuse (via libintl) and libarchive have references to pthreads
> but do not specify pthreads in their pkg-config descriptions. This
> change adds pthreads to the fwup linker options so that the link step
> succeeds.

I've finally taken some time to look into this, and I believe your fix
is not the right fix, and the bug is in fact in uClibc (and I have
already posted a mail on the uClibc mailing list about this).

The fact that libintl and libarchive do *not* link with libpthread is
intentional and actually a feature. As explained in my mail to the
uClibc mailing list [1], the idea is that those libraries don't need
threads, they only need to be thread-safe if threads are used by the
application using them.

So the libc part of the C library contains a stub implementation of
those functions, while the libpthread part of the C library contains
the real implementation.

So, libintl and libarchive are only linked against libc.so. If you make
a regular, non-threaded application, linked against libintl and/or
libarchive, then those libraries will use the stub version of the
pthread functions. This is correct and actually good: your application
is not multi-threaded, so why suffer the cost of acquiring/releasing a
mutex?

If on the other hand, your application is multi-threaded, it will link
against libpthread. In this case, the pthread_mutex_*() calls from
libarchive or libintl will use the real implementation from libpthread,
and those libraries will have a thread-safe behavior.

The problem is that this doesn't work with static linking with uClibc.
I believe it's a uClibc bug, but I'm not entirely sure either.

So, if fwup links fine dynamically (i.e without linking against
pthread), there should be no reason to link it with pthread for static
linking.

[1] http://mailman.uclibc-ng.org/pipermail/devel/2016-August/001132.html

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
