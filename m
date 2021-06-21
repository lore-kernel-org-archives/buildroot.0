From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jun 2021 23:42:23 +0200
Subject: [Buildroot] [PATCH 04/15] package/pkg-generic.mk: Fix .la files
 overwrite detection
In-Reply-To: <20210621141130.48654-5-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-5-herve.codina@bootlin.com>
Message-ID: <20210621214223.GC44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> During per-package build, original .la files are modified by
> fixup-libtool-files calls.
> But since fixup-libtool-files modifies files using sed --in-place,
> these modification are done using a temporary file and a call to
> rename. Rename breaks the hardlink to the original file and leave the
> temporary file in per-package TARGET dir.
> As the original file is not modified, this is no longer considered as
> an overwrite.
> 
> To fix this detection, this patch simply considers the what is done
> by fixup-libtool-files is part of the original snapshot used to
> detect overwrites. And so, the original snapshot is taken after
> fixup-libtool-files call.

Then this should be squashed together with the first patch, to avoid
introducing the issue just to fix it a few patches down the series.

You should however add a note about that in the commit log of the first
patch, of course, to explain why the overwrite ifnra is inserted after
the .la tweaks.

So, I agree with the explanations, which make sense, but I disagree that
it should be a separate patch...

Regards,
Yann E. MORIN.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 2499c94746..f9564831cc 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -254,9 +254,9 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call pkg_size_before,$(TARGET_DIR))
>  	@$(call pkg_size_before,$(STAGING_DIR),-staging)
>  	@$(call pkg_size_before,$(HOST_DIR),-host)
> +	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
>  	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
>  	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
> -	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>  	$($(PKG)_CONFIGURE_CMDS)
>  	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> -- 
> 2.31.1
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
