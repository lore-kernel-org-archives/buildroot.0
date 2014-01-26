From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2014 23:08:41 +0100
Subject: [Buildroot] [PATCH] Rename TAR_OPTIONS to BUILDROOT_TAR_OPTIONS
	to avoid conflict with GNU tar.
In-Reply-To: <878uu3pw4z.fsf@spindle.srvr.nix> (nix@esperi.org.uk's message of
 "Sat, 25 Jan 2014 21:52:12 +0000")
References: <878uu3pw4z.fsf@spindle.srvr.nix>
Message-ID: <8738ka1jme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nix" == Nix  <nix@esperi.org.uk> writes:

Hi,

 > GNU tar > 1.13.17 interprets TAR_OPTIONS as an environment variable
 > containing options to be prepended to the set on the command line.

 > This causes considerable trouble here, where it is set to -xf by default,
 > since -xf causes whatever argument follows to be interpreted as a filename,
 > even if it is e.g. --strip-components=1.  This tends to cause spurious
 > "Multiple archive files require '-M' option" errors which are very hard
 > to track down, since nothing is visibly wrong with the command, and
 > repeating it outside of make works perfectly well.

 > Fix by avoiding this risky variable name.

 > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
 > ---
 >  Makefile                                           | 2 +-
 >  package/cvs/cvs.mk                                 | 2 +-
 >  package/gcc/gcc.mk                                 | 2 +-
 >  package/lsof/lsof.mk                               | 4 ++--
 >  package/perl/perl.mk                               | 2 +-
 >  package/pkg-generic.mk                             | 2 +-
 >  toolchain/toolchain-external/toolchain-external.mk | 6 +++---
 >  7 files changed, 10 insertions(+), 10 deletions(-)

 > (Sent directly to the listed maintainer: I'm not subscribed to the
 > buildroot list yet and it's awfully high volume...)

 > I can't really understand how buildroot works for anyone, given this bug.
 > I'm sure it must, but, how? Is everyone using a tar <=1.13? Surely not,
 > it's fourteen years old...

Hmm, I'm certainly not:

tar --version
tar (GNU tar) 1.26
Copyright (C) 2011 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by John Gilmore and Jay Fenlason.


But this should only be an issue if TAR_OPTIONS are exported to the
environment, which it isn't:

git grep export | grep -c TAR_OPTIONS
0

Do you perhaps have a local patch which exports it?



 > diff --git a/Makefile b/Makefile
 > index 9dfb1e0..c66a471 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -299,7 +299,7 @@ KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 >  ZCAT:=$(call qstrip,$(BR2_ZCAT))
 >  BZCAT:=$(call qstrip,$(BR2_BZCAT))
 >  XZCAT:=$(call qstrip,$(BR2_XZCAT))
 > -TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 > +BUILDROOT_TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 >  # packages compiled for the host go here
 >  HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 > diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
 > index d2a1033..92d44b9 100644
 > --- a/package/cvs/cvs.mk
 > +++ b/package/cvs/cvs.mk
 > @@ -25,7 +25,7 @@ endif
 >  CVS_CONF_OPT = $(CVS_CONFIGURE_ARGS)
 
 >  define CVS_BZIP_UNPACK
 > -	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 > +	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(BUILDROOT_TAR_OPTIONS) -
 >  	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
 >  endef
 
 > diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
 > index 236297d..0a8679b 100644
 > --- a/package/gcc/gcc.mk
 > +++ b/package/gcc/gcc.mk
 > @@ -70,7 +70,7 @@ define HOST_GCC_EXTRACT_CMDS
 >  		--exclude='libgo/*' \
 >  		--exclude='gcc/testsuite/*' \
 >  		--exclude='libstdc++-v3/testsuite/*' \
 > -		$(TAR_OPTIONS) -
 > +		$(BUILDROOT_TAR_OPTIONS) -
 >  	mkdir -p $(@D)/libstdc++-v3/testsuite/
 >  	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
 >  	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
 > diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
 > index f4b1b4c..d6c0ec2 100644
 > --- a/package/lsof/lsof.mk
 > +++ b/package/lsof/lsof.mk
 > @@ -42,8 +42,8 @@ endif
 >  # The .tar.bz2 contains another .tar, which contains the source code.
 >  define LSOF_EXTRACT_CMDS
 >          $(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
 > -                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
 > -        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 > +                $(TAR) -O $(BUILDROOT_TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
 > +        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(BUILDROOT_TAR_OPTIONS) -
 >  endef
 
 >  define LSOF_CONFIGURE_CMDS
 > diff --git a/package/perl/perl.mk b/package/perl/perl.mk
 > index ec94e4f..a6770f2 100644
 > --- a/package/perl/perl.mk
 > +++ b/package/perl/perl.mk
 > @@ -31,7 +31,7 @@ PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
 
 >  define PERL_CROSS_EXTRACT
 >  	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
 > -	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 > +	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(BUILDROOT_TAR_OPTIONS) -
 >  endef
 >  PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 > index 1b99c2a..794b2e2 100644
 > --- a/package/pkg-generic.mk
 > +++ b/package/pkg-generic.mk
 > @@ -377,7 +377,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 >  # default extract command
 >  $(2)_EXTRACT_CMDS ?= \
 >  	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
 > -	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
 > +	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(BUILDROOT_TAR_OPTIONS) -)
 
 >  # post-steps hooks
 >  $(2)_POST_DOWNLOAD_HOOKS        ?=
 > diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
 > index a7bfafc..616bec5 100644
 > --- a/toolchain/toolchain-external/toolchain-external.mk
 > +++ b/toolchain/toolchain-external/toolchain-external.mk
 > @@ -377,16 +377,16 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_
 >  define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 >  	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 >  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
 > -		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 > +		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(BUILDROOT_TAR_OPTIONS) -
 >  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
 > -		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 > +		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(BUILDROOT_TAR_OPTIONS) -
 >  endef
 >  else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 >  # Normal handling of toolchain tarball extraction.
 >  define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 >  	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 >  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
 > -		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 > +		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(BUILDROOT_TAR_OPTIONS) -
 >  	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
 >  endef
 >  endif
 > -- 
 > 1.8.5.2.169.ge058798


-- 
Bye, Peter Korsgaard
