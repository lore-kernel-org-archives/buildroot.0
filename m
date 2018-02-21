From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:58:15 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 5/6] qt5webengine: satisfy new
 requirements for 5.10
In-Reply-To: <20180221142801.28997-6-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-6-gael.portay@savoirfairelinux.com>
Message-ID: <20180221225815.0ee22315@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 09:28:00 -0500, Ga?l PORTAY wrote:
> Since Qt WebEngine 5.10, libnss is a requirement[1] because OpenSSL
> certificate validation[3] and NSS bundle[3] was dropped.
> 
> Also, it compiles host-tools that require libnss and libpng.
> 
> Let satisfy these new requirements by selecting libnss and adding
> host-libnss and host-libpng dependencies.
> 
> [1]: https://github.com/qt/qtwebengine/commit/9b449045fbd5fd3b58bcaff6cf0c5878cd6e64eb
> [2]: https://codereview.chromium.org/2862543003
> [3]: https://codereview.chromium.org/1882433002
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

So if we merge PATCH 4/6, but not this PATCH 5/6, qt5webengine doesn't
build in its 5.10 version ? If that's the case, then you have a
bisectability problem.

I'm fine with having it separate during the review, to make PATCH 4/6
be just a mechanism change of all versions and hashes, and PATCH 5/6 be
a fixup patch that should be squashed into the 5.10 bump once applied.
But if that's the case, it should be noted...

> ---

... here.

>  package/qt5/qt5webengine/Config.in       | 1 +
>  package/qt5/qt5webengine/qt5webengine.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index d0c8d18210..c0d2a54682 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -38,6 +38,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64 # v8/chromium
>  	select BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBNSS if !BR2_PACKAGE_QT5_VERSION_5_6
>  	select BR2_PACKAGE_LIBVPX
>  	select BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_WEBP
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index b9edacec62..47084c1af4 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -22,6 +22,10 @@ QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
>  	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
>  endif
>  
> +ifneq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> +QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
> +endif
> +
>  QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
>  
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
