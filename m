From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 11:33:23 +0200
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210519093323.GL2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-05-18 23:37 +0200, Thomas Petazzoni spake thusly:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> The project at https://github.com/linux4sam/at91bootstrap was until
> now releasing 3.x versions, which were packaged using
> boot/at91bootstrap3/ in Buildroot. Microchip has now started a new
> branch of at91bootstrap, called 4.x, which will only support the
> following devices: sam9x60, sama5d2, sama5d3, sama5d4, sama7g5. A
> number of older devices from Microchip will only be supported by the
> existing 3.x series.
> 
> Therefore, we cannot simply remove support for the 3.x series, and
> allow using only the 4.x series.
> 
> So what this commit does is extend the boot/at91bootstrap3 package to
> support building both 3.x and 4.x versions. In detail, this implies:
> 
>  * Having the BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION symbol point to
>    the latest 4.x version. Indeed, we want
>    BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION to really point to the
>    latest upstream version, even if that means potential breakage for
>    users. Users who want to use a fixed version of at91bootstrap
>    should anyway not be using
>    BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION.
> 
>  * Introduce BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X for users who
>    would like to use the latest 3.x series.

This introduces two issues.

First, and most important: this means that we now have two "known
versions". However, you forgot to account for the licensing stuff. We
use main.c as a substitute for a license file, but of course main.c
differs between 4.x and 3.x...

We could carry a per-version hash file, but using main.c as a license
file is really just hidding the issue. IOnstead, I've dropped it
altogether.

Eugen, Nicolas (and Simon?): would you care to add an actual license
file to your repository, please?

The second issue is less of an issue: there were two defconfigs that use
the default 3.x version. Without a tweak, they would have switched over
to using 4.x. So I pinned them with BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X.

>  * Adjust the installation logic, as images to install are now in
>    build/binaries/*.bin instead of binaries/*.bin. In order to not
>    have to differentiate 3.x and 4.x, we simply use $(wildcard ...) to
>    expand the list of files to install.
> 
>  * To make it clear that boot/at91bootstrap3 supports both 3.x and
>    4.x, we also update the prompt of the package.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> [Thomas: while this patch is based on previous work by Eugen, it was
> reworked quite significantly.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

With the aboce two issues adressed: applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/at91bootstrap3/Config.in           | 10 +++++++---
>  boot/at91bootstrap3/at91bootstrap3.hash |  1 +
>  boot/at91bootstrap3/at91bootstrap3.mk   |  2 +-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index 25ab30489f..ebc912e46c 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_TARGET_AT91BOOTSTRAP3
> -	bool "AT91 Bootstrap 3"
> +	bool "AT91 Bootstrap 3+"
>  	depends on BR2_arm926t || BR2_cortex_a5 || BR2_cortex_a7
>  	help
>  	  AT91Bootstrap is a first level bootloader for the Atmel AT91
> @@ -16,9 +16,12 @@ if BR2_TARGET_AT91BOOTSTRAP3
>  
>  choice
>  
> -	prompt "AT91 Bootstrap 3 version"
> +	prompt "AT91 Bootstrap 3+ version"
>  
>  config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
> +	bool "4.0.0-rc2"
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
>  	bool "3.9.3"
>  
>  config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
> @@ -51,7 +54,8 @@ endif
>  
>  config BR2_TARGET_AT91BOOTSTRAP3_VERSION
>  	string
> -	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
> +	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
> +	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
>  	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
>  		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
>  	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
> diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
> index 6b6257b0ab..a63eb1d623 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.hash
> +++ b/boot/at91bootstrap3/at91bootstrap3.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
> +sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
>  sha256  fd7a1ce5719bb7abf5e289da2e0ea8c933af3ba0f6ad03dbdbd2b7f54a77498a  main.c
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index a942afcdc9..fdd87591bb 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -48,7 +48,7 @@ define AT91BOOTSTRAP3_BUILD_CMDS
>  endef
>  
>  define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> -	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
> +	cp $(wildcard $(@D)/build/binaries/*.bin $(@D)/binaries/*.bin) $(BINARIES_DIR)
>  endef
>  
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> -- 
> 2.31.1
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
