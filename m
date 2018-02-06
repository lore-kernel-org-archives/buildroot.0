From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 17:41:37 +0100
Subject: [Buildroot] [PATCH v2] qt5base: Qt KMS support does not depend
 on opengl
In-Reply-To: <1505762485-15768-1-git-send-email-joshua.henderson@microchip.com>
References: <1505762485-15768-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180206174137.681d7502@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Sep 2017 12:21:25 -0700, Joshua Henderson wrote:

> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 0ca11a5..7234948 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -40,8 +40,13 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  QT5BASE_CONFIGURE_OPTS += -kms -gbm
>  QT5BASE_DEPENDENCIES += mesa3d
>  else
> +ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +QT5BASE_CONFIGURE_OPTS += -kms
> +QT5BASE_DEPENDENCIES += libdrm
> +else
>  QT5BASE_CONFIGURE_OPTS += -no-kms
>  endif
> +endif

It looks good in principle, but these conditions become very messy. Can
we do something like this instead:

ifeq ($(BR2_PACKAGE_LIBDRM),y)
QT5BASE_CONFIGURE_OPTS += -kms
QT5BASE_DEPENDENCIES += libdrm
else
QT5BASE_CONFIGURE_OPTS += -no-kms
endif

ifeq ($($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
QT5BASE_CONFIGURE_OPTS += -gbm
QT5BASE_DEPENDENCIES += mesa3d
else
QT5BASE_CONFIGURE_OPTS += -no-gbm
endif

It should be functionally the same, because when
BR2_PACKAGE_MESA3D_OPENGL_EGL=y, BR2_PACKAGE_LIBDRM is always enabled I
believe.

Could you test this, and send an updated version if it works?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
