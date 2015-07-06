From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 11:47:08 +0200
Subject: [Buildroot] [PATCH 3/5 v10] package/opencv: add qt5 support
In-Reply-To: <5155a3b6c47fd098de012cc0620e53e1bc2d046d.1436132995.git.yann.morin.1998@free.fr>
References: <cover.1436132995.git.yann.morin.1998@free.fr>
 <5155a3b6c47fd098de012cc0620e53e1bc2d046d.1436132995.git.yann.morin.1998@free.fr>
Message-ID: <20150706114708.797867fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  5 Jul 2015 23:54:46 +0200, Yann E. MORIN wrote:

> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 0e5cf77..98e1614 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -266,11 +266,18 @@ else
>  OPENCV_CONF_OPTS += -DWITH_PNG=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT)$(BR2_PACKAGE_OPENCV_WITH_QT5),)
> +OPENCV_CONF_OPTS += -DWITH_QT=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
>  OPENCV_CONF_OPTS += -DWITH_QT=4
>  OPENCV_DEPENDENCIES += qt
> -else
> -OPENCV_CONF_OPTS += -DWITH_QT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT5),y)
> +OPENCV_CONF_OPTS += -DWITH_QT=5
> +OPENCV_DEPENDENCIES += qt5base
>  endif

I think something like:

ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
OPENCV_CONF_OPTS += -DWITH_QT=4
OPENCV_DEPENDENCIES += qt
else ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT5),y)
OPENCV_CONF_OPTS += -DWITH_QT=5
OPENCV_DEPENDENCIES += qt5base
else
OPENCV_CONF_OPTS += -DWITH_QT=OFF
endif

Would probably have been more logical. But oh well, we're already at
the 10th iteration, so I'll commit as is, and such improvements can be
done as follow-up patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
