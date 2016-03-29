From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 00:20:14 +0200
Subject: [Buildroot] [PATCH] qt5webkit: restore package
In-Reply-To: <1459255689-21551-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1459255689-21551-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <56FAFF9E.30401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/16 14:48, Gary Bisson wrote:
> Although this package has been removed from the official release
> packages since Qt5.6.0, it is still available for users to build
> it from source. This is useful for platforms without GPU since its
> successor (QtWebEngine) requires OpenGL support.
>
> The package now matches the community-based meta-qt5 Yocto layer,
> using the exact same revision of the qtwebkit source from github:
> https://github.com/meta-qt5/meta-qt5/commit/e434995a
>
> Here is the project source tree:
> https://github.com/qtproject/qtwebkit
>
> All the patches have been pulled from Yocto as well.
>
> Since we are now using the source from the git repository, we need
> to create an empty .git/ folder to force the headers re-generation.
> https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33
>
> Note that GPLv3 license option has been added with this release.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[snip]
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index f673daa..0c0e971 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -49,4 +49,5 @@ source "package/qt5/qt5x11extras/Config.in"
>   source "package/qt5/qt5xmlpatterns/Config.in"
>   comment "legacy compatibility"
>   source "package/qt5/qt5script/Config.in"
> +source "package/qt5/qt5webkit/Config.in"

  For me it's not needed to add an additional comment. I also don't think it's 
necessary to distinguish between upstream-supported legacy packages and 
not-upstream-supported one in the menu - better do that (more verbosely) in the 
help text.

  Maybe change the comment into "legacy modules", because the webkit thing is 
not for compatibility.

>   endif
> diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> new file mode 100644
> index 0000000..e8b0e43
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> @@ -0,0 +1,30 @@
> +From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
> +From: Trevor Woerner <trevor.woerner@linaro.org>
> +Date: Fri, 7 Feb 2014 04:07:17 +0100
> +Subject: [PATCH 1/3] qtwebkit: fix QA issue (bad RPATH)

  Generate git patches with -N, so there is no [PATH 1/3] header (which in this 
case is alrady incorrect because there are 4 patches, not 3).

> +
> +Building qtwebkit causes a QA issue such that QtWebPluginProcess and
> +QtWebProcess contain bad RPATHs which point into the build location. This fix
> +adds a patch to not include the rpath.prf which causes this problem.
> +
> +Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

  As Julien wrote, you have to add your Sob to indicate that the license is OK.

[snip]
> diff --git a/package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch b/package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
> new file mode 100644
> index 0000000..c5e6ac5
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
> @@ -0,0 +1,33 @@
> +From 5dd4bb67cfce812fd7686e43616e2069f354a7df Mon Sep 17 00:00:00 2001
> +From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
> +Date: Mon, 22 Feb 2016 10:57:32 +0100
> +Subject: [PATCH] Fix linking with libpthread
> +
> +WebKit use libpthread directly but is depending on other qt modules
> +causing it to be linked against, which might break unless -lpthread
> +is last. Instead just add it explicitly after the static libraries.
> +
> +Upstream-Status: Backport from 5.7 branch

  I thought qtwebkit was removed? So how can it be backported from the 5.7 branch?


> +
> +Change-Id: I2b95cff2c96373f8dce6f95052c4fccbe1982b33
> +Reviewed-by: Simon Hausmann <simon.hausmann@theqtcompany.com>
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +---
> + Tools/qmake/mkspecs/features/default_post.prf | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Tools/qmake/mkspecs/features/default_post.prf b/Tools/qmake/mkspecs/features/default_post.prf
> +index 67276b7..39bb3f7 100644
> +--- a/Tools/qmake/mkspecs/features/default_post.prf
> ++++ b/Tools/qmake/mkspecs/features/default_post.prf
> +@@ -201,6 +201,7 @@ needToLink() {
> +         linkAgainstLibrary($$library, $$eval(WEBKIT.$${library_identifier}.root_source_dir))
> +         LIBS += $$eval(WEBKIT.$${library_identifier}.dependent_libs)
> +     }
> ++    posix:!darwin: LIBS += -lpthread
> + }
> +
> + creating_module {
> +--
> +2.7.1
> +
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> new file mode 100644
> index 0000000..fb84b1e
> --- /dev/null
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_QT5WEBKIT
> +	bool "qt5webkit"
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_ICU
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
> +	# This module does not support static linking
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> +	depends on !BR2_BINFMT_FLAT # icu
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt5webkit module.
> +
> +	  This package has been removed from the official release packages
> +	  since Qt5.6.0, but it is still available for users to build it
> +	  from source. This is useful for platforms without GPU since the
> +	  successor (QtWebEngine) requires OpenGL support.

  Yes, that's what I mean!

> +
> +	  http://qt.io
> diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
> new file mode 100644
> index 0000000..d2ac7bb
> --- /dev/null
> +++ b/package/qt5/qt5webkit/qt5webkit.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256 1c79843ef32313312290d4fe0b87256a9129dc44d62b01789a692981edf4d8ab  qt5webkit-d2ff5a085572b1ee24dcb42ae107063f3142d14e.tar.gz
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> new file mode 100644
> index 0000000..7bcad91
> --- /dev/null
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -0,0 +1,58 @@
> +################################################################################
> +#
> +# qt5webkit
> +#
> +################################################################################
> +
> +QT5WEBKIT_VERSION = d2ff5a085572b1ee24dcb42ae107063f3142d14e
> +QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))

  In case anyone asks: the reason to use github is because it supports 
downloading tarballs from random commits, while cgit doesn't. But I'd like to 
see a comment to explain this.

> +QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-flex
> +QT5WEBKIT_INSTALL_STAGING = YES
> +
> +QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), LGPLv2.1 with exception or LGPLv3 or GPLv2 or GPLv3
> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2 LICENSE.GPLv3
> +else
> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), Commercial license
> +QT5WEBKIT_REDISTRIBUTE = NO
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> +QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> +QT5WEBKIT_DEPENDENCIES += qt5declarative
> +endif
> +
> +define QT5WEBKIT_CONFIGURE_CMDS
> +	mkdir -p $(@D)/.git || true

  That this is needed is really really suspicious... A quick grep through the 
source doesn't show anything relevant.


  Regards,
  Arnout

> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> +endef
> +
> +define QT5WEBKIT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5WEBKIT_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> +	$(QT5_LA_PRL_FILES_FIXUP)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
> +define QT5WEBKIT_INSTALL_TARGET_QMLS
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
> +endef
> +endif
> +
> +define QT5WEBKIT_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
> +	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
