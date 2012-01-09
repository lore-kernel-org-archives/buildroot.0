From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 9 Jan 2012 20:45:16 +0000
Subject: [Buildroot] [PATCH] Static build changes
In-Reply-To: <201201090812.57114.arnout@mind.be>
References: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
 <201201090812.57114.arnout@mind.be>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60EF684@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Makefile
> > package/ethtool/ethtool.mk
> > package/htop/htop.mk
> > package/i2c-tools/i2c-tools.mk
> > package/kexec/kexec.mk
> > package/libgcrypt/libgcrypt.mk
> > package/libgpg-error/libgpg-error.mk
> > package/makedevs/makedevs.mk
> > package/mtd/mtd.mk
> > package/ncurses/ncurses.mk
> > package/portmap/portmap.mk
> > package/proftpd/proftpd.mk
> > toolchain/uClibc/uclibc.mk
> 
>  This part of the log message is redundant.  It shows up in the git
> shortlog.
> However, it is useful to include a remark that this doesn't fix the
> issue
> for all packages.

I do not have the time to figure out how to (nor am I sure that on this
network I can) use git to do the patches.  Were I able to get git going,
the first e-mail would have been that really nice blurb about the files
affected.  This was my intent by the above.

> > @@ -7,4 +7,8 @@
> >  ETHTOOL_VERSION = 3.0
> >  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
> >
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +ETHTOOL_CONF_ENV += LDFLAGS+=-static
> > +endif
> 
>  Wouldn't it be more convenient if this was added globally to
> TARGET_LDFLAGS in Makefile.in?  The -static is anyway just a hint,
> it doesn't force the linker to link statically.

To quote Bill Cosby:  "I hadn't thought of that."

> 
> > +
> >  $(eval $(call AUTOTARGETS))
> > diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
> > --- a/package/htop/htop.mk      2011-12-14 15:54:04.000000000 -
> 0600
> > +++ b/package/htop/htop.mk      2011-12-20 09:44:06.000000000 -
> 0600
> > @@ -11,4 +11,9 @@
> >  HTOP_AUTORECONF = YES
> >  HTOP_CONF_OPT += --disable-unicode
> >
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +HTOP_CONF_ENV += LDFLAGS+="--static -lpthread"
> > +HTOP_CONF_OPT += "'--enable-static' --disable-shared"
>  Is this needed?  The $(PKG)_CONFIGURE_CMDS of
> Makefile.autotools.in
> already includes $(SHARED_STATIC_LIBS_OPTS).

Okay, I'm cool with that too.  Looking at the various configure scripts,
I seem to recall an issue with giving a parameter that wasn't available
in the configure script.  Like it errored out.  I cannot recall, though.
I did this patch up over a month ago and sent it out before xmas. (I've
slept since then.)  The bottom line, there appears to be a lack of a
standard for dealing with the configure options (or at least not all
packages use the standard).

> >
> > +# This does not build kdump static (for some reason)
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +KEXEC_CONF_ENV += LDFLAGS+=-static CFLAGS+=-static
>  I haven't tested, but as far as I can see in the Makefiles, the
> only
> place where LDFLAGS is not used for linking is for kdump...  So if
> it
> anyway doesn't work, you can just as well leave out the -static
> from the
> CFLAGS.

Bummer, that got left in there, eh.

> 
> > +endif
> > +
> >  define KEXEC_REMOVE_LIB_TOOLS
> >         rm -rf $(TARGET_DIR)/usr/lib/kexec-tools
> >  endef
> > diff -Naur a/package/libgcrypt/libgcrypt.mk
> b/package/libgcrypt/libgcrypt.mk
> > --- a/package/libgcrypt/libgcrypt.mk    2011-12-14
> 15:54:04.000000000 -0600
> > +++ b/package/libgcrypt/libgcrypt.mk    2011-12-20
> 09:46:12.000000000 -0600
> > @@ -9,6 +9,12 @@
> >  LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
> >  LIBGCRYPT_INSTALL_STAGING = YES
> >
> > +ifneq ($(BR2_PREFER_STATIC_LIB),y)
> > +LIBGCRYPT_INSTALL_TARGET = YES
> > +else
> > +LIBGCRYPT_INSTALL_TARGET = NO
> > +endif
> 
>  There should also be a global solution for this.  When you prefer
> static
> libs, then none of the libraries should be installed.  Something
> like
> FOO_INSTALL_LIBRARIES = YES
> that sets INSTALL_STAGING and INSTALL_TARGET, perhaps?  (Note that
> this is
> not required for acceptance of this specific patch, just a general
> remark.)

A global approach would be better for this solution.  I've requested
such numerous times in the past.  I was told that if I wanted something
like this, then I needed to do it.  Whether I was the most knowledgeable
person to complete this task is a completely different discussion.  I
worked with what I know.

> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +NCURSES_CONF_OPT += \
> > +       --without-shared \
> > +       --enable-static
> > +else
> > +NCURSES_CONF_OPT += \
> > +       --with-shared \
> >         --disable-static
> > +endif
> 
>  This is already done by $(PKG)_CONFIGURE_CMDS, so just removing
> the

These files already have this verbiage in each.  To that end, I only
encapsulated what was there.  Sounds like each package needs some
clean-up.

> > +
> >  define PROFTPD_MAKENAMES
> >         $(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C
> $(@D)/lib/libcap _makenames
> >  endef
> > diff -Naur a/toolchain/uClibc/uclibc.mk
> b/toolchain/uClibc/uclibc.mk
> > --- a/toolchain/uClibc/uclibc.mk        2011-12-14
> 15:54:04.000000000 -0600
> > +++ b/toolchain/uClibc/uclibc.mk        2011-12-20
> 09:53:49.000000000 -0600
> > @@ -480,6 +480,7 @@
> >                 install_runtime
> >         touch -c $@
> >
> > +ifneq ($(BR2_PREFER_STATIC_LIB),y)
> >  $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
> >         $(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
> >                 CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
> > @@ -487,7 +488,6 @@
> >                 PREFIX=$(TARGET_DIR) utils install_utils
> >         touch -c $@
> >
> > -ifneq ($(BR2_PREFER_STATIC_LIB),y)
> >  UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
> >  endif
> 
>  I'm not sure if I agree with this change.  Prefer static does not
> mean
> force static, so the dynamic linker stuff should still be present.

So, the original design I had done was to add top-level config option
under PREFER_STATIC as BUILD_ONLY_STATIC.  I guessed that this would not
be well received by the hive.  Perhaps that would have been a better
thing to do.  PREFER_STATIC seems to be misleading (based upon my
expectations) given that if you _PREFER_ to use static libraries, then
shouldn't the system ONLY USE static libraries and never install the
shared objects?  I mean, if I ask my contractor to use screws to build
something, and he uses nails, that isn't what I asked for.  But again,
perhaps I have the wrong expectations for PREFER_STATIC.

$0.02 (USD).

Andy
