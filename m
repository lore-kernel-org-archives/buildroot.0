From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 14:52:48 +0200
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726121429.GA3588@tarshish>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
 <20160726100101.208d0299@free-electrons.com>
 <20160726111557.GY3588@tarshish>
 <20160726134801.1d2eb91b@free-electrons.com>
 <20160726121429.GA3588@tarshish>
Message-ID: <20160726145248.5dc5a39a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 15:14:29 +0300, Baruch Siach wrote:

> You are right of course, forgive my sloppiness. To be correct for uClibc the 
> code should test for __ARCH_USE_MMU__ instead of __ARCH_HAS_MMU__. But testing 
> HAVE_FORK is better, I thing, since it also covers other hypothetical MMU-less 
> C libraries.

Using HAVE_FORK indeed seems better. However, can you verify that it
actually works for MMU-capable platforms?

What worries me is that the code in libbb/ originally comes from
Busybox, which doesn't use autoconf. HAVE_FORK is a #define value
defined by ipkg's autoconf configure script, in config.h, and I'm not
sure if the libbb/ code includes config.h.

So, please make sure that HAVE_FORK is really taken into account when
building on MMU-capable platforms by adding some #error in the #if
defined(HAVE_FORK) test in the libbb code that you're changing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
