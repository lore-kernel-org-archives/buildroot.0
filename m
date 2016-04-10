From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Apr 2016 23:55:26 +0200
Subject: [Buildroot] [PATCH v2] qt5webkit: restore package
In-Reply-To: <1459525200-12624-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1459525200-12624-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <570ACBCE.3090506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/01/16 17:40, Gary Bisson wrote:
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
> ---
> Hi all,
>
> Changelog v1->v2:
> - Add comment to explain GitHub choice, suggested by Arnout.
> - Add comment to explain .git folder creation, suggested by Julien.
> - Remove || true for .git folder creation, suggested by Julien.
> - Add SOB to patches, suggested by Julien and Arnout.
> - Remove x/y number in patches titles, suggested by Arnout.
>
> I know the .git folder will still make people wonder, I unfortunately haven't
> found the exact Makefile where this folder makes a difference. My comment
> points to the meta-qt5 inc file which does it with the following explanation:
> # Regenerate header files when they are included in source tarball
> # Otherwise cmake files don't set PRIVATE_HEADERS correctly
> do_configure_prepend() {
>      rm -rf ${S}/include
>      mkdir -p ${S}/.git || true
> }

  I've found out, I'll comment on it below.

>
> Tested on i.MX6Q Nitrogen6x platform.
>
> Regards,
> Gary
> ---
>   Config.in.legacy                                   |  7 --
>   package/qt5/Config.in                              |  1 +
>   .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 31 +++++++++
>   .../qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch | 80 ++++++++++++++++++++++
>   ...ude-backtrace-API-for-non-glibc-libraries.patch | 39 +++++++++++
>   .../0004-Fix-linking-with-libpthread.patch         | 34 +++++++++
>   package/qt5/qt5webkit/Config.in                    | 24 +++++++
>   package/qt5/qt5webkit/qt5webkit.hash               |  2 +
>   package/qt5/qt5webkit/qt5webkit.mk                 | 62 +++++++++++++++++
>   9 files changed, 273 insertions(+), 7 deletions(-)
>   create mode 100644 package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
>   create mode 100644 package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
>   create mode 100644 package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
>   create mode 100644 package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
>   create mode 100644 package/qt5/qt5webkit/Config.in
>   create mode 100644 package/qt5/qt5webkit/qt5webkit.hash
>   create mode 100644 package/qt5/qt5webkit/qt5webkit.mk
[snip]
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> new file mode 100644
> index 0000000..1ac4c25
> --- /dev/null
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -0,0 +1,62 @@
> +################################################################################
> +#
> +# qt5webkit
> +#
> +################################################################################
> +
> +QT5WEBKIT_VERSION = d2ff5a085572b1ee24dcb42ae107063f3142d14e
> +# Using GitHub since it supports downloading tarballs from random commits.
> +# The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
> +QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
> +QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-flex
> +QT5WEBKIT_INSTALL_STAGING = YES
> +
> +QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), LGPLv2.1 with exception or LGPLv3 or GPLv2 or GPLv3

  Actually, as far as I can see with the help of fossology, it's all LGPLv2+ 
except a few files which specify additional possibilities. So I'd say that it's 
LGPLv2+.

  There is also quite a lot of BSD-2c and BSD-3c, so I'd add those, even if 
there's no corresponding license file.

  There are also a few build tools that are GPLv2+ but we don't consider those.

> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2 LICENSE.GPLv3

  This is a funny situation... Four license files are provided, but none of them 
actually corresponds to the license of the code... Anyway, I'd keep just the 
LGPLv21 file.

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
> +# Create an empty .git/ folder to force headers re-generation.
> +# See http://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qt5.inc

  Here's my analysis of the situation; I'll write it as comments directly for 
easy cut and paste.

# Since we get the source from git, generated header files are not included.
# qmake detects that header file generation (using the syncqt tool) must be
# done based on the existence of a .git directory (cfr. the git_build config
# option which is set in qt_build_paths.prf).
# So, to make sure that qmake detects that header files must be generated,
# create an empty .git directory.


  Regards,
  Arnout

> +define QT5WEBKIT_CONFIGURE_CMDS
> +	mkdir -p $(@D)/.git
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
