From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 23:10:52 +0100
Subject: [Buildroot] [PATCH v2 5/7] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.0.p1.0
In-Reply-To: <20200203193155.12657-5-tuzakli.refik@gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-5-tuzakli.refik@gmail.com>
Message-ID: <20200204231052.350677e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Gary, there is a question for you below.)

On Mon,  3 Feb 2020 22:31:53 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>

I've applied, but with some changes, and they may need further work
from you. See below.

>  define IMX_GPU_VIV_BUILD_CMDS
>  	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
> -	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so
> -	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1
> -	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
> +	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so
> +	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1
> +	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2
> +	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2.0

The libGL is only available for the wl and x11 backends, not for the fb
backend, so these statements were creating broken symlinks when fb was
the selected backend. So I've added some conditional to only do that
when wl or x11 is used.

>  	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
>  	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
>  	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
> @@ -115,7 +116,7 @@ define IMX_GPU_VIV_INSTALL_TARGET_CMDS
>  	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
>  	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
>  	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
> -	for lib in EGL GAL GLESv2 VDK; do \
> +	for lib in EGL GAL GL GLESv2 VDK vulkan; do \

I have dropped this change. Indeed, the package was not updated to
reflect that it also provides GL support, and there is no really
organized Vulkan support in Buildroot today (except in mesa3d). So
adding these need more work, and should be done in separate commits.

Generally, I am surprised of the "fixes" done to libGL in BUILDS_CMDS
since anyway libGL does not get installed. It was like that, so I kept
it as it is, but I'm not sure why we did that. Gary, do you remember ?

>  		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
>  			case $$f in \
>  				*-$(IMX_GPU_VIV_LIB_TARGET).so) : ;; \

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
