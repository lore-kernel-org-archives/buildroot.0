From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Mar 2015 23:00:13 +0100
Subject: [Buildroot] [PATCH 3/6] kodi: switch smb support to samba4
In-Reply-To: <1425646234-22041-3-git-send-email-gustavo@zacarias.com.ar>
References: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
 <1425646234-22041-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150309220013.GA10620@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-06 09:50 -0300, Gustavo Zacarias spake thusly:
> samba3 is deprecated upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[run-time tested on RPI-2 and played video via a SMB share]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 7 +++++--
>  package/kodi/kodi.mk   | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 1bc8b15..48e624f 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -203,10 +203,13 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
>  comment "shairport support needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS
>  
> +comment "samba support needs an (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
>  config BR2_PACKAGE_KODI_LIBSMBCLIENT
>  	bool "samba"
> -	select BR2_PACKAGE_SAMBA
> -	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_SAMBA4
>  	help
>  	  Enable Samba support
>  
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index f40fc31..a975f70 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -140,7 +140,7 @@ KODI_CONF_OPTS += --disable-webserver
>  endif
>  
>  ifeq ($(BR2_PACKAGE_KODI_LIBSMBCLIENT),y)
> -KODI_DEPENDENCIES += samba
> +KODI_DEPENDENCIES += samba4
>  KODI_CONF_OPTS += --enable-samba
>  else
>  KODI_CONF_OPTS += --disable-samba
> -- 
> 2.0.5
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
