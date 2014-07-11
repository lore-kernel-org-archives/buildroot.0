From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Jul 2014 10:24:11 +0200
Subject: [Buildroot] [PATCHv3 1/2] linux target name might be not equal
 linux file name
In-Reply-To: <20140710202208.GH28300@free.fr>
References: <20140710200054.GA29977@waldemar-brodkorb.de>
 <20140710202208.GH28300@free.fr>
Message-ID: <20140711082410.GA22779@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Yann E. MORIN wrote,

> Waldemar, All,
> 
> On 2014-07-10 22:00 +0200, Waldemar Brodkorb spake thusly:
> > For example the upcoming qemu-xtensa patch is using this feature,
> > where the target is called "zImage", but the resulting kernel name
> > is "Image.elf".
> > 
> > ---
> > Changes v2 -> v3:
> >   - no change
> > Changes v1 -> v2:
> >   - add comment about default value (suggested by Arnout)
> >   - reorder default value for LINUX_TARGET_NAME (suggested by Arnout)
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  linux/Config.in |    7 +++++++
> >  linux/linux.mk  |   10 +++++++---
> >  2 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/linux/Config.in b/linux/Config.in
> > index 0a13b13..1c316ae 100644
> > --- a/linux/Config.in
> > +++ b/linux/Config.in
> > @@ -244,6 +244,13 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
> >  	  Specify the kernel make target to build the kernel that you
> >  	  need.
> >  
> > +config BR2_LINUX_KERNEL_IMAGE_NAME
> > +	string "Kernel image name"
> > +	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
> > +	help
> > +	  Specify the kernel filename. Defaults to BR2_LINUX_KERNEL_TARGET_NAME
> > +	  if not set.
> 
> I would rephrase this to:
> 
>     The filename of the kernel image, if it is different from the
>     make target (above). Only Xtensa uses a filename different from
>     the make target.
> 
>     If unsure, leave it empty.
> 
> >  config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
> >  	string "load address (for 3.7+ multi-platform image)"
> >  	depends on BR2_arm || BR2_armeb
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index bd3f2ac..1ba3953 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -80,7 +80,8 @@ endif
> >  KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
> >  
> >  ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
> > -LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
> > +LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
> > +LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
> >  else
> >  ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
> >  LINUX_IMAGE_NAME = uImage
> > @@ -106,6 +107,9 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
> >  LINUX_IMAGE_NAME = vmlinuz
> >  endif
> >  endif
> > +ifeq ($(LINUX_TARGET_NAME),)
> > +LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
> > +endif
> 
> I'm confused. Above, you state that if BR2_LINUX_KERNEL_IMAGE_NAME is
> empty, it defaults to BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM.
> 
> But here, you are doing exactly the opposite, that is set
> LINUX_TARGET_NAME (derived from BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM)
> with the value of LINUX_IMAGE_NAME, which is derived from the new option
> you added above, BR2_LINUX_KERNEL_IMAGE_NAME.
> 
> Should that not be:
> 
>     ifeq ($(LINUX_IMAGE_NAME),)
>     LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
>     endif
> 
> But I may have missed something... ;-)

I'm confused too now ;)
Indeed I have put in Arnout suggestion for my first patch version
without modifying the help text and only done runtime testing
without actually thinking if this is the correct thing.

So the new variable BR2_LINUX_KERNEL_IMAGE_NAME should be default
LINUX_TARGET_NAME, if not set.

best regards
 Waldemar
