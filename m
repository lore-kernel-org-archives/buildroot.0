From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Oct 2018 22:15:54 +0200
Subject: [Buildroot] [PATCH 1/1] qt5location: copy PositioningQuick.so*
 for QtQuick
In-Reply-To: <20181015190217.GA31890@blarch>
References: <20181015190217.GA31890@blarch>
Message-ID: <20181015221554.1fade38f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Mon, 15 Oct 2018 21:02:17 +0200, Alexander 'z33ky' Hirsch <1zeeky@gmail.com> wrote:

> The Location module for QtQuick depends on this library, which was not
> being copied in the build rule.
> 
> Signed-off-by: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
> ---
>  package/qt5/qt5location/qt5location.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
> index 18253e9..fe26b6e 100644
> --- a/package/qt5/qt5location/qt5location.mk
> +++ b/package/qt5/qt5location/qt5location.mk
> @@ -44,6 +44,9 @@ define QT5LOCATION_INSTALL_TARGET_LOCATION
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location.so.* $(TARGET_DIR)/usr/lib
>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geoservices $(TARGET_DIR)/usr/lib/qt/plugins/
>  endef

Should depend on BR2_PACKAGE_QT5_VERSION_LATEST because the library is not
build/installed in the Qt5.6.x case:

+ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)

> +define QT5LOCATION_INSTALL_TARGET_POSITION_QUICK
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5PositioningQuick.so.* $(TARGET_DIR)/usr/lib
> +endef

+ endif

Thanks for the patch, mind to resend with the changes?

Regards,
Peter

>  ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>  define QT5LOCATION_INSTALL_TARGET_EXAMPLES
>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/location $(TARGET_DIR)/usr/lib/qt/examples/
> @@ -59,6 +62,7 @@ endef
>  
>  define QT5LOCATION_INSTALL_TARGET_CMDS
>  	$(QT5LOCATION_INSTALL_TARGET_POSITION)
> +	$(QT5LOCATION_INSTALL_TARGET_POSITION_QUICK)
>  	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
>  	$(QT5LOCATION_INSTALL_TARGET_QMLS)
>  	$(QT5LOCATION_INSTALL_TARGET_EXAMPLES)
