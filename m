From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 11:09:06 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <201311111114.51686.fatih.asici@gmail.com>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <201311111114.51686.fatih.asici@gmail.com>
Message-ID: <20131111110906.7585ca0e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Mon, 11 Nov 2013 11:14:51 +0200, Fatih A??c? wrote:

> >   http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc035507150aa/build-end.log
> >   (sqlite problem)
> 
> Needs posix_fallocate() which is not available in the test toolchain.

Except that posix_fallocate() is not available in uClibc. It is indeed
available in the internal toolchain backend, due to a patch that we
have added, but we cannot assume it will be available in external
uClibc toolchains that may not have the same of patches applied.

Moreover, the sqlite3.c code in Qt seems to have some code to handle
the absence of posix_fallocate():

#if defined(HAVE_POSIX_FALLOCATE) && HAVE_POSIX_FALLOCATE
  { "fallocate",    (sqlite3_syscall_ptr)posix_fallocate,  0 },
#else
  { "fallocate",    (sqlite3_syscall_ptr)0,                0 },
#endif

It would be nice to have a look at why HAVE_POSIX_FALLOCATE is defined
even though posix_fallocate() is not available.

> >   http://autobuild.buildroot.net/results/bbe7d79da059fdf67fb29880b8539ca2320ba86d/build-end.log
> >   (inlining problem)
> 
> It seems this is fixed in GCC 4.7.3 [1].

Ok.

> > are not fixed. Fatih, would you mind having a look?
> > 
> 
> Is there a method to solve such cases with custom external toolchains?

No, there isn't a really good way. Possibilities are:

 (1) Add an exception to my autobuilder scripts, and document this
    exception (i.e gcc version <foo> fails to build qt5base).

 (2) Rebuild the toolchain with a newer ct-ng and therefore a newer
     gcc, and forget about the problem :-) I anyway desperately need to
     rebuild the Crosstool-NG toolchains used in the autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
