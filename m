From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Jan 2021 15:19:22 +0100
Subject: [Buildroot] [PATCH] package/openblas: allow disabling
 multithreading
In-Reply-To: <20210102173437.3bc0698f@windsurf>
References: <20201202145024.13436-1-patrickdepinguin@gmail.com>
 <20210102173437.3bc0698f@windsurf>
Message-ID: <CAAXf6LVWOhFzBERunt5OdHhDkaKG1OGR4dxEzr48v52da7gJ-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

First of all, best wishes for 2021 and thanks for applying my patches recently!


El s?b, 2 ene 2021 a las 17:34, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello Thomas,
>
> On Wed,  2 Dec 2020 15:50:24 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > +config BR2_PACKAGE_OPENBLAS_USE_THREAD
> > +     bool "use multithreading"
> > +     default y
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on !BR2_STATIC_LIBS
> > +     help
> > +       Tell OpenBLAS to use multithreading, by passing USE_THREAD=1.
> > +
> > +config BR2_PACKAGE_OPENBLAS_USE_LOCKING
> > +     bool "use locking"
> > +     default y
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
>
> Should this instead be:
>
>         depends on !BR2_PACKAGE_OPENBLAS_USE_THREAD
>
> indeed, as you're explaining in the help text, when USE_THREAD=1, the
> USE_LOCKING option has no effect, as it is forcefully enabled.

We can indeed add this inverse dependency on
BR2_PACKAGE_OPENBLAS_USE_THREAD, this is more clear.
However, I think we also have to retain the dependency on
BR2_TOOLCHAIN_HAS_THREADS, right? Because if there is no thread
support, it does not make sense to lock.
If only depending on !BR2_PACKAGE_OPENBLAS_USE_THREAD, then the
USE_LOCKING option becomes visible if !BR2_TOOLCHAIN_HAS_THREADS .
Right?


>
> And perhaps drop the "default y" ?

I added 'default y' because the introduction of USE_LOCKING in
openblas actually lead to a regression if you were using it in
single-threaded mode from a multi-threaded application. The regression
is only at run-time and causes incorrect math results in some cases
(ugh!).
So, the 'default y' would help existing users in this situation when
upgrading Buildroot and its contained openblas.

We could remove the 'default y' too. In my own repo I can make sure to
enable USE_LOCKING explicitly. This may be fine if we assume there are
few users that use openblas, and even fewer that use it in
single-threaded mode from a multithreaded application.

Thanks,
Thomas
