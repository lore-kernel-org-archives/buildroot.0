From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 23:55:58 +0100
Subject: [Buildroot] [PATCH 02/11] opencv: rework V4L/libv4l support
In-Reply-To: <1392588004-13317-3-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140305225558.GC9644@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-02-16 22:59 +0100, Samuel Martin spake thusly:
> Starting with the 2.4.7 release, for V4L support, OpenCV does not
> requires a libv4l dependency for its V4L support.
> 
> So, it now provides 2 distincts knobs for this: WITH_V4L and a new
> one: WITH_LIBV4L.
> 
> This patch takes advantage of this new knob and libv4l support is
> now automatically enabled if only the libv4l package is enabled.

So, if I understood correctly:
  - v4l support in openCV does not require libv4l
  - if libv4l is present, openCV can use it
  - use of libv4l or not, openCV support v4l the same

Right?

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/opencv/Config.in | 11 ++++++-----
>  package/opencv/opencv.mk | 10 +++++++---
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index c3273fd..2acbe19 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -189,14 +189,15 @@ config BR2_PACKAGE_OPENCV_WITH_TIFF
>  
>  config BR2_PACKAGE_OPENCV_WITH_V4L
>  	bool "v4l support"
> -	depends on BR2_LARGEFILE
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_LIBV4L
>  	help
>  	  Enable Video 4 Linux support.
>  
> -comment "v4l support needs a toolchain w/ largefile, threads"
> -	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> +	  If the package libv4l is enabled, its support is automatically enabled.
> +
> +if BR2_PACKAGE_OPENCV_WITH_V4L && !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
> +comment "libv4l support will be disabled."
> +comment "libv4l support needs a toolchain w/ largefile, threads"
> +endif

I guess we do not need a comment for an optional dependency, especially
since you added a blurb in the help text.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
