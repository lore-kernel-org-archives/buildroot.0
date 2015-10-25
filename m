From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 15:37:16 +0100
Subject: [Buildroot] [PATCH v5 08/36] package/efl/libefl: add libcurl
 dependency
In-Reply-To: <1445720476-21517-9-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-9-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025143716.GE11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> Curl is listed as an dependency in the README:
> https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n453
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: rename to libefl
> ---
>  package/efl/libefl/Config.in | 1 +
>  package/efl/libefl/libefl.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index 07aee42..29aef05 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_LIBEFL
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_FREETYPE
>  	select BR2_PACKAGE_JPEG # Emile needs libjpeg
> +	select BR2_PACKAGE_LIBCURL # eina_module, runtime dependency

If it is a runtime dependency, ...

>  	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
>  	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
>  	help
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index c697e41..b26f848 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -13,7 +13,8 @@ LIBEFL_LICENSE_FILES = COPYING
>  
>  LIBEFL_INSTALL_STAGING = YES
>  
> -LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev zlib
> +LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg libcurl lua \
> +	udev zlib

... then why do you add it to build dependencies?

Moreover, it looks more like a build dependency, given the number of
calls to the libcurl functions throughout the libelf code. Can you
confirm whether this is only a runtime dependency or a build dependency?

Regards,
Yann E. MORIN.

>  # regenerate the configure script:
>  # https://phab.enlightenment.org/T2718
> -- 
> 2.4.3
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
