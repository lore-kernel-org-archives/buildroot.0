From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:47:47 +0200
Subject: [Buildroot] [PATCH] openal: New package
In-Reply-To: <561C0AD0.6050909@dawncrow.de>
References: <561C0AD0.6050909@dawncrow.de>
Message-ID: <20151012214747.4c0d3cba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

Thanks for this patch! It looks pretty good, but I have some comments
(see below).

On Mon, 12 Oct 2015 21:32:32 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>

It seems like you have an UTF-8 configuration issue somewhere, since
this ? got messed up into ??.

> diff --git a/package/openal/Config.in b/package/openal/Config.in
> new file mode 100644
> index 0000000..0bbbb37
> --- /dev/null
> +++ b/package/openal/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_OPENAL
> +	bool "openal"
> +	# OpenAL needs a backend
> +	depends on BR2_PACKAGE_ALSA_LIB || \
> +	           BR2_PACKAGE_PORTAUDIO || \
> +	           BR2_PACKAGE_PULSEAUDIO

I think in this case, we like when at least one backend is
automatically selected. alsa-lib seems to be the simplest one, so:

	select BR2_PACKAGE_ALSA_LIB if !BR2_PACKAGE_PORTAUDIO && !BR2_PACKAGE_PULSEAUDIO
	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib

> +	help
> +	  OpenAL provides capabilities for playing audio in a virtual
> +	  3D environment. Distance attenuation, doppler shift, and
> +	  directional sound emitters are among the features handled by
> +	  the API.
> +
> +	  http://kcat.strangesoft.net/openal.html
> +
> +comment "openal needs a backend"
> +	depends on !BR2_PACKAGE_ALSA_LIB && \
> +	           !BR2_PACKAGE_PORTAUDIO && \
> +	           !BR2_PACKAGE_PULSEAUDIO

Replace this with:

comment "openal needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/openal/openal.hash b/package/openal/openal.hash
> new file mode 100644
> index 0000000..b28b2e2
> --- /dev/null
> +++ b/package/openal/openal.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	2f3dcd313fe26391284fbf8596863723f99c65d6c6846dccb48e79cadaf40d5f  openal-soft-1.16.0.tar.bz2
> diff --git a/package/openal/openal.mk b/package/openal/openal.mk
> new file mode 100644
> index 0000000..0c6a7cb
> --- /dev/null
> +++ b/package/openal/openal.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# openal
> +#
> +################################################################################
> +
> +OPENAL_VERSION = 1.16.0
> +OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
> +OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
> +OPENAL_LICENSE = LGPL

This should be LGPLv2+.

> +OPENAL_LICENSE_FILES = COPYING
> +OPENAL_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +OPENAL_DEPENDENCIES += alsa-lib

Maybe:

OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=ON
else
OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=OFF

> +endif
> +
> +ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
> +OPENAL_DEPENDENCIES += portaudio

ditto.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +OPENAL_DEPENDENCIES += pulseaudio

ditto.

This way, if it can't find Alsa even if we enabled it, we'll get an
error.

Could you fix those minor issues and send an updated version of your
patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
