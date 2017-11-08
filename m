From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Nov 2017 23:39:50 +0100
Subject: [Buildroot] [PATCH v2 2/2] add qmake.conf eglfs_mali option
In-Reply-To: <1510165263-7599-2-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1510165263-7599-2-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <a6e97c11-b4fa-06f4-6eb4-9cb472f1b02a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-17 19:21, Giulio Benetti wrote:
> Package qt5base didn't treat eglfs_mali.
> Add support for eglfs_mali according to package selection
> 
> Changes v1->v2:
> * Add eglfs_mali support
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index d58a58a..23f5138 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -240,18 +240,27 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
>  
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>  
> -ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
> -# use vivante backend
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
> +# use eglfs vivante backend
>  define QT5BASE_CONFIGURE_QMAKE_CONFIG
>  	sed 's/@EGLFS_DEVICE@/eglfs_viv/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
>  		$(QT5BASE_PKGDIR)/qmake.conf
>  endef
> +else ifeq ($(filter y,$(BR2_PACKAGE_SUNXI_MALI) $(BR2_PACKAGE_SUNXI_MALI_MAINLINE)),y)

 Since the sunxi-mali-mainline package has not been accepted yet, this is not
correct (yet). To solve that, the easiest way is to include all three in a
single series.

> +# use eglfs mali backend
> +define QT5BASE_CONFIGURE_QMAKE_CONFIG
> +	sed 's/@EGLFS_DEVICE@/eglfs_mali/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
> +		$(QT5BASE_PKGDIR)/qmake.conf
> +endef

 This is getting complicated, especially since there will probably be more
backends that need this... How about:

ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
QT5BASE_EGLFS_DEVICE = eglfs_viv
else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
QT5BASE_EGLFS_DEVICE = eglfs_mali
endif
endif

ifeq ($(QT5BASE_EGLFS_DEVICE),)
	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
else
 	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g'
$(QT5BASE_PKGDIR)/qmake.conf.in > \
		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
endif


 Regards,
 Arnout

>  else
> +# don't use any eglfs backend
>  define QT5BASE_CONFIGURE_QMAKE_CONFIG
>  	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
>  		$(QT5BASE_PKGDIR)/qmake.conf
>  endef
>  endif
> +endif
>  
>  ifneq ($(QT5BASE_CONFIG_FILE),)
>  define QT5BASE_CONFIGURE_CONFIG_FILE
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
