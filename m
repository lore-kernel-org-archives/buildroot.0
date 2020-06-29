From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 18:05:56 +0200
Subject: [Buildroot] [1/1] fs/cpio: sort 'find' utility output
 (reproducible builds)
In-Reply-To: <20200629153701.7c2c5ca4@monakov-y.xu>
References: <20200629153701.7c2c5ca4@monakov-y.xu>
Message-ID: <20200629160556.GE20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yurii, All,

On 2020-06-29 15:37 +0300, Yurii Monakov spake thusly:
> Order of find utility results are not sorted and depend on items
> attributes, so cpio produces different results across machines.
> 
> This patch sorts find output before piping to cpio to make
> builds reproducible.
> 
> Signed-off-by: Yurii Monakov <monakov.y@gmail.com>

Thanks for the ptatch, but see below...

> ---
>  fs/cpio/cpio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 28a435dd5e..73837ddecb 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -37,7 +37,7 @@ ROOTFS_CPIO_OPTS += --reproducible
>  endif
>  
>  define ROOTFS_CPIO_CMD
> -	cd $(TARGET_DIR) && find . | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@
> +	cd $(TARGET_DIR) && find . | sort | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@

sort order depends on the locale, so you also have to enforce the locale
to guarantee reproducibility; this is usually done with:

    ... |LC_ALL=C sort |...

So I've fixed that, wrapped the line that is now too long, and reworded
the commit log slightly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  endef
>  
>  ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
> -- 
> 2.17.1
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
