From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 13 Mar 2019 18:24:38 -0400
Subject: [Buildroot] [PATCH 2/2] linux{,
 -headers}: support downloads of v5+
In-Reply-To: <e952d8b7-a4a8-4a5d-9a95-0e441b742bc5@cesnet.cz>
References: <20190306212815.19759-1-arnout@mind.be>
 <20190306212815.19759-2-arnout@mind.be>
 <e952d8b7-a4a8-4a5d-9a95-0e441b742bc5@cesnet.cz>
Message-ID: <CAFSsvmrrZy6Aqk=5z9759a7s5ebL2SQBWWe9Z8+WW3pFWX3KXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

Tested-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>


On Thu, Mar 7, 2019 at 6:23 AM Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
>
> On st?eda 6. b?ezna 2019 22:28:15 CET, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> > With the arrival of linux v5.0, we need yet another condition to set
> > _SITE correctly. Instead of continuing this madness, solve the problem
> > generically: use v2.6 for 2.6.*, and use the number before the first dot
> > in the other cases.
> >
> > While we're at it, remove the comment which has been incorrect since
> > 80d7b68167a5c8893e906ace6b5f0b0166336406 (7 years ago).
> >
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > ---
> >  linux/linux.mk                         | 9 ++-------
> >  package/linux-headers/linux-headers.mk | 9 ++-------
> >  2 files changed, 4 insertions(+), 14 deletions(-)
> >
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 2b5d096e14..c7081db88f 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -37,15 +37,10 @@ else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
> >  LINUX_SITE = https://git.kernel.org/torvalds/t
> >  else
> >  LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
> > -# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> > -# to use the $(word) function. We support versions such as 4.0, 3.1,
> > -# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
> >  ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
> >  LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> > -else ifeq ($(findstring x3.,x$(LINUX_VERSION)),x3.)
> > -LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
> > -else ifeq ($(findstring x4.,x$(LINUX_VERSION)),x4.)
> > -LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
> > +else
> > +LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword
> > $(subst ., ,$(LINUX_VERSION))).x
> >  endif
> >  endif
> >
> > diff --git a/package/linux-headers/linux-headers.mk
> > b/package/linux-headers/linux-headers.mk
> > index 4b5ebf8d97..95432ade83 100644
> > --- a/package/linux-headers/linux-headers.mk
> > +++ b/package/linux-headers/linux-headers.mk
> > @@ -50,15 +50,10 @@ LINUX_HEADERS_SOURCE =
> > linux-$(LINUX_HEADERS_VERSION).tar.gz
> >  LINUX_HEADERS_SITE = https://git.kernel.org/torvalds/t
> >  else
> >  LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
> > -# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> > -# to use the $(word) function. We support versions such as 4.0, 3.1,
> > -# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
> >  ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
> >  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> > -else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
> > -LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
> > -else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
> > -LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
> > +else
> > +LINUX_HEADERS_SITE =
> > $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst .,
> > ,$(LINUX_HEADERS_VERSION))).x
> >  endif # x2.6
> >  endif # LINUX_HEADERS_CUSTOM_TARBALL
> >
>
> Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
>
> Thanks!
>
> Jan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
