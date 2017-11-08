From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Nov 2017 23:30:44 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5 add qmake.conf.in for eglfs
In-Reply-To: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <bbeb18e2-bc63-25c8-d3b0-05da16dca69f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Giulio,

On 08-11-17 19:21, Giulio Benetti wrote:
> EGLFS_DEVICE_INTEGRATION = eglfs_* doesn't work correctly with previous patch
> EGLFS_DEVICE_INTEGRATION = eglfs_viv/eglfs_* must be written before include(../common/linux_device_post.conf)
> 
> Starting from qmake.conf.in, 
> generate qmake.conf substituting @EGLFS_DEVICE@ with eglfs_viv or eglfs_mali
> according to Package selection

 The commit message is still not entirely clear. Howe about this:

qt5: correct eglfs support in qmake.conf.in

Setting EGLFS_DEVICE_INTEGRATION at the end of qmake.conf like is done by commit
0c219ddb8a doesn't work correctly: it has to be set before the
include(../common/linux_device_post.conf)

Instead of appending to the file, change it into a qmake.conf.in template file
that contains an EGLFS_DEVICE_INTEGRATION assignment and update it with sed.

> 
> Changes v1 -> v2:
> 
> * Moved qmake.conf to qmake.conf.in
> * Added @EGLFS_DEVICE@ placeholder into qmake.conf.in
> * Modified QT5BASE_CONFIGURE_QMAKE_CONFIG to use sed
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/qt5/qt5base/{qmake.conf => qmake.conf.in} |  2 ++
>  package/qt5/qt5base/qt5base.mk                    | 12 +++++++++---
>  2 files changed, 11 insertions(+), 3 deletions(-)
>  rename package/qt5/qt5base/{qmake.conf => qmake.conf.in} (95%)
> 
> diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf.in
> similarity index 95%
> rename from package/qt5/qt5base/qmake.conf
> rename to package/qt5/qt5base/qmake.conf.in
> index 8b6debe..fb698b9 100644
> --- a/package/qt5/qt5base/qmake.conf
> +++ b/package/qt5/qt5base/qmake.conf.in
> @@ -24,5 +24,7 @@ QMAKE_CFLAGS_ISYSTEM   =
>  # Architecturespecific configuration
>  include(arch.conf)
>  
> +EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE@
> +
>  include(../common/linux_device_post.conf)
>  load(qt_config)
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index b3f9c79..d58a58a 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -243,8 +243,13 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
>  # use vivante backend
>  define QT5BASE_CONFIGURE_QMAKE_CONFIG
> -	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
> -		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> +	sed 's/@EGLFS_DEVICE@/eglfs_viv/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
> +		$(QT5BASE_PKGDIR)/qmake.conf

 What I meant is to write directly to the target file, so
		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf

> +endef
> +else
> +define QT5BASE_CONFIGURE_QMAKE_CONFIG
> +	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
> +		$(QT5BASE_PKGDIR)/qmake.conf
>  endef
>  endif
>  
> @@ -263,9 +268,10 @@ endef
>  endif
>  
>  define QT5BASE_CONFIGURE_CMDS
> +	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
>  	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
>  		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf

 So remove this

> -	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
> +	$(RM) $(QT5BASE_PKGDIR)/qmake.conf

 And this.


 Regards,
 Arnout

>  	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
>  		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>  	$(QT5BASE_CONFIGURE_CONFIG_FILE)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
