From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 14:03:16 +0200
Subject: [Buildroot] [PATCH v5 03/13] package/opencv: bump to version 3.0
In-Reply-To: <1433672799-21387-4-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607120316.GD3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> This major version bump is in fact a bump from 2.4.10 to 2.4.11, then to
> 3.0.
> 
> OpenCV-2.4.11 improves a lot the Buildroot integration, including a
> couple of patches that no longer need to be carried in Buildroot tree:

...that are no longer needed:

> - x86 PIC code compilation fix in core module [1];
> - return type fix in superes module [2];
> - opencv.pc generation [3].
> 
> It also improves the gstreamer-0.10/1.x detection [4], that will needed

...that will be needed...

> in a follow-up patch.
> 
> The OpenCV-3.0 does some major changes, for which a transition guide
> has been published [5].
> 
> Among these changes coming with OpenCV-3.0, some new modules have been
> introduced and others got removed; leading to a bunch of configure
> option updates (to keep as much as possible an iso-functional-perimeter)
> and the legacy menu has been updated too.
> The worth noticing removal being:
> - the opencv_legacy and opencv_nonfree modules no longer exist;
> - the opencv_contrib module has moved out of the opencv base tree and
>   now has its own repository [6].
>   There is currently no plan to support it.
> 
> Some 3rd-party supports have been improved or added; their integrations
> in Buildroot will be addressed in follow-up patches.
> 
> [1] https://github.com/Itseez/opencv/commit/ea50be0529c248961e1b66293f8a9e4b807294a6
> [2] https://github.com/Itseez/opencv/commit/2e393ab83362743ba1825ad4b31d4a2925c606b4
> [3] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656
> [4] https://github.com/Itseez/opencv/commit/38bb0db9dbec08666c8a64b3e4ead8fadf15c980
> [5] http://docs.opencv.org/master/db/dfa/tutorial_transition_guide.html
> [6] https://github.com/itseez/opencv_contrib
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - new patch
> ---
>  Config.in.legacy                                   |  16 +++
>  .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 -------
>  ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 ------
>  ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 ---------------------
>  package/opencv/Config.in                           |  44 +++---
>  package/opencv/opencv.mk                           |  70 +++++++--
>  6 files changed, 96 insertions(+), 279 deletions(-)
>  delete mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
>  delete mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
>  delete mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 9b9fff0..e4a963b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -113,6 +113,22 @@ config BR2_TARGET_UBOOT_NETWORK
>  	help
>  	  U-Boot's custom network settings options have been removed.
>  
> +config BR2_PACKAGE_OPENCV_LIB_CONTRIB
> +	bool "opencv contrib module"
> +	select BR2_LEGACY

We're usually to be more explicit in the legacy option, either with a
longer prompt (e.g. "opencv contrib module no longer exists") or a help
entry (e.g. "help\nOpenCV contrib module no longer exists") or both.

> +config BR2_PACKAGE_OPENCV_LIB_GPU
> +	bool "opencv gpu module (splited in several 'cudaXXX' modules)"
> +	select BR2_LEGACY

'split' is an irregular verb, so its participle past is just 'split'.

Also, I did not see those new cudaXXX modules being added in that patch,
nor did I see a further patch adding them.

If we're not adding them, then no need to reference them in the legacy
prompt, or that would confuse the user.

> +config BR2_PACKAGE_OPENCV_LIB_LEGACY
> +	bool "opencv legacy module"
> +	select BR2_LEGACY

Ditto, we're usually trying to be more explicit about legacy options.

> +config BR2_PACKAGE_OPENCV_LIB_NONFREE
> +	bool "opencv nonfree module"
> +	select BR2_LEGACY

Ditto.

> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 4d08481..0a1b94c 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
[--SNIP--]
> @@ -12,19 +12,28 @@ OPENCV_LICENSE_FILES = LICENSE
>  
>  # OpenCV component options
>  OPENCV_CONF_OPTS += \
> +	-DBUILD_DOCS=OFF \
>  	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
>  	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
>  	-DBUILD_WITH_DEBUG_INFO=OFF
>  
> +ifneq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
> +OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
> +else
> +OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
> +endif

We usually prefer positive logic, like so:

    ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
    OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
    else
    OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
    endif

> @@ -39,40 +48,49 @@ OPENCV_CONF_OPTS += \
>  	-DINSTALL_CREATE_DISTRIB=OFF
>  
>  # OpenCV module selection
> +# - contrib modules are disabled.

'disabled' or 'no longer exist' ?

>  OPENCV_CONF_OPTS += \
>  	-DBUILD_opencv_androidcamera=OFF \
>  	-DBUILD_opencv_apps=OFF \
>  	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
> -	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
>  	-DBUILD_opencv_core=ON \
> -	-DBUILD_opencv_dynamicuda=OFF \
>  	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
>  	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
> -	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
> +	-DBUILD_opencv_hal=ON \
>  	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
> +	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGCODECS),ON,OFF) \
>  	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
>  	-DBUILD_opencv_java=OFF \
> -	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
>  	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
> -	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
>  	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
> -	-DBUILD_opencv_ocl=OFF \
>  	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
> -	-DBUILD_opencv_python=OFF \
> +	-DBUILD_opencv_python2=OFF \
> +	-DBUILD_opencv_python3=OFF \
> +	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
>  	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
>  	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
>  	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
>  	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
> +	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOIO),ON,OFF) \
>  	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
> +	-DBUILD_opencv_viz=OFF \

Any reason not to add a Config.in option for viz?

>  	-DBUILD_opencv_world=OFF
>  
>  # Hardware support options.
>  #
>  # * PowerPC support is turned off since its only effect is altering CFLAGS,
>  #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
> +# * fma3 and popcnt support is disabled because according to gcc manual [1], it
> +#   is only available on x86_64 haswell, broadwell and knl architecture.
> +#
> +# [1] https://gcc.gnu.org/onlinedocs/gcc-5.1.0/gcc/x86-Options.html#x86-Options
>  OPENCV_CONF_OPTS += \
>  	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
> +	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
> +	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
>  	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \

Uho... Duplicating avx and avx2.

And like I said for SSE/. SE2: AVX sorts before AVX2. Don't trust your
vim! ;-)

[--SNIP--]
> @@ -83,6 +101,19 @@ OPENCV_CONF_OPTS += \
>  
>  # Cuda stuff
>  OPENCV_CONF_OPTS += \
> +	-DBUILD_CUDA_STUBS=OFF \
> +	-DBUILD_opencv_cudaarithm=OFF \
> +	-DBUILD_opencv_cudabgsegm=OFF \
> +	-DBUILD_opencv_cudacodec=OFF \
> +	-DBUILD_opencv_cudafeatures2d=OFF \
> +	-DBUILD_opencv_cudafilters=OFF \
> +	-DBUILD_opencv_cudaimgproc=OFF \
> +	-DBUILD_opencv_cudalegacy=OFF \
> +	-DBUILD_opencv_cudaobjdetect=OFF \
> +	-DBUILD_opencv_cudaoptflow=OFF \
> +	-DBUILD_opencv_cudastereo=OFF \
> +	-DBUILD_opencv_cudawarping=OFF \
> +	-DBUILD_opencv_cudev=OFF \

Oh, we're adding all of the CUDA modules here, and they are forcibly
disabled. So, don't refer to them in the legacy prompt, or the user
would hunt for the corresponding options to enable/disable them, when
they are always disabled anyway, and that would be quite confusing
(He!, look how I was confused! ;-] ).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
