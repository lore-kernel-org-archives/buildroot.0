From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 15:26:56 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: test_glxinfo load X11
 modules in the right order
In-Reply-To: <20210513141149.3154510-2-romain.naour@gmail.com>
References: <20210513141149.3154510-1-romain.naour@gmail.com>
 <20210513141149.3154510-2-romain.naour@gmail.com>
Message-ID: <20210518132656.GN2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-13 16:11 +0200, Romain Naour spake thusly:
> From [1]
> "Xorg does not implement real dynamic linking and requires that its
> modules get loaded in the right order."
> 
> From /var/log/Xorg.0.0.log:
>  (II) LoadModule: "modesetting"
>  (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
>  (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661899
> 
> [1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_glxinfo.py         |  4 +++-
>  .../etc/X11/xorg.conf.d/01-modules.conf               | 11 +++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
> 
> diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
> index 44ac92347a..3417e48612 100644
> --- a/support/testing/tests/package/test_glxinfo.py
> +++ b/support/testing/tests/package/test_glxinfo.py
> @@ -32,7 +32,9 @@ class TestGlxinfo(infra.basetest.BRTest):
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>          BR2_TARGET_ROOTFS_EXT2=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> -        """
> +        BR2_ROOTFS_OVERLAY="{}"
> +        """.format(
> +          infra.filepath("tests/package/test_glxinfo/rootfs-overlay"))
>  
>      def wait_for_xserver(self):
>          # xserver takes some time to start up
> diff --git a/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf b/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
> new file mode 100644
> index 0000000000..c693c213f5
> --- /dev/null
> +++ b/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
> @@ -0,0 +1,11 @@
> +
> +# Xorg does not implement real dynamic linking and requires that its
> +# modules get loaded in the right order.
> +# https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
> +Section "Module"
> +   Load "vgahw"
> +   Load "fb"
> +   Load "shadowfb"
> +   Load "shadow"
> +   Load "glamoregl"
> +EndSection
> -- 
> 2.31.1
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
