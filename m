From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 17:18:19 +0100
Subject: [Buildroot] [PATCH 2/3] package/libnss: remove ld segfault
 workaround
In-Reply-To: <20191217143704.51115-3-giulio.benetti@benettiengineering.com>
References: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
 <20191217143704.51115-3-giulio.benetti@benettiengineering.com>
Message-ID: <20191231161819.GM26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2019-12-17 15:37 +0100, Giulio Benetti spake thusly:
> This ld bug has been fixed with binutils version 2.27 and Buildroot at
> the moment provides binutils > 2.27, so let's remove the workaround.

Even though Buildroot only has binutils > 2.27, there might still exist
pre-built, external toolchains that use a version older than 2.27.

Since we support gcc back to at least 4.3, I believe we must still
support binutils versions that were contemporary to that.

gcc-4.3 was releaswed in 2008, so the current binutils at the time was
2.18

However, for microblaze, in practice, I'm not sure what the oldest
binutils version makes sense... :-/

Unless another maintainer is happy to take those two patches, I'll
reject then next year (woot, you have a one year delay! ;-] ).

Regards,
Yann E. MORIN.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> This patch must be applied after patch:
> https://patchwork.ozlabs.org/patch/1210535/
> ---
>  package/libnss/libnss.mk | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 9349276a90..7c49ac1b25 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -27,16 +27,6 @@ endef
>  
>  LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_FIXUP_LINUX_MK
>  
> -# --gc-sections triggers binutils ld segfault
> -# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
> -ifeq ($(BR2_microblaze),y)
> -define LIBNSS_DROP_GC_SECTIONS
> -	sed -i 's:-Wl,--gc-sections::g' $(@D)/nss/coreconf/Linux.mk
> -endef
> -
> -LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_DROP_GC_SECTIONS
> -endif
> -
>  ifeq ($(BR2_aarch64_be),y)
>  LIBNSS_ARCH = aarch64
>  else
> -- 
> 2.20.1
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
