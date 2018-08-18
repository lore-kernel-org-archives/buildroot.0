From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Aug 2018 22:09:13 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
In-Reply-To: <20180818212953.26bf3a2f@windsurf>
References: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
 <20180818174900.0ee2b668@windsurf> <20180818212953.26bf3a2f@windsurf>
Message-ID: <CAPi7W808osYXWuNs8URXOdOix6eP4P46+ESrH+DuaR6syRLz5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-08-18 21:29 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sat, 18 Aug 2018 17:49:00 +0200, Thomas Petazzoni wrote:
>
> > However, we still have an issue: when static linking, libboost_atomic.a
> > is produced even on platforms that do provide the "always lock-free
> > atomic ints".
> >
> > Examples:
> >
> >  - Cortex-M4
> >
> >    http://autobuild.buildroot.net/results/212/212651b677cfb0763
> b34596d4f999103039d89bc/build-end.log
> >
> >    $ ./host/bin/arm-linux-gcc -dM -E - < /dev/null | grep
> >    ATOMIC_BOOL_LOCK_FREE #define __GCC_ATOMIC_BOOL_LOCK_FREE 2
> >
> >  - MIPS, statically linked
> >
> >    http://autobuild.buildroot.net/results/6d3/6d3db8a67a1de7592
> 0624b3e13e8110e783ddbd9/build-end.log
> >
> >    $ ./host/bin/mipsel-linux-gcc -dM -E - < /dev/null | grep
> >    ATOMIC_BOOL_LOCK_FREE #define __GCC_ATOMIC_BOOL_LOCK_FREE 2
>
> And we have another situation here:
>
>   http://autobuild.buildroot.net/results/9c3/9c373d0b5a1a59e22
> 71d71c480d55a90a67b84cb/build-end.log
>
> This one is on PowerPC, and with dynamic linking. It is not going to be
> solved by the BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS stuff.
>
OK, this last one is easy, azmq selects BOOST_LOG but BOOST_LOG depends on
!(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC):

warning: (BR2_PACKAGE_AZMQ) selects BR2_PACKAGE_BOOST_LOG which has unmet
direct dependencies (BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_HAS_THREADS_NPTL &&
(!BR2_powerpc || !BR2_TOOLCHAIN_USES_UCLIBC))

I will fix this by removing the dependency on !(BR2_powerpc &&
BR2_TOOLCHAIN_USES_UCLIBC) from BOOST_LOG as it seems that boost-log builds
fine on powerpc with uclibc nowadays.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180818/cdc513c6/attachment.html>
