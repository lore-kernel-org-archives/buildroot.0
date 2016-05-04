From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 21:46:05 +0200
Subject: [Buildroot] [PATCH v3] barebox: add an option to embed
	environment image
In-Reply-To: <1462360499-29955-1-git-send-email-yegorslists@googlemail.com>
References: <1462360499-29955-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <bf329c47-a1d6-09ff-2d5d-a67bf95308cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/16 13:14, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Barebox provides an option to embed a custom environment image into
> barebox binary. This image will be used, when the environment found
> in the environment sector is invalid.
>
> This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH
> to user specified path. This way one can use such BR's variables like
> BR2_EXTERNAL, TOPDIR etc. to provide paths to custom environment folders.
>
> Cc: Pieter Smith <pieter@boesman.nl>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v3: fix setting boolean option (Arnout Vandecappelle)
> 	    simplify config by just checking, if path was set (Arnout Vandecappelle)
> 	    use qstrip for path variable (Arnout Vandecappelle)
>
> 	v2: set CONFIG_DEFAULT_ENVIRONMENT too, to enable default env at all
>  boot/barebox/barebox-aux/Config.in | 14 ++++++++++++++
>  boot/barebox/barebox.mk            |  7 +++++++
>  boot/barebox/barebox/Config.in     | 14 ++++++++++++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
> index 35aadc0..e381d10 100644
> --- a/boot/barebox/barebox-aux/Config.in
> +++ b/boot/barebox/barebox-aux/Config.in
> @@ -57,3 +57,17 @@ config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV_PATH
>  	  the additions needed. The output will be an image in the
>  	  barebox devfs format, stored in the images directory, with
>  	  the same name as the directory name given here.
> +
> +config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
> +	string "Embedded environment path"
> +	help
> +	  Embed a custom environment image into barebox binary. If this
> +	  path is provided both barebox internal CONFIG_DEFAULT_ENVIRONMENT

  This line is too long (should be 72 chars where tab counts as 8).

  But actually, I find the text of your commit message more helpful. How about.

	  If this option is not empty, it is the path to a custom
	  embedded barebox environment. This image will be used when the
	  environment found in the environment sector is invalid. This
	  option sets the barebox Kconfig option
	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This way
	  it is possible to use Buildroot variables like BR2_EXTERNAL,
	  TOPDIR etc. to refer to the custom environment.

	  Depending on your setup, the custom embedded environment will
	  probably be based on either the content of the defaultenv or
	  defaultenv-2 directories in the barebox source code.

  (Note that we spell Barebox with a capital everywhere, except for the options 
just added by Pieter. But the website itself says barebox without capital, so 
that's indeed better.)

> +	  and CONFIG_DEFAULT_ENVIRONMENT_PATH will be configured.
> +
> +	  Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
> +	  will be set to the path containing custom barebox
> +	  environment. Depending on your setup, it will probably be
> +	  based on either the content of the defaultenv or
> +	  defaultenv-2 directories in the barebox source code, plus
> +	  the additions needed.
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 949fb9f..6ed072f 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -96,6 +96,13 @@ define $(1)_INSTALL_CUSTOM_ENV
>  endef
>  endif
>
> +ifneq ($$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH)),)

  I think it's better to use an auxiliary variable for the qstripped path.

> +define $(1)_KCONFIG_FIXUP_CMDS
> +	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT,$$(@D)/.config)
> +	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))",$$(@D)/.config)
> +endef
> +endif
> +
>  define $(1)_BUILD_CMDS
>  	$$($(1)_BUILD_BAREBOXENV_CMDS)
>  	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
> diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
> index bf13ea5..a95b123 100644
> --- a/boot/barebox/barebox/Config.in
> +++ b/boot/barebox/barebox/Config.in
> @@ -63,3 +63,17 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
>  	  the additions needed. The output will be an image in the
>  	  barebox devfs format, stored in the images directory, with
>  	  the same name as the directory name given here.
> +
> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
> +	string "Embedded environment path"
> +	help

  Same help as above, of course.

  Regards,
  Arnout

> +	  Embed a custom environment image into barebox binary. If this
> +	  path is provided both barebox internal CONFIG_DEFAULT_ENVIRONMENT
> +	  and CONFIG_DEFAULT_ENVIRONMENT_PATH will be configured.
> +
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
