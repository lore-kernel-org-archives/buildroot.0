From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 May 2016 19:38:46 +0200
Subject: [Buildroot] [PATCH v2] barebox: add an option to embed
 environment image
In-Reply-To: <1462280172-23389-1-git-send-email-yegorslists@googlemail.com>
References: <1462280172-23389-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <0a54707b-6bc8-979d-8eac-8aa87a388f08@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/16 14:56, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Barebox provides an option to embed a custom environment image into
> barebox.bin. This image will be used, when the environment found in
> the environment sector is invalid.
>
> This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH
> to user specified path. This way one can use such BR's variables like
> BR2_EXTERNAL, TOPDIR etc. to provide paths to custom environment folders.
>
> Cc: Pieter Smith <pieter@boesman.nl>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v2: set CONFIG_DEFAULT_ENVIRONMENT too, to enable default env at all
>
>  boot/barebox/barebox-aux/Config.in | 17 +++++++++++++++++
>  boot/barebox/barebox.mk            |  7 +++++++
>  boot/barebox/barebox/Config.in     | 17 +++++++++++++++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
> index 35aadc0..00d550e 100644
> --- a/boot/barebox/barebox-aux/Config.in
> +++ b/boot/barebox/barebox-aux/Config.in
> @@ -57,3 +57,20 @@ config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV_PATH
>  	  the additions needed. The output will be an image in the
>  	  barebox devfs format, stored in the images directory, with
>  	  the same name as the directory name given here.
> +
> +config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV
> +	bool "Embed custom environment"
> +	help
> +	  Embed a custom environment image into barebox.bin. This option
> +	  enables barebox internal CONFIG_DEFAULT_ENVIRONMENT option.
> +
> +config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
> +	string "Embedded environment path"
> +	depends on BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV

  I'm not altogether sure of this, but we could remove the _CUSTOM_EMBEDDED_ENV 
option and instead check for non-empty _CUSTOM_EMBEDDED_ENV_PATH. Or was this 
discussed before already?

> +	help
> +	  Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
> +	  will be set to the path containing custom barebox
> +	  environment. Depending on your setup, it will probably be
> +	  based on either the content of the defaultenv or
> +	  defaultenv-2 directories in the barebox source code, plus

  Not that I really know what all this is about, but isn't 'defaultenv' typical 
for plain barebox, and 'defaultenv-2' typical for barebox-aux? Then maybe the 
help text can suggest this as well.

> +	  the additions needed.
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 949fb9f..36a9cf5 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -96,6 +96,13 @@ define $(1)_INSTALL_CUSTOM_ENV
>  endef
>  endif
>
> +ifeq ($(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV),y)
> +define $(1)_KCONFIG_FIXUP_CMDS
> +	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH),$$(@D)/.config)

  Without actually knowing barebox, it seems to me that this should be a 
KCONFIG_ENABLE_OPT instead...

> +	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH),$$(@D)/.config)

  This should be qstripped and then "" added explicitly. That way, it will also 
work when the variable is overridden from the command line.


  Regards,
  Arnout

> +endef
> +endif
> +
>  define $(1)_BUILD_CMDS
>  	$$($(1)_BUILD_BAREBOXENV_CMDS)
>  	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
> diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
> index bf13ea5..a3a7767 100644
> --- a/boot/barebox/barebox/Config.in
> +++ b/boot/barebox/barebox/Config.in
> @@ -63,3 +63,20 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
>  	  the additions needed. The output will be an image in the
>  	  barebox devfs format, stored in the images directory, with
>  	  the same name as the directory name given here.
> +
> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
> +	bool "Embed custom environment"
> +	help
> +	  Embed a custom environment image into barebox.bin. This option
> +	  enables barebox internal CONFIG_DEFAULT_ENVIRONMENT option.
> +
> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
> +	string "Embedded environment path"
> +	depends on BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
> +	help
> +	  Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
> +	  will be set to the path containing custom barebox
> +	  environment. Depending on your setup, it will probably be
> +	  based on either the content of the defaultenv or
> +	  defaultenv-2 directories in the barebox source code, plus
> +	  the additions needed.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
