From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jan 2012 08:01:36 +0100
Subject: [Buildroot] [PATCH] Static build changes
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60EF684@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
 <201201090812.57114.arnout@mind.be>
 <F9C551623D2CBB4C9488801D14F864C60EF684@ex-mb1.corp.adtran.com>
Message-ID: <201201110801.36481.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 09 January 2012 21:45:16 ANDY KENNEDY wrote:
> > > Makefile
> > > package/ethtool/ethtool.mk
> > > package/htop/htop.mk
> > > package/i2c-tools/i2c-tools.mk
> > > package/kexec/kexec.mk
> > > package/libgcrypt/libgcrypt.mk
> > > package/libgpg-error/libgpg-error.mk
> > > package/makedevs/makedevs.mk
> > > package/mtd/mtd.mk
> > > package/ncurses/ncurses.mk
> > > package/portmap/portmap.mk
> > > package/proftpd/proftpd.mk
> > > toolchain/uClibc/uclibc.mk
> > 
> >  This part of the log message is redundant.  It shows up in the git
> > shortlog.
> > However, it is useful to include a remark that this doesn't fix the
> > issue
> > for all packages.
> 
> I do not have the time to figure out how to (nor am I sure that on this
> network I can) use git to do the patches.  Were I able to get git going,
> the first e-mail would have been that really nice blurb about the files
> affected.  This was my intent by the above.

 The thing is, everything that you put in the e-mail will end up in the
git commit as well.  To add comments in the mail that should not be in
the commit message, add something like
---
additional comment
---
between the commit message (first part) and the first diff.

> > > @@ -7,4 +7,8 @@
> > >  ETHTOOL_VERSION = 3.0
> > >  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
> > >
> > > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > > +ETHTOOL_CONF_ENV += LDFLAGS+=-static
> > > +endif
> > 
> >  Wouldn't it be more convenient if this was added globally to
> > TARGET_LDFLAGS in Makefile.in?  The -static is anyway just a hint,
> > it doesn't force the linker to link statically.
> 
> To quote Bill Cosby:  "I hadn't thought of that."

 That's why we have reviews :-)

> > > +
> > >  $(eval $(call AUTOTARGETS))
> > > diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
> > > --- a/package/htop/htop.mk      2011-12-14 15:54:04.000000000 -
> > 0600
> > > +++ b/package/htop/htop.mk      2011-12-20 09:44:06.000000000 -
> > 0600
> > > @@ -11,4 +11,9 @@
> > >  HTOP_AUTORECONF = YES
> > >  HTOP_CONF_OPT += --disable-unicode
> > >
> > > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > > +HTOP_CONF_ENV += LDFLAGS+="--static -lpthread"
> > > +HTOP_CONF_OPT += "'--enable-static' --disable-shared"
> >  Is this needed?  The $(PKG)_CONFIGURE_CMDS of
> > Makefile.autotools.in
> > already includes $(SHARED_STATIC_LIBS_OPTS).
> 
> Okay, I'm cool with that too.  Looking at the various configure scripts,
> I seem to recall an issue with giving a parameter that wasn't available
> in the configure script.  Like it errored out.  I cannot recall, though.
> I did this patch up over a month ago and sent it out before xmas. (I've
> slept since then.)  The bottom line, there appears to be a lack of a
> standard for dealing with the configure options (or at least not all
> packages use the standard).

 GNU autoconf will give a warning about unsupported options.  One of the
global options is actually unsupported for most platforms:
--disable-gtk-doc.

 If some package has a custom configure script that errors out, it
should override $(PKG)_CONFIGURE_CMDS.

[snip]
> > > diff -Naur a/toolchain/uClibc/uclibc.mk
> > b/toolchain/uClibc/uclibc.mk
> > > --- a/toolchain/uClibc/uclibc.mk        2011-12-14
> > 15:54:04.000000000 -0600
> > > +++ b/toolchain/uClibc/uclibc.mk        2011-12-20
> > 09:53:49.000000000 -0600
> > > @@ -480,6 +480,7 @@
> > >                 install_runtime
> > >         touch -c $@
> > >
> > > +ifneq ($(BR2_PREFER_STATIC_LIB),y)
> > >  $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
> > >         $(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
> > >                 CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
> > > @@ -487,7 +488,6 @@
> > >                 PREFIX=$(TARGET_DIR) utils install_utils
> > >         touch -c $@
> > >
> > > -ifneq ($(BR2_PREFER_STATIC_LIB),y)
> > >  UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
> > >  endif
> > 
> >  I'm not sure if I agree with this change.  Prefer static does not
> > mean
> > force static, so the dynamic linker stuff should still be present.
> 
> So, the original design I had done was to add top-level config option
> under PREFER_STATIC as BUILD_ONLY_STATIC.  I guessed that this would not
> be well received by the hive.  Perhaps that would have been a better
> thing to do.  PREFER_STATIC seems to be misleading (based upon my
> expectations) given that if you _PREFER_ to use static libraries, then
> shouldn't the system ONLY USE static libraries and never install the
> shared objects?  I mean, if I ask my contractor to use screws to build
> something, and he uses nails, that isn't what I asked for.  But again,
> perhaps I have the wrong expectations for PREFER_STATIC.

 I guess this is because some packages don't know how to build static
libraries, or how to link with them.  Such packages would have to depend
on !BUILD_ONLY_STATIC.  But I think that it is a lot of work to maintain
that option, with little benefit.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
