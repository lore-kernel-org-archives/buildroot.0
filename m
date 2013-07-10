From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 07:31:48 +0200
Subject: [Buildroot] [PATCH] fdk-aac: new package
In-Reply-To: <1367282387-8011-1-git-send-email-gilles.talis@gmail.com> (Gilles
 Talis's message of "Mon, 29 Apr 2013 17:39:47 -0700")
References: <1367282387-8011-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87k3kzgeuz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

Hi, and sorry for the slow response.

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/Config.in          |    1 +
 Gilles>  package/fdk-aac/Config.in  |   12 ++++++++++++
 Gilles>  package/fdk-aac/fdk-aac.mk |   14 ++++++++++++++
 Gilles>  3 files changed, 27 insertions(+)
 Gilles>  create mode 100644 package/fdk-aac/Config.in
 Gilles>  create mode 100644 package/fdk-aac/fdk-aac.mk

 Gilles> diff --git a/package/Config.in b/package/Config.in
 Gilles> index 56fdd2f..9a06284 100644
 Gilles> --- a/package/Config.in
 Gilles> +++ b/package/Config.in
 Gilles> @@ -350,6 +350,7 @@ menu "Audio/Sound"
 Gilles>  source "package/alsa-lib/Config.in"
 Gilles>  source "package/audiofile/Config.in"
 Gilles>  source "package/celt051/Config.in"
 Gilles> +source "package/fdk-aac/Config.in"
 Gilles>  source "package/libao/Config.in"
 Gilles>  source "package/libcdaudio/Config.in"
 Gilles>  source "package/libcue/Config.in"
 Gilles> diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
 Gilles> new file mode 100644
 Gilles> index 0000000..4fba357
 Gilles> --- /dev/null
 Gilles> +++ b/package/fdk-aac/Config.in
 Gilles> @@ -0,0 +1,12 @@
 Gilles> +config BR2_PACKAGE_FDK_AAC
 Gilles> +	bool "fdk-aac"
 Gilles> +	# These architectures are not supported by FDK AAC
 Gilles> +	depends on !(BR2_bfin || BR2_avr32 || BR2_sparc || BR2_xtensa \
 Gilles> +			|| BR2_microblaze)

Are you sure about these? What about arc and aarch64? Normally we prefer
positive logic so these things don't need to be updated when a new
architecture is added.

With that said, from a 1 minute look at the source code, it looks like
there's specific code for arm/mips/x86, but generic sw fallbacks for
other archs - So perhaps it does work on all archs?

It is written in C++, so you need to depend on BR2_INSTALL_LIBSTDCPP and
show a comment if not available.


 Gilles> +	help
 Gilles> +	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
 Gilles> +	  is software that implements the MPEG Advanced Audio Coding ("AAC")
 Gilles> +	  encoding and decoding scheme for digital audio
 Gilles> +
 Gilles> +	  http://sourceforge.net/projects/opencore-amr/files/fdk-aac/
 Gilles> +
 Gilles> diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
 Gilles> new file mode 100644
 Gilles> index 0000000..b36f144
 Gilles> --- /dev/null
 Gilles> +++ b/package/fdk-aac/fdk-aac.mk
 Gilles> @@ -0,0 +1,14 @@
 Gilles> +#############################################################
 Gilles> +#
 Gilles> +# fdk-aac
 Gilles> +#
 Gilles> +#############################################################

We make the '#' headers 80 chars wide noadays.


 Gilles> +
 Gilles> +FDK_AAC_VERSION = 0.1.1
 Gilles> +FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 Gilles> +FDK_AAC_LICENSE = fdk-aac license
 Gilles> +FDK_AAC_LICENSE_FILES = NOTICE
 Gilles> +
 Gilles> +FDK_AAC_INSTALL_STAGING = YES
 Gilles> +
 Gilles> +$(eval $(autotools-package))


Are there no programs in buildroot that can use this library?

Other that these minor issues it looks good, care to send an updated
version fixing them? Thanks.

-- 
Bye, Peter Korsgaard
