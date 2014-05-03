From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 00:15:12 +0200
Subject: [Buildroot] [PATCH v2 10/24] opencv: sort and reorder HW
 support options
In-Reply-To: <1398208556-4195-11-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-11-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503221512.GD13170@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> Sort per HW features and disable their support when it is not suppported
> by Buildroot.

Strictly speaking, you are also adding some more config options. But it
seems they are needed to properly work. Say so in the commit log.

An alternate solution would have been to really do only the re-ordering
in those patches, and add a single new patch to add the missing bits?

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Add a bit more to the commit log, then:
--> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(I wonder if Patchwork is smart enough to not catch this?)

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - new patch (split suggested by Yann)
> ---
>  package/opencv/opencv.mk | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index ae89577..046b847 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -47,6 +47,7 @@ OPENCV_CONF_OPT += \
>  	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
>  	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
>  	-DBUILD_opencv_core=ON                                                  \
> +	-DBUILD_opencv_dynamicuda=OFF                                           \
>  	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
>  	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
>  	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
> @@ -77,6 +78,35 @@ OPENCV_CONF_OPT += \
>  	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
>  
>  # Software/3rd-party support options.
> +# Cuda stuff
> +OPENCV_CONF_OPT += \
> +	-DWITH_CUBLAS=OFF \
> +	-DWITH_CUDA=OFF   \
> +	-DWITH_CUFFT=OFF
> +
> +# NVidia stuff
> +OPENCV_CONF_OPT += -DWITH_NVCUVID=OFF
> +
> +# AMD stuff
> +OPENCV_CONF_OPT += \
> +	-DWITH_OPENCLAMDFFT=OFF \
> +	-DWITH_OPENCLAMDBLAS=OFF
> +
> +# Intel stuff
> +OPENCV_CONF_OPT += \
> +	-DWITH_INTELPERC=OFF \
> +	-DWITH_IPP=OFF       \
> +	-DWITH_TBB=OFF
> +
> +# Smartek stuff
> +OPENCV_CONF_OPT += -DWITH_GIGEAPI=OFF
> +
> +# Prosilica stuff
> +OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
> +
> +# Ximea stuff
> +OPENCV_CONF_OPT += -DWITH_XIMEA=OFF
> +
>  OPENCV_CONF_OPT += \
>  	-DBUILD_JASPER=OFF \
>  	-DBUILD_JPEG=OFF   \
> @@ -96,22 +126,15 @@ OPENCV_CONF_OPT += \
>  	-DWITH_ANDROID_CAMERA=OFF \
>  	-DWITH_AVFOUNDATION=OFF	  \
>  	-DWITH_CARBON=OFF         \
> -	-DWITH_CUBLAS=OFF         \
> -	-DWITH_CUDA=OFF           \
> -	-DWITH_CUFFT=OFF          \
>  	-DWITH_EIGEN=OFF          \
>  	-DWITH_IMAGEIO=OFF        \
> -	-DWITH_IPP=OFF            \
>  	-DWITH_JASPER=OFF         \
>  	-DWITH_OPENEXR=OFF        \
>  	-DWITH_OPENGL=OFF         \
>  	-DWITH_OPENNI=OFF         \
> -	-DWITH_PVAPI=OFF          \
>  	-DWITH_QUICKTIME=OFF      \
> -	-DWITH_TBB=OFF            \
>  	-DWITH_UNICAP=OFF         \
>  	-DWITH_VIDEOINPUT=OFF     \
> -	-DWITH_XIMEA=OFF          \
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
