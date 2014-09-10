From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Sep 2014 00:12:05 +0200
Subject: [Buildroot] [PATCH V3 3/4] kexec-lite: Depends on elfutils
 instead of libelf to get the libelf library
In-Reply-To: <1409228494-19492-4-git-send-email-gregory.clement@free-electrons.com>
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-4-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <20140910221205.GJ23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gregory, All,

On 2014-08-28 14:21 +0200, Gregory CLEMENT spake thusly:
> The elfutils package provides a more recent version of the libelf, so
> let's use it. It will allow to remove the libelf package and to avoid
> conflicts with two packages providing the same library.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kexec-lite/Config.in     | 4 +++-
>  package/kexec-lite/kexec-lite.mk | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
> index 944ee29..dd9713e 100644
> --- a/package/kexec-lite/Config.in
> +++ b/package/kexec-lite/Config.in
> @@ -2,7 +2,9 @@ config BR2_PACKAGE_KEXEC_LITE
>  	bool "kexec-lite"
>  	depends on BR2_powerpc || BR2_powerpc64
>  	depends on !BR2_PREFER_STATIC_LIB # dtc
> -	select BR2_PACKAGE_LIBELF
> +	depends on BR2_LARGEFILE # elfutils
> +	depends on BR2_USE_WCHAR # elfutils
> +	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_DTC
>  	select BR2_PACKAGE_DTC_PROGRAMS
>  	help
> diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
> index 7028c6e..7e3c8d3 100644
> --- a/package/kexec-lite/kexec-lite.mk
> +++ b/package/kexec-lite/kexec-lite.mk
> @@ -7,7 +7,7 @@
>  KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
>  KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
>  KEXEC_LITE_LICENSE = GPLv2+
> -KEXEC_LITE_DEPENDENCIES = libelf dtc
> +KEXEC_LITE_DEPENDENCIES = elfutils dtc
>  
>  define KEXEC_LITE_BUILD_CMDS
>  	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> -- 
> 1.9.1
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
