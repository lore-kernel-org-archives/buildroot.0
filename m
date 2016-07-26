From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jul 2016 18:08:54 +0300
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726145248.5dc5a39a@free-electrons.com>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
 <20160726100101.208d0299@free-electrons.com>
 <20160726111557.GY3588@tarshish>
 <20160726134801.1d2eb91b@free-electrons.com>
 <20160726121429.GA3588@tarshish>
 <20160726145248.5dc5a39a@free-electrons.com>
Message-ID: <20160726150854.GB3588@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 26, 2016 at 02:52:48PM +0200, Thomas Petazzoni wrote:
> On Tue, 26 Jul 2016 15:14:29 +0300, Baruch Siach wrote:
> > You are right of course, forgive my sloppiness. To be correct for uClibc 
> > the code should test for __ARCH_USE_MMU__ instead of __ARCH_HAS_MMU__. But 
> > testing HAVE_FORK is better, I thing, since it also covers other 
> > hypothetical MMU-less C libraries.
> 
> Using HAVE_FORK indeed seems better. However, can you verify that it
> actually works for MMU-capable platforms?
> 
> What worries me is that the code in libbb/ originally comes from
> Busybox, which doesn't use autoconf. HAVE_FORK is a #define value
> defined by ipkg's autoconf configure script, in config.h, and I'm not
> sure if the libbb/ code includes config.h.
> 
> So, please make sure that HAVE_FORK is really taken into account when
> building on MMU-capable platforms by adding some #error in the #if
> defined(HAVE_FORK) test in the libbb code that you're changing.

I verified that config.h macros are defined in libbb.h before posting the last 
patch, by using another defined macros. I repeated this test as you suggested, 
with HAVE_FORK and the current br-arm-full.config, just to be sure. The #error 
triggers as expected in both tests.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
