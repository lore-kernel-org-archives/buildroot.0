From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Mon, 7 Oct 2013 14:12:01 +0200
Subject: [Buildroot] eSpeak: new package
In-Reply-To: <20131007134818.6be83088@skate>
References: <CACjG4BJjXtXVBTTS9zneQ-JEmsOA+zzbDhNiZv6N5AvXhz7cPw@mail.gmail.com>
 <20131007134818.6be83088@skate>
Message-ID: <CACjG4BKRzYUBJnEpiiTAtEr4bGRT4Rh5znPqoEEeSVUTWZQXYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the review, I will post a new version soon.


2013/10/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear arnaud aujon,
>
> On Mon, 7 Oct 2013 12:25:45 +0200, arnaud aujon wrote:
> > From 853618d37de1afd4fe43b502e5582423ceea3d43 Mon Sep 17 00:00:00 2001
> > From: Arnaud Aujon <arnaud.aujon@gmail.com>
> > Date: Mon, 7 Oct 2013 11:48:52 +0200
> > Subject: [PATCH] Add new package espeak, a speech synthesizer software
> >
> > Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
>
> Thanks for this patch. It looks pretty good, but there are a few issues
> to fix. First of all, could you use "git send-email" to send patches?
> Your patch is currently completely line-wrapped, most likely due to
> your mail client. Using "git send-email" ensures your mail client does
> not do bad things with your patches, and there are plenty of tutorials
> on the Web that explain how to configure "git send-email" for GMail
> users.
>
> > +comment "eSpeak requires a toolchain with C++ and WCHAR support"
> > +    depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
> > +
> > +config BR2_PACKAGE_ESPEAK
> > +    bool "eSpeak"
> > +    depends on BR2_INSTALL_LIBSTDCPP
> > +    depends on BR2_USE_WCHAR
> > +    help
>
> Indentation should be done with one tab, but maybe it's correct in your
> original code, and your mail client has replaced the tab with spaces.
> Just make sure that you're indeed using tabs in your code, and resend
> with git send-email.
>
> > +      eSpeak is a speech synthesizer software for English and other
> > languages.
> > +
> > +      http://espeak.sourceforge.net/
> > +
> > +
> > +
> > +if BR2_PACKAGE_ESPEAK
> > +
> > +config BR2_PACKAGE_ESPEAK_SOUND
> > +    bool
>
> This option is not used anywhere, as far as I can see.
>
> > +choice
> > +    prompt "choose audio backend"
> > +    default BR2_PACKAGE_ESPEAK_SOUND_NOSOUND
> > +    help
> > +      Select the audio backend you want to use
> > +
> > +    config BR2_PACKAGE_ESPEAK_SOUND_NOSOUND
> > +        bool "No sound backend, only produce wav files"
> > +
> > +    comment "ALSA backend requires a toolchain with threads support"
> > +    depends on !(BR2_TOOLCHAIN_HAS_THREADS)
>
> Useless parenthesis.
>
> > +
> > +    config BR2_PACKAGE_ESPEAK_SOUND_ALSA
> > +        bool "Portaudio and ALSA"
> > +        select BR2_PACKAGE_PORTAUDIO
> > +        select BR2_PACKAGE_PORTAUDIO_CXX
> > +        depends on BR2_TOOLCHAIN_HAS_THREADS #portaudio
> > +        help
> > +          Allow eSpeak to output sound using ALSA
> > +
> > +    comment "Pulseaudio backend requires a toolchain with WCHAR,
> LARGEFILE
> > and threads support"
> > +    depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR &&
> > BR2_LARGEFILE)
> > +
> > +    config BR2_PACKAGE_ESPEAK_SOUND_PULSEAUDIO
> > +        bool "pulseaudio"
> > +        select BR2_PACKAGE_PULSEAUDIO
> > +        depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
> > +        depends on BR2_USE_WCHAR # pulseaudio
> > +        depends on BR2_LARGEFILE # pulseaudio
> > +        help
> > +          Allow eSpeak to output sound using Pulseaudio
> > +
> > +
> > +endchoice
> > +endif #BR2_PACKAGE_ESPEAK
> > diff --git a/package/espeak/espeak-1-do-not-compil-when-install.patch
> > b/package/espeak/espeak-1-do-not-compil-when-install.patch
> > new file mode 100644
> > index 0000000..744af62
> > --- /dev/null
> > +++ b/package/espeak/espeak-1-do-not-compil-when-install.patch
> > @@ -0,0 +1,15 @@
> > +Index: espeak-1.47.11-source/src/Makefile
> > +Makefile: do not executethe rule "all" when executing "install"
> > +signed-off-by Arnaud Aujon <arnaud.aujon@gmail.com>
>
> The Index: line is not needed, and there should be one empty line
> between the description and the Signed-off-by line. Also, Signed-off-by
> should be followed by a colon sign, such as:
>
> Signed-off-by: Foo Bar <foo.bar@barfoo.com>
>
> And while you're at it, add a space between 'execute' and 'the'.
>
> >
> +###############################################################################
> > +#
> > +# eSpeak
>
> The package name in the header should be all lower case.
>
> > +#
> >
> +################################################################################
>
> Please add one empty line between the header and the first variable.
>
> > +ESPEAK_VERSION = 1.47.11-source
> > +ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION).zip
> > +ESPEAK_SITE =
> > http://sourceforge.net/projects/espeak/files/espeak/espeak-1.47
>
> We use downloads.sourceforge.net for all Sourceforge downloads. See
> other Sourceforge packages in Buildroot.
>
> > +ESPEAK_LICENSE = GPLv3
>
> Can you check it's really GPLv3 and not GPLv3+ ?
>
> > +ESPEAK_LICENSE_FILES = Licence.txt
> > +
> > +ifeq ($(BR2_PACKAGE_ESPEAK_SOUND_ALSA), y)
> > +AUDIO = portaudio
> > +ESPEAK_DEPENDENCIES = portaudio
> > +endif
> > +ifeq ($(BR2_PACKAGE_ESPEAK_SOUND_PULSEAUDIO), y)
> > +AUDIO = pulseaudio
> > +ESPEAK_DEPENDENCIES = pulseaudio
> > +endif
> > +ifeq ($(BR2_PACKAGE_ESPEAK_SOUND_NOSOUND), y)
> > +AUDIO =
> > +endif
>
> Those last three lines are not needed: variables are automatically
> empty in make. Also, remove the spaces between ", y" in the tests, i.e:
>
> ifeq ($(BR2_<something>),y)
> ...
>
> Also, please use ESPEAK_AUDIO_BACKEND instead of AUDIO, because the
> namespace of variables is global in Buildroot, so "AUDIO" is too
> generic.
>
> > +
> > +define ESPEAK_EXTRACT_CMDS
> > +    unzip $(DL_DIR)/$(ESPEAK_SOURCE) -d $(BUILD_DIR)
> > +endef
> > +
> > +define ESPEAK_CONFIGURE_CMDS
> > +    # next command is required because buildroot provides portaudio V19,
> > this is explained in package ReadMe file.
>
> This comment needs to be wrapped at a reasonable length.
>
> > +    cp $(@D)/src/portaudio19.h $(@D)/src/portaudio.h
> > +endef
> > +
> > +define ESPEAK_BUILD_CMDS
> > +    $(MAKE) CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" AUDIO="$(AUDIO)" -C
> > $(@D)/src all
>
> Use $(TARGET_CONFIGURE_OPTS) instead of CXX and LD, so something like:
>
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>                 AUDIO="$(ESPEAK_AUDIO_BACKEND)" \
>                 -C $(@D)/src all
>
> > +endef
> > +
> > +define ESPEAK_INSTALL_TARGET_CMDS
> > +    $(MAKE) install DESTDIR="$(TARGET_DIR)" -C $(@D)/src
> > +endef
> > +
> > +$(eval $(generic-package))
>
> Can you resubmit a new version (see
> http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog
> )
> with those issues fixed?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131007/368ab45f/attachment.html>
