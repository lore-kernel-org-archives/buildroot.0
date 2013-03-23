From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Mar 2013 16:29:31 +0100
Subject: [Buildroot] [PATCH v2] Enable ccache for cmake packages
In-Reply-To: <CAHXCMMKF9BPbNG38LtDMuFD47uBUKYGbQzFNjVmsyR9BCqP4=Q@mail.gmail.com>
References: <514CDE1E.8040107@lucaceresoli.net>
 <1363992947-21417-1-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKF9BPbNG38LtDMuFD47uBUKYGbQzFNjVmsyR9BCqP4=Q@mail.gmail.com>
Message-ID: <20130323162931.31f5b59c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat, 23 Mar 2013 01:03:09 +0100, Samuel Martin wrote:
> >  ################################################################################
> >  # inner-cmake-package -- defines how the configuration, compilation and
> >  # installation of a CMake package should be done, implements a few hooks to
> > @@ -65,6 +72,7 @@ define $(2)_CONFIGURE_CMDS
> >         $$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> >                 -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> >                 -DCMAKE_INSTALL_PREFIX="/usr" \
> > +               $(CMAKE_EXTRA_OPT) \
> Or the inlined if works as well ;)
> 
> >                 -DCMAKE_VERBOSE_MAKEFILE=ON \
> Ahem... I think this belongs to some debug remains ;)

But it hasn't been added by this patch from Luca.


> > +ifeq ($(BR2_CCACHE),y)
> > +$(2)_DEPENDENCIES += host-ccache
> > +endif
> I don't think this is need since host-ccache is one of the first
> target add to the list in the topdir Makefile.

Correct. 

> > +               set(CMAKE_C_COMPILER $(CCACHE))\n\
> > +               set(CMAKE_CXX_COMPILER $(CCACHE))\n\
> > +               set(CMAKE_C_COMPILER_ARG1 $(TARGET_CC_NOCCACHE) CACHE STRING \"\" FORCE)\n\
> > +               set(CMAKE_CXX_COMPILER_ARG1 $(TARGET_CXX_NOCCACHE) CACHE STRING \"\" FORCE)\n\
> > +       endif(DEFINED USE_CCACHE AND USE_CCACHE)\n\
> > +       if(DEFINED USE_CCACHE AND NOT USE_CCACHE)\n\
> You can replace the 2 above lines by:
> else ()

I don't think so. See the explanation in Luca's commit log. He needs to
differentiate three cases:

 * USE_CCACHE is defined and set to ON
 * USE_CCACHE is defined and set to OFF
 * USE_CCACHE is not defined

Luca, I think a portion of the message you've added below the '---'
should be added either in the commit log, or maybe as a comment in
pkg-cmake.mk.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
