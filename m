From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 9 Jul 2013 21:25:36 +0300
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
 post-build and post-image scripts
In-Reply-To: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
References: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130709182536.GU5098@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Jul 09, 2013 at 08:06:36PM +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> It can be useful to have different configuration use the same post-build
> and/or post-image scripts as they share a common infrastructure, but yet
> have minor differentiation.
> 
> This option allows passing zero or more additional arguments to each
> post-build or post-image script.
> 
> The same set of extra arguments are passed to all scripts, it is not
> possible to pass different arguments to each script.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

You should also change the "first and only argument" language in the help text 
of BR2_ROOTFS_POST_BUILD_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT.

baruch

> ---
>  Makefile         |  4 ++--
>  system/Config.in | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 955e684..f6e9965 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -512,7 +512,7 @@ endif
>  
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-build script $(s)"); \
> -		$(s) $(TARGET_DIR)$(sep))
> +		$(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
>  ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
>  LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
> @@ -558,7 +558,7 @@ endif
>  target-post-image:
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
> -		$(s) $(BINARIES_DIR)$(sep))
> +		$(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
>  toolchain-eclipse-register:
>  	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
> diff --git a/system/Config.in b/system/Config.in
> index c0e4f4a..da50f67 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -294,4 +294,20 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
>  	  first and only argument. The script is executed from the
>  	  main Buildroot source directory as the current directory.
>  
> +config BR2_ROOTFS_POST_SCRIPT_ARGS
> +	string "Extra post-{build,image} arguments"
> +	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
> +	help
> +	  Pass these aditional arguments to each post-build or post-image
> +	  scripts.
> +
> +	  Note that all the post-build and post-image scripts will be passed
> +	  the same set of arguments, you can not pass different arguments to
> +	  each script.
> +
> +	  Note also, as stated in their respective help text, that the first
> +	  argument to each post-build or post-image script is the target/
> +	  directory $(TARGET_DIR). The arguments in this option will be
> +	  passed *after*.
> +
>  endmenu

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
