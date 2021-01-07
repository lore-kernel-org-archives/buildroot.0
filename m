From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 7 Jan 2021 21:19:19 +0100
Subject: [Buildroot] [RFC: 1/4] package/freescale-imx/imx-gpu-viv:
 BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_{X11, WL} are libgl provider
In-Reply-To: <20210107170429.GM1485369@scaer>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
 <20210107170429.GM1485369@scaer>
Message-ID: <d3eef2e7-13c2-773a-40ea-f3418f0adf1e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 07/01/2021 ? 18:04, Yann E. MORIN a ?crit?:
> romain, All,
> 
> On 2021-01-07 12:04 +0100, Romain Naour spake thusly:
>> libGL.so is installed when BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 or BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>> is selected, so declare it as a libgl provider.
> 

We are speaking about patch 2/4:
http://lists.busybox.net/pipermail/buildroot/2021-January/300221.html

> I don;t think this is a good solution. At the very best it is a poor
> workaround...

Well, the real purpose of this patch is to explain the issue.

> 
> mesa3d will not install its headers if opengl is not enabled.
> 
> However, we always enable openGL:
> 
>     https://git.buildroot.org/buildroot/tree/package/mesa3d/mesa3d.mk#n160
> 
>     # Always enable OpenGL:
>     #   - Building OpenGL ES without OpenGL is not supported, so alway keep opengl enabled.
> 
> The first part of thet comment was added back in 2014-04-2, with commit
> 384d601d4ea (package/mesa3d: always enable openGL, by your's truly), and
> the second part was just an amendment to that, when we switched to using
> meson as buildsystem, with commit f0483751dfa (package/mesa3d: switch
> build system to meson).

Indeed

> 
> So, the initial rationale for always enabling openGL is very old, and
> mesa3d has changed quite a lot since then, so I'd like that we revisit
> that assertion in the light of the new meson-based buildsystem.
> 
> And if imx-gpu-viv is enabled but mesa3d is not, then it would be
> missing the GL headers. As such, it seems that mesa3d-headers should
> then be used to provide those headers.

imx-gpu-viv provides GL headers but for some reason mesa3d is needed to build
xorg with glx/dri (see xdriver_xf86-video-imx-viv package).

> 
> Unfortunately, we've made mesa3d-headers and mesa3d to conflict on
> purpose.
> 
> But then does it make sense to have both imx-gpu-viv and mesa3d enabled
> at the same time in the same configuration?

Well, that what meta-freescale do in order to build X11 image w/ GLX.

The debian 10.2 image for nitrogen6x (sabrelite) contain both mesa and imx gpu
firmware (as far I can see):

https://boundarydevices.com/debian-buster-10-2-for-i-mx6-7-boards-december-2019-kernel-4-14-x/

> 
> I.e. isn't the solution to that issue for imx-gpu-viv to select and
> build-depend on mesa3d-headers when it needs the GL headers?

I tried to remove mesa3d and use mesa3d-headers but it doesn't build.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>>
>> Not related to this patch but mesa3d-demo doesn't build with imx-gpu-viv
>> as GL provider. meta-freescale provide a patch that replace glWindowPos2iARB
>> calls with glWindowPos2i but it was rejected by upstream.
>>
>> https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-graphics/mesa/mesa-demos/Replace-glWindowPos2iARB-calls-with-glWindowPos2i.patch
>> ---
>>  package/freescale-imx/imx-gpu-viv/Config.in      | 6 ++++++
>>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 4 ++--
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
>> index cca2689905..4e53044d1d 100644
>> --- a/package/freescale-imx/imx-gpu-viv/Config.in
>> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
>> @@ -44,6 +44,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
>>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE
>>  	select BR2_PACKAGE_XLIB_LIBXEXT
>>  	select BR2_PACKAGE_XLIB_LIBXFIXES
>> +	select BR2_PACKAGE_HAS_LIBGL # libGL-x11.so
>>  
>>  comment "X11 backend needs Xorg package"
>>  	depends on !BR2_PACKAGE_XORG7
>> @@ -60,6 +61,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>>  	select BR2_PACKAGE_LIBDRM
>>  	select BR2_PACKAGE_WAYLAND
>>  	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>> +	select BR2_PACKAGE_HAS_LIBGL # libGL-wl.so
>>  
>>  endchoice
>>  
>> @@ -72,6 +74,10 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
>>  config BR2_PACKAGE_PROVIDES_LIBEGL
>>  	default "imx-gpu-viv"
>>  
>> +config BR2_PACKAGE_PROVIDES_LIBGL
>> +	default "imx-gpu-viv" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 || \
>> +		BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>> +
>>  config BR2_PACKAGE_PROVIDES_LIBGLES
>>  	default "imx-gpu-viv"
>>  
>> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>> index 6ae9aa7acc..f03415b336 100644
>> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>> @@ -61,7 +61,7 @@ endif
>>  
>>  ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
>>  define IMX_GPU_VIV_FIXUP_PKGCONFIG
>> -	for lib in egl gbm glesv1_cm glesv2 vg; do \
>> +	for lib in egl gbm glesv1_cm glesv2 gl vg; do \
>>  		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc || exit 1; \
>>  	done
>>  endef
>> @@ -70,7 +70,7 @@ endif
>>  define IMX_GPU_VIV_INSTALL_STAGING_CMDS
>>  	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
>>  	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
>> -	for lib in egl gbm glesv1_cm glesv2 vg; do \
>> +	for lib in egl gbm glesv1_cm glesv2 gl vg; do \
>>  		$(INSTALL) -m 0644 -D \
>>  			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
>>  			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
>> -- 
>> 2.25.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
