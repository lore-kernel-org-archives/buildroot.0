From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jun 2015 16:41:34 +0200
Subject: [Buildroot] Busybox build fails on raspberrypi defconfig
In-Reply-To: <CAJtjsKa9Osr3VjF6jBysCFPEKhh4c8HAHVP7FfVj07_N_B1FMQ@mail.gmail.com>
References: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
 <CAJtjsKa9Osr3VjF6jBysCFPEKhh4c8HAHVP7FfVj07_N_B1FMQ@mail.gmail.com>
Message-ID: <20150617164134.01411faf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Wed, 17 Jun 2015 16:02:10 +0200, Johan Oudinet wrote:
> On Wed, Jun 17, 2015 at 3:27 PM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> > And busybox build fails with the following error:
> > include/libbb.h:87:19: fatal error: utmp.h: No such file or directory
> >  # include <utmp.h>
> >                    ^
> 
> Reverting from uClibc-ng to uClibc-0.9.33 fixes this error.

This seems weird, since UTMP is enabled in our uClibc-ng configuration:

$ grep UTMP *.config
uClibc-0.9.33.config:UCLIBC_HAS_UTMPX=y
uClibc-ng.config:UCLIBC_HAS_UTMP=y
uClibc-ng.config:UCLIBC_HAS_UTMPX=y
uClibc-snapshot.config:UCLIBC_HAS_UTMP=y
uClibc-snapshot.config:UCLIBC_HAS_UTMPX=y

And it's really UCLIBC_HAS_UTMP that controls whether utmp.h is
installed or not:

HEADERS_RM-$(UCLIBC_HAS_UTMP)               += bits/utmp.h utmp.h
HEADERS_RM-$(UCLIBC_HAS_UTMPX)               += bits/utmpx.h utmpx.h

Are you sure you did a full rebuild from scratch, and you didn't select
uClibc-ng but using package/uclibc/uClibc-0.9.33.config as the
configuration file ? That could explain the problem, because the
UCLIBC_HAS_UTMP option didn't exist in uClibc-0.9.33.config, so if you
use that config file with uClibc-ng, UTMP support will be disabled.

Can you double check this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
