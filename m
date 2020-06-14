From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 09:40:29 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: disable --as-needed linker
 flag for Codesourcery ARM 2014.05 toolchain
In-Reply-To: <20200613104708.2415431-1-romain.naour@gmail.com>
References: <20200613104708.2415431-1-romain.naour@gmail.com>
Message-ID: <20200614074029.GC2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-06-13 12:47 +0200, Romain Naour spake thusly:
> Meson build system enable by default -Wl,--as-needed [1][2] in the linker command line
> and due to this the libmesa_dri_drivers.so build fail with the Codesourcery ARM and
> Aarch64 2014.05 toolchain:

What about removing this old toolchain, now?

Ditto other old toolchains?

> In order to build mesa3d with the CodeSourcery 2014.05 using --as-needed would be
> reorder the static librairies:
> 
>  diff --git a/src/mesa/drivers/dri/meson.build b/src/mesa/drivers/dri/meson.build
>  index b09ca16e38a..9ac6731c522 100644
>  --- a/src/mesa/drivers/dri/meson.build
>  +++ b/src/mesa/drivers/dri/meson.build
>  @@ -59,7 +59,7 @@ if _dri_drivers != []
>       [],
>       link_whole : _dri_drivers,
>       link_with : [
>  -      libmegadriver_stub, libdricommon, libglapi,
>  +      libdricommon, libmegadriver_stub, libglapi,
>         libmesa_classic,
>       ],

That might make sense to push upstream, no?

> Instead, we can disable --as-needed from the meson build system using
> "-Db_asneeded=false" only for this toolchain.
> 
> [1] https://mesonbuild.com/Builtin-options.html
> [2] https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed
> 
> Fixes:
> http://autobuild.buildroot.net/results/eec39a4fbfbfaa58980fab36f2fd902a16eecf0f/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/mesa3d.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index e726bd33b3..59d96fe7c2 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -27,6 +27,12 @@ MESA3D_CONF_OPTS = \
>  	-Dgallium-omx=disabled \
>  	-Dpower8=false
>  
> +# Codesourcery ARM 2014.05 fail to link libmesa_dri_drivers.so with --as-needed linker
> +# flag due to a linker bug between binutils 2.24 and 2.25 (2.24.51.20140217).
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
> +MESA3D_CONF_OPTS += -Db_asneeded=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>  MESA3D_DEPENDENCIES += host-llvm llvm
>  MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
> -- 
> 2.25.4
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
