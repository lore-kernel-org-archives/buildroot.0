From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Apr 2014 08:11:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] u-boot: allow to pass a custom
 configuration file
In-Reply-To: <1379675476-24448-1-git-send-email-eric.jarrige@armadeus.org>
References: <1379589006-28682-1-git-send-email-eric.jarrige@armadeus.org>
 <1379675476-24448-1-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <53609426.4050704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/09/13 13:11, Eric Jarrige wrote:
> 
> Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
> ---
> Changes v1 -> v2:
>   - Fix typo
> 
>  boot/uboot/Config.in |   18 ++++++++++++++++++
>  boot/uboot/uboot.mk  |    3 +++
>  2 files changed, 21 insertions(+), 0 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 1b98339..1db0339 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -71,6 +71,24 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
>  endif
>  
>  choice
> +	prompt "U-Boot configuration"
> +	default BR2_TARGET_UBOOT_USE_DEFCONFIG
> +
> +config BR2_TARGET_UBOOT_USE_DEFCONFIG
> +	bool "Using default board configuration file"

 Thomas P. made a remark that you didn't take into account:

>>> I don't think using the word 'defconfig' for U-Boot is appropriate,
>>> since 'defconfig' really refers to a kconfig terminology and U-Boot,
>>> sadly, doesn't use kconfig.
>>
>> Does the alternate terminology DEFAULT_CONFIG could be more
>> appropriate or acceptable ?
> 
> I don't think "default" is really meaningful. Just "Path to the board
> configuration file" would be sufficient.

 Also, it is missing help text. So I propose:

config BR2_TARGET_UBOOT_USE_BUNDLED_CONFIG
	bool "Use <boardname>.h in the U-Boot sources"
	help
	  Choose this option to use the include/configs/<boardname>.h
	  file in the U-Boot sources as the configuration.

config BR2_TARGET_UBOOT_USE_MODIFIED_CONFIG
	bool "Use a modified configuration header file"
	help
	  Choose this option to provide a path to a customized header
	  file with the configuration option. Note that this doesn't
	  allow you to create a custom board, only to modify some of
	  configuration variables.

> +
> +config BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> +	bool "Using a custom board configuration file"
> +
> +endchoice
> +
> +config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the board configuration file

	help
	  Path to the modified configuration header file. It will be
	  copied to include/configs/<boardname>.h in the U-Boot sources.
	  Note that this doesn't allow you to create a custom board,
	  only to modify some of configuration variables.


 Also, instead of adding a choice to choose between bundled or modified
configuration file, you could just have the string option and use the
default if it is empty. The first way is what is used in kernel and
barebox, the second way is what is done in busybox and uClibc. Well,
actually, the latter don't use the default when it's empty, instead they
encode the default in the Config.in - but I personally don't like that :-)

 Peter, which approach do you prefer?


> +
> +choice
>  	prompt "U-Boot binary format"
>  	default BR2_TARGET_UBOOT_FORMAT_BIN
>  
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 631da6b..8bcf260 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -80,6 +80,9 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
>  endif
>  
>  define UBOOT_CONFIGURE_CMDS
> +	$(if $(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),
> +		cp -pf $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)) \
> +			$(@D)/include/configs/$(UBOOT_BOARD_NAME).h)

 I prefer the following idiom:

ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
define UBOOT_COPY_CUSTOM_CONFIG_FILE
	...
endef
endif

define UBOOT_CONFIGURE_CMDS
	$(UBOOT_COPY_CUSTOM_CONFIG_FILE)
	...

 Peter, please confirm?


 Also, I don't like the -f option of cp much because most people don't
know what it means. And finally, I really wouldn't give it a -p.
Actually, if it's not recursive, we usually use $(INSTALL). Therefore:

ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
define UBOOT_COPY_CUSTOM_CONFIG_FILE
	(INSTALL) -m 0644 $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)) \
		$(@D)/include/configs/$(UBOOT_BOARD_NAME).h)
endef
endif



 And finally, to completely defuse Thomas's remarks, you could put the
following in the commit log.

"""
Add an option BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE that makes it possible
to override the configuration options in the board header file. This
avoids the need for manipulating the board header file with sed hacks
like is currently done for the BR2_TARGET_UBOOT_NETWORK settings.

Note that this option does not make it possible to add a new board to
U-Boot. That still has to be done by patching the source.
"""

 Regards,
 Arnout


>  	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
>  		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
>  		$(UBOOT_BOARD_NAME)_config
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
