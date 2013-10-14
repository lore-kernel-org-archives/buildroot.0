From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 19:40:50 +0200
Subject: [Buildroot] [PATCH v5] espeak: new package
In-Reply-To: <1381770929-13754-1-git-send-email-arnaud.aujon@gmail.com>
References: <1381770929-13754-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <20131014194050.6f0db457@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud Aujon,

> +if BR2_PACKAGE_ESPEAK
> +choice
> +	prompt "choose audio backend"
> +	default BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
> +
> +	config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
> +		bool "No sound backend, only produce wav files"
> +
> +	comment "ALSA backend requires a toolchain with threads support"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +	config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
> +		bool "ALSA via Portaudio"
> +		select BR2_PACKAGE_PORTAUDIO
> +		select BR2_PACKAGE_PORTAUDIO_CXX
> +		depends on BR2_TOOLCHAIN_HAS_THREADS #portaudio
> +
> +	comment "Pulseaudio backend requires a toolchain with WCHAR, LARGEFILE and threads support"
> +	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR && BR2_LARGEFILE)
> +
> +	config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
> +		bool "pulseaudio"
> +		select BR2_PACKAGE_PULSEAUDIO
> +		depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
> +		depends on BR2_USE_WCHAR # pulseaudio
> +		depends on BR2_LARGEFILE # pulseaudio

Throughout the Buildroot tree, I don't think we have the habit of
indenting things inside a choice, so I would remove one tab from this
entire block. However, the "depends on" for the comments should be
intended.

> +
> +endchoice
> +endif #BR2_PACKAGE_ESPEAK

Nit pick: one space between # and BR2_...

> diff --git a/package/espeak/espeak-1-do-not-compil-when-install.patch b/package/espeak/espeak-1-do-not-compil-when-install.patch

Even we have agreed on the number of digits we should use, I believe 1
digit is really too short. We don't even notice it's the patch number.
So if you could replace that by espeak-01-....patch it would be great.

> +ESPEAK_VERSION = 1.47.11
> +ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
> +ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-1.47
> +ESPEAK_LICENSE = GPLv3

License is actually GPLv3+, as the source code states:

 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 3 of the License, or     *
 *   (at your option) any later version.                                   *


> +define ESPEAK_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS)\
> +		AUDIO="$(ESPEAK_AUDIO_BACKEND)"\

One space before backslashes.

> +		-C $(@D)/src all
> +endef
> +
> +define ESPEAK_INSTALL_TARGET_CMDS
> +	$(MAKE) install DESTDIR="$(TARGET_DIR)" -C $(@D)/src
> +endef

Other than that, looks good to me. Thanks a lot for the quick
turnaround of new versions!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
