From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Jan 2011 22:30:24 +0100
Subject: [Buildroot] [PATCH 4/5] libao: new package
In-Reply-To: <1294339321-5659-4-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Thu, 6 Jan 2011 15:42:00 -0300")
References: <1294339321-5659-1-git-send-email-gustavo@zacarias.com.ar>
	<1294339321-5659-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877hec5tvz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/Config.in       |    1 +
 Gustavo>  package/multimedia/libao/Config.in |    7 +++++++
 Gustavo>  package/multimedia/libao/libao.mk  |   15 +++++++++++++++
 Gustavo>  3 files changed, 23 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/multimedia/libao/Config.in
 Gustavo>  create mode 100644 package/multimedia/libao/libao.mk

 Gustavo> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Gustavo> index da50dbb..5c1111d 100644
 Gustavo> --- a/package/multimedia/Config.in
 Gustavo> +++ b/package/multimedia/Config.in
 Gustavo> @@ -10,6 +10,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 Gustavo>  source "package/multimedia/gst-plugins-good/Config.in"
 Gustavo>  source "package/multimedia/gst-plugins-bad/Config.in"
 Gustavo>  source "package/multimedia/gst-plugins-ugly/Config.in"
 Gustavo> +source "package/multimedia/libao/Config.in"
 Gustavo>  source "package/multimedia/libcdaudio/Config.in"
 Gustavo>  source "package/multimedia/libdvdread/Config.in"
 Gustavo>  source "package/multimedia/libdvdnav/Config.in"
 Gustavo> diff --git a/package/multimedia/libao/Config.in b/package/multimedia/libao/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..3c99ab9
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/multimedia/libao/Config.in
 Gustavo> @@ -0,0 +1,7 @@
 Gustavo> +config BR2_PACKAGE_LIBAO
 Gustavo> +	bool "libao"
 Gustavo> +	help
 Gustavo> +	  Libao is a cross-platform audio library that allows programs
 Gustavo> +	  to output audio using a simple API on a wide variety of platforms.
 Gustavo> +
 Gustavo> +	  http://www.xiph.org/ao/
 Gustavo> diff --git a/package/multimedia/libao/libao.mk b/package/multimedia/libao/libao.mk
 Gustavo> new file mode 100644
 Gustavo> index 0000000..edbada7
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/multimedia/libao/libao.mk
 Gustavo> @@ -0,0 +1,15 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# libao
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +LIBAO_VERSION = 1.0.0
 Gustavo> +LIBAO_SITE = http://downloads.xiph.org/releases/ao
 Gustavo> +LIBAO_INSTALL_STAGING = YES
 Gustavo> +
 Gustavo> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 Gustavo> +LIBAO_DEPENDENCIES += alsa-lib
 Gustavo> +endif

This seems to atleast need host-pkg-config:

./configure: line 14903: /home/peko/source/buildroot/output2/host/usr/bin/pkg-config: No such file or directory
*** Your version of pkg-config is too old. You need version 0.9.0 or newer.
*** See http://www.freedesktop.org/software/pkgconfig

And configure also picks up a lot of host files, that might cause
problems:

checking for esd-config... /usr/bin/esd-config
checking for ESD - version >= 0.2.8... cross compiling; assumed OK... 
yes
checking sys/soundcard.h usability... yes
checking sys/soundcard.h presence... yes
checking for sys/soundcard.h... yes
checking machine/soundcard.h usability... no
checking machine/soundcard.h presence... no
checking for machine/soundcard.h... no
checking for snd_pcm_open in -lasound... no
checking alsa/asoundlib.h usability... no
checking alsa/asoundlib.h presence... no
checking for alsa/asoundlib.h... no
checking sys/audioio.h usability... no
checking sys/audioio.h presence... no
checking for sys/audioio.h... no
checking sndio.h usability... no
checking sndio.h presence... no
checking for sndio.h... no
checking roaraudio.h usability... no
checking roaraudio.h presence... no
checking for roaraudio.h... no
checking for artsc-config... /usr/bin/artsc-config

-- 
Bye, Peter Korsgaard
