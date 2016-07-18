From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 18 Jul 2016 11:28:54 +0200
Subject: [Buildroot] [PATCH v2] uboot-tools: fix conditional build of
	FIT support
In-Reply-To: <20160718000708.26051-1-ricardo.martincoski@gmail.com>
References: <20160717193603.13671-1-ricardo.martincoski@gmail.com>
 <20160718000708.26051-1-ricardo.martincoski@gmail.com>
Message-ID: <CAGm1_kt_QgmSkGR+ne+zmm=d-7ZuD2+hSmdG2bOOuCxCj_UyZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 18, 2016 at 2:07 AM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> The removal of the unconditional compilation and linking of some .o files were
> missed when porting the patch 0003 to the version 2016.07, leading to errors
> like these when FIT support is enabled:
>
> tools/fit_common.o: In function `fit_verify_header':
> fit_common.c:(.text+0x0): multiple definition of `fit_verify_header'
> tools/fit_common.o:fit_common.c:(.text+0x0): first defined here
> tools/fit_common.o: In function `fit_check_image_types':
> fit_common.c:(.text+0x10): multiple definition of `fit_check_image_types'
>
> When FIT support is disabled, the build does not fail but it includes FIT
> support.
>
> Fix the patch 0003 to be equivalent to the original one.
>
> Fixes:
> http://autobuild.buildroot.net/results/7494a5b22e3df1c05cdcc47670deaf54d9e04133
> http://autobuild.buildroot.net/results/f98f30bbf9d4cdde37a96b9310873d83dd649c54
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: Carlos Santos <casantos@datacom.ind.br>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Changes v1 -> v2:
>  - add reference to autobuild failures, as I just noticed the error was caught
>  - clarify a bit the error on the commit log, and also in the patch header
>   - the build failure occurs when FIT support is enabled
>   - when it is disabled the build includes FIT support but does not fail
>   - compilation is also conditional in the original patch, not just linking
>  - fix typo on commit log
>  - git format-patch -U4 when sending to the list to make this review easier
>
> CC: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>  .../0003-Make-FIT-support-really-optional.patch    | 26 +++++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
> index 3ba5389..8853198 100644
> --- a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
> +++ b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
> @@ -1,5 +1,5 @@
> -From ddcd6cd622889a2d74d0a16efae8e3b2d098f717 Mon Sep 17 00:00:00 2001
> +From d9d7d7cf8b27516d45c66daa1bf0a18c878c4e33 Mon Sep 17 00:00:00 2001
>  From: Carlos Santos <casantos@datacom.ind.br>
>  Date: Sun, 8 May 2016 11:11:39 -0300
>  Subject: [PATCH] Make FIT support really optional
>
> @@ -18,13 +18,16 @@ following changes:
>
>  Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>  [fabio: adapt for 2016.07]
>  Signed-off-by: Fabio Estevam <festevam@gmail.com>
> +[Ricardo: fix conditional compilation and linking of the files mentioned above
> +for 2016.07]
> +Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>  ---
>   common/bootm.c  | 2 ++
>   include/bootm.h | 2 ++
> - tools/Makefile  | 2 ++
> - 3 files changed, 6 insertions(+)
> + tools/Makefile  | 6 ++----
> + 3 files changed, 6 insertions(+), 4 deletions(-)
>
>  diff --git a/common/bootm.c b/common/bootm.c
>  index 2431019..7e1adc8 100644
>  --- a/common/bootm.c
> @@ -58,9 +61,9 @@ index 4981377..94d62a1 100644
>
>   int boot_selected_os(int argc, char * const argv[], int state,
>                      bootm_headers_t *images, boot_os_fn *boot_fn);
>  diff --git a/tools/Makefile b/tools/Makefile
> -index f72294a..adf7c83 100644
> +index f72294a..ccf5120 100644
>  --- a/tools/Makefile
>  +++ b/tools/Makefile
>  @@ -54,6 +54,7 @@ mkenvimage-objs := mkenvimage.o os_support.o lib/crc32.o
>   hostprogs-y += dumpimage mkimage
> @@ -69,14 +72,25 @@ index f72294a..adf7c83 100644
>  +FIT_OBJS-$(CONFIG_FIT) := fit_common.o fit_image.o image-host.o common/image-fit.o
>   FIT_SIG_OBJS-$(CONFIG_FIT_SIGNATURE) := common/image-sig.o
>   # Flattened device tree objects
>   LIBFDT_OBJS := $(addprefix lib/libfdt/, \
> -@@ -68,6 +69,7 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
> +@@ -68,16 +69,13 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
>   # common objs for dumpimage and mkimage
>   dumpimage-mkimage-objs := aisimage.o \
>                         atmelimage.o \
>  +                      $(FIT_OBJS-y) \
>                         $(FIT_SIG_OBJS-y) \
>                         common/bootm.o \
>                         lib/crc32.o \
> +                       default_image.o \
> +                       lib/fdtdec_common.o \
> +                       lib/fdtdec.o \
> +-                      fit_common.o \
> +-                      fit_image.o \
> +-                      common/image-fit.o \
> +-                      image-host.o \
> +                       common/image.o \
> +                       imagetool.o \
> +                       imximage.o \
>  --
> -1.9.1
> +2.9.1
> +
> --
> 2.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
