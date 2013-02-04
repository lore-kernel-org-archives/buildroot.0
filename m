From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 4 Feb 2013 15:49:49 +0100
Subject: [Buildroot] [PATCH] lttng-tools: Fix compilation
In-Reply-To: <1359983522-20044-1-git-send-email-sho@relinux.de>
References: <1359983522-20044-1-git-send-email-sho@relinux.de>
Message-ID: <CAHXCMM+d_eEx6u6bm8LvgkVzB0568VPM-p2xZttJJFmxh+CmGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephan,

2013/2/4 Stephan Hoffmann <sho@relinux.de>:
> Compiling lttng-tools fails when lttng-libust is enabled bacause of a missing
s/bacause/because/

> -lurcu-bp in the linker command line, at least for linaro 2012.12 toolchain.
hum... weird!

lttng-tools handles that in its configure file, checking for
ustctl_set_filter availability in liblttng-ust-ctl; see:
http://git.lttng.org/?p=lttng-tools.git;a=blob;f=configure.ac;h=91e76f06a98700d2a9deb36c29a650176e62c4ab;hb=HEAD#l137

Are you sure lttng-libust was correctly built before?
Could you give more details about the linking error?

It may also be something to report upstream, lttng guys are quite responsive.

>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  package/lttng-tools/lttng-tools.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
> index 5be3abb..288e351 100644
> --- a/package/lttng-tools/lttng-tools.mk
> +++ b/package/lttng-tools/lttng-tools.mk
> @@ -21,6 +21,8 @@ LTTNG_AUTORECONF = YES
>  ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
>  LTTNG_TOOLS_CONF_OPT += --enable-lttng-ust
>  LTTNG_TOOLS_DEPENDENCIES += lttng-libust
> +# Build fails without this, at least with Linuaro 2012.12 toolchain
> +LTTNG_TOOLS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lurcu-bp"
>  else
>  LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
>  endif
> --
> 1.7.0.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel
