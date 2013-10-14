From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 14 Oct 2013 10:05:12 -0500
Subject: [Buildroot] [PATCH v3]eSpeak: new package
In-Reply-To: <1381751344-7942-1-git-send-email-arnaud.aujon@gmail.com>
References: <1381751344-7942-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <OF4011086C.175959E2-ON86257C04.004BD9F8-86257C04.0052DFCE@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

See comment below

Arnaud Aujon <arnaud.aujon@gmail.com> wrote on 10/14/2013 06:49:04 AM:

> Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
> ---

For future reference, it would be nice to see a change log of the
different changes you have made between the different versions of
the patches.

Please see:
http://buildroot.uclibc.org/downloads/manual/manual.html#_patch_revision_changelog

>  package/Config.in                                  |  1 +
>  package/espeak/Config.in                           | 50 
++++++++++++++++++++++
>  .../espeak-1-do-not-compil-when-install.patch      | 15 +++++++
>  package/espeak/espeak.mk                           | 42 
++++++++++++++++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 package/espeak/Config.in
>  create mode 100644 
package/espeak/espeak-1-do-not-compil-when-install.patch
>  create mode 100644 package/espeak/espeak.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 41d828a..31f6274 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -6,6 +6,7 @@ menu "Audio and video applications"
>  source "package/alsa-utils/Config.in"
>  source "package/aumix/Config.in"
>  source "package/bellagio/Config.in"
> +source "package/espeak/Config.in"
>  source "package/faad2/Config.in"
>  source "package/ffmpeg/Config.in"
>  source "package/flac/Config.in"
> diff --git a/package/espeak/Config.in b/package/espeak/Config.in
> new file mode 100644
> index 0000000..61493ac
> --- /dev/null
> +++ b/package/espeak/Config.in
> @@ -0,0 +1,50 @@
> +comment "eSpeak requires a toolchain with C++ and WCHAR support"
> +   depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
> +
> +config BR2_PACKAGE_ESPEAK
> +   bool "eSpeak"
> +   depends on BR2_INSTALL_LIBSTDCPP
> +   depends on BR2_USE_WCHAR
> +   help
> +     eSpeak is a speech synthesizer software for English and other 
languages.
> +
> +     http://espeak.sourceforge.net/
> +
> +
> +

Seems like you have two extra new lines between the website and
the 

> +if BR2_PACKAGE_ESPEAK
> +choice
> +   prompt "choose audio backend"
> +   default BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
> +   help
> +     Select the audio backend you want to use

help comments seems a bit redundant from the prompt. I would 
consider removing it. 

> +
> +   config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
> +      bool "No sound backend, only produce wav files"
> +
> +   comment "ALSA backend requires a toolchain with threads support"
> +   depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +   config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
> +      bool "Portaudio and ALSA"

What if bool name was "ALSA via Portaudio" since really ALSA is
the backend but it is achieved using Portaudio? This would also
allow for the help to be removed since again help isn't saying
anything different that from the bool.

> +      select BR2_PACKAGE_PORTAUDIO
> +      select BR2_PACKAGE_PORTAUDIO_CXX
> +      depends on BR2_TOOLCHAIN_HAS_THREADS #portaudio
> +      help
> +        Allow eSpeak to output sound using ALSA
> +
> +   comment "Pulseaudio backend requires a toolchain with WCHAR, 
> LARGEFILE and threads support"
> +   depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR && 
BR2_LARGEFILE)
> +
> +   config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
> +      bool "pulseaudio"
> +      select BR2_PACKAGE_PULSEAUDIO
> +      depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
> +      depends on BR2_USE_WCHAR # pulseaudio
> +      depends on BR2_LARGEFILE # pulseaudio
> +      help
> +        Allow eSpeak to output sound using Pulseaudio

help seems redundant see earlier comments above.

> +
> +
> +endchoice
> +endif #BR2_PACKAGE_ESPEAK
> diff --git a/package/espeak/espeak-1-do-not-compil-when-install.patch 
> b/package/espeak/espeak-1-do-not-compil-when-install.patch
> new file mode 100644
> index 0000000..983cd1c
> --- /dev/null
> +++ b/package/espeak/espeak-1-do-not-compil-when-install.patch
> @@ -0,0 +1,15 @@
> +Makefile: do not execute the rule "all" when executing "install"
> +
> +signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
> +===================================================================
> +--- espeak-1.47.11-source.orig/src/Makefile
> ++++ espeak-1.47.11-source/src/Makefile
> +@@ -131,7 +131,7 @@
> +    rm -f $(BIN2_NAME)
> +    rm -f $(LIB_NAME)*
> + 
> +-install: all
> ++install:
> +    # Create directories
> +    rm -rf $(DESTDIR)$(DATADIR)
> +    $(MKDIR) $(DESTDIR)$(BINDIR)
> diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
> new file mode 100644
> index 0000000..31fe4c4
> --- /dev/null
> +++ b/package/espeak/espeak.mk
> @@ -0,0 +1,42 @@
> 
+###############################################################################
> +#
> +# espeak
> +#
> 
+###############################################################################
> +
> +ESPEAK_VERSION = 1.47.11-source
> +ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION).zip

The ESPEAK_VERSION and ESPEAK_SOURCE should be as follows because the 
version
number should only really be in ESPEAK_VERSION. 

ESPEAK_VERSION = 1.47.11
ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip

> +ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/
> espeak-1.47
> +ESPEAK_LICENSE = GPLv3
> +ESPEAK_LICENSE_FILES = Licence.txt
> +
> +ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA),y)
> +ESPEAK_AUDIO_BACKEND = portaudio
> +ESPEAK_DEPENDENCIES = portaudio
> +endif
> +ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO),y)
> +ESPEAK_AUDIO_BACKEND = pulseaudio
> +ESPEAK_DEPENDENCIES = pulseaudio
> +endif
> +
> +define ESPEAK_EXTRACT_CMDS
> +   unzip $(DL_DIR)/$(ESPEAK_SOURCE) -d $(BUILD_DIR)
> +endef

I would change the extract commands to be something like this and that
more closely mirror package/rapidjson/rapidjson.mk

define ESPEAK_EXTRACT_CMDS
        unzip -d $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)
        mv $(@D)/espeak-$(ESPEAK_VERSION)-source/* $(@D)
        rm -r $(@D)/espeak-$(ESPEAK_VERSION)-source
endef

By doing this, it removes the -source from the version number in the
BUILD_DIR and all of the legal-info things.

> +
> +define ESPEAK_CONFIGURE_CMDS
> +   # Buildroot provides portaudio V19, see ReadMe file for more 
details.
> +   cp $(@D)/src/portaudio19.h $(@D)/src/portaudio.h
> +endef
> +
> +define ESPEAK_BUILD_CMDS
> +   $(MAKE) $(TARGET_CONFIGURE_OPTS)\
> +      AUDIO="$(ESPEAK_AUDIO_BACKEND)"\
> +      -C $(@D)/src all
> +#   $(MAKE) CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" AUDIO="$
> (ESPEAK_AUDIO_BACKEND)" -C $(@D)/src all
> +endef
> +
> +define ESPEAK_INSTALL_TARGET_CMDS
> +   $(MAKE) install DESTDIR="$(TARGET_DIR)" -C $(@D)/src
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.8.3.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
