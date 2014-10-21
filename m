From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 18:58:17 +0200
Subject: [Buildroot] [PATCH] Complain loudly if BR2_GLOBAL_PATCH_DIR
 does not exit
In-Reply-To: <1413880974-30138-1-git-send-email-sojka@merica.cz>
References: <1413880974-30138-1-git-send-email-sojka@merica.cz>
Message-ID: <20141021165817.GI3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michal, All,

On 2014-10-21 10:42 +0200, Michal Sojka spake thusly:
> If the BR2_GLOBAL_PATCH_DIR is misspelled in the .config or if somebody
> renamed the existing directory with patches, buildroot happily builds
> everything but without the patches. As this can lead to surprising
> results,

Indeed... :-/

> it is better to fail and give a user a message that
> BR2_GLOBAL_PATCH_DIR is wrongly configured.
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 259ee02..46d92aa 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -162,6 +162,11 @@ $(BUILD_DIR)/%/.stamp_patched:
>  	$(Q)touch $@
>  	@$(call step_end,patch)
>  
> +# Check that all directories specified in BR2_GLOBAL_PATCH_DIR exist.
> +$(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
> +	$(if $(wildcard $(dir)),,\
> +		$(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
> +
>  # Configure
>  $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call step_start,configure)
> -- 
> 2.1.1
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
