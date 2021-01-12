From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 12 Jan 2021 12:05:58 +0100
Subject: [Buildroot] [RFC: 3/4]
 package/x11r7/xdriver_xf86-video-imx-viv: bump to version
 rel_imx_5.4.24_2.1.0
In-Reply-To: <7856829.T7Z3S40VBb@pc-42>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
 <53e43012-7460-6954-2467-dea1ddcf0be7@gmail.com> <X/xOqBw1AkEKB3SP@p1g2>
 <7856829.T7Z3S40VBb@pc-42>
Message-ID: <2fc205fc-9dcb-7f47-1f87-f339fee6f94b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

Thanks for your feedback!

Le 11/01/2021 ? 15:02, J?r?me Pouiller a ?crit?:
> Hi Romain, Garry,
> 
> On Monday 11 January 2021 14:12:08 CET Gary Bisson wrote:
>> On Sun, Jan 10, 2021 at 06:46:38PM +0100, Romain Naour wrote:
>>> Le 07/01/2021 ? 12:04, Romain Naour a ?crit :
>>>> This package needs to be updated to build with the NXP imx_5.4.x_2.1.0 release.
>>>>
>>>> Don't override CFLAGS on the command line otherwise we loose some include paths
>>>> (ex: -I./vivante_gal).
>>>> CFLAGS is already provided by TARGET_CONFIGURE_OPTS in make environment.
>>>
>>> What's the status of vivante gpu support for X11 ? especially for kernel >= 5.4.
>>
>> Don't know. To be honest, i.MX6 will soon be a legacy product for NXP
>> releases so I strongly suggest moving to mainline + Etnaviv.
> 
> Same here, I haven't worked on iMX6 for a while. The last teams I know who develop
> new iMX6 designs use Etnaviv..

I haven't worked a lot for customer on iMX6, but each time they used Yocto and
NXP BSP. Last time I tried to use Etnaviv with linux-imx, the kernel build was
broken.

> 
>>> Because it's currently broken with several issues:
>>>
>>> 0) glxinfo fail to report OpenGL informations
>>>
>>> # glxinfo -B -display :0
>>> name of display: :0
>>> Error: glXMakeCurrent failed
>>> X Error of failed request:  GLXBadContext
>>>   Major opcode of failed request:  148 (GLX)
>>>   Minor opcode of failed request:  4 (X_GLXDestroyContext)
>>>   Serial number of failed request:  20
>>>   Current serial number in output stream:  25
>>> Perform final cleanup before process termination!
>>>
>>> (I'm using a patch that replace glWindowPos2iARB calls with glWindowPos2i:
>>> https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-graphics/mesa/mesa-demos/Replace-glWindowPos2iARB-calls-with-glWindowPos2i.patch)
>>
>> Have you tried NXP pre-built image from latest release? Although it
>> seems they now use Wayland/XWayland. Yet it'd be surprising they'd
>> release a broken X11 package.
> 
> As far as remember, imx-gpu-viv has never provided a working GLX stack (it
> only provides EGL/GLes and X11 2D acceleration). Yocto automatically
> provided swrast to support GLX. For Buildroot,
> 
> I remember I found confusing to install swrast automatically. I preferred
> the user manually selects swrast instead.

Yes, Buildroot doesn't support installing two virtual package provider in the
same config.

> 
> [...]
>>> It means that we really need two LIBGL providers enabled at the same time in the
>>> Buildroot configuration.
>>
>> OpenGL is another issue though, you can get X11 working without it. But
>> yes the implementation on libGL from imx-gpu-viv is messy. Thomas did
>> implement it once but never submitted it as the change was pretty
>> intrusive & hacky.
> 
> I think you can consider that imx-gpu-viv is a EGL and GLES provider, but
> it is not a GL provider.

I believe we have to remove LIBGL support from imx-gpu-viv entirely and avoid
installing it.

Best regards,
Romain

> 
> 
> --
> J?r?me Pouiller
> 
> 
