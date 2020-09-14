From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Sep 2020 22:04:07 +0200
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200914200407.GB8792@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2019-12-04 16:02 +0100, Thomas Petazzoni spake thusly:
> Currently, the cross-compilation.conf installed in
> $(HOST_DIR)/etc/meson/cross-compilation.conf for use by the SDK is
> generated in a post-install-staging hook of the toolchain package.
> 
> With per-package directory support enabled, this means that the
> generated cross-compilation.conf contains references to the
> per-package directory of the toolchain/ package, which is not want we
> want:
> 
> [binaries]
> c = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-gcc'
> cpp = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-g++'
> ar = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-ar'
> strip = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-strip'
> pkgconfig = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/usr/bin/pkg-config'
> 
> So instead, we generate this file in TOOLCHAIN_TARGET_FINALIZE_HOOKS,
> so that the global paths are used:
> 
> [binaries]
> c = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc'
> cpp = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-g++'
> ar = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-ar'
> strip = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-strip'
> pkgconfig = '/home/thomas/projets/buildroot/output/host/usr/bin/pkg-config'
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

After giving it quite some thoughts, I think we do not want to provide
any guarantee about the stableness of target/ vs. host/ on a partial
rebuild, like Thomas P. said.

As such, I have applied this patch now.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index e7eea2aa58..085da219fe 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -205,4 +205,4 @@ define PKG_MESON_INSTALL_CROSS_CONF
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
>  endef
>  
> -TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> +TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> -- 
> 2.23.0
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
