From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 00:19:28 +0200
Subject: [Buildroot] [PATCH v2 11/24] opencv: sort and reorder SW
 support options
In-Reply-To: <1398208556-4195-12-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-12-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503221928.GE13170@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> Sort SW features by category and disable them when not supported by
> Buildroot.

... and add a few missing ones.

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

With the commit log ammended:
--> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - new patch (split suggested by Yann)
> ---
>  package/opencv/opencv.mk | 62 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 046b847..264507c 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -77,7 +77,6 @@ OPENCV_CONF_OPT += \
>  	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
>  	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
>  
> -# Software/3rd-party support options.
>  # Cuda stuff
>  OPENCV_CONF_OPT += \
>  	-DWITH_CUBLAS=OFF \
> @@ -107,34 +106,53 @@ OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
>  # Ximea stuff
>  OPENCV_CONF_OPT += -DWITH_XIMEA=OFF
>  
> +# Non-Linux support (Android options) must remain OFF:
>  OPENCV_CONF_OPT += \
> -	-DBUILD_JASPER=OFF \
> -	-DBUILD_JPEG=OFF   \
> -	-DBUILD_PNG=OFF	   \
> -	-DBUILD_TIFF=OFF   \
> -	-DBUILD_ZLIB=OFF   \
> +	-DWITH_ANDROID_CAMERA=OFF          \
>  	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
>  	-DBUILD_ANDROID_EXAMPLES=OFF	   \
> +	-DINSTALL_ANDROID_EXAMPLES=OFF     \
>  	-DBUILD_FAT_JAVA_LIB=OFF           \
> -	-DBUILD_JAVA_SUPPORT=OFF	   \
> +	-DBUILD_JAVA_SUPPORT=OFF
> +
> +# Non-Linux support (Mac OSX options) must remain OFF:
> +OPENCV_CONF_OPT += \
> +	-DWITH_AVFOUNDATION=OFF	\
> +	-DWITH_CARBON=OFF       \
> +	-DWITH_QUICKTIME=OFF
> +
> +# Non-Linux support (Windows options) must remain OFF:
> +OPENCV_CONF_OPT += \
> +	-DWITH_VFW=OFF      \
> +	-DWITH_WIN32UI=OFF  \
> +	-DWITH_CSTRIPES=OFF \
> +	-DWITH_DSHOW=OFF    \
> +	-DWITH_MSMF=OFF     \
> +	-DWITH_VIDEOINPUT=OFF
> +
> +# Software/3rd-party support options.
> +OPENCV_CONF_OPT += \
> +	-DBUILD_JASPER=OFF  \
> +	-DBUILD_JPEG=OFF    \
> +	-DBUILD_OPENEXR=OFF \
> +	-DBUILD_PNG=OFF	    \
> +	-DBUILD_TIFF=OFF    \
> +	-DBUILD_ZLIB=OFF    \
>  	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
> -	-DINSTALL_ANDROID_EXAMPLES=OFF \
>  	-DINSTALL_C_EXAMPLES=OFF       \
>  	-DINSTALL_PYTHON_EXAMPLES=OFF  \
> -	-DINSTALL_TO_MANGLED_PATHS=OFF \
> -	-DWITH_1394=OFF           \
> -	-DWITH_ANDROID_CAMERA=OFF \
> -	-DWITH_AVFOUNDATION=OFF	  \
> -	-DWITH_CARBON=OFF         \
> -	-DWITH_EIGEN=OFF          \
> -	-DWITH_IMAGEIO=OFF        \
> -	-DWITH_JASPER=OFF         \
> -	-DWITH_OPENEXR=OFF        \
> -	-DWITH_OPENGL=OFF         \
> -	-DWITH_OPENNI=OFF         \
> -	-DWITH_QUICKTIME=OFF      \
> -	-DWITH_UNICAP=OFF         \
> -	-DWITH_VIDEOINPUT=OFF     \
> +	-DINSTALL_TO_MANGLED_PATHS=OFF
> +
> +# Disabled features (mostly because they are not available in Buildroot), but
> +# - eigen: OpenCV does not use it, not take any benefit from it.
> +OPENCV_CONF_OPT += \
> +	-DWITH_1394=OFF    \
> +	-DWITH_EIGEN=OFF   \
> +	-DWITH_IMAGEIO=OFF \
> +	-DWITH_OPENEXR=OFF \
> +	-DWITH_OPENGL=OFF  \
> +	-DWITH_OPENNI=OFF  \
> +	-DWITH_UNICAP=OFF  \
>  	-DWITH_XINE=OFF
>  
>  OPENCV_DEPENDENCIES += zlib
> -- 
> 1.9.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
