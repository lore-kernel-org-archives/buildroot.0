From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Jun 2020 19:05:37 +0200
Subject: [Buildroot] [PATCH v3 6/9] package/minetest: do not select
 luajit
In-Reply-To: <20200525004845.3019642-6-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-6-james.hilliard1@gmail.com>
Message-ID: <9bd512a3-e010-62d9-4fe2-841e25abaae5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

Le 25/05/2020 ? 02:48, James Hilliard a ?crit?:
> Since luajit is not a requirement for minetest we should not select it
> instead we should conditionally use it when available.

I never tested minetest without Luajit since I'm testing with a target using efl
+ enlightenment that already depend on luajit.

There is only Debian that still support Lua 5.1 for minetest, other distribution
dropped Lua 5.1 support.

[Luajit or Lua 5.1]
https://salsa.debian.org/games-team/minetest/-/blob/master/debian/control#L22

[Luajit support only]
https://src.fedoraproject.org/rpms/minetest/blob/f32/f/minetest.spec#_38
https://www.archlinux.org/packages/community/x86_64/minetest/

Not only for minetest package but for other packages in this series, what's the
benefit of adding back Lua 5.1 ? Sure Luajit has some architecture dependencies
compared to Lua... but the Lua ABI version handling is a nightmare.

Best regards,
Romain

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/minetest/Config.in   |  4 ----
>  package/minetest/minetest.mk | 10 ++++++++--
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/minetest/Config.in b/package/minetest/Config.in
> index 085525534d..19da290df4 100644
> --- a/package/minetest/Config.in
> +++ b/package/minetest/Config.in
> @@ -5,11 +5,9 @@ config BR2_PACKAGE_MINETEST
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_XORG7 # irrlicht
>  	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
> -	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	select BR2_PACKAGE_IRRLICHT
>  	select BR2_PACKAGE_GMP
>  	select BR2_PACKAGE_JSONCPP
> -	select BR2_PACKAGE_LUAJIT
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_ZLIB
>  	# At least one option must be enabled
> @@ -53,13 +51,11 @@ comment "sound support needs a toolchain w/ threads NPTL"
>  endif
>  
>  comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
> -	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS
>  
>  comment "minetest needs X11 and an OpenGL provider"
> -	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	depends on (BR2_INSTALL_LIBSTDCPP \
>  		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
>  		&& BR2_TOOLCHAIN_HAS_THREADS)
> diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
> index e8fe5b45ce..c0301273be 100644
> --- a/package/minetest/minetest.mk
> +++ b/package/minetest/minetest.mk
> @@ -9,12 +9,11 @@ MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
>  MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
>  MINETEST_LICENSE_FILES = LICENSE.txt
>  
> -MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
> +MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp sqlite zlib
>  
>  MINETEST_CONF_OPTS = \
>  	-DDEFAULT_RUN_IN_PLACE=OFF \
>  	-DENABLE_GLES=OFF \
> -	-DENABLE_LUAJIT=ON \
>  	-DENABLE_CURSES=OFF \
>  	-DAPPLY_LOCALE_BLACKLIST=OFF \
>  	-DENABLE_SYSTEM_GMP=ON \
> @@ -75,6 +74,13 @@ else
>  MINETEST_CONF_OPTS += -DENABLE_SPATIAL=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +MINETEST_DEPENDENCIES += luajit
> +MINETEST_CONF_OPTS += -DENABLE_LUAJIT=ON
> +else
> +MINETEST_CONF_OPTS += -DENABLE_LUAJIT=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
>  MINETEST_DEPENDENCIES += postgresql
>  MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=ON
> 
