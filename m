From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 16:51:14 +0200
Subject: [Buildroot] [PATCH v6 02/16] package/opencv: bump to version 3.0
In-Reply-To: <1435262397-888-3-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626145114.GA17113@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> This major version bump is in fact a bump from 2.4.10 to 2.4.11, then to
> 3.0.
> 
> OpenCV-2.4.11 improves a lot the Buildroot integration, including a
> couple of patches that are no longer needed:
> - x86 PIC code compilation fix in core module [1];
> - return type fix in superes module [2];
> - opencv.pc generation [3].
> 
> It also improves the gstreamer-0.10/1.x detection [4], that will be
> needed in a follow-up patch.
> 
> OpenCV-3.0 still requires 2 patches (backported from upstream fixing
> pthread support [5,6].
> 
> The OpenCV-3.0 does some major changes, for which a transition guide
> has been published [7].
> 
> Among these changes coming with OpenCV-3.0, some new modules have been
> introduced and others got removed; leading to a bunch of configure
> option updates (to keep as much as possible an iso-functional-perimeter)
> and the legacy menu has been updated too.
> The worth noticing removals being:
> - the opencv_legacy and opencv_nonfree modules no longer exist;
> - the opencv_contrib module has moved out of the opencv base tree and
>   now has its own repository [8].
>   There is currently no plan to support it.
> 
> Some 3rd-party supports have been improved or added; their integrations
> in Buildroot will be addressed in follow-up patches.
> 
> [1] https://github.com/Itseez/opencv/commit/ea50be0529c248961e1b66293f8a9e4b807294a6
> [2] https://github.com/Itseez/opencv/commit/2e393ab83362743ba1825ad4b31d4a2925c606b4
> [3] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656
> [4] https://github.com/Itseez/opencv/commit/38bb0db9dbec08666c8a64b3e4ead8fadf15c980
> [5] https://github.com/Itseez/opencv/commit/1f983ec39c97298b0c8ce409a1cc229ecf14e55c
> [6] https://github.com/Itseez/opencv/commit/a482dcce464acbd5368fb93c6c3d52ba8401776a
> [7] http://docs.opencv.org/master/db/dfa/tutorial_transition_guide.html
> [8] https://github.com/itseez/opencv_contrib

Great list of pointers! :-)

> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index e40437f..95e1e13 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -4,10 +4,14 @@ menuconfig BR2_PACKAGE_OPENCV
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> +	depends on !BR2_STATIC_LIBS # include dlfcn.h
>  	help
>  	  OpenCV (Open Source Computer Vision) is a library of programming
>  	  functions for real time computer vision.
>  
> +	  Note that the opencv_core module and the opencv_hal library are
> +	  automatically enabled.

"automatically enabled" suggests that we do have (Kconfig) options to
enable them, which is not the case. What about:

    Note that the opencv_core module and the opencv_hal library are
    always built and installed, not matter which other modules are
    enabled below.

>  	  http://opencv.org/
>  
>  if BR2_PACKAGE_OPENCV
> @@ -20,11 +24,7 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	help
>  	  Include opencv_calib3d module into the OpenCV build.
>  
> -config BR2_PACKAGE_OPENCV_LIB_CONTRIB
> -	bool "contrib"
> -	default y
> -	help
> -	  Include opencv_contrib module into the OpenCV build.
> +# opencv_core module is automatically enabled when OpenCV package is selected

I would not add this comment, since it's already been explicitly stated
so in the help entry.

>  config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	bool "features2d"
> @@ -38,10 +38,8 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
>  	help
>  	  Include opencv_flann module into the OpenCV build.
>  
> -config BR2_PACKAGE_OPENCV_LIB_GPU
> -	bool "gpu"
> -	help
> -	  Include opencv_gpu module into the OpenCV build.
> +# opencv_hal (hardware acceleration layer (hal) module is required by
> +# opencv_core, so it is automatically enabled

Ditto.

>  config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	bool "highgui"
> @@ -49,17 +47,17 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	help
>  	  Include opencv_highgui module into the OpenCV build.
>  
> -config BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	bool "imgproc"
> +config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> +	bool "imgcodecs (image codecs)"

I forgot to say so in my previous review, but we ususally do not add
such explications in the prompt, but in the help text. Besides, since
you do not update the existing prompts accordingly, it makes the whole
menu inconsistent, because some prompts have explanations, some don't.

(Note that this comment is valid for all entries; I won't repeat it.)

>  	default y
>  	help
> -	  Include opencv_imgproc module into the OpenCV build.
> +	  Include opencv_imgcodecs module into the OpenCV build.

Furthermore, the proposed help text is not very helpful. A help text,
when present, should have some explanations that go further than just
repeating the promopt with syntaxic sugar. What about (adapt list, of
course):

    config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
        bool "imgcodecs"
        help
            Include opencv_imgcodecs module, to provide image codecs,
            like jpeg, png, gif...

(Ditto, comment valid for all following entries.)

But others may disagree, of course. ;-)

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Build-tested only, on i586.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
