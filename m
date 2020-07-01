From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jul 2020 23:54:42 +0200
Subject: [Buildroot] [PATCH v6 20/28] qt5: Fix pkgconfig search path for
 per-package infrastructure
In-Reply-To: <20200701211513.GX20645@scaer>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-21-anaumann@ultratronik.de>
 <a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org>
 <20200701211513.GX20645@scaer>
Message-ID: <20200701215442.GY20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis-Paul, Andeas, All,

On 2020-07-01 23:15 +0200, Yann E. MORIN spake thusly:
> On 2020-06-19 12:22 +0200, Louis-Paul CORDIER spake thusly:
> > On 2/17/20 10:23 PM, Andreas Naumann wrote:
> > >Per default qmake uses the pkg-config binary and search path detected by qt5base
> > >and set in mkspecs/qconfig.pri. For per-package infra, this leads to packages
> > >not contained in qt5base not being detected.
> > >To overcome this, set the correct pathes in the global QMAKE variable.
> > >
> > >Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> > >---
> > >  package/qt5/qt5.mk | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> > >index eb2a749678..c3b9f69c3f 100644
> > >--- a/package/qt5/qt5.mk
> > >+++ b/package/qt5/qt5.mk
> > >@@ -33,4 +33,6 @@ endef
> > >  endif
> > >  # Variable for other Qt applications to use
> > >-QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> > >+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
> > >+	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
> > >+	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig
> > >
> > I attached 2 additional patches, that fix compile issue on x86 platform (see
> > http://lists.busybox.net/pipermail/buildroot/2020-June/285123.html). I based
> > my work on top of 2020.05 tag [...]
> [--SNIP--]
> > 1. The first one is fixing the absolute path added in .pri and .pc files
> > when building qt5base. When using sysroot, thos abolute path are breaking
> > the compilation because they are pointing to directories outside the
> > sysroot.
> 
> As I read that description, I can see that some keywords are matching
> with the original commit mesage.
> 
> Most notabley, the originalcommit states "mkspecs/qconfig.pri" while
> your are talking about "absolute path added in .pri [..] files".
> 
> So, am I allowed to take the following shortcut :
> 
>     the patch from Louis-Paul supersedes the one from Andreas, as it
>     fixes the issue at the root, rther than work around it
> ?

So, patch 19 in the series is in master now, but patch 20 (this one)
not yet. So, on master, I did a build with PPD, and right after qt5base,
was built, I applied Louis-Paul's tweaks [0], marked the qt5base PPD
directory read-only, and built qt5declarative. It worked. :-)

    $ make qt5base-depends
    $ sed magic from L-P's patch
    $ chmod -R a-w per-package/qt5base/
    $ make qt5dceclarative

Woot! :-)

So, yeath it looks like this patch 20 is not needed if the .pri and .pc
(and .cmake) are properly fixed.

Still, I'll let you guys validate that point, and maybe repost the
agregated series.

Thanks again! :-)

[0] I did not apply the patch from Louis-Paul, because I wanted to
observe the build step by step, and see how the files were before/after
the fixes.

Regards,
Yann E. MORIN.

> As for the .pc files, I think the fix should be generalised out of the
> Qt world, maybe... Fopr example, we already fix the /la files in
> package/pkg-generic at 324
> 
> So, as far as I can see (which can be quite short, in some cases), we
> should introduce a similar generic .pc fixup.
> 
> Also, please see a little comment below...
> 
> > 2. The second one is fixing .cmake files that also contains absolute paths
> > after qt5base installation
> 
> Ditto, maybe all .cmake files should be fixed, not just the ones by
> Qt5, no?
> 
> > I'm now able to use full parallel build with per-package with Qt5.
> 
> This is really sounding good! :-)
> 
> Andreas, Louis-Paul, I know I may be asking a lot, but I'd love to see
> an updated and consolidated series reposted to the list, that aggregates
> both your developments.
> 
> Would you be willing to do that, please?
> 
> Regards,
> Yann E. MORIN.
> 
> > 
> > Thank you for your hard work Andreas,
> > 
> > BR,
> > Louis-Paul CORDIER
> 
> > From bc08430ebb5d76bdd0b45b8339761c85c7a48800 Mon Sep 17 00:00:00 2001
> > From: Louis-Paul Cordier <lpdev@cordier.org>
> > Date: Fri, 19 Jun 2020 11:01:21 +0200
> > Subject: [PATCH 1/2] core/pkg-infra: Fix pkg-config and .pri absolute path
> > 
> > Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> > ---
> >  package/pkg-qmake.mk | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
> > index 27727119d7..49fe185d4a 100644
> > --- a/package/pkg-qmake.mk
> > +++ b/package/pkg-qmake.mk
> > @@ -20,6 +20,22 @@
> >  #
> >  ################################################################################
> >  
> > +# When per-package is enabled, and qmake project is configured to generate 
> > +# pkg-config compatible package, absolute path are generated for "prefix" field 
> > +# of .pc files. In order to keep per-package isolation with sysroot'in, it is 
> > +# needed to remove those absolute path. Same apply for mkspecs files.
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define PKG_QMAKE_FIXUP_ABSOLUTE_PATH
> > +	$(Q)find $(STAGING_DIR)/ -name "*.pc" \
> > +	| xargs --no-run-if-empty \
> > +	$(SED) "s:$(STAGING_DIR)::g"
> > +
> > +	$(Q)find $(HOST_DIR)/ -name "*.pri" \
> > +		| xargs --no-run-if-empty \
> > +		$(SED) "s:$(STAGING_DIR):\$$\$$\[QT_SYSROOT\]:g"
> > +endef
> > +endif
> > +
> >  ################################################################################
> >  # inner-qmake-package -- defines how the configuration, compilation and
> >  # installation of a qmake package should be done, implements a few hooks
> > @@ -66,6 +82,7 @@ define $(2)_BUILD_CMDS
> >  endef
> >  endif
> >  
> > +
> 
> Spurious empty line.
> 
> >  #
> >  # Staging installation step. Only define it if not already defined by
> >  # the package .mk file.
> > @@ -76,6 +93,8 @@ define $(2)_INSTALL_STAGING_CMDS
> >  endef
> >  endif
> >  
> > +$(2)_POST_INSTALL_STAGING_HOOKS += PKG_QMAKE_FIXUP_ABSOLUTE_PATH
> > +
> >  #
> >  # Target installation step. Only define it if not already defined by
> >  # the package .mk file.
> > -- 
> > 2.26.2
> > 
> 
> > From 517307628cd76079952e606061990c2fd8df0d84 Mon Sep 17 00:00:00 2001
> > From: Louis-Paul Cordier <lpdev@cordier.org>
> > Date: Fri, 19 Jun 2020 12:05:19 +0200
> > Subject: [PATCH 2/2] package/qt5base: fix absolute path generated in .cmake
> >  config files
> > 
> > Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> > ---
> >  package/qt5/qt5base/qt5base.mk | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index ec56287ed0..3d30c41d0e 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -310,4 +310,17 @@ endef
> >  
> >  QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
> >  
> > +
> > +# CMake config files generated by Qt5 might break per-package isolation because
> > +# of absolute path generated.
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define QT5BASE_CMAKECONFIG_FIXUP
> > +	$(Q)find $(STAGING_DIR)/ -name "*.cmake" \
> > +		| xargs --no-run-if-empty \
> > +		$(SED) "s:$(STAGING_DIR)::g"
> > +endef
> > +endif
> > +
> > +QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_CMAKECONFIG_FIXUP
> > +
> >  $(eval $(qmake-package))
> > -- 
> > 2.26.2
> > 
> 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
