From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 11:16:41 +0100
Subject: [Buildroot] [PATCH 1/3] libsigrok: bump version to 0.5.1
In-Reply-To: <20181117141203.19695-1-brgl@bgdev.pl>
References: <20181117141203.19695-1-brgl@bgdev.pl>
Message-ID: <20181230101641.GD14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2018-11-17 15:12 +0100, Bartosz Golaszewski spake thusly:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Since commit 79034d4f39f7 ("strutil: Locale independent snprintf()
> and vsnprintf() functions") libsigrok now needs to know locale_t.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libsigrok/Config.in      | 3 ++-
>  package/libsigrok/libsigrok.hash | 2 +-
>  package/libsigrok/libsigrok.mk   | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
> index fb74beaab5..bb76e09d2d 100644
> --- a/package/libsigrok/Config.in
> +++ b/package/libsigrok/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSIGROK
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
> +	depends on BR2_ENABLE_LOCALE

You forgot to propagate this new dependency to at least sigrock-cli,
which selects libsigrok:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBSIGROK
  Depends on [n]: BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_ENABLE_LOCALE [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
  Selected by [y]:
  - BR2_PACKAGE_SIGROK_CLI [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]

Regards,
Yann E. MORIN.

>  	depends on !BR2_STATIC_LIBS # libzip
>  	# std=c11
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> @@ -35,7 +36,7 @@ comment "C++ bindings need a toolchain w/ C++, gcc >= 4.9"
>  
>  endif
>  
> -comment "libsigrok needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7"
> +comment "libsigrok needs a toolchain w/ wchar, locale, threads, dynamic library, gcc >= 4.7"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
> diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
> index 47ad6129f6..7a52c6ca1b 100644
> --- a/package/libsigrok/libsigrok.hash
> +++ b/package/libsigrok/libsigrok.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256	4c8c86779b880a5c419f6c77a08b1147021e5a19fa83b0f3b19da27463c9f3a4	libsigrok-0.5.0.tar.gz
> +sha256	e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c	libsigrok-0.5.1.tar.gz
> diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
> index ef7fab82bd..5bca9ad518 100644
> --- a/package/libsigrok/libsigrok.mk
> +++ b/package/libsigrok/libsigrok.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSIGROK_VERSION = 0.5.0
> +LIBSIGROK_VERSION = 0.5.1
>  LIBSIGROK_SITE = http://sigrok.org/download/source/libsigrok
>  LIBSIGROK_LICENSE = GPL-3.0+
>  LIBSIGROK_LICENSE_FILES = COPYING
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
