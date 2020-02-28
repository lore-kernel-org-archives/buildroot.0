From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 28 Feb 2020 16:23:52 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/qt5/qt5webengine: fix
 ffmpeg/codec/alsa option handling for latest
In-Reply-To: <1582900755-10044-1-git-send-email-nford@westpond.com>
References: <1582900755-10044-1-git-send-email-nford@westpond.com>
Message-ID: <20200228162352.7995d8e1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathan,

thanks for the new patch iteration, only minor nitpicks...

On Fri, 28 Feb 2020 09:39:14 -0500, Nathan Ford <nford@westpond.com> wrote:

> qt5engine also now requires webp mux support or the auto
> detection will fail.
>
> This patch is based on the suggested fix, and fixes, Bug #12416
>
> Signed-off-by: Nathan Ford <nford@westpond.com>
> ---
>  package/qt5/qt5webengine/Config.in       |  1 +
>  package/qt5/qt5webengine/qt5webengine.mk | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 0e776ec..18e4418 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -42,6 +42,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	select BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_WEBP
>  	select BR2_PACKAGE_WEBP_DEMUX
> +	select BR2_PACKAGE_WEBP_MUX
>  	select BR2_PACKAGE_QT5BASE_DBUS
>  	select BR2_PACKAGE_QT5BASE_EGLFS
>  	select BR2_PACKAGE_QT5BASE_FONTCONFIG
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 8987259..3824738 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -30,17 +30,35 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
>  endif
>
> +# As of qt 5.10 these options are handled as arguments to qmake instead of defines
> +# The -- is needed to delineate qmake options from config options

s/delineate/separate/ (but I am not a native speaker)?

> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +'
> +endif

First occurrence of QT5WEBENGINE_QMAKEFLAGS, so 'QT5WEBENGINE_QMAKEFLAGS = --' is
enough...

With this fixed you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> +
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +QT5WEBENGINE_QMAKEFLAGS += -webengine-ffmpeg
> +else
>  QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
> +endif
>
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +QT5WEBENGINE_QMAKEFLAGS += -webengine-proprietary-codecs
> +else
>  QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
>  endif
> +endif
>
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
>  QT5WEBENGINE_DEPENDENCIES += alsa-lib
>  else
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +QT5WEBENGINE_QMAKEFLAGS += -no-webengine-alsa
> +else
>  QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
>  endif
> +endif
>
>  # QtWebengine's build system uses python, but only supports python2. We work
>  # around this by forcing python2 early in the PATH, via a python->python2
