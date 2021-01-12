From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 12 Jan 2021 22:52:42 +0100
Subject: [Buildroot] [RFC: 3/4]
 package/x11r7/xdriver_xf86-video-imx-viv: bump to version
 rel_imx_5.4.24_2.1.0
In-Reply-To: <20210112203211.67131ed6@gmx.net>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
 <53e43012-7460-6954-2467-dea1ddcf0be7@gmail.com> <X/xOqBw1AkEKB3SP@p1g2>
 <7856829.T7Z3S40VBb@pc-42> <2fc205fc-9dcb-7f47-1f87-f339fee6f94b@gmail.com>
 <20210112203211.67131ed6@gmx.net>
Message-ID: <0c8bb9db-d979-8508-1768-df8599416d5d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 12/01/2021 ? 20:32, Peter Seiderer a ?crit?:
> Hello Romain,
> 
> On Tue, 12 Jan 2021 12:05:58 +0100, Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Hi J?r?me,
>>
>> Thanks for your feedback!
>>
>> Le 11/01/2021 ? 15:02, J?r?me Pouiller a ?crit?:
>>> Hi Romain, Garry,
>>>
>>> On Monday 11 January 2021 14:12:08 CET Gary Bisson wrote:  
>>>> On Sun, Jan 10, 2021 at 06:46:38PM +0100, Romain Naour wrote:  
>>>>> Le 07/01/2021 ? 12:04, Romain Naour a ?crit :  
>>>>>> This package needs to be updated to build with the NXP imx_5.4.x_2.1.0 release.
>>>>>>
>>>>>> Don't override CFLAGS on the command line otherwise we loose some include paths
>>>>>> (ex: -I./vivante_gal).
>>>>>> CFLAGS is already provided by TARGET_CONFIGURE_OPTS in make environment.  
>>>>>
>>>>> What's the status of vivante gpu support for X11 ? especially for kernel >= 5.4.  
>>>>
>>>> Don't know. To be honest, i.MX6 will soon be a legacy product for NXP
>>>> releases so I strongly suggest moving to mainline + Etnaviv.  
>>>
>>> Same here, I haven't worked on iMX6 for a while. The last teams I know who develop
>>> new iMX6 designs use Etnaviv..  
>>
>> I haven't worked a lot for customer on iMX6, but each time they used Yocto and
>> NXP BSP. Last time I tried to use Etnaviv with linux-imx, the kernel build was
>> broken.
>>
> 
> On a past project I worked on a iMX6 platform with etnaviv (using Qt eglfs and
> qtquickcontrols for the GUI and GStreamer for video/audio recording/streaming)
> using mainline linux kernel...., worked very well...

Yes, as soon as you use a mainline kernel with Etnaviv it should work as
expected. My point is when you use a linux-imx from NXP BSP (that was changed to
use vivante) and try to enable etnaviv. I had some build issues.


I just finished to configure the xserver to use etnaviv (mainline kernel and
mesa3d):

# glxinfo -B -display :0
name of display: :0
display: :0  screen: 0
direct rendering: Yes
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: etnaviv (0xffffffff)
    Device: Vivante GC2000 rev 5108 (0xffffffff)
    Version: 20.3.2
    Accelerated: yes
    Video memory: 0MB
    Unified memory: yes
    Preferred profile: compat (0x2)
    Max core profile version: 0.0
    Max compat profile version: 1.3
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 2.0
OpenGL vendor string: etnaviv
OpenGL renderer string: Vivante GC2000 rev 5108
OpenGL version string: 1.3 Mesa 20.3.2

OpenGL ES profile version string: OpenGL ES 2.0 Mesa 20.3.2
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 1.0.16

I just had to backport one patch to xserver 1.20.10:

https://cgit.freedesktop.org/xorg/xserver/commit/?id=26004df63c25061586a967f3586795a75280acc2

Surprisingly etnaviv driver expose OpenGL 1.3 while the vivante driver expose
OpenGL 3.1:

(Debian buster image)
$ glxinfo -B
name of display: :0.0
display: :0  screen: 0
direct rendering: Yes
OpenGL vendor string: Vivante Corporation
OpenGL renderer string: Vivante GC2000
OpenGL version string: 3.1 V6.2.4.p4.190076
OpenGL shading language version string: 3.00
OpenGL context flags: (none)


Best regards,
Romain


> 
> Regards,
> Peter
> 
