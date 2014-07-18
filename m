From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 00:42:09 +0200
Subject: [Buildroot] [git commit] opencv: bump to version 2.4.8
In-Reply-To: <20140716210452.638659D25F@busybox.osuosl.org>
References: <20140716210452.638659D25F@busybox.osuosl.org>
Message-ID: <20140719004209.1ff86ade@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

I don't know if it's directly related to the bump, but opencv fails to
build in the autobuilders in certain conditions:

  http://autobuild.buildroot.org/results/729/729dbfa730cce34e1316126a69de9951c6ea7be0/build-end.log

The error is:

  fatal error: opencv2/highgui/highgui.hpp: No such file or directory

Could you have a look?

Thanks,

Thomas

On Wed, 16 Jul 2014 22:51:19 +0200, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=d16c4669592d7be35076bd6925914ac524bb721c
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This patch bumps OpenCV version and address the minimal set of change to
> get the new version building correctly:
> - update the download location;
> - force Qt version to Qt 4 when support is enabled;
> - naively fix the v4l support.
> 
> However, it does not address a couple improvements, among these:
> - jasper support;
> - python/numpy support;
> - Qt4 and Qt5 support (since the 2.4.6 release), so only Qt4 support is
>   supported in this patch;
> - optional libv4l dependency (since 2.4.7 release);
> - etc.
> These will be addressed in followup patches.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/opencv/Config.in |    2 +-
>  package/opencv/opencv.mk |   11 +++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index f9ee416..7644d64 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_OPENCV
>  	  OpenCV (Open Source Computer Vision) is a library of programming
>  	  functions for real time computer vision.
>  
> -	  http://opencv.willowgarage.com/wiki/
> +	  http://opencv.org/
>  
>  if BR2_PACKAGE_OPENCV
>  
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 464a95a..d56b5e4 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -OPENCV_VERSION = 2.4.2
> -OPENCV_SITE = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
> -OPENCV_SOURCE = OpenCV-$(OPENCV_VERSION).tar.bz2
> +OPENCV_VERSION = 2.4.8
> +OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
>  OPENCV_INSTALL_STAGING = YES
>  OPENCV_LICENSE = BSD-3c
>  OPENCV_LICENSE_FILES = doc/license.txt
> @@ -141,7 +140,7 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
> -OPENCV_CONF_OPT += -DWITH_QT=ON
> +OPENCV_CONF_OPT += -DWITH_QT=4
>  OPENCV_DEPENDENCIES += qt
>  else
>  OPENCV_CONF_OPT += -DWITH_QT=OFF
> @@ -155,10 +154,10 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
> -OPENCV_CONF_OPT += -DWITH_V4L=ON
> +OPENCV_CONF_OPT += -DWITH_V4L=ON -DWITH_LIBV4L=ON
>  OPENCV_DEPENDENCIES += libv4l
>  else
> -OPENCV_CONF_OPT += -DWITH_V4L=OFF
> +OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
>  endif
>  
>  # Installation hooks:
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
