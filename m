From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Oct 2020 21:32:26 +0200
Subject: [Buildroot] [PATCH v2] boot/barebox: fix target bareboxenv
 command compile
In-Reply-To: <20201003095902.16248-1-ps.report@gmx.net>
References: <20201003095902.16248-1-ps.report@gmx.net>
Message-ID: <20201004193226.GK11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-10-03 11:59 +0200, Peter Seiderer spake thusly:
> The buildroot custom bareboxenv compile command
> misses the additional include path 'scripts/include'
> to gain access to the local copy of the kernel header
> files (which leads to compile error when using an
> older toolchain).
> 
> This could be fixed by enhancing the custom bareboxenv
> compile command (see [1]) or by using the barebox
> build system by simply enabling the CONFIG_BAREBOXENV_TARGET
> option (available since April 2012, see [2]) instead (as
> suggested by Yann E. MORIN).
> 
> Fixes (with BR2_TARGET_BAREBOX_BAREBOXENV enabled):
> 
>   build/barebox-2019.12.0/scripts/bareboxenv.c:100:10: fatal error: linux/list.h: No such file or directory
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-January/270942.html
> [2] https://git.pengutronix.de/cgit/barebox/commit/?id=afb03d7a554a2911a3742e316f011319fcb416f1
> 
> Reported-by: Frederick Gotham <cauldwell.thomas@gmail.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, after adding an explicit disabling when the user has
not seelcted it; see the rationale in the commit log why I believe this
is legit.

Thanks, and sorry for the long tiem it took to review your initial v1...

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - change to barebox CONFIG_BAREBOXENV_TARGET config option
>     (suggested by Yann E. MORIN)
> ---
>  boot/barebox/barebox.mk | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 422f27312d..d47a47966c 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -88,13 +88,6 @@ $(1)_KCONFIG_DEPENDENCIES = \
>  	$(BR2_BISON_HOST_DEPENDENCY) \
>  	$(BR2_FLEX_HOST_DEPENDENCY)
>  
> -ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
> -define $(1)_BUILD_BAREBOXENV_CMDS
> -	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
> -		$$(@D)/scripts/bareboxenv.c
> -endef
> -endif
> -
>  ifeq ($$(BR2_TARGET_$(1)_CUSTOM_ENV),y)
>  $(1)_ENV_NAME = $$(notdir $$(call qstrip,\
>  	$$(BR2_TARGET_$(1)_CUSTOM_ENV_PATH)))
> @@ -109,12 +102,23 @@ endef
>  endif
>  
>  ifneq ($$($(1)_CUSTOM_EMBEDDED_ENV_PATH),)
> -define $(1)_KCONFIG_FIXUP_CMDS
> +define $(1)_KCONFIG_FIXUP_CUSTOM_EMBEDDED_ENV_PATH
>  	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT)
>  	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$($(1)_CUSTOM_EMBEDDED_ENV_PATH)")
>  endef
>  endif
>  
> +ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
> +define $(1)_KCONFIG_FIXUP_BAREBOXENV
> +	$$(call KCONFIG_ENABLE_OPT,CONFIG_BAREBOXENV_TARGET)
> +endef
> +endif
> +
> +define $(1)_KCONFIG_FIXUP_CMDS
> +	$$($(1)_KCONFIG_FIXUP_CUSTOM_EMBEDDED_ENV_PATH)
> +	$$($(1)_KCONFIG_FIXUP_BAREBOXENV)
> +endef
> +
>  define $(1)_BUILD_CMDS
>  	$$($(1)_BUILD_BAREBOXENV_CMDS)
>  	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
> @@ -136,7 +140,7 @@ endef
>  
>  ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
>  define $(1)_INSTALL_TARGET_CMDS
> -	cp $$(@D)/bareboxenv $$(TARGET_DIR)/usr/bin
> +	cp $$(@D)/scripts/bareboxenv-target $$(TARGET_DIR)/usr/bin/bareboxenv
>  endef
>  endif
>  
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
