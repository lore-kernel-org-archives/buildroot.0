From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 22:11:46 +0100
Subject: [Buildroot] [PATCH 1/1] picotts: new package
In-Reply-To: <20181023082513.30099-1-inigohuguet@fanamoel.com>
References: <20181023082513.30099-1-inigohuguet@fanamoel.com>
Message-ID: <20181102221146.4884a16b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution, seems like a useful package to have! See
my review below.

On Tue, 23 Oct 2018 10:25:13 +0200, I?igo Huguet wrote:
> PicoTTS, from SVOX, is the speech synthesizer included in Android
> AOSP. It's lighweight (actually it compiles really fast), very
> suitable for embedded devices, it sounds good and quite natural,
> and have good support of all this languages: English, Spanish,

this languages -> these languages

> German, French and Italian.
> 
> Languages support is probably the main improvements over the existing

Languages support -> Language support

> speech synthesizer packages, such as flite.
> 
> Tested in desktop PC with Ubuntu and embedded device with Allwinner
> A20 processor (ARMv7).
> 
> The program only can output the synthesized sound to a wav file, and
> you have to specify the language as an argument if it's not en_US.
> I've added to the package to scripts that are installed to /usr/bin

Don't use personal sentences such as "I've added". Something like "Two
helper scripts have been added..."

> to help with that:
>  - picotts: create the output wav file in /tmp, play it with aplay
>    and delete it
>  - picotts-lc: detect the current system language and call picotts
>    script

However, I am not convinced that we want those helper scripts. They
seem to be pretty use case specific, and it's not really the point of
Buildroot to carry this type of script IMO. If you think they are
generally useful, then talk with upstream to get them merged.

However, I want to point out that this commit log is nice, and provide
interesting details to understand the usefulness of this package.
Thanks!

> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> ---
>  package/Config.in            |  1 +
>  package/picotts/Config.in    |  8 ++++++
>  package/picotts/picotts      | 40 ++++++++++++++++++++++++++
>  package/picotts/picotts-lc   | 54 ++++++++++++++++++++++++++++++++++++
>  package/picotts/picotts.hash |  1 +
>  package/picotts/picotts.mk   | 34 +++++++++++++++++++++++

Please add an entry in the DEVELOPERS file for this new package.

> diff --git a/package/picotts/Config.in b/package/picotts/Config.in
> new file mode 100755
> index 0000000000..7ee5505fa0
> --- /dev/null
> +++ b/package/picotts/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PICOTTS
> +	bool "picotts"
> +	select BR2_PACKAGE_POPT
> +	help
> +	  PicoTTS: text-to-speech voice synthesizer from Android AOSP.
> +	  It is lightweight and sounds quite good and natural.
> +	  PicoTTS supports languages: English (British and American),

PicoTTS supports the following languages:

> +	  Spanish, German, French and Italian.

Please add a blank line, and then the upstream URL of the project.

> +picotts $lang_pico "$@"
> diff --git a/package/picotts/picotts.hash b/package/picotts/picotts.hash
> new file mode 100644
> index 0000000000..967544767c
> --- /dev/null
> +++ b/package/picotts/picotts.hash
> @@ -0,0 +1 @@
> +sha256 1cc989efd85ea90ca228bbb694c4b842a909a232e2c8b9a307d241b3ddec246c  picotts-2f86050dc5da9ab68fc61510b594d8e6975c4d2d.tar.gz
> diff --git a/package/picotts/picotts.mk b/package/picotts/picotts.mk
> new file mode 100755
> index 0000000000..02ccb4d13f
> --- /dev/null
> +++ b/package/picotts/picotts.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# picotts
> +#
> +################################################################################
> +
> +# pkg info

Please don't add this type of comment, we don't have them anywhere in
other Buildroot packages.

> +PICOTTS_VERSION = 2f86050dc5da9ab68fc61510b594d8e6975c4d2d
> +PICOTTS_SITE = $(call github,naggety,picotts,$(PICOTTS_VERSION))
> +PICOTTS_LICENSE = Apache-2.0

Sad that upstream doesn't include a license file :-/

> +# dependencies
> +PICOTTS_DEPENDENCIES = popt
> +
> +# extract
> +define PICOTTS_EXTRACT_CMDS
> +	tar xf $(PICOTTS_DL_DIR)/picotts-$(PICOTTS_VERSION).tar.gz -C $(@D) picotts-$(PICOTTS_VERSION)/pico --strip-components=2
> +endef

Instead of this, could you try

PICOTTS_SUBDIR = pico

This tells the autotools-package infrastructure that all the
autoconf/automake stuff is in the pico/ sub-directory.

> +# generate build files (autotools)
> +PICOTTS_PRE_CONFIGURE_HOOKS += PICOTTS_EXEC_AUTOGEN
> +define PICOTTS_EXEC_AUTOGEN
> +	cd $(@D) && ./autogen.sh
> +endef

This won't work correctly, because you're not adding host-autoconf,
host-automake and host-libtool in dependencies.

Could you use PICOTTS_AUTORECONF = YES instead? If it doesn't work,
could you give more details at what doesn't work?

> +# install additional files
> +PICOTTS_POST_INSTALL_TARGET_HOOKS += PICOTTS_INSTALL_ADDITIONAL_FILES
> +define PICOTTS_INSTALL_ADDITIONAL_FILES
> +	$(INSTALL) -D -m 0755 $(TOPDIR)/$(PICOTTS_PKGDIR)/picotts $(TARGET_DIR)/usr/bin/picotts
> +	$(INSTALL) -D -m 0755 $(TOPDIR)/$(PICOTTS_PKGDIR)/picotts-lc $(TARGET_DIR)/usr/bin/picotts-lc

$(TOPDIR)/$(PICOTTS_PKGDIR)/ can be simplified as $(PICOTTS_PKGDIR)/:
all Buildoot make code is exactly from the Buildroot source code
top-level directory.

Could you rework the package to take into account those comments, and
send an updated version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
