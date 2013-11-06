From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Wed, 6 Nov 2013 20:21:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <20131106183947.0b078df7@skate>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
 <20131102122618.18eb2f00@skate>
 <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
 <CAAHaz6HvxQR0g9CpfvRTJN2FAoGmgR_z6uWVar93AXjENH-vbQ@mail.gmail.com>
 <20131106183947.0b078df7@skate>
Message-ID: <CAAHaz6GeH4p99WBpgESL0LKaL9R-ey4Tzx8FdUOTOqs6gGyxCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2013/11/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Well, I believe your original patch remains almost good then: openpgm
> cannot be built on avr32 because the AVR32 compiler doesn't provide the
> required compiler intrinsics.
> <http://free-electrons.com>
>

Another option would be to build openpgm without fancy code that uses those
intrinsics. If I disable some constants defined in configure script when
intrinsics
are expected from the toolchain, the code does not use them but instead
tries to use pthread_spin_{lock,trylock,unlock}() functions. Curiously, my
toolchain,
built with "linuxthreads (stable/old)", does not have them. Should it? I
have
attached defconfig I use.

I have tried to rebuild the toolchain with "linuxthreads" but it complained
somewhere
in uClibc:

  CC libc/unistd/confstr.os
  CC libc/unistd/usleep.os
  CC libpthread/linuxthreads/forward.oS
  CC libpthread/linuxthreads/libc-cancellation.oS
  CC libpthread/linuxthreads/libc_pthread_init.oS
  CC libc/misc/elf/dl-iterate-phdr.oS
  CC libc/misc/internals/__uClibc_main.oS
  CC libc/inet/rpc/rpc_thread.oS
In file included from
./libpthread/linuxthreads/sysdeps/pthread/bits/libc-tsd.h:24,
                 from libc/inet/rpc/rpc_thread.c:16:
./include/tls.h:6:22: error: tls.h: No such file or directory
make[1]: *** [libc/inet/rpc/rpc_thread.oS] Error 1

Could I fix this somehow?

I will send a disabling patch, of course, but I was just interested why my
toolchain
does not have spinlock support (POSIX [1] does not say that this is
restricted to
some extension).

[1] http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/pthread.h.html

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/62d5cf9b/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pthreads_stable_avr32_defconfig
Type: application/octet-stream
Size: 7718 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/62d5cf9b/attachment-0001.obj>
