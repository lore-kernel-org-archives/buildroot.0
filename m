From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:44:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/alac: new package
In-Reply-To: <20200727152720.8427-1-marc.chalain@gmail.com>
References: <20200727152720.8427-1-marc.chalain@gmail.com>
Message-ID: <20200907234438.5aca1015@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Jul 2020 17:27:20 +0200
Marc Chalain <marc.chalain@gmail.com> wrote:

> From: Marc Chalain <marc.chalain@smile.fr>
> 
> The Apple Lossless Audio Codec (ALAC) is an audio codec developed by Apple and supported on iPhone, iPad, most iPods, Mac and iTunes. ALAC is a data compression method which reduces the size of audio files with no loss of information. A decoded ALAC stream is bit-for-bit identical to the original uncompressed audio file.

This commit log should be wrapped at 72 columns.

> diff --git a/package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch b/package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch
> new file mode 100644
> index 0000000000..580a18d3a6
> --- /dev/null
> +++ b/package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch
> @@ -0,0 +1,26 @@
> +convert-utility: reorder library and objects to link all symbols
> +
> +Signed-off-by: Marc Chalain <marc.chalain@smile.fr>

Since upstream is using Git, we would like to have a patch generated
with "git format-patch -N".

> diff --git a/package/alac/Config.in b/package/alac/Config.in
> new file mode 100644
> index 0000000000..2f1d4a1077
> --- /dev/null
> +++ b/package/alac/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_ALAC
> +	bool "Apple Lossless Audio Codec"

Just:

	bool "alac"

> +	help
> +	  Alac is an audio codec developed by Apple and
> +	  supported on iPhone, iPad, most iPods, Mac and
> +	  iTunes. ALAC is a data compression method which
> +	  reduces the size of audio files with no loss
> +	  of information. A decoded ALAC stream is bit-for-bit
> +	  identical to the original uncompressed audio file
> +
> +	  https://macosforge.github.io/alac/
> +
> +
> +config BR2_PACKAGE_ALAC_CONVERT
> +	bool "binary converter"
> +	depends on BR2_PACKAGE_ALAC

We prefer:

if BR2_PACKAGE_ALAC

config ...

endif

Also, the prompt should be "alacconvert", and the option should have a
help text.

> diff --git a/package/alac/alac.hash b/package/alac/alac.hash
> new file mode 100644
> index 0000000000..9477916558
> --- /dev/null
> +++ b/package/alac/alac.hash
> @@ -0,0 +1,2 @@

Please add a comment:

# Locally calculated

> +sha256 98635ece42fb1c3fceb75eaa4b5164d866e09f0195b3e7ec4085f1123c5e272f  alac-c38887c5c5e64a4b31108733bd79ca9b2496d987.tar.gz
> +sha256 a337314dd82d26791112c1e5a85725b2eb92f5b7e6f9102fa4eaa2903f77518f  LICENSE
> diff --git a/package/alac/alac.mk b/package/alac/alac.mk
> new file mode 100644
> index 0000000000..64227eaa2e
> --- /dev/null
> +++ b/package/alac/alac.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# alac
> +#
> +################################################################################
> +
> +ALAC_VERSION = c38887c5c5e64a4b31108733bd79ca9b2496d987
> +ALAC_SITE =$(call github,macosforge,alac,$(ALAC_VERSION))
> +ALAC_LICENSE = APACHE

This is not a valid SPDX identifier.

> +ALAC_LICENSE_FILES = LICENSE
> +ALAC_INSTALL_STAGING = YES
> +
> +ALAC_MAKE_OPTS =  CC=$(TARGET_CXX)

You should use $(TARGET_CONFIGURE_OPTS) instead.

> +ifeq ($(BR2_PACKAGE_ALAC_CONVERT),y)
> +define ALACCONVERT_BUILD_CMDS
> +	$(MAKE) $(ALAC_MAKE_OPTS) -C $(@D)/convert-utility
> +endef
> +define ALAC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/convert-utility/alacconvert $(TARGET_DIR)/usr/bin

You should use a full destination path here.

> +endef

> +endif
> +
> +define ALAC_BUILD_CMDS
> +	$(MAKE) $(ALAC_MAKE_OPTS) -C $(@D)/codec
> +	$(ALACCONVERT_BUILD_CMDS)
> +endef

Perhaps for the build, you could do:

ALAC_MAKE_TARGETS = codec

ifeq ($(BR2_PACKAGE_ALAC_CONVERT),y)
ALAC_MAKE_TARGETS += convert-utility
...
endif

define ALAC_BUILD_CMDS
	$(foreach t,$(ALAC_MAKE_TARGETS), \
		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
			-C $(@D)/$(t)
	)
endef
		
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
