From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2015 17:30:18 +0200
Subject: [Buildroot] [PATCH 1/1] sed: handle merged usr folder
In-Reply-To: <1445180905-15896-1-git-send-email-james.knight@rockwellcollins.com>
References: <1445180905-15896-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151018153017.GB3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-10-18 11:08 -0400, James Knight spake thusly:
> For targets prepared with a usr-move, package should not be attempting
> to move binaries from `usr/bin` to `bin`.

I was looking at your coreutils patch doing the same, and was about to
suggest you also looked at sed. ;-)

However, we discussed these two changes with Thomas on IRC, and we're
not very happy that the merged /usr change implies we have to have
special handling for it in various packages... :-/

But we can't see an easy alternate solution to the problem either... :-/

> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

BTW, note that we would already had the issue if a user were to provide
a custom skeleton with merged /usr .

Regards,
Yann E. MORIN.

> ---
>  package/sed/sed.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sed/sed.mk b/package/sed/sed.mk
> index b819300..5f76e7e 100644
> --- a/package/sed/sed.mk
> +++ b/package/sed/sed.mk
> @@ -19,10 +19,11 @@ SED_CONF_OPTS = \
>  	--infodir=/usr/share/info \
>  	--include=$(STAGING_DIR)/usr/include
>  
> +ifeq ($(BR2_ROOTFS_MERGED_USR),)
>  define SED_MOVE_BINARY
>  	mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/
>  endef
> -
>  SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
> +endif
>  
>  $(eval $(autotools-package))
> -- 
> 1.9.5.msysgit.1
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
