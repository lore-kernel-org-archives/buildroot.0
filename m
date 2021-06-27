From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jun 2021 12:44:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix env image help
 text
In-Reply-To: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
References: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
Message-ID: <20210627104420.GA2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mirza, All,

On 2021-06-25 11:19 +0200, Mirza Kapetanovic spake thusly:
> BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE is passed almost as is to mkenvimage
> which, looking at the help text and source code of the tool, doesn't seem to support
> mulitple files as input.
> 
> I tried providing multiple files (space separated) and only the last file was included
> in the resulting environment image.

Can't we instead make that possible?

For example, this (totally untested) patch should be a step in that
direction, I think:

    diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
    index 8963d6182e..d4392e47bf 100644
    --- a/package/uboot-tools/uboot-tools.mk
    +++ b/package/uboot-tools/uboot-tools.mk
    @@ -116,7 +116,7 @@ endif
     
     ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
     
    -UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
    +UBOOT_TOOLS_ENV_FILE_SOURCES = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
     
     # If BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE is left empty, we
     # will use the default environment provided in the U-Boot build
    @@ -130,7 +130,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
     
     # Handle the case where BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
     # is left empty, use the default U-Boot environment.
    -ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
    +ifeq ($(UBOOT_TOOLS_ENV_FILE_SOURCES),)
     UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
     define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
     	CROSS_COMPILE="$(TARGET_CROSS)" \
    @@ -138,7 +138,13 @@ define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
     		$(UBOOT_SRCDIR) \
     		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
     endef
    -endif # UBOOT_TOOLS_GENERATE_ENV_FILE
    +else
    +UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-buildroot.txt
    +define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
    +	cat $(UBOOT_TOOLS_ENV_FILE_SOURCES) \
    +		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
    +endef
    +endif # UBOOT_TOOLS_ENV_FILE_SOURCE
     endif # BR2_TARGET_UBOOT
     
     ifeq ($(BR_BUILDING),y)

As I said: totally untested... I can already see that it is broken for
the case where uboot is not enabled, so this definitely needs a little
bit more of thinking...

Can you look into that, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
> ---
>  package/uboot-tools/Config.in.host | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
> index 431cc8631d..7e5c5084c0 100644
> --- a/package/uboot-tools/Config.in.host
> +++ b/package/uboot-tools/Config.in.host
> @@ -56,15 +56,13 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
>  if BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
>  
>  config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
> -	string "Source files for environment"
> +	string "Source file for environment"
>  	default BR2_TARGET_UBOOT_ENVIMAGE_SOURCE if BR2_TARGET_UBOOT_ENVIMAGE_SOURCE != "" # legacy
>  	help
> -	  Text files describing the environment. Files should have
> +	  Text file describing the environment. File should have
>  	  lines of the form var=value, one per line. Blank lines and
>  	  lines starting with a # are ignored.
>  
> -	  Multiple source files are concatenated in the order listed.
> -
>  	  Leave empty to generate image from compiled-in env if a U-boot
>  	  target build is configured (BR2_TARGET_UBOOT)
>  
> -- 
> 2.25.1
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
