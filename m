From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 13:48:01 +0200
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726111557.GY3588@tarshish>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
 <20160726100101.208d0299@free-electrons.com>
 <20160726111557.GY3588@tarshish>
Message-ID: <20160726134801.1d2eb91b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 14:15:57 +0300, Baruch Siach wrote:

> Right. It's this code from libbb/libbb.h:
> 
> /* Cope with mmu-less systems somewhat gracefully */
> #if defined(__UCLIBC__) && !defined(__ARCH_HAS_MMU__)
> #define fork    vfork
> #endif
> 
> This breaks musl that does not define __UCLIBC__. I posted an updated patch to 
> uses HAVE_FORK instead.

We don't use musl on any noMMU platform today, so this certainly cannot
explain failures like:

  http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/

(which was the first one mentioned in your commit log), since this
failure happens with uClibc.

Looking at http://autobuild.buildroot.net/?reason=ipkg-0.99.163, I see
(looking only at the failures since the beginning of 2016) :

 * Numerous failures on ARM noMMU (uClibc)
 * Two failures on m68k noMMU (uClibc)
 * An old failure on i686 due to download issue

i.e, none of the failures are caused by a musl-related build.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
