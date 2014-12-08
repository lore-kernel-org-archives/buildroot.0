From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 08 Dec 2014 11:32:59 +0100
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
In-Reply-To: <20141205234431.101f3141@free-electrons.com>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
 <2300509.9auvbGzPAa@sagittea> <20141205234431.101f3141@free-electrons.com>
Message-ID: <2478091.mcU7omfvoP@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 05 December 2014 23:44:31 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Thu, 04 Dec 2014 22:19:13 +0100, J?r?me Pouiller wrote:
> 
> > It looks like you enabled EGLFS in Qt5. EGLFS need framebuffer version of gpu-
> > viv-bin-mx6q. If you want to use X11, you have to enable xcb in qt5 (as in 
> > example in commit log of "07/14 xdriver_xf86-video-imx-viv").
> > 
> > I do not see any simple generic solution to prevent user to choose EGLFS in Qt 
> > if X11 backend is selected in gpu-viv-bin-mx6q :-(
> 
> Well, we could always imagine something like:
> 
> config BR2_PACKAGE_QT5BASE_XCB
>         bool "X.org XCB support"
>         depends on BR2_PACKAGE_XORG7
>         select BR2_PACKAGE_XLIB_LIBX11
>         select BR2_PACKAGE_LIBXCB
>         select BR2_PACKAGE_XCB_UTIL_IMAGE
>         select BR2_PACKAGE_XCB_UTIL_KEYSYMS
>         select BR2_PACKAGE_XCB_UTIL_WM
>         select BR2_PACKAGE_LIBXKBCOMMON
> +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11 if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
> 
> comment "X.org XCB backend available if X.org is enabled"
>         depends on !BR2_PACKAGE_XORG7
> 
> +comment "X11 backend of gpu-viv-bin-mx6q needed to enable XCB"
> +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q && !BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> 
> config BR2_PACKAGE_QT5BASE_EGLFS
>         bool "eglfs support"
>         select BR2_PACKAGE_QT5BASE_OPENGL
>         depends on BR2_PACKAGE_HAS_LIBEGL
>         depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
> 
> +comment "FB backend of gpu-viv-bin-mx6q needed to enable EGLFS"
> +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q && !BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
> 
> comment "eglfs backend available if OpenGL and EGL are enabled"
>         depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT5_GL_AVAILABLE
> 
> For sure, it's not very generic, but at least it lets the user know
> about this dependency, which is not very obvious.
> 
> But I am wondering, for the X11 output to work, don't you also need the
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV option ?
Hmmm... I believe Vivante drivers are not the only drivers with this 
problem. I am not sure mesa3d works with eglfs or RPi works with 
xcb/GLESv2.

Maybe we should find a more generic way to solve this issue.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
