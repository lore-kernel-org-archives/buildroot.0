From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 23:46:06 +0200
Subject: [Buildroot] [PATCH v3 1/2] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <20210427125657.1449953-1-eugen.hristev@microchip.com>
References: <20210427125657.1449953-1-eugen.hristev@microchip.com>
Message-ID: <20210518234606.0683f320@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Tue, 27 Apr 2021 15:56:56 +0300
Eugen Hristev via buildroot <buildroot@busybox.net> wrote:

> Introduce support for the next generation of at91bootstrap,
> at91bootstrap 4.x series.
> 
> AT91Bootstrap 4.x only supports devices: sam9x60, sama5d2, sama5d3,
> sama5d4, sama7g5.
> 
> User can select 4.x series as a bool, and if so, the latest 4.x
> version is automatically selected.
> If the user deselects this option, only 3.x latest version can be
> picked.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

I just submitted a patch series that is based on your work, but
modified to match how I believe it should be done. Some comments below
to explain which changes I made.

> +config BR2_TARGET_AT91BOOTSTRAP3_4SERIES
> +	bool "AT91Bootstrap3 4.x series"
> +	help
> +	  AT91Bootstrap3 4.x series version

This option is not necessary, see below for how I handled that.

>  choice
>  
>  	prompt "AT91 Bootstrap 3 version"
>  
> -config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
> +config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X

We don't want this option rename, as otherwise we would need a
Config.in.legacy entry, and we would potentially break existing
configuration. So instead, I have kept
BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION, which points to 4.0.0-rc2.
Indeed, this is really the "latest" version".

And then I've added a new BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
symbol, which points to 3.9.3.

Note that you had forgotten to update the .hash file to add the hash of
the 4.0.0-rc1 tarball, so in fact your patch wasn't working when trying
to build 4.0.0-rc1.

> +config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
> +	bool "AT91Bootstrap3 requires host Python 3.x for NAND/PMECC scripts"
> +	help
> +	  Host Python 3.x needs to be installed to use the NAND/PMECC python scripts

I've moved that to a separate commit, with a better prompt and help
text.

> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3),y)
> +AT91BOOTSTRAP3_DEPENDENCIES += host-python3
> +endif

Moved to the separate patch as well, of course.

> +
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
>  AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
>  AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
> @@ -19,7 +23,7 @@ else
>  AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
>  endif
>  
> -AT91BOOTSTRAP3_LICENSE = Atmel License
> +AT91BOOTSTRAP3_LICENSE = Microchip License

This is unrelated, and actually quite dubious, since the main.c file
which we use as the license file is still referring to "Atmel", in both
3.x and 4.x versions, which makes this change anyway independent from
the 4.x support.

>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
>  AT91BOOTSTRAP3_LICENSE_FILES = main.c
>  endif
> @@ -47,9 +51,15 @@ define AT91BOOTSTRAP3_BUILD_CMDS
>  	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D)
>  endef
>  
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_4SERIES),y)
> +define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> +	cp $(@D)/build/binaries/*.bin $(BINARIES_DIR)
> +endef
> +else
>  define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
>  	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
>  endef
> +endif

Replaced by using $(wildcard ...) to copy both build/binaries/*.bin and
binaries/*.bin so that we are compatible with 3.x and 4.x without the
need for BR2_TARGET_AT91BOOTSTRAP3_4SERIES.

See my patch series at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=244548

Note that I have not taken care of your second patch adding the
defconfig. Indeed, once the at91bootstrap 4.x support is applied, your
defconfig should not be problematic at all to apply.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
