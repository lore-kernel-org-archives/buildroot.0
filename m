From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 17:18:14 +0200
Subject: [Buildroot] [RFC/PATCH 1/1] gst-fsl-plugins: fix compile for
 sysroot based on newer linux kernel headers
In-Reply-To: <1393366722-27644-2-git-send-email-ps.report@gmx.net>
References: <1393366722-27644-1-git-send-email-ps.report@gmx.net>
 <1393366722-27644-2-git-send-email-ps.report@gmx.net>
Message-ID: <20141006171814.378d6558@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

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

I believe this problem has been fixed by the following commit:

commit daf3708be46d7eb7e9352ee987f37e32eb00c6bd
Author: Gary Bisson <bisson.gary@gmail.com>
Date:   Fri Jul 25 22:34:30 2014 -0700

    gst-fsl-plugins: fix build for kernel headers >= 3.10
    
    This package couldn't build using a toolchain with kernel headers >=
    3.10 because of the use of VIDIOC_DBG_G_CHIP_IDENT. As stated in
    videodev2.h, this ioctl should never be used.
    
    Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Therefore, I'm marking your patch as Superseded in our patch tracking
system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
