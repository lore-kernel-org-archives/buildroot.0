From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 29 Mar 2016 16:45:32 +0200
Subject: [Buildroot] [PATCH] freescale-imx: add
 BR2_PACKAGE_FREESCALE_IMX_HAS_VPU config
In-Reply-To: <20160329162913.276b43a6@free-electrons.com>
References: <1457535909-12591-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160329162913.276b43a6@free-electrons.com>
Message-ID: <CAAMH-ysfk8FJQ6R6TzZFOhUZc3fPYi_EZPTi6OP80YhEcCHeww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tue, Mar 29, 2016 at 4:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  9 Mar 2016 16:05:09 +0100, Gary Bisson wrote:
>> Since the imx-vpu package build is skipped if the platform doesn't
>> have a VPU, libraries dependent on the package such as libimxvpuapi
>> can fail although the imx-vpu package build went "fine".
>>
>> This patch therefore adds a BR2_PACKAGE_FREESCALE_IMX_HAS_VPU config
>> which is used in every package selecting imx-vpu directly or indrectly.
>>
>> It fixes the following build errors:
>> http://autobuild.buildroot.net/results/892/8924b17f3aa5eba1a8016d84d4478ecb0a96b236/
>> http://autobuild.buildroot.net/results/86f/86fef2a30065d5bc0d7755706e9ca3332426834d/
>> http://autobuild.buildroot.net/results/b47/b47eb03e93e2f1af85caebb707f7b4667f7e3d74/
>> http://autobuild.buildroot.net/results/4c9/4c9b22b33533132fd9f88917cc341ae2c2e171a8/
>> http://autobuild.buildroot.net/results/a8b/a8b33bfd099d9b9cd383cc568ea70846eb13c34d/
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> Thanks, I've applied. But I have some questions, see below.
>
>> ---
>> Hi all,
>>
>> This patch is the follow-up of the autobuilder failures discussion:
>> http://lists.busybox.net/pipermail/buildroot/2016-March/154989.html
>>
>> Implementing this BR2_PACKAGE_FREESCALE_IMX_HAS_VPU was actually easier
>> and not as intrusive as expected. Let me know your thoughts.
>>
>> However during the testing of this patch, I realized that old
>> platforms will be a nightmare to maintain, here are a few examples:
>> - if using IMX25_3STACK or IMX51, imx-lib will fail with the following errors:
>> iso7816-3.c:34:37: fatal error: linux/mxc_sim_interface.h: No such file or directory
>>  #include <linux/mxc_sim_interface.h>
>> - if using IMX37_3STACK or IMX50 or IMX53 or IMX27ADS, imx-lib will fail too:
>> fsl_shw_rand.c:46:24: fatal error: shw_driver.h: No such file or directory
>>  #include "shw_driver.h"
>>
>> Both issues above require to use the old 2.6.x kernels from Freescale, are
>> they even still building? All the defconfigs I see of old platforms are
>> using mainline kernel which doesn't work with those proprietary Freescale
>> packages anyway as the Yocto community explained:
>> https://github.com/Freescale/meta-fsl-arm/commit/3b698004
>> https://github.com/Freescale/meta-fsl-arm/commit/83b240e7
>
> People who want to use those Freescale specific packages are indeed
> supposed to use Freescale specific kernels. Just like it's the case for
> i.MX6 I believe, no?

Yes it is true. The difference is that the i.MX6 kernel is still
active and moving forward whereas those old platforms are stuck with a
2.6.x kernel. My understanding of Yocto move is that those 2.6 kernels
won't even build with recent toolchains (gcc > 5.1) but I might be
wrong.

> However, what I don't really understand here is whether imx-lib in its
> latest version packaged in BR will build/work fine or not for those old
> Freescale platforms (of course, provided you build the Freescale
> specific kernel that is relevant for that old platform).
>
> If the latest version of imx-lib still supports those old platforms,
> then I don't see where the problem is.

The imx-lib package will still be fine for those platforms as long as
their 2.6.x kernel can build.

> However, if imx-lib no longer supports those old platforms, then we
> indeed have a problem.
>
>> Anyway, I guess this patch can be merged as-is to fix the build issue and we
>> can later discuss the fate of older platforms once autobuilder will try a
>> config with imx-lib ;)
>
> imx-lib depends on BR2_LINUX_KERNEL, so autobuilders are never testing
> them.

Oh ok, good to know.

>> diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>> index 2ac558a..fa0e093 100644
>> --- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>> +++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>> @@ -16,7 +16,11 @@ GST_FSL_PLUGINS_INSTALL_STAGING = YES
>>  GST_FSL_PLUGINS_AUTORECONF = YES
>>
>>  GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
>> -     libfslvpuwrap imx-lib imx-vpu libfslparser libfslcodec
>> +     imx-lib libfslparser libfslcodec
>> +
>> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
>> +GST_FSL_PLUGINS_DEPENDENCIES += libfslvpuwrap
>> +endif
>
> So the gst-fsl-plugins code autodetects if libfslvpuwrap is available?

No actually in this case it will build vpu-related plugins only if the
$PLATFORM supports it.

Thanks for applying the patch.

Regards,
Gary
