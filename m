From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 21:28:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5wayland: install compositor
 QML files
In-Reply-To: <20190511150750.5985-1-nowrep@gmail.com>
References: <20190511150750.5985-1-nowrep@gmail.com>
Message-ID: <20190513212833.63cd7c1a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Sat, 11 May 2019 17:07:49 +0200
nowrep at gmail.com wrote:

> From: David Rosca <nowrep@gmail.com>
> 
> Fixes using QtWayland.Compositor QML import.
> 
> Signed-off-by: David Rosca <nowrep@gmail.com>
> ---
>  package/qt5/qt5wayland/qt5wayland.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> index f96e4c2f8f..6ff8ba169f 100644
> --- a/package/qt5/qt5wayland/qt5wayland.mk
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -46,6 +46,7 @@ ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  define QT5WAYLAND_INSTALL_COMPOSITOR
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/

Thanks a lot for your patch. However, I see two problems with it:

 - First of all, QML files are only generated when
   BR2_PACKAGE_QT5DECLARATIVE_QUICK=y, but BR2_PACKAGE_QT5WAYLAND does
   not mandate having BR2_PACKAGE_QT5DECLARATIVE_QUICK as far as I can
   see. So I believe we need a conditional on
   BR2_PACKAGE_QT5DECLARATIVE_QUICK=y. See qt5location.mk for an
   example.

 - Secondly, you only handle the BR2_PACKAGE_QT5_VERSION_LATEST case
   (i.e Qt 5.11), but not the Qt LTS version (5.6) case. Does it mean
   that Qt 5.6 did not have those QML files (if that's the case, the
   commit log should at least say it) ? Or was it an oversight ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
