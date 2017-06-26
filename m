From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 26 Jun 2017 23:53:21 +0200
Subject: [Buildroot] [PATCH] qt5multimedia: conditionally add pulseaudio
 to dependencies
In-Reply-To: <1498486306-29649-1-git-send-email-brgl@bgdev.pl>
References: <1498486306-29649-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170626235321.7a3521fb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Mon, 26 Jun 2017 16:11:46 +0200, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Qt5Multimedia includes support for pulseaudio if it detects libpulse
> and libpulse-mainloop-glib in the system at build-time. We need to
> depend on pulseaudio if it is selected.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 133536e..8ebddeb 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
>  QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +QT5MULTIMEDIA_DEPENDENCIES += pulseaudio
> +endif
> +

Thanks for catching this one.

Ony one nit: the test qtmultimedia-opensource-src-5.8.0/config.tests/pulseaudio/pulseaudio.cpp
checks for:

  #include <pulse/pulseaudio.h>
  #include <pulse/glib-mainloop.h>

and pulse/glib-mainloop.h is only installed by the pulseaudio package in case
BR2_PACKAGE_LIBGLIB2 is selected. The Dependency should therefore be (not sure
about the libglib2 one):

 +ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
 +QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
 +endif

By the way, the dependency on alsa is missing too...

Regards,
Peter

>  define QT5MULTIMEDIA_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
>  endef
