From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 19:29:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <CAAHaz6GeH4p99WBpgESL0LKaL9R-ey4Tzx8FdUOTOqs6gGyxCQ@mail.gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
 <20131102122618.18eb2f00@skate>
 <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
 <CAAHaz6HvxQR0g9CpfvRTJN2FAoGmgR_z6uWVar93AXjENH-vbQ@mail.gmail.com>
 <20131106183947.0b078df7@skate>
 <CAAHaz6GeH4p99WBpgESL0LKaL9R-ey4Tzx8FdUOTOqs6gGyxCQ@mail.gmail.com>
Message-ID: <20131106192959.184c208e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

(Your e-mail wrapping is weird: it leaves one word alone on some lines.
Strange. Maybe some GMail craziness.)

On Wed, 6 Nov 2013 20:21:31 +0200, Alexander Lukichev wrote:

> Another option would be to build openpgm without fancy code that uses those
> intrinsics. If I disable some constants defined in configure script when
> intrinsics
> are expected from the toolchain, the code does not use them but instead
> tries to use pthread_spin_{lock,trylock,unlock}() functions. Curiously, my
> toolchain,
> built with "linuxthreads (stable/old)", does not have them. Should it? I
> have
> attached defconfig I use.

There is no implementation of pthread_spin_*() in the linuxthreads.old
thread implementation in uClibc. You should use NPTL instead when
available.

> I have tried to rebuild the toolchain with "linuxthreads" but it complained
> somewhere in uClibc:

Yes, I believe linuxthreads is known to be broken for a number of
architectures. From the Config.in help text in uClibc:

          The new version has not been tested much, and lacks ports for
          arches which glibc does not support (like bfin/frv/etc...),
          but is based on the latest code from glibc, so it may be the
          only choice for the newer ports (like alpha/amd64/64bit
          arches and hppa).

> ./libpthread/linuxthreads/sysdeps/pthread/bits/libc-tsd.h:24,
>                  from libc/inet/rpc/rpc_thread.c:16:
> ./include/tls.h:6:22: error: tls.h: No such file or directory
> make[1]: *** [libc/inet/rpc/rpc_thread.oS] Error 1
> 
> Could I fix this somehow?

I don't think fixing linuxthreads in uClibc is really worth it, to be
honest.

Moreover, Simon said that while uClibc 0.9.33 does build fine for
AVR32, it doesn't work properly on the target, and he is still using
uClibc 0.9.31 + a good stack of patches on top of it.

I think we should just disable OpenPGM on AVR32. If somebody ever cares
about this, he will be in charge of fixing it :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
