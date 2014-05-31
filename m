From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 May 2014 17:01:44 +0200
Subject: [Buildroot] [PATCH 01/30] toolchain: add option to copy the
	gconv libraries
In-Reply-To: <bd4936cffb6b9a15326d591ea15075c381b701db.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
 <bd4936cffb6b9a15326d591ea15075c381b701db.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <CAGduivxMRDT1Eo92uG8xYG3G3Z2wxyu_7aChrw+bstQdFXi5gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

We discussed this patch with Yann on IRC, and it may not be the best
solution as it bluntly copy all the files to the target but at least
it solve an issues, it could be refined by following patches.
The issue I had (and IIRC, Jerzy too) with XBMC that led to this
patch, was some subtitles with a non 'utf-8' encoding with some
characters outside the ASCII standard (like '?') stopped being
displayed as soon as you hit the 'bad' characters.
XBMC tries to convert them, but fail to do so without theses files installed.

Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

On Wed, May 28, 2014 at 1:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The gconv libraries are used to translate between different character
> sets (charsets).
>
> In (e)glibc they are implemented by the internal implemenation of
> iconv, called gconv, and are provided as dlopen-able libraries.
>
> Some packages need them to present text to the user (eg. XBMC Gotham).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Makefile                      |  6 ++++++
>  toolchain/toolchain-common.in | 10 ++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b7a0721..7377478 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -395,6 +395,9 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  ifneq ($(GENERATE_LOCALE),)
>  TARGETS += target-generatelocales
>  endif
> +ifeq ($(BR2_COPY_GCONV_LIBS),y)
> +TARGETS += target-copygconvlibs
> +endif
>  endif
>
>  ifeq ($(BR2_ECLIPSE_REGISTER),y)
> @@ -620,6 +623,9 @@ target-generatelocales: host-localedef toolchain
>         done
>  endif
>
> +target-copygconvlibs:
> +       $(Q)cp -a $(STAGING_DIR)/usr/lib/gconv $(TARGET_DIR)/usr/lib/gconv
> +
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
>         @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>                 $(call MESSAGE,"Executing post-image script $(s)"); \
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 1573e00..59ec64e 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -77,6 +77,16 @@ config BR2_GENERATE_LOCALE
>           specified, UTF-8 is assumed. Examples of locales: en_US,
>           fr_FR.UTF-8.
>
> +config BR2_COPY_GCONV_LIBS
> +       bool "copy gconv libs"
I know that it has already been told, but anyway, it should be 'Copy'
instead of 'copy'.
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         The gconv libraries are used to convert between different
> +         character sets (charsets).
> +
> +         Say 'y' if you need to store and/or display different charsets.
> +         Note that the full set of gconv libraries is worth around 7MiB.
> +
>  # glibc and eglibc directly include gettext, so a separatly compiled
>  # gettext isn't needed and shouldn't be built to avoid conflicts. Some
>  # packages always need gettext, other packages only need gettext when
> --
> 1.8.3.2
>
