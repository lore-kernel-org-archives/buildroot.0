From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 14:11:18 +0200
Subject: [Buildroot] [PATCH v5 04/13] package/opencv: define modules
 inter-dependencies
In-Reply-To: <1433672799-21387-5-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607121118.GE3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
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
[--SNIP--]
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index a3f1f5e..4ab4dc7 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -19,7 +19,8 @@ comment "OpenCV modules"
>  
>  config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	bool "calib3d"
> -	default y
> +	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC

You remove the 'default y' but that means existing defconfig files will
no longer be usable.

Also, it is not documented in the commit log.

And it leaves quite a few options to default to 'y' anyway.

I'm not opposed to changing that, but it must be really thought about.

And in any case, this should probably be a separate patch, that removes
all 'default y' for all options, while this patch only enforces
dependency, like is explained in the commit log.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
