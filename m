From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 00:38:50 +0200
Subject: [Buildroot] [PATCH v6 4/6] libselinux: bump to version 2.5
In-Reply-To: <1466980753-667-5-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-5-git-send-email-Aduskett@gmail.com>
Message-ID: <20160630223850.GA4281@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2016-06-26 18:39 -0400, Adam Duskett spake thusly:
> In addition, if a user is using glibc 2.22, the default CFLAG
> D_FILE_OFFSET_BITS=64 will cause a compile error.  This flag is now
> removed from the CFLAGS in the make file to ensure that toolchains
> compiled against glibc 2.22 will build the new version of the package
> properly.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index d4b96c4..6f94173 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBSELINUX_VERSION = 2.1.13
> -LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +LIBSELINUX_VERSION = 2.5
> +LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
>  LIBSELINUX_LICENSE = Public Domain
>  LIBSELINUX_LICENSE_FILES = LICENSE
>  
> @@ -13,8 +13,10 @@ LIBSELINUX_DEPENDENCIES = libsepol pcre
>  
>  LIBSELINUX_INSTALL_STAGING = YES
>  
> +# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22.
>  LIBSELINUX_MAKE_OPTS = \
>  	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \

I was a bit unsure about that one. Discussing with Thomas just confirmed
what I was thinking: this means that this package will not be able to
use 64-bit offset, and thus won't be able to deal with files greater
than 2GiB in size.

On the other hand, this program can *not* handle such files anyway,
since fts in not 64-bit aware anyway.

And we are already using this kind of hack in other packages.

So:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
>  	ARCH=$(KERNEL_ARCH)
>  
> -- 
> 2.7.4
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
