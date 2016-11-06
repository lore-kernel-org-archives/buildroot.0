From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:46:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Remove opengl headers
 files if opengl support is disabled
In-Reply-To: <20161106181100.10976-1-bernd.kuhls@t-online.de>
References: <20161106181100.10976-1-bernd.kuhls@t-online.de>
Message-ID: <20161106224623.07bb117f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 19:11:00 +0100, Bernd Kuhls wrote:
> Mesa3d used to install GL/gl.h & co. only if libGL.so was installed.
> 
> After this commit
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=13.0&id=a89faa2022fd995af2019c886b152b49a01f9392
> 
> this is no longer the case leading to misdetection of opengl support by
> vlc if mesa3d was built before:
> 
> http://git.videolan.org/?p=vlc.git;a=blob;f=configure.ac;h=c8900d216540816224e872bef46fbcc93d83ca41;hb=HEAD#l3010
> 
> This patch partly re-introduces a mechanism to clean unwanted files
> installed by mesa3d which was removed when bumping to 12.0.0:
> https://git.buildroot.net/buildroot/commit/package/mesa3d?id=ff3e522e748925f6be5732a6e5df6553468ca0a1
> 
> Fixes
> http://autobuild.buildroot.net/results/13e/13e7c0f5fc6ae8ba5e62b2597d188496c64090fd/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you report this issue upstream? I think it's not normal for
mesa3d to install the OpenGL headers if it doesn't install libGL.so.


> +define MESA3D_REMOVE_OPENGL_HEADERS
> +	rm -rf $(STAGING_DIR)/usr/include/GL/
> +endef

I've moved this...

> +
>  # libGL is only provided for a full xorg stack
>  ifeq ($(BR2_PACKAGE_XORG7),y)
>  MESA3D_PROVIDES += libgl
> +else

... here, so that it is next to where it's actually used.

> +MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
>  endif

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
