From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 14:41:29 +0200
Subject: [Buildroot] [PATCH v5 09/13] package/opencv: add opengl support
In-Reply-To: <1433672799-21387-10-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-10-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607124129.GJ3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> In OpenCV, OpenGL support is done using extensions from 3rd party
> framework: either Qt5OpenGL with Qt5 (with GL support only, not GLES);
> or gtkglext (which is not available in Buildroot) with gtk2
> 
> So, make OpenGL knob visible when Qt5 support is selected.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - new patch
> ---
>  package/opencv/Config.in | 11 +++++++++++
>  package/opencv/opencv.mk |  7 +++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 55e7580..f4072ef 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -227,6 +227,17 @@ config BR2_PACKAGE_OPENCV_WITH_JPEG
>  	help
>  	  Use shared libjpeg from the target system.
>  
> +config BR2_PACKAGE_OPENCV_WITH_OPENGL
> +	bool "opengl support"
> +	# OpenGL support done using Qt5OpenGL, so depends on QT5_BACKEND
> +	depends on BR2_PACKAGE_OPENCV_QT5_BACKEND
> +	# OpenGL support requires Qt5OpenGL with GL support
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_HAS_LIBGL

I was going to say that BR2_PACKAGE_QT5_GL_AVAILABLE already depends on
BR2_PACKAGE_HAS_LIBGL, so it was not needed.

However, as you say in the commit log, BR2_PACKAGE_QT5_GL_AVAILABLE also
alternatively depends on BR2_PACKAGE_HAS_LIBGLES, which OpenCV does not
support.

So, that 'depends on BR2_PACKAGE_HAS_LIBGL' makes sense. I'd however add
a comment about that, like so:

    # OpenGL support requires Qt5OpenGL with GL support, not GLES
    depends on BR2_PACKAGE_QT5_GL_AVAILABLE
    depends on BR2_PACKAGE_HAS_LIBGL

> +	select BR2_PACKAGE_QT5BASE_OPENGL
> +	help
> +	  Enable OpenGL for UI.

Maybe add a comment about the Qt5 dependency:

    comment "OpenGL support needs Qt5 and an OpenGL provider"

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
