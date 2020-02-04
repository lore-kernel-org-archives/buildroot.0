From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 22:55:31 +0100
Subject: [Buildroot] [PATCH] package/imagemagick: fix configure error
 with --disable-opencl in setups without libltdl
In-Reply-To: <20200204212910.13935-1-peter@korsgaard.com>
References: <20200204212910.13935-1-peter@korsgaard.com>
Message-ID: <20200204215531.GD6335@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-04 22:29 +0100, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/d9a/d9a84b642357f758c3f84270fb9a109abd7e2684/
> 
> configure.ac contains a test using $ax_cv_check_cl_libcl:
> 
> if test "$build_modules" != 'no' || test "X$ax_cv_check_cl_libcl" != Xno; then
>   AC_MSG_RESULT([-------------------------------------------------------------])
>   AC_MSG_CHECKING([for libltdl])
> 
> But ax_cv_check_cl_libcl is only assigned a value (yes/no) if
> --disable-opencl is NOT passed, as the assignment logic is inside a
> conditional:
> 
> AC_ARG_ENABLE([opencl],
>     [AC_HELP_STRING([--disable-opencl],
>                     [do not use OpenCL])],
>     [disable_opencl=$enableval],
>     [disable_opencl='yes'])
> 
> if test "$disable_opencl" = 'yes'; then
>   ..
>   AC_CACHE_CHECK([for OpenCL library], [ax_cv_check_cl_libcl],
> 
> So configure errors out if --disable-opencl is passed on setups where
> libltdl isn't available:
> 
> checking if libltdl package is complete... no
> configure: error: in `/home/naourr/work/instance-0/output-1/build/imagemagick-7.0.8-59':
> configure: error: libltdl is required for modules and OpenCL builds
> 
> As a workaround, explictly set ax_cv_check_cl_libcl=no to skip this
> conditional.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/imagemagick.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index eaa291a1bd..5ef04973a6 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -18,7 +18,9 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
>  IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
>  endif
>  
> -IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
> +IMAGEMAGICK_CONF_ENV = \
> +	ac_cv_sys_file_offset_bits=64 \
> +	ax_cv_check_cl_libcl=no
>  
>  IMAGEMAGICK_CONF_OPTS = \
>  	--program-transform-name='s,,,' \
> @@ -179,7 +181,9 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
>  	--with-zlib
>  
>  # uses clock_gettime, which was provided by librt in glibc < 2.17
> -HOST_IMAGEMAGICK_CONF_ENV = LIBS="-lrt"
> +HOST_IMAGEMAGICK_CONF_ENV = \
> +	LIBS="-lrt" \
> +	ax_cv_check_cl_libcl=no
>  
>  HOST_IMAGEMAGICK_DEPENDENCIES = \
>  	host-libjpeg \
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
