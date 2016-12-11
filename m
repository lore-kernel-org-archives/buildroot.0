From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Dec 2016 11:02:43 +0100
Subject: [Buildroot] [PATCH] mimic: new package
In-Reply-To: <20161210122154.7172-1-ezequiel@vanguardiasur.com.ar> (Ezequiel
 Garcia's message of "Sat, 10 Dec 2016 09:21:54 -0300")
References: <20161210122154.7172-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <87shpusrzw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

Hi,

 > +config BR2_PACKAGE_MIMIC
 > +	bool "mimic"
 > +        help
 > +          Mimic is a fast, lightweight Text-to-speech engine developed by
 > +          Mycroft A.I. and VocaliD, based on Carnegie Mellon University's
 > +          Flite (Festival-Lite) software. Mimic takes in text and reads it
 > +          out loud to create a high quality voice.

Heh, "lightweight" - The tarball is more than 400MB!

> +################################################################################
 > +#
 > +# mimic
 > +#
 > +################################################################################
 > +
 > +MIMIC_VERSION = 1.1.0
 > +MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
 > +MIMIC_INSTALL_STAGING = NO
 > +MIMIC_LICENSE = MIT
 > +MIMIC_LICENSE_FILES = LICENSE
 > +
 > +MIMIC_DEPENDENCIES = host-pkgconf
 > +
 > +ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
 > +MIMIC_AUDIO_BACKEND = alsa
 > +MIMIC_DEPENDENCIES = alsa-lib
 > +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
 > +MIMIC_AUDIO_BACKEND = portaudio
 > +MIMIC_DEPENDENCIES = portaudio
 > +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
 > +MIMIC_AUDIO_BACKEND = pulseaudio
 > +MIMIC_DEPENDENCIES = pulseaudio

configure.ac uses PKG_CHECK_MODULES to detect these, so we should depend
on host-pkgconf - I've fixed that in git.

-- 
Bye, Peter Korsgaard
