From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 1 Feb 2017 21:18:25 +0100
Subject: [Buildroot] [PATCH v6 7/9] qt5quickcontrols/qt5quickcontrols2:
 enable for software renderer for Qt 5.8.0
In-Reply-To: <1485849551-20469-8-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-8-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20170201211825.66e24ddb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Tue, 31 Jan 2017 08:59:09 +0100, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:

> From: Naumann Andreas <ANaumann@ultratronik.de>
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/qt5/qt5quickcontrols/Config.in             |  4 ++--
>  package/qt5/qt5quickcontrols2/Config.in            |  4 ++--
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 12 ++++++++++++
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
> index 0fe8465..d1a4fa5 100644
> --- a/package/qt5/qt5quickcontrols/Config.in
> +++ b/package/qt5/qt5quickcontrols/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
>  	bool "qt5quickcontrols"
>  	select BR2_PACKAGE_QT5DECLARATIVE
>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_QT5_VERSION_5_8
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	help
>  	  Qt is a cross-platform application and UI framework for
> @@ -13,5 +13,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
>  	  http://qt.io
>  
>  comment "qt5quickcontrols needs an OpenGL-capable backend"
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_QT5_VERSION_5_6
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
> index 1e57674..ea22a2b 100644
> --- a/package/qt5/qt5quickcontrols2/Config.in
> +++ b/package/qt5/qt5quickcontrols2/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
>  	bool "qt5quickcontrols2"
>  	select BR2_PACKAGE_QT5DECLARATIVE
>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_QT5_VERSION_5_8 # qt5declarative/quick
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
>  	help
>  	  Qt is a cross-platform application and UI framework for
> @@ -13,5 +13,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
>  	  http://qt.io
>  
>  comment "qt5quickcontrols2 needs an OpenGL-capable backend"
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_QT5_VERSION_5_6
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> index 8de7932..0ef25e2 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> @@ -36,6 +36,7 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
>  endef
>  endif
>  
> +ifeq ($(BR2_QT5_VERSION_5_6),y)
>  define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
>  	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
> @@ -43,5 +44,16 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
>  	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
>  	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
>  endef
> +else
> +define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
> +	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/platform $(TARGET_DIR)/usr/qml/Qt/labs
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls.2 $(TARGET_DIR)/usr/qml/QtQuick
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
> +	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
> +endef
> +endif

This last part of the patch, fixing the installation for Qt5.8.0 has nothing to do with
the patch subject '...enable for software renderer...' and should go to the first patch
of the series or to an extra patch....

Regards,
Peter


>  
>  $(eval $(generic-package))
