From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jul 2016 14:15:57 +0300
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726100101.208d0299@free-electrons.com>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
 <20160726100101.208d0299@free-electrons.com>
Message-ID: <20160726111557.GY3588@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 26, 2016 at 10:01:01AM +0200, Thomas Petazzoni wrote:
> On Tue, 26 Jul 2016 09:59:29 +0200, Thomas Petazzoni wrote:
> > I think this needs more investigation, because:
> > 
> > BR2_bfin=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_INIT_NONE=y
> > # BR2_PACKAGE_BUSYBOX is not set
> > BR2_PACKAGE_IPKG=y
> > # BR2_TARGET_ROOTFS_TAR is not set
> > 
> > which is a noMMU configuration, is able to build ipkg just fine.
> 
> I was indeed a bit surprised to see this patch: we have been having
> Blackfin configurations for a long time in the autobuilders, and we
> never had to add a BR2_USE_MMU dependency on this package.
> 
> So I believe there's something a bit more subtle going on here.

Right. It's this code from libbb/libbb.h:

/* Cope with mmu-less systems somewhat gracefully */
#if defined(__UCLIBC__) && !defined(__ARCH_HAS_MMU__)
#define fork    vfork
#endif

This breaks musl that does not define __UCLIBC__. I posted an updated patch to 
uses HAVE_FORK instead.

Is there anyone actually using this package anyway? Even its homepage is not 
accessible here (handhelds.org does not resolve).

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
