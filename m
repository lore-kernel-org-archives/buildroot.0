From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 07:36:44 +0200
Subject: [Buildroot] [PATCH] qemu/riscv32-virt: Fix missing
 linux-headers patch
In-Reply-To: <20190620204314.GL2216@scaer>
References: <20190620175648.7969-1-alistair.francis@wdc.com>
 <20190620205424.10702057@windsurf> <20190620204314.GL2216@scaer>
Message-ID: <20190621073644.4560aece@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 22:43:14 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > So what I would propose instead is this:
> > 
> > diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> > index 95432ade83..46f270a0e1 100644
> > --- a/package/linux-headers/linux-headers.mk
> > +++ b/package/linux-headers/linux-headers.mk
> > @@ -60,7 +60,8 @@ endif # LINUX_HEADERS_CUSTOM_TARBALL
> >  # Apply any necessary patches if we are using the headers from a kernel
> >  # build.
> >  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> > -LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
> > +LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH)) \
> > +       $(wildcard $(addsuffix /linux,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
> >  
> >  # We rely on the generic package infrastructure to download and apply
> >  # remote patches (downloaded from ftp, http or https). For local
> > 
> > Yann, what do you think of this ?  
> 
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks. One thing I'm sure of is the order in which patches will be
applied between the patches in BR2_GLOBAL_PATCH_DIR and
BR2_LINUX_KERNEL_PATCH. We need to make sure that what happens for the
linux package happens in the same order for the linux-headers package.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
