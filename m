From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:05:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libudfread: new package
In-Reply-To: <20200405182034.1941032-1-bernd.kuhls@t-online.de>
References: <20200405182034.1941032-1-bernd.kuhls@t-online.de>
Message-ID: <20200406200517.GR22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-04-05 20:20 +0200, Bernd Kuhls spake thusly:
> Upcoming release of kodi 19.0 will add libudfread as optional
> dependency: https://github.com/xbmc/xbmc/pull/17612
> 
> Please note that the removed support of libudf was added on the master
> branch so we do not need to backport udf support to kodi 18.x:
> https://github.com/xbmc/xbmc/commit/558b54a79eff717237919afe453ec09e0851d3a5
> 
> Build-tested using this defconfig
> 
> BR2_PACKAGE_LIBUDFREAD=y
> 
>                              andes-nds32 [ 1/44]: OK
>                              arm-aarch64 [ 2/44]: OK
>                         br-aarch64-glibc [ 3/44]: OK
>                            br-arcle-hs38 [ 4/44]: OK
>                             br-arm-basic [ 5/44]: OK
>                   br-arm-cortex-a9-glibc [ 6/44]: OK
>                    br-arm-cortex-a9-musl [ 7/44]: OK
>                    br-arm-cortex-m4-full [ 8/44]: OK
>                              br-arm-full [ 9/44]: OK
>                     br-arm-full-nothread [10/44]: OK
>                       br-arm-full-static [11/44]: OK
>                    br-i386-pentium4-full [12/44]: OK
>                 br-i386-pentium-mmx-musl [13/44]: OK
>                        br-m68k-5208-full [14/44]: OK
>                       br-m68k-68040-full [15/44]: OK
>                     br-microblazeel-full [16/44]: OK
>                  br-mips32r6-el-hf-glibc [17/44]: OK
>                       br-mips64-n64-full [18/44]: OK
>                  br-mips64r6-el-hf-glibc [19/44]: OK
>                       br-mipsel-o32-full [20/44]: OK
>                           br-nios2-glibc [21/44]: OK
>                       br-openrisc-uclibc [22/44]: OK
>                br-powerpc-603e-basic-cpp [23/44]: OK
>              br-powerpc64le-power8-glibc [24/44]: OK
>                br-powerpc64-power7-glibc [25/44]: OK
>                   br-powerpc-e500mc-full [26/44]: OK
>                               br-riscv32 [27/44]: OK
>                               br-riscv64 [28/44]: OK
>                              br-sh4-full [29/44]: OK
>                         br-sparc64-glibc [30/44]: OK
>                          br-sparc-uclibc [31/44]: OK
>                     br-x86-64-core2-full [32/44]: OK
>                           br-x86-64-musl [33/44]: OK
>                           br-xtensa-full [34/44]: OK
>                        linaro-aarch64-be [35/44]: OK
>                           linaro-aarch64 [36/44]: OK
>                               linaro-arm [37/44]: OK
>                      sourcery-arm-armv4t [38/44]: OK
>                             sourcery-arm [39/44]: OK
>                      sourcery-arm-thumb2 [40/44]: OK
>                          sourcery-mips64 [41/44]: OK
>                            sourcery-mips [42/44]: OK
>                           sourcery-nios2 [43/44]: OK
>                          sourcery-x86-64 [44/44]: OK
> 44 builds, 0 skipped, 0 build failed, 0 legal-info failed

The build report is very interesting and indeed gives confidence about
the package, thank you! However, this does not belong to the commit log,
but to a post-commit message (after the --- line).

I've dropped it, fixed the two-spaces in hash file, and appiled to
master, thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/libudfread/Config.in       |  6 ++++++
>  package/libudfread/libudfread.hash |  3 +++
>  package/libudfread/libudfread.mk   | 15 +++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/libudfread/Config.in
>  create mode 100644 package/libudfread/libudfread.hash
>  create mode 100644 package/libudfread/libudfread.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e9ac2b7460..bf209b45d6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -396,6 +396,7 @@ F:	package/libsndfile/
>  F:	package/libsoil/
>  F:	package/libsoundtouch/
>  F:	package/libsquish/
> +F:	package/libudfread/
>  F:	package/liburiparser/
>  F:	package/libva/
>  F:	package/libva-intel-driver/
> diff --git a/package/Config.in b/package/Config.in
> index 373868ca82..fce3eeff03 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1619,6 +1619,7 @@ menu "Multimedia"
>  	source "package/libopenh264/Config.in"
>  	source "package/libopusenc/Config.in"
>  	source "package/libtheora/Config.in"
> +	source "package/libudfread/Config.in"
>  	source "package/libvpx/Config.in"
>  	source "package/libyuv/Config.in"
>  	source "package/live555/Config.in"
> diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
> new file mode 100644
> index 0000000000..8d42570500
> --- /dev/null
> +++ b/package/libudfread/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBUDFREAD
> +	bool "libudfread"
> +	help
> +	  UDF reader
> +
> +	  https://code.videolan.org/videolan/libudfread
> diff --git a/package/libudfread/libudfread.hash b/package/libudfread/libudfread.hash
> new file mode 100644
> index 0000000000..b6970c1762
> --- /dev/null
> +++ b/package/libudfread/libudfread.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 c4c5ee6b65be051fb1f2a738f726f2afc8601620e8f013d087769dc13aab6d4c  libudfread-1.0.0.tar.bz2
> +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
> new file mode 100644
> index 0000000000..53ee4a578e
> --- /dev/null
> +++ b/package/libudfread/libudfread.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libudfread
> +#
> +################################################################################
> +
> +LIBUDFREAD_VERSION = 1.0.0
> +LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
> +LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
> +LIBUDFREAD_AUTORECONF = YES
> +LIBUDFREAD_INSTALL_STAGING = YES
> +LIBUDFREAD_LICENSE = LGPL-2.1+
> +LIBUDFREAD_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> -- 
> 2.25.0
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
