From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:13:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/multicat: fix build with
 external Blackfin uClibc toolchain
In-Reply-To: <1458493787.1998.14.camel@embedded.rocks>
References: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
 <1458430906-8291-3-git-send-email-joerg.krause@embedded.rocks>
 <20160320152212.54caaaa6@free-electrons.com>
 <1458493787.1998.14.camel@embedded.rocks>
Message-ID: <20160320181347.492b3725@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Mar 2016 18:09:47 +0100, J?rg Krause wrote:

> You're right! It has?__UCLIBC_HAS_ADVANCED_REALTIME__, but it does not
> define?__UCLIBC_HAS_THREADS_NATIVE__ and clock_nanosleep() is only
> defined if both are set in <time.h>:
> 
> #??ifdef __UCLIBC_HAS_THREADS_NATIVE__
> #???if defined __USE_XOPEN2K && defined
> __UCLIBC_HAS_ADVANCED_REALTIME__

Ah, makes sense!

> I'll prepare a v2 with something like that testing for __UCLIBC__,
> __UCLIBC_HAS_THREADS_NATIVE__ and __UCLIBC_HAS_ADVANCED_REALTIME__.

Sounds good.

It would of course be better if they were using autoconf, to be able to
add a configure script, but well...

> My guess is that uClibc was build with __LINUXTHREADS_OLD__ enabled,
> but the toolchain ships libpthread instead. However, I am not a
> toolchain expert.

Regardless of whether you have linuxthreads/old, linuxthreads or NPTL,
there is always a library named libpthread. It's the internals of the
library and how it interacts with the kernel that completely differs
between the different implementations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
