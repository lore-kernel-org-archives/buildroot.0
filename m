From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2020 21:34:35 +0100
Subject: [Buildroot] [PATCH] package/toolchain: bumb ARC tools to
 arc-2019.09 release
In-Reply-To: <20200116072242.10524-1-Evgeniy.Didin@synopsys.com>
References: <20200116072242.10524-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200117203435.GM22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evgeniy, All,

On 2020-01-16 10:22 +0300, Evgeniy Didin spake thusly:
> This commit bumps ARC toolchain to most recent arc-2019.09 release version.
> 
> ARC GNU tools of version arc-2019.09 bring some quite significant changes like:
> * Binutils v2_33.20191002 with additional ARC patches
> * GCC 9.2.1 with additional ARC patches
> * glibc 2.30 with additional ARC patches
> 
> More information on this release could be found here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.09-release
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/binutils/Config.in.host                                       | 2 +-
>  .../0001-poison-system-directories.patch                              | 0
>  package/binutils/binutils.hash                                        | 2 +-
>  package/binutils/binutils.mk                                          | 4 ++--
>  package/gcc/Config.in.host                                            | 2 +-
>  .../{arc-2019.09-rc1 => arc-2019.09-release}/0100-uclibc-conf.patch   | 0
>  package/gcc/gcc.hash                                                  | 2 +-
>  package/gdb/Config.in.host                                            | 2 +-
>  package/gdb/gdb.hash                                                  | 2 +-
>  package/glibc/{arc-2019.09-rc1 => arc-2019.09-release}/glibc.hash     | 2 +-
>  package/glibc/glibc.mk                                                | 2 +-
>  11 files changed, 10 insertions(+), 10 deletions(-)
>  rename package/binutils/{arc-2019.09-rc1 => arc-2019.09-release}/0001-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2019.09-rc1 => arc-2019.09-release}/0100-uclibc-conf.patch (100%)
>  rename package/glibc/{arc-2019.09-rc1 => arc-2019.09-release}/glibc.hash (75%)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 514f620086..06902b4ba6 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -37,7 +37,7 @@ endchoice
>  
>  config BR2_BINUTILS_VERSION
>  	string
> -	default "arc-2019.09-rc1"	if BR2_BINUTILS_VERSION_ARC
> +	default "arc-2019.09-release"	if BR2_BINUTILS_VERSION_ARC
>  	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
>  	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
>  	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
> diff --git a/package/binutils/arc-2019.09-rc1/0001-poison-system-directories.patch b/package/binutils/arc-2019.09-release/0001-poison-system-directories.patch
> similarity index 100%
> rename from package/binutils/arc-2019.09-rc1/0001-poison-system-directories.patch
> rename to package/binutils/arc-2019.09-release/0001-poison-system-directories.patch
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index 544b318d02..82a4082104 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -4,7 +4,7 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
>  sha512  b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac  binutils-2.33.1.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  3840770da5ede0248f6a6605e3f1743210acd9f4da7de48720ef566cc2aae52ea9e84c285a0a6d39eb15bd7ad197d543b6e407ec9e1a00739989e574d4e04384  binutils-gdb-arc-2019.09-rc1.tar.gz
> +sha512  33ac5ad662db551870193f5c76c35a18de465adfa1c7f4bf5c1bb4145805a47507bf11ec21eb446b52f91f70cfe392252dd2b02724dc9dad3505258e3f6f4d45  binutils-gdb-arc-2019.09-release.tar.gz
>  
>  # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
>  sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index a19d6940f7..876c9c59f8 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -9,13 +9,13 @@
>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>  ifeq ($(BINUTILS_VERSION),)
>  ifeq ($(BR2_arc),y)
> -BINUTILS_VERSION = arc-2019.09-rc1
> +BINUTILS_VERSION = arc-2019.09-release
>  else
>  BINUTILS_VERSION = 2.32
>  endif
>  endif # BINUTILS_VERSION
>  
> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
> +ifeq ($(BINUTILS_VERSION),arc-2019.09-release)
>  BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>  BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
>  BINUTILS_FROM_GIT = y
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 92af40b19f..e9d9d52347 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -95,7 +95,7 @@ config BR2_GCC_VERSION
>  	default "7.5.0"     if BR2_GCC_VERSION_7_X
>  	default "8.3.0"     if BR2_GCC_VERSION_8_X
>  	default "9.2.0"     if BR2_GCC_VERSION_9_X
> -	default "arc-2019.09-rc1" if BR2_GCC_VERSION_ARC
> +	default "arc-2019.09-release" if BR2_GCC_VERSION_ARC
>  	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
>  	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
>  
> diff --git a/package/gcc/arc-2019.09-rc1/0100-uclibc-conf.patch b/package/gcc/arc-2019.09-release/0100-uclibc-conf.patch
> similarity index 100%
> rename from package/gcc/arc-2019.09-rc1/0100-uclibc-conf.patch
> rename to package/gcc/arc-2019.09-release/0100-uclibc-conf.patch
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 393c4eb940..65c8c0d794 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -8,7 +8,7 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
>  sha512  a12dff52af876aee0fd89a8d09cdc455f35ec46845e154023202392adc164848faf8ee881b59b681b696e27c69fd143a214014db4214db62f9891a1c8365c040  gcc-9.2.0.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  c478efba4a497875b2add3b1bf4261c187459e252d397ace40ca740e51ac96491defa78733aafcb2b03c8e2e423dd8c115761a5e74ef2386368d53730f3e45ba  gcc-arc-2019.09-rc1.tar.gz
> +sha512  84648d13f174102733e06ccdf7b351150babe06af0f2b99b8dfb2b2d3c3f13e424547349939806fe19932ad347977cad79cd8b37be9cbb03e6a4d03cdf95a72e  gcc-arc-2019.09-release.tar.gz
>  # Locally calculated (fetched from Github)
>  sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
>  # Locally calculated (fetched from https://github.com/c-sky/gcc)
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index a22b3150aa..5315f10493 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -67,7 +67,7 @@ endif
>  # If cross-gdb is not enabled, the latest working version is chosen.
>  config BR2_GDB_VERSION
>  	string
> -	default "arc-2019.09-rc1-gdb" if BR2_arc
> +	default "arc-2019.09-release-gdb" if BR2_arc
>  	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
>  	default "8.1.1"    if BR2_GDB_VERSION_8_1
>  	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index ec60b47c20..b98d6d6a67 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -4,7 +4,7 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
>  sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  a2b83e949638fa27d3d2b971e3a77902050191d517c5b9ca1273d182b8c3b9da2c993a0dbaf76e18d2603e59a1af6618dff830a3905f22272af68fcbb49d58a8 	gdb-arc-2019.09-rc1-gdb.tar.gz
> +sha512  c33818f8679d99d5315220578864b04b87f69c46ebe62472809ee6e1d260e5ec84d598f38d80c127a2045d6624f28803c2720d89434204acbd94e988a45870f1 	gdb-arc-2019.09-release-gdb.tar.gz
>  
>  # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
>  sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
> diff --git a/package/glibc/arc-2019.09-rc1/glibc.hash b/package/glibc/arc-2019.09-release/glibc.hash
> similarity index 75%
> rename from package/glibc/arc-2019.09-rc1/glibc.hash
> rename to package/glibc/arc-2019.09-release/glibc.hash
> index e99eedc8ea..296035c495 100644
> --- a/package/glibc/arc-2019.09-rc1/glibc.hash
> +++ b/package/glibc/arc-2019.09-release/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  a9beeace7e2b4b25c6d253591b005975c50bf4ca1c0b6b38a24d89ac5a1458e1  glibc-arc-2019.09-rc1.tar.gz
> +sha256  0e0fd7603938fd8ebd793385a3d72c6e1fba22e16a600a16cc953a93f0e85943  glibc-arc-2019.09-release.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index c77105ec61..e4eb665ed6 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ifeq ($(BR2_arc),y)
> -GLIBC_VERSION =  arc-2019.09-rc1
> +GLIBC_VERSION =  arc-2019.09-release
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  else ifeq ($(BR2_RISCV_32),y)
>  GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
> -- 
> 2.16.2
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
