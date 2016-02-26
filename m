From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 00:26:51 +0100
Subject: [Buildroot] [v3,
 2/4] barebox: adds option to build secondary config
In-Reply-To: <1453329821-3167-3-git-send-email-pieter@boesman.nl>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-3-git-send-email-pieter@boesman.nl>
Message-ID: <56D0DF3B.1060305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/16 23:43, Pieter Smith wrote:
> Support selection of secondary config, but version, source URL and patches are
> shared with barebox bootloader build.
> 
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>  boot/barebox/Config.in                | 60 ++++++++++++++++++++++++++++++++++-
>  boot/barebox/barebox-2/barebox-2.hash |  1 +
>  boot/barebox/barebox-2/barebox-2.mk   | 54 +++++++++++++++++++++++++++++++
>  3 files changed, 114 insertions(+), 1 deletion(-)
>  create mode 120000 boot/barebox/barebox-2/barebox-2.hash
>  create mode 100644 boot/barebox/barebox-2/barebox-2.mk
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index ed120af..f848afe 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -100,11 +100,20 @@ config BR2_TARGET_BAREBOX_ONE_CONFIG
>  	  Useful for building the traditional TPL (Tertiary Program
>  	  Loader).
>  
> +config BR2_TARGET_BAREBOX_TWO_CONFIGS
> +	select BR2_TARGET_BAREBOX_1
> +	select BR2_TARGET_BAREBOX_2
> +	bool "Build 2 configs"
> +	help
> +	  Build two barebox configurations.
> +	  Useful for building an SPL (Secondary Program Loader) in addition to
> +	  the traditional TPL (Tertiary Program Loader), such as the X-Loader
> +	  or MLO for Texas Instruments processors.
> +
>  endchoice
>  
>  config BR2_TARGET_BAREBOX_1
>  	bool "Barebox configuration 1"
> -	default y
>  
>  if BR2_TARGET_BAREBOX_1
>  
> @@ -142,4 +151,53 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
>  
>  endif
>  
> +if BR2_TARGET_BAREBOX_TWO_CONFIGS
> +
> +config BR2_TARGET_BAREBOX_2
> +	bool "Barebox configuration 2"

 So, if you remove the choice, then this config should stay and be called
something like "build second Barebox configuration", with the help text from
BR2_TARGET_BAREBOX_TWO_CONFIGS.

 And if the option of keeping barebox and just adding barebox-2 works out, then
this can also go into a separate Config.in file in the barebox-2 directory,
which is source'd from here.

 Also, it should be a menuconfig instead, since there are 5 entries.

> +
> +if BR2_TARGET_BAREBOX_2
> +
> +choice
> +	prompt "Type of configuration"
> +	default BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
> +
> +config BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
> +	bool "Using a defconfig"
> +
> +config BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
> +	bool "Using a custom config file"
> +
> +endchoice
> +
> +config BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG
> +	string "Board defconfig"
> +	depends on BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
> +	help
> +	  Name of the board for which Barebox should be built, without
> +	  the _defconfig suffix.
> +
> +

 Spurious line here.


 Regards,
 Arnout

> +config BR2_TARGET_BAREBOX_2_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the barebox configuration file
> +
> +config BR2_TARGET_BAREBOX_2_CONFIG_FRAGMENT_FILES
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-separated list of configuration fragment files,
> +	  that will be merged to the main Barebox configuration file.
> +
> +config BR2_TARGET_BAREBOX_2_INSTALL_FILENAME
> +	string "Destination image filename in output/images"
> +	default "MLO"
> +	help
> +	  Name to give the image in the output/images directory.
> +
> +endif
> +
> +endif
> +
>  endif
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
