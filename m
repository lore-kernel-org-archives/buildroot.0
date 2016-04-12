From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 00:24:54 +0200
Subject: [Buildroot] [PATCH v3] qt5webkit: restore package
In-Reply-To: <1460449482-26524-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1460449482-26524-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <570D75B6.1060709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Still two small issues...

On 04/12/16 10:24, Gary Bisson wrote:
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
> Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>
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
> Changelog v2->v3:
> - Update licenses to match source code headers, suggested by Arnout.
> - Add Arnout comment explaining the .git folder creation.
> - Add Julien Reviewed-by.
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
>   package/qt5/qt5webkit/qt5webkit.mk                 | 66 ++++++++++++++++++
>   9 files changed, 277 insertions(+), 7 deletions(-)
>   create mode 100644 package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
>   create mode 100644 package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
>   create mode 100644 package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
>   create mode 100644 package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
>   create mode 100644 package/qt5/qt5webkit/Config.in
>   create mode 100644 package/qt5/qt5webkit/qt5webkit.hash
>   create mode 100644 package/qt5/qt5webkit/qt5webkit.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 60702ce..6691c50 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -152,13 +152,6 @@ config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
>   	  The qt5webkit-examples package has been removed, since it
>   	  was removed from upstream starting from Qt 5.6.
>
> -config BR2_PACKAGE_QT5WEBKIT
> -	bool "qt5webkit package removed"
> -	select BR2_LEGACY
> -	help
> -	  The qt5webkit package has been removed, since it was removed
> -	  from upstream starting from Qt 5.6.
> -
>   config BR2_PACKAGE_QT5QUICK1
>   	bool "qt5quick1 package removed"
>   	select BR2_LEGACY
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index f673daa..0c0e971 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -49,4 +49,5 @@ source "package/qt5/qt5x11extras/Config.in"
>   source "package/qt5/qt5xmlpatterns/Config.in"
>   comment "legacy compatibility"
>   source "package/qt5/qt5script/Config.in"
> +source "package/qt5/qt5webkit/Config.in"
>   endif
> diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> new file mode 100644
> index 0000000..ada98a2
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> @@ -0,0 +1,31 @@
> +From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
> +From: Trevor Woerner <trevor.woerner@linaro.org>
> +Date: Fri, 7 Feb 2014 04:07:17 +0100
> +Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
> +
> +Building qtwebkit causes a QA issue such that QtWebPluginProcess and
> +QtWebProcess contain bad RPATHs which point into the build location. This fix
> +adds a patch to not include the rpath.prf which causes this problem.
> +
> +Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

  I thought that these commits were coming from qt-project.org, but actually 
they come from yocto I guess. In this case, the commit ID isn't enough, you 
really have to refer to the yocto URL. Something like

sob: Trevor
sob: Martin

Downloaded from:
<url from yocto>

sob: Gary

  Same for patches 2 and 3.

  Patch 4 does come from upstream so you can use it as is.


[snip]
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

  This is actually redundant.

> +	depends on !BR2_STATIC_LIBS

  There should probably be a comment as well:

comment "qt5webkit needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS
	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
	depends on !BR2_BINFMT_FLAT


  Regards,
  Arnout

> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> +	 # icu
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
> +
> +	  http://qt.io
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
