From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 28 Feb 2020 16:56:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/qt5/qt5webengine: fix build
 dependencies for autodetected packages
In-Reply-To: <1582900755-10044-2-git-send-email-nford@westpond.com>
References: <1582900755-10044-1-git-send-email-nford@westpond.com>
 <1582900755-10044-2-git-send-email-nford@westpond.com>
Message-ID: <20200228165645.734b6390@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathan,

On Fri, 28 Feb 2020 09:39:15 -0500, Nathan Ford <nford@westpond.com> wrote:

> Signed-off-by: Nathan Ford <nford@westpond.com>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 3824738..e5f8421 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -60,6 +60,34 @@ QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
>  endif
>  endif
>
> +ifeq ($(BR2_PACKAGE_JSONCPP),y)
> +QT5WEBENGINE_DEPENDENCIES += jsoncpp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LCMS2),y)
> +QT5WEBENGINE_DEPENDENCIES += lcms2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> +QT5WEBENGINE_DEPENDENCIES += libevent
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +QT5WEBENGINE_DEPENDENCIES += libxml2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXSLT),y)
> +QT5WEBENGINE_DEPENDENCIES += libxslt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PROTOBUF),y)
> +QT5WEBENGINE_DEPENDENCIES += protobuf
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SNAPPY),y)
> +QT5WEBENGINE_DEPENDENCIES += snappy
> +endif
> +

According to build/qt5webengine-5.12.7/config.summary:

  Optional system libraries used:
    re2 .................................. no   ---> not in buildroot
    icu .................................. no   ---> handled by select BR2_PACKAGE_QT5BASE_ICU but not found (version mismatch)?
    libwebp, libwebpmux and libwebpdemux . yes  ---> already handled and fixed by your previous patch
    opus ................................. yes  ---> already handled
    ffmpeg ............................... yes  ---> already handled
    libvpx ............................... yes  ---> already handled
    snappy ............................... yes  ---> handled by our patch
    glib ................................. yes  ---> already handled
    zlib ................................. yes  ---> handled by qt5base
    minizip .............................. no
    libevent ............................. no   ---> handled by our patch
    jsoncpp .............................. no   ---> handled by our patch
    protobuf ............................. no   ---> handled by our patch
    libxml2 and libxslt .................. no   ---> handled by our patch
    lcms2 ................................ no   ---> handled by our patch
    png .................................. yes  ---> handled by qt5base (only in case BR2_PACKAGE_QT5BASE_PNG is set)?
    JPEG ................................. no   ---> handled by qt5base (only in case BR2_PACKAGE_QT5BASE_JPEG is set)? In my config
                                                     BR2_PACKAGE_QT5BASE_JPEG is set but not found?
    harfbuzz ............................. yes  ---> handled by qt5base (only in case BR2_PACKAGE_QT5BASE_HARFBUZZ and BR2_TOOLCHAIN_HAS_SYNC_4 is set)?
    freetype ............................. yes  ---> handled by qt5base

So your patch is definitely an improvement and you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Care to take a look if the buildroot package minizip is sufficient for qt5webengine?

Leaving icu, png, jpeg and harfbuzz for more research....

Regards,
Peter

>  # QtWebengine's build system uses python, but only supports python2. We work
>  # around this by forcing python2 early in the PATH, via a python->python2
>  # symlink.
