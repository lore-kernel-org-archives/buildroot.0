From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 22 Sep 2015 09:37:26 +0100
Subject: [Buildroot] [PATCH v9 1/1] squeezelite: new package
In-Reply-To: <201509220826.t8M8QvuY012965@ms-omx01.plus.so-net.ne.jp>
References: <201509220826.t8M8QvuY012965@ms-omx01.plus.so-net.ne.jp>
Message-ID: <56011346.4020006@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On 09/22/2015 09:26 AM, kei-k at ca2.so-net.ne.jp wrote:
[snip]

> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
> new file mode 100644
> index 0000000..96efb7c
> --- /dev/null
> +++ b/package/squeezelite/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_SQUEEZELITE
> +	bool "squeezelite"
> +	depends on BR2_USE_WCHAR # flac
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +	depends on BR2_USE_MMU # mpg123
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_FLAC
> +	select BR2_PACKAGE_LIBMAD
> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_FAAD2
> +	select BR2_PACKAGE_MPG123
> +	help
> +	  Logitech Media Server client
> +	  https://code.google.com/p/squeezelite/
> +
> +config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
> +	bool "Enable resampling function"
> +	default n
> +	select BR2_PACKAGE_LIBSOXR
> +	depends on BR2_PACKAGE_SQUEEZELITE
> +	help
> +	  Enable resampling function

The BR2_PACKAGE_SQUEEZELITE_RESAMPLE block needs to be enclosed into an
if clause like these one:

if BR2_PACKAGE_SQUEEZELITE
[here the BR2_PACKAGE_SQUEEZELITE_RESAMPLE block]
endif

That way the resample option will only be shown in the menu after
selecting the squeezelite package.

Regards,

Vincent.

> +comment "squeezelite needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
> new file mode 100644
> index 0000000..4defa31
> --- /dev/null
> +++ b/package/squeezelite/squeezelite.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# squeezelite
> +#
> +################################################################################
> +
> +SQUEEZELITE_VERSION = v1.8
> +SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
> +SQUEEZELITE_SITE_METHOD = git
> +SQUEEZELITE_LICENSE = GPLv3
> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123 libsoxr
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
> +SQUEEZELITE_MAKE_OPTS += -DRESAMPLE -DRESAMPLE_MP
> +endif
> +
> +define SQUEEZELITE_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
> +		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +define SQUEEZELITE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))
> 
