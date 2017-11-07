From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 7 Nov 2017 19:58:01 +0100
Subject: [Buildroot] [PATCH 1/1] add qmake.conf fixup for sunxi-mali
 platforms
In-Reply-To: <1510066081-35701-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510066081-35701-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <002cc8ca-ccf5-7610-905a-735e0740d942@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is buggy.
The same for Gary Bisson patch.
Must put "EGLFS_DEVICE_INTEGRATION = eglfs_mali"
before:

include(../common/linux_device_post.conf)
load(qt_config)

otherwise qmake ignores it.
I thought to use sed to append EGLFS_DEVICE_INTEGRATION = eglfs_mali/viv 
just after include(arch.conf).

What do you think?

Kind regards

Il 07/11/2017 15:48, Giulio Benetti ha scritto:
> Based on Gary Bisson patch qt5base: add qmake.conf fixup for i.MX platforms
> Same happens for eglfs_mali.
> 
> As stated in QTBUG-61156 [1], since Qt5.9 all the Qt apps fail to start
> on sunxi-mali platforms.
> 
> The reason is that the qmake.conf should apparently now specify which
> eglfs backend to use.
> 
> Although this issue can be worked around by exporting a variable
> (QT_QPA_EGLFS_INTEGRATION=eglfs_mali), this patch aims at providing
> a more user-friendly approach by modifying qmake.conf when created.
> 
> [1]: https://bugreports.qt.io/browse/QTBUG-61156
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/qt5/qt5base/qt5base.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index b3f9c79..494031e 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -248,6 +248,14 @@ define QT5BASE_CONFIGURE_QMAKE_CONFIG
>   endef
>   endif
>   
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_SUNXI_MALI_MAINLINE),yy)
> +# use vivante backend
> +define QT5BASE_CONFIGURE_QMAKE_CONFIG
> +	echo "EGLFS_DEVICE_INTEGRATION = eglfs_mali" >> \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> +endef
> +endif
> +
>   ifneq ($(QT5BASE_CONFIG_FILE),)
>   define QT5BASE_CONFIGURE_CONFIG_FILE
>   	cp $(QT5BASE_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
> 


-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
