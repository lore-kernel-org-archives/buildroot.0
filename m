From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 20:19:54 +0100
Subject: [Buildroot] [PATCH] pkg-generic: run $(PKG)_PRE_RSYNC_HOOKS
 before checking for the existence of $(SRCDIR)
In-Reply-To: <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
References: <20161211174528.GD3599@free.fr>
 <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <20161211191954.GE3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-11 20:12 +0200, Tal Shorer spake thusly:
> This will allow packages to define their pre-rsync hooks which will be
> guaranteed to run even if the source is missing.
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>

Before this goes in, we have to notice that packages (most probably,
out-of-tree packages in a br2-external tree) that defined hooks that
relied on the check to be done before the hooks are called, may now
break with this change.

However, I still believe this change is good, because it ensures the
hooks are called before the infra does anything, which is what we do in
all the other similar commands; also, there are valid cases where we
want the hooks to run first.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 827de62..3ca71b0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -161,8 +161,8 @@ $(BUILD_DIR)/%/.stamp_extracted:
>  # used.
>  $(BUILD_DIR)/%/.stamp_rsynced:
>  	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
> -	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
>  	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
> +	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
>  	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
>  	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
>  	$(Q)touch $@
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
