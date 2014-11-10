From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 10 Nov 2014 18:31:03 +0100
Subject: [Buildroot] [PATCH v3] gst1-imx: add package
In-Reply-To: <1415506111-21818-1-git-send-email-bisson.gary@gmail.com>
References: <1415506111-21818-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <5460F657.8000301@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary,

Gary Bisson wrote:
> Open-source GStreamer 1.0 plugins for i.MX6 platforms.
> More info at https://github.com/Freescale/gstreamer-imx
>
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Modifications v2->v3:
> - Change package name from gst1-plugins-imx to gst1-imx
> - Remove commands unnecessary parentheses
> - Modify package comment to clarify it is only working on i.MX6
>
> Modifications v1->v2:
> - Use of github helper macro
> - Modify package comment with Peter S. original patch
> - Add comment for eglibc dependency (due to GPU libs)
> - Remove comments on package dependencies
>
> This patch has been tested using an i.MX6Q SabreLite (nitrogen6x config) along
> with the usual Tears of Steel movie in 1080p:
> http://media.xiph.org/mango/tears_of_steel_1080p.webm
>
> Below are the commands used to test the different sinks:
>
> $ gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
> $ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
> matroskademux ! imxvpudec ! imxipusink
> $ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
> matroskademux ! imxvpudec ! imxeglvivsink

I tested it on i.MX6DL SABRESD (not Quad), based on
freescale_imx6dlsabresd_defconfig, but with libc changed to glibc.
All the three pipelines you provided work, with the first one eating up
~30% of CPU time, while the other two ones take only 2~3% CPU only (but
play no audio of course).

A couple of comments below.

> diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
> new file mode 100644
> index 0000000..6bdbb6c
> --- /dev/null
> +++ b/package/gstreamer1/gst1-imx/Config.in
> @@ -0,0 +1,25 @@
> +comment "gst1-imx needs an imx-specific Linux kernel to be built"
> +	depends on BR2_arm && !BR2_LINUX_KERNEL
> +
> +# Required by gpu-viv-bin-mx6q
> +comment "gst1-imx needs an (e)glibc toolchain"
> +	depends on BR2_arm
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

Sorry for coming back on the comments issue, but...

I simulated a newbie wanting to use gst1-imx:
  - make freescale_imx6dlsabresd_defconfig
  - make menuconfig
  - go to target packages -> audio/video, look for gst1
    -> "gstreamer 1.x needs a toolchain w/ wchar, threads" is shown
  - change toolchain settings to enable wchar
  - go to target packages -> audio/video, enable gst1
    -> "gst1-imx needs an (e)glibc toolchain" is shown
  - change toolchain settings to use glibc
  - go back to target packages -> audio/video
    -> gst1-imx disappeared, no comments shown
       -> user panic!

Well, I don't remember exactly how we came to the conclusion that some
of the comments should be removed, but I think they should have not.

The BR2_PACKAGE_LIBFSLVPUWRAP and BR2_PACKAGE_GPU_VIV_BIN_MX6Q
dependencies are software packages, not architecture features, so they
are user-selectable and thus should show a comment when not satisfied.

However, to me this patch is an improvement and could be merged as-is,
and the comments re-added later if discussions on this point does not
settle quickly. Gary seems very responsive and willing to have a good
support for this package, so I guess he will keep on.

> +
> +config BR2_PACKAGE_GST1_IMX
> +	bool "gst1-imx"
> +	depends on BR2_LINUX_KERNEL

As per Arnout's suggestion on v2, there should be a # libfslvpuwrap
here.

With that fixed:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
