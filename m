From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 19:16:32 +0200
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
In-Reply-To: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
References: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
Message-ID: <20140731171632.GC3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel, All,

On 2014-07-31 23:26 +0800, Nathaniel Roach spake thusly:
> BR2_CONFIG_COPY copies the config file to /etc/buildroot.config
> as 0600 during target-finalize after overlay copy, but before
> post-build script install.

I wonder what would be the use-case for this?

I think the case where one would want this file in the generated
filesystem is a corner case, and that it would be better served with
a post-build script.

Regards,
Yann E. MORIN.

> ---
> Changes v1 to v2
>  - Corrected wording of config helper message (Thomas De Schampheleire)
>  - Moved order in menu to reflect actual order of the operation
> ---
>  Makefile         |  4 ++++
>  system/Config.in | 11 +++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 022beea..cc49291 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -614,6 +614,10 @@ endif
>  			--chmod=Du+w --exclude .empty --exclude '*~' \
>  			$(d)/ $(TARGET_DIR)$(sep))
>  
> +ifeq ($(BR2_CONFIG_COPY),y)
> +	$(INSTALL) -m 0600 .config $(TARGET_DIR)/etc/buildroot.config
> +endif
> +
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-build script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> diff --git a/system/Config.in b/system/Config.in
> index e7e146a..a1ff23f 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -339,6 +339,17 @@ config BR2_ROOTFS_OVERLAY
>  	  They are copied as-is into the rootfs, excluding files ending with
>  	  ~ and .git, .svn and .hg directories.
>  
> +config BR2_CONFIG_COPY
> +	bool "Copy buildroot .config file to rootfs"
> +	help
> +	  Copies the buildroot .config file into the rootfs.
> +	  This may be useful for debugging.
> +
> +	  It will be put in /etc/buildroot.config with a mode of 0600
> +
> +	  However, be wary that it will contain the root password
> +	  (if set) and other possibly sensitive data.
> +
>  config BR2_ROOTFS_POST_BUILD_SCRIPT
>  	string "Custom scripts to run before creating filesystem images"
>  	default ""
> -- 
> 2.0.1
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
