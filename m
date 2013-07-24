From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 09:05:05 +0200
Subject: [Buildroot] custom extraction and libs11n
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F451B3DA8@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451B3DA8@G4W3291.americas.hpqcorp.net>
Message-ID: <CAAXf6LVVEdBfiKgqJtP+3XPYGz3U9aOiyQXiGtiKkZv0XhQj3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lee Jenkins,

On Thu, Jul 18, 2013 at 6:19 PM, Jenkins, Lee (ISS Houston)
<Lee.Jenkins@hp.com> wrote:
> I have added the package libs11n to buildroot. I?ve tested the patch and
> makefile on my system and it appears to be working correctly.

Thanks for your efforts in contributing to buildroot, it is much appreciated.
However, there are some changes necessary before this patch can be
considered for inclusion in the buildroot tree.

First of all, patches should be sent in plain text (not HTML mail), in
the actual patch format.
It is most convenient if you start using a version control system like
git (or alternatively: mercurial). The manual explains this, start for
example in this section:
http://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot

Your patch should contain a Signed-off-by line, which is automatically
added if you use git (if not you'll have to add it manually). I
suggest you have a look at some of the other patches on the mailing
list to get an idea about the right format.

Changes should be made on top of the latest buildroot development
version (coming from git, or a snapshot). From your patch below, I
have the impression, I conclude that your changes are made in an older
release. There have been several changes to the package infrastructure
since then.

Some specific comments below:

> --- buildroot/package/Makefile.package.in 2013-07-18 09:42:31.458605792
> -0500
>
> +++ buildroot-mods/package/Makefile.package.in       2013-07-18
> 09:41:40.614605176 -0500
>
> @@ -244,8 +245,10 @@
>
> $(BUILD_DIR)/%/.stamp_extracted:
>
>         @$(call MESSAGE,"Extracting")
>
>         $(Q)mkdir -p $(@D)
>
> -       $(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE)))
> $(DL_DIR)/$($(PKG)_SOURCE) | \
>
> -       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
>
> +       $(if $($(PKG)_EXTRACT_CMDS), @echo $(PKG)_EXTRACT_CMDS IS DEFINED )
>
> +       $(if $($(PKG)_EXTRACT_CMDS), $($(PKG)_EXTRACT_CMDS), \
>
> +       $(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE)))
> $(DL_DIR)/$($(PKG)_SOURCE) | \
>
> +       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -) )

The <PKG>_EXTRACT_CMDS are automatically executed (at least in recent
buildroot versions). I don't think you need these changes here.
Moreover, the Makefile.package.in has been split up in different files
in package/pkg-xxxx.

>
> # some packages have messed up permissions inside
>
>         $(Q)chmod -R ug+rw $(@D)
>
>         $(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
>
>
>
>
>
>
>
> #############################################################
>
> #
>
> # libs11n
>
> #
>
> #############################################################
>
>
>
> LIBS11N_VERSION          = 1.2.10
>
> LIBS11N_SOURCE_BASENAME  = libs11n-$(LIBS11N_VERSION)-nobuildfiles
>
> LIBS11N_SOURCE           = $(LIBS11N_SOURCE_BASENAME).zip

Why are you using the 'nobuildfiles' version?
The download page has a standard .tar.bz2 for 'GNU platforms', while
the 'nobuildfiles' file is mentioned as 'for non-GNU platforms'.
I suggest you just use the libs11n-1.2.10.tar.bz2 file. Not only do
you no longer need unzip for this, the rest of the .mk file will
probably also be more standard.

>
> LIBS11N_MAKE_DIR         = $(@D)/src
>
> LIBS11N_SITE             = http://s11n.net/download
>
> LIBS11N_LICENSE          = Public Domain

There should also be a
LIBS11N_LICENSE_FILES = LICENSE.libs11n
line that refers to the file describing the license.

*Luca*: different files in this package fall under different licenses.
What is the best way to handle this?
From the LICENSE.libs11n file:

---------
All build-related files are Public Domain.

Some source code falls under other licenses such as LGPL or BSD, as
described in their source files. To the best of my understanding, s11n
falls under Section 5 of the LGPL, and need not be released under that
license. (More specifically, it contains no LGPL code, but uses features
provided by a couple of LGPL'd classes.)

The list of files which are known to be exceptions to the Public
Domain license:

LGPL:
        lib/toolbox/bzstream.{h,cpp}
        lib/toolbox/gzstream.{h,cpp}

BSD:
        include/FlexLexer.h

MIT:
        lib/expat (may or may not be in your s11n distribution)

Unspecified:
        toc/bin/mkdeps.c

These are all released under fairly non-restritive licenses.

There *may* be other such files: please see the individual source
files if in doubt.
-------------------


>
> LIBS11N_INSTALL_STAGING  = YES
>
> LIBS11N_DEPENDENCIES     = expat
>
>
>
> # use a custom extract because standard buildroot does not support .zip
> files
>
> # also, the files are extracted into a directory named
> libs11n-$(LIBS11N_VERSION)-nobuildfiles -- but
>
> # buildroot requires them to be put in libs11n-$(LIBS11N_VERSION) -- which
> buildroot creates
>
> define LIBS11N_EXTRACT_CMDS
>
>     unzip $(DL_DIR)/$(LIBS11N_SOURCE) -d $(@D)
>
>     mv $(@D)/$(LIBS11N_SOURCE_BASENAME)/* $(@D)
>
>     rmdir $(@D)/$(LIBS11N_SOURCE_BASENAME)
>
> endef
>

As said above, if you use the standard .tar.bz2 I don't think you need this.

>
>
> define LIBS11N_CONFIGURE_CMDS
>
>     # use the configure command to modify the stock Makefile because
>
>     # it tries and fails to build an unneeded binary
>
>     cd $(LIBS11N_MAKE_DIR) ; sed -i 's/install: bins libs/install: libs/'
> Makefile ; sed -i '/cp ..S11NCONVERT_BIN/d' Makefile
>
> endef

It will be more readable if you put the different commands on separate lines.

>
>
>
> define LIBS11N_BUILD_CMDS
>
>     $(MAKE) CXX="$(TARGET_CC)" -C $(LIBS11N_MAKE_DIR) all:
>
> endef
>
>
>
> define LIBS11N_INSTALL_STAGING_CMDS
>
>     $(MAKE) CXX="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) -C $(LIBS11N_MAKE_DIR)
> install
>
> endef
>
>
>
> define LIBS11N_INSTALL_TARGET_CMDS
>
>     $(MAKE) CXX="$(TARGET_CC)" DESTDIR=$(TARGET_DIR) -C $(LIBS11N_MAKE_DIR)
> install
>
> endef
>
>
>
> define LIBS11N_CLEAN_CMDS
>
>     $(MAKE) -C $(LIBS11N_MAKE_DIR) clean
>
> endef
>
>
>
> $(eval $(call AUTOTARGETS,package,libs11n))

In the current buildroot version, this is now simply:
$(eval $(autotools-package))

but this package isn't really autotools. It simply has a 'configure'
script but that's about all.
I think it makes more sense to make this a generic package, since
you're overwriting all of the commands anyway.


In addition to the Config.in file which you sent in your second mail,
you'll also need a change in package/Config.in to include the libs11n
Config.in file.

Best regards,
Thomas
