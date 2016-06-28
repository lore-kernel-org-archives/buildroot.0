From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 27 Jun 2016 21:51:52 -0400
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <20160627205746.GC3714@free.fr>
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
Message-ID: <CAFSsvmq4=Rjj=E8Bbvfj4AThYW7iG0fhSxcyAU4umpqO-4p8GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jun 27, 2016 16:57, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> Adam, All,
>
> (Peter, Thomas, Arnout: questions for you, below.)
>
> On 2016-06-26 22:25 -0400, Adam Duskett spake thusly:
> > Just like the kernel menuconfig, this allows for a user to
> > specify a local directory for the uboot source code.
>
> I'm not sure this is a great idea... I'm not sure it was a great idea to
> allow it for the Linux kernel either, mind you.
>
> The problem with local sources is that they make the build
> non-reproducible.
>
> If your concern is to be able to use a local source during development,
> we have the override-srcdir mechanism just for that. See in the
> menuconfig, in the "Build options" sub-menu:
>
>     ($(CONFIG_DIR)/local.mk) location of a package override file
>
Interesting!  However I was not aware of this feature and I would suspect
most users won't know about it because it's not in menuconfig.  For local
development why would this be a bad thing?

> So, by default, Buildroot will look for a file named "local.mk" in the
> same directory with the .config file.  You can change the location where
> to find that file. If it does not exist, that's not an error. If it
> exists, Buildroot will parse it.
>
> The local.mk file is suposed to include override-srcdir directives, like
> so:
>
>     MY_PACKAGE_OVERRIDE_SRCDIR = /path/to/my/local/source/for/my/package
>
> For example:
>
>     LINUX_OVERRIDE_SRCDIR = /path/to/my/linux
>     UBOOT_OVERRIDE_SRCDIR = /path/to/my/uboot
>
> With those, Buildroot will conclude that it should download the affected
> package, and just use the sources it finds in the specified directory.
> Note that Buildroot will not apply any patches in this case; you are
> responsbile for propagating whatever patch you need. Buildroot jsut use
> the sources as-is.
>
Again, while this is good; I believe it isn't advertised well in the
documentation. I had to go hunt it.  Perhaps a revision to the online
documentation to inform users of this feature other than putting it in the
"using buildroot for development" section?  Perhaps just a subsection in
that section?

> And looking at the commit that introduced it for linux, it is exactly
> the case that would have been covered by an override-srcdir:
>
>     commit 73da2ff6f718f2889e3c5024d899f8d58f502863
>     Author: Rafal Fabich <rafal.fabich@gmail.com>
>     Date:   Sat Feb 23 19:03:30 2013 +0100
>
>         Added local directory as source of kernel code
>
>         Add the option to use a local directory as the source for
>         building the Linux kernel, which can be useful during
>         kernel development.
>
>         Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
>         Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>         Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>         Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> Peter, any reason that you applied this patch at the time?
> Arnout, anything you remember for giving your ACK?
>
> So, I would think that:
>   1- we don't want this for U-Boot;
>   2- we should drop it for Linux.
>
> Peter, Thomas, Arnout: what do you think?
>
> Regards,
> Yann E. MORIN.
>
> > Also had to change ifeq ($(UBOOT_VERSION),custom) to
> > ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y) in uboot.mk,
> > this is also just like the kernel's make file as well.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> >  boot/uboot/Config.in | 15 +++++++++++++++
> >  boot/uboot/uboot.mk  |  5 ++++-
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index 9ffbb51..5a91461 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -57,6 +57,12 @@ config BR2_TARGET_UBOOT_CUSTOM_HG
> >  config BR2_TARGET_UBOOT_CUSTOM_SVN
> >       bool "Custom Subversion repository"
> >
> > +config BR2_TARGET_UBOOT_CUSTOM_LOCAL
> > +     bool "Local directory"
> > +     help
> > +       This option allows Buildroot to get the Linux kernel source
> > +       code from a local directory.
> > +
> >  endchoice
> >
> >  config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
> > @@ -84,6 +90,13 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
> >
> >  endif
> >
> > +config BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH
> > +     string "Path to the local directory"
> > +     depends on BR2_TARGET_UBOOT_CUSTOM_LOCAL
> > +     help
> > +       Path to the local directory with the uboot source code.
> > +
> > +
> >  config BR2_TARGET_UBOOT_VERSION
> >       string
> >       default "2016.05"       if BR2_TARGET_UBOOT_LATEST_VERSION
> > @@ -92,9 +105,11 @@ config BR2_TARGET_UBOOT_VERSION
> >       default "custom"        if BR2_TARGET_UBOOT_CUSTOM_TARBALL
> >       default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
> >               if BR2_TARGET_UBOOT_CUSTOM_GIT ||
BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
> > +     default "custom" if BR2_TARGET_UBOOT_CUSTOM_LOCAL
> >
> >  config BR2_TARGET_UBOOT_PATCH
> >       string "Custom U-Boot patches"
> > +     depends on !BR2_TARGET_UBOOT_CUSTOM_LOCAL
> >       help
> >         A space-separated list of patches to apply to U-Boot.
> >         Each patch can be described as an URL, a local file path,
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index a2274ee..86671bd 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -12,12 +12,15 @@ UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
> >
> >  UBOOT_INSTALL_IMAGES = YES
> >
> > -ifeq ($(UBOOT_VERSION),custom)
> > +ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y)
> >  # Handle custom U-Boot tarballs as specified by the configuration
> >  UBOOT_TARBALL = $(call
qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
> >  UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
> >  UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
> >  BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
> > +else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_LOCAL),y)
> > +UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH))
> > +UBOOT_SITE_METHOD = local
> >  else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
> >  UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
> >  UBOOT_SITE_METHOD = git
> > --
> > 2.7.4
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
.-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
>
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160627/0a1e6bad/attachment.html>
