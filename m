From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:08:20 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5location: needs
 qt5declarative quick package
In-Reply-To: <20200919194857.491282-1-b.bilas@grinn-global.com>
References: <20200919194857.491282-1-b.bilas@grinn-global.com>
Message-ID: <20200919220820.2d5d47ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Sep 2020 21:48:57 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Simply add the dependency of qt5declarative quick module that
> forces Qt OpenGL support which is needed for qt5location component [1].
> 
> Fixes:
>  http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
>  http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/
> 
> and many many more...
> 
> [1] https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/qt5/qt5location/Config.in      | 4 ++++
>  package/qt5/qt5location/qt5location.mk | 5 +----
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
> index c68deb1006..207ad5a37a 100644
> --- a/package/qt5/qt5location/Config.in
> +++ b/package/qt5/qt5location/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_QT5LOCATION
>  	bool "qt5location"
> +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK

This looks a bit weird, because src/src.pro looks like this:

SUBDIRS += positioning
positioning.depends = clip2tri

qtHaveModule(quick) {
    SUBDIRS += positioningquick location
    positioningquick.depends += positioning
    location.depends += positioningquick clip2tri

    plugins.depends += location

    SUBDIRS += imports
    imports.depends += positioningquick positioning location
}

So, the "location" subdirectory should not be built of the quick module
is not there.

Could you try to see what's going on ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
