From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 13:53:54 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/pkg-utils.mk: fix
 per-package build
In-Reply-To: <20210117122444.2409286-1-bernd.kuhls@t-online.de>
References: <20210117122444.2409286-1-bernd.kuhls@t-online.de>
Message-ID: <20210117125354.GF2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-17 13:24 +0100, Bernd Kuhls spake thusly:
> While host-fontconfig provides share/gettext as a directory
> in host-libglib2 share/gettext is a link
> causing an error with rsync.
[--SNIP--]
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> This patch is a RFC because I am unsure whether this is the correct fix
> as I do not have much experience with rsync. But nonetheless I would like
> to point into the imho right direction for the fix.

In my opinion, this is not the correct patch.

I think the proper approach is to fix either package so that they
provide dentries of the same type.

In this case, it seems like a workaround would be to have
host-fontconfig to also depend on host-gettext, which would ensure that
gettext is a proper symlink in host-fontconfig too.

Regards,
Yann E. MORIN.

>  package/pkg-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 11090cb628..1f3ff05b6c 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -178,7 +178,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  define per-package-rsync
>  	mkdir -p $(3)
>  	$(foreach pkg,$(1),\
> -		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
> +		rsync -a --force --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
>  		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
>  		$(3)$(sep))
>  endef
> -- 
> 2.29.2
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
