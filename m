From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 14:59:14 +0100
Subject: [Buildroot] [PATCH] mimic: new package
In-Reply-To: <20161210122154.7172-1-ezequiel@vanguardiasur.com.ar>
References: <20161210122154.7172-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20161210145914.35ae9db8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 09:21:54 -0300, Ezequiel Garcia wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

I've applied, with a number of changes, see below.


> diff --git a/package/mimic/Config.in b/package/mimic/Config.in
> new file mode 100644
> index 000000000000..b4322a986401
> --- /dev/null
> +++ b/package/mimic/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_MIMIC
> +	bool "mimic"
> +        help
> +          Mimic is a fast, lightweight Text-to-speech engine developed by
> +          Mycroft A.I. and VocaliD, based on Carnegie Mellon University's
> +          Flite (Festival-Lite) software. Mimic takes in text and reads it
> +          out loud to create a high quality voice.

I rewrapped the help text so that it fits in 72 character lines.

> +choice
> +	prompt "choose audio backend"

Simplified to just "audio backend"

> +	default BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
> +
> +config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
> +	bool "No sound backend, only produce wav files"

Simplified to "none", with an added help text.

> +
> +config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA
> +	bool "alsa"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +	select BR2_PACKAGE_ALSA_LIB

Changed to a "depends on BR2_PACKAGE_ALSA_LIB"

> +
> +config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO
> +	bool "alsa via portaudio"
> +	select BR2_PACKAGE_PORTAUDIO

Changed to a "depends on BR2_PACKAGE_PORTAUDIO"

> +
> +config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO
> +	bool "pulseaudio"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
> +	depends on BR2_USE_MMU # pulseaudio
> +	depends on !BR2_STATIC_LIBS # pulseaudio
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
> +	select BR2_PACKAGE_PULSEAUDIO

Changed to a "depends on BR2_PACKAGE_PULSEAUDIO", which avoids the need
to replicate all the dependencies.

> +MIMIC_VERSION = 1.1.0
> +MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
> +MIMIC_INSTALL_STAGING = NO

I removed this line, as it's useless: it's the default.

> +MIMIC_LICENSE = MIT
> +MIMIC_LICENSE_FILES = LICENSE
> +
> +MIMIC_DEPENDENCIES = host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
> +MIMIC_AUDIO_BACKEND = alsa
> +MIMIC_DEPENDENCIES = alsa-lib

Using = here is wrong: you basically ignore the host-pkgconf
dependency defined above. So I've changed this to += here, and in the
other cases below.

> +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
> +MIMIC_AUDIO_BACKEND = portaudio
> +MIMIC_DEPENDENCIES = portaudio
> +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
> +MIMIC_AUDIO_BACKEND = pulseaudio
> +MIMIC_DEPENDENCIES = pulseaudio
> +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE),y)
> +MIMIC_AUDIO_BACKEND = none
> +endif
> +
> +MIMIC_CONF_OPTS += --with-audio="$(MIMIC_AUDIO_BACKEND)"

Double quotes unneeded, so I dropped them.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
