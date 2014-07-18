From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Jul 2014 22:48:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] ti-gfx: add patch to fix build
	failure with es5.x
In-Reply-To: <1405701996-25351-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1405701996-25351-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140718204846.GE3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien, All,

On 2014-07-18 18:46 +0200, Hadrien Boutteville spake thusly:
> Since commit a73fdc647417699833f22d0f239affe22e062827 in the kernel,
> omap_dss_device's 'output' is renamed 'src'.
> 
> Build with es5.x fails because ti-gfx still uses 'output'.
> 
> Fix build with at least es5.x selected (AM35xx).
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - add a condition on LINUX_VERSION_CODE (Thomas)
> ---
>  .../ti-gfx-0001-fix-build-omaplfb-linux.patch       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch
> 
> diff --git a/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch b/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch
> new file mode 100644
> index 0000000..002d01c
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch
> @@ -0,0 +1,21 @@
> +Since commit a73fdc647417699833f22d0f239affe22e062827 in the kernel,
> +omap_dss_device's 'output' is renamed 'src'.
> +
> +Fix build with at least es5.x selected (AM35xx).
> +
> +Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> +
> +--- a/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c
> ++++ b/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c
> +@@ -176,8 +176,10 @@
> + #define OMAP_DSS_DRIVER(drv, dev) struct omap_dss_driver *drv = (dev) != NULL ? (dev)->driver : NULL
> + #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0))
> + #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->manager : NULL
> +-#else
> ++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(3,12,0))
> + #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->output->manager : NULL
> ++#else
> ++#define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->src->manager : NULL
> + #endif
> + 
> + #define	WAIT_FOR_VSYNC(man)	((man)->wait_for_vsync)
> -- 
> 2.0.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
