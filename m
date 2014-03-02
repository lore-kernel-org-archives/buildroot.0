From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 09:48:59 +0100
Subject: [Buildroot] [RFC/PATCH 1/1] gst-fsl-plugins: fix compile for
 sysroot based on newer linux kernel headers
In-Reply-To: <1393366722-27644-2-git-send-email-ps.report@gmx.net>
References: <1393366722-27644-1-git-send-email-ps.report@gmx.net>
 <1393366722-27644-2-git-send-email-ps.report@gmx.net>
Message-ID: <20140302094859.66470cdc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Since you originally added the package with -idirafter, can you comment
on the below patch? To me it makes sense that if the package needs
special kernel headers, it should use first the headers from the kernel
and then only the sysroot headers. Am I missing something that lead you
to the usage of -idirafter?

See the patch below.

Thanks!

Thomas

On Tue, 25 Feb 2014 23:18:42 +0100, Peter Seiderer wrote:
> The v4l2 ioctl VIDIOC_DBG_G_CHIP_IDENT was removed in linux-3.11 (see [1]/[2]).
> 
> To avoid build failure of the gst-fsl-plugins/mfw_gst_v4lsrc with toolchains based
> on newer linux kernel headers this patch gives the include of the custom linux
> kernel headers precedence over the sysroot linux kernel headers (oposed to the
> previous behavior).
> 
> Fixes the following compile error with buildroot/glibc toolchain:
> 
> mfw_gst_v4lsrc.c: In function 'mfw_gst_v4lsrc_capture_setup':
> mfw_gst_v4lsrc.c:452:10: error: variable 'chip' has initializer but incomplete type
>    struct v4l2_dbg_chip_ident chip = {0};
>           ^
> mfw_gst_v4lsrc.c:452:10: warning: excess elements in struct initializer [enabled by default]
> mfw_gst_v4lsrc.c:452:10: warning: (near initialization for 'chip') [enabled by default]
> mfw_gst_v4lsrc.c:452:30: error: storage size of 'chip' isn't known
>    struct v4l2_dbg_chip_ident chip = {0};
>                               ^
> mfw_gst_v4lsrc.c:464:22: error: 'VIDIOC_DBG_G_CHIP_IDENT' undeclared (first use in this function)
>    if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
>                       ^
> 
> [1] http://www.spinics.net/lists/linux-media/msg64081.html
> [2] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/uapi/linux/videodev2.h?id=b71c99801e18eb172ae34851daf25044a3bf644a
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> index ccdb521..610bd78 100644
> --- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> +++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> @@ -23,7 +23,7 @@ GST_FSL_PLUGINS_CONF_ENV = PLATFORM=$(BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM)
>  
>  # needs access to imx-specific kernel headers
>  GST_FSL_PLUGINS_DEPENDENCIES += linux
> -GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include"
> +GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(LINUX_DIR)/include"
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
>  GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
