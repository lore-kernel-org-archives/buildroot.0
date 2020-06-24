From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 22:17:31 +0200
Subject: [Buildroot] [PATCH] linux: run depmod only if modules directory
 exists
In-Reply-To: <20200623113859.172177-1-paul@crapouillou.net>
References: <20200623113859.172177-1-paul@crapouillou.net>
Message-ID: <20200624201731.GJ20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2020-06-23 13:38 +0200, Paul Cercueil spake thusly:
> If the modules directory that corresponds to the version of the kernel
> being built has been deleted, don't try to run depmod, which will
> obviously fail.
> 
> This can happen for instance when the modules are stripped from the main
> root filesystem, and placed into a separate filesystem image, so that
> the root filesystem and the kernel can be updated separately.

I fail to see how this can happen, sine:

  - LINUX_RUN_DEPMOD is run as a TARGET_FINALIZE_HOOKS

  - TARGET_FINALIZE_HOOKS are run ultra-early in the target-finalize
    step, way before we run post-build scripts.

So, how can you end up with a /lib/modules/VERSIO/ directory missing?

(Note that I find your reason valid, I'm just curious to understand how
this can happen before I apply the patch.)

Regards,
Yann E. MORIN.

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  linux/linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index b90b032bb9..d31933fea1 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -490,7 +490,8 @@ endef
>  # Run depmod in a target-finalize hook, to encompass modules installed by
>  # packages.
>  define LINUX_RUN_DEPMOD
> -	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
> +	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
> +		&& grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
>  		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
>  	fi
>  endef
> -- 
> 2.27.0
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
