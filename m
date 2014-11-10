From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 10 Nov 2014 11:43:50 -0800
Subject: [Buildroot] [PATCH v3] gst1-imx: add package
In-Reply-To: <5460F657.8000301@lucaceresoli.net>
References: <1415506111-21818-1-git-send-email-bisson.gary@gmail.com>
 <5460F657.8000301@lucaceresoli.net>
Message-ID: <54611576.3000803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 11/10/2014 09:31 AM, Luca Ceresoli wrote:
> Dear Gary,
>
> Gary Bisson wrote:
>> [snip]
>> $ gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>> $ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>> matroskademux ! imxvpudec ! imxipusink
>> $ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>> matroskademux ! imxvpudec ! imxeglvivsink
>
> I tested it on i.MX6DL SABRESD (not Quad), based on
> freescale_imx6dlsabresd_defconfig, but with libc changed to glibc.
> All the three pipelines you provided work, with the first one eating up
> ~30% of CPU time, while the other two ones take only 2~3% CPU only (but
> play no audio of course).

Good to hear everything worked out. Thanks for checking CPU consumption, 
although 30% seems high for audio handling we can clearly see the video 
is decoded through the VPU.

> [snip]
> Sorry for coming back on the comments issue, but...
>
> I simulated a newbie wanting to use gst1-imx:
>  - make freescale_imx6dlsabresd_defconfig
>  - make menuconfig
>  - go to target packages -> audio/video, look for gst1
>    -> "gstreamer 1.x needs a toolchain w/ wchar, threads" is shown
>  - change toolchain settings to enable wchar
>  - go to target packages -> audio/video, enable gst1
>    -> "gst1-imx needs an (e)glibc toolchain" is shown
>  - change toolchain settings to use glibc
>  - go back to target packages -> audio/video
>    -> gst1-imx disappeared, no comments shown
>       -> user panic!
>
> Well, I don't remember exactly how we came to the conclusion that some
> of the comments should be removed, but I think they should have not.
>
> The BR2_PACKAGE_LIBFSLVPUWRAP and BR2_PACKAGE_GPU_VIV_BIN_MX6Q
> dependencies are software packages, not architecture features, so they
> are user-selectable and thus should show a comment when not satisfied.

Yes that is exactly why I've put comments in the first place. Yann 
wasn't a huge fan of that solution and I understand it [1]. The best 
would be to find another approach to be able to do the select.

> However, to me this patch is an improvement and could be merged as-is,
> and the comments re-added later if discussions on this point does not
> settle quickly. Gary seems very responsive and willing to have a good
> support for this package, so I guess he will keep on.
>
>> +
>> +config BR2_PACKAGE_GST1_IMX
>> +    bool "gst1-imx"
>> +    depends on BR2_LINUX_KERNEL
>
> As per Arnout's suggestion on v2, there should be a # libfslvpuwrap
> here.

Actually I think this should not be added as this package also needs the 
kernel headers for IPU use (see source code under src/ipu).

> With that fixed:
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Thanks,
Gary

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/109264.html
