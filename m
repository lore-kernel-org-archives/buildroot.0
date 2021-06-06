From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 09:34:32 +0200
Subject: [Buildroot] [PATCH]
 configs/minnowboard_max-graphical_defconfig: unbreak X11/mesa
In-Reply-To: <20210606070522.13728-1-peter@korsgaard.com>
References: <20210606070522.13728-1-peter@korsgaard.com>
Message-ID: <20210606073432.GF168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-06-06 09:05 +0200, Peter Korsgaard spake thusly:
> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337965
> 
> Commit 15a2f9b819806d38a7d8172a2 (package/{mesa3d, mesa3d-headers}: bump
> version to 21.0.2) marked BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST as legacy,
> but forgot to update the defconfig.  The SW rasterizer isn't really needed
> with the Intel GPU, so just drop it.
> 
> In addition, X11 now needs some help with loading the modules in the correct
> order, similar to how it was done for the test in commit 4a3639bad01a
> (support/testing: test_glxinfo load X11 modules in the right order).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../etc/X11/xorg.conf.d/01-modules.conf               | 11 +++++++++++
>  configs/minnowboard_max-graphical_defconfig           |  1 -
>  2 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
> 
> diff --git a/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf b/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
> new file mode 100644
> index 0000000000..91659baa65
> --- /dev/null
> +++ b/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
> @@ -0,0 +1,11 @@
> +
> +# Xorg does not implement real dynamic linking and requires that its
> +# modules get loaded in the right order.
> +# https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
> +Section "Module"
> +   Load "vgahw"
> +   Load "fb"
> +   Load "shadowfb"
> +   Load "int10"
> +   Load "vbe"
> +EndSection
> diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
> index 3b769ca6e7..051c7584dc 100644
> --- a/configs/minnowboard_max-graphical_defconfig
> +++ b/configs/minnowboard_max-graphical_defconfig
> @@ -40,7 +40,6 @@ BR2_PACKAGE_ALSA_UTILS_APLAY=y
>  BR2_PACKAGE_GLMARK2=y
>  BR2_PACKAGE_MESA3D_DEMOS=y
>  BR2_PACKAGE_MESA3D=y
> -BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
>  BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
>  BR2_PACKAGE_MESA3D_OPENGL_GLX=y
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
