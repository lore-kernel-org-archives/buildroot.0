From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:20:55 +0200
Subject: [Buildroot] [PATCH v6 04/16] package/opencv: define modules
 inter-dependencies
In-Reply-To: <1435262397-888-5-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626152055.GC17113@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> OpenCV allows to enable/disable the selection of modules (a.k.a.
> opencv libraries). These modules depend one on the others; these
> dependencies are already handled by the build-system (CMake).
> 
> However, the way we handled them in Buildroot was not really clean.
> For each opencv module, there is a kconfig option, but we forced the
> corresponding CMake config option without checking for the modules'
> dependencies.
> 
> This patch replicates the modules' dependency relations in the
> Config.in, so that the selection of the user will actually be built.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v5->v6:
> - rebase
> 
> changes v4->v5:
> - rebase
> - remove Reviewed-by tag form Yann (because of the changes introduced
>   with the version bump)
> 
> changes v3->v4:
> - rebase
> - update ts module dependencies
> 
> changes v2->v3:
> - rebase
> - fix typo in commit log (Yann)
> - update A/R/T tags
> 
> changes v1->v2:
> - rebase
> ---
>  package/opencv/Config.in | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 95e1e13..87f4bf5 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -21,6 +21,8 @@ comment "OpenCV modules"
>  config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	bool "calib3d"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_calib3d module into the OpenCV build.
>  
> @@ -29,12 +31,16 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	bool "features2d"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_FLANN
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_ML
>  	help
>  	  Include opencv_features2d module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_FLANN
>  	bool "flann"
>  	default y
> +	# opencv_core dependency is already enabled
>  	help
>  	  Include opencv_flann module into the OpenCV build.
>  
> @@ -44,36 +50,46 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
>  config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	bool "highgui"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  	help
>  	  Include opencv_highgui module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
>  	bool "imgcodecs (image codecs)"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_imgcodecs module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	bool "imgproc (image processing)"
>  	default y
> +	# opencv_core dependency is already enabled
>  	help
>  	  Include opencv_imgproc module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_ML
>  	bool "ml (machine learning)"
>  	default y
> +	# opencv_core dependency is already enabled
>  	help
>  	  Include opencv_ml module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  	bool "objdetect"
>  	default y
> +	# opencv_core dependency is already enabled
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_ML
>  	help
>  	  Include opencv_objdetect module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_PHOTO
>  	bool "photo"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_photo module into the OpenCV build.
>  
> @@ -82,44 +98,65 @@ comment "opencv_python module requires numpy which is not yet available."
>  config BR2_PACKAGE_OPENCV_LIB_SHAPE
>  	bool "shape (shape descriptors and matchers)"
>  	default y
> +	# opencv_core dependency is already enabled
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
>  	  Include opencv_shape module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_STITCHING
>  	bool "stitching"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> +	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  	help
>  	  Include opencv_stitching module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>  	bool "superres"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
>  	  Include opencv_superres "super resolution" - module into the OpenCV
>  	  build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_TS
>  	bool "ts (touchscreen)"
> -	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	default y
> +	# opencv_core dependency is already enabled
> +	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  	help
>  	  Include opencv_ts module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  	bool "videoio (media i/o)"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_videoio module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	bool "video"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_video module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
>  	bool "videostab"
>  	default y
> +	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> +	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_PHOTO
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
>  	  Include opencv_videostab module into the OpenCV build.
>  
> -- 
> 2.4.4
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
