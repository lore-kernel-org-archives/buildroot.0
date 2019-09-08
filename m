From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 22:15:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/minimodem: new package
In-Reply-To: <20190908160846.17343-1-user@vserver64>
References: <20190908160846.17343-1-user@vserver64>
Message-ID: <347f7686-0d98-a943-f5eb-785265cdb8f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alexander,

On 08/09/2019 18:08, Alexander Kurz wrote:
> From: Alexander Kurz <akurz@blala.de>
> 
> Minimodem is a command-line program which decodes (or generates)
> audio modem tones at any specified baud rate, using various
> framing protocols. It acts a general-purpose software FSK modem,
> and includes support for various standard FSK protocols such as
> Bell103, Bell202, RTTY, TTY/TDD NOAA SAME, and Caller-ID.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  package/Config.in                |  1 +
>  package/minimodem/Config.in      | 13 +++++++++++++
>  package/minimodem/minimodem.hash |  2 ++
>  package/minimodem/minimodem.mk   | 25 +++++++++++++++++++++++++

 Please add yourself to the DEVELOPERS file [1] for this package. This way,
you'll get an e-mail if the package fails in the autobuilders, or when a new
version is released if the package is registered on release-monitoring.org.

[1] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

[snip]
> diff --git a/package/minimodem/minimodem.mk b/package/minimodem/minimodem.mk
> new file mode 100644
> index 0000000000..899f59547b
> --- /dev/null
> +++ b/package/minimodem/minimodem.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# minimodem
> +#
> +################################################################################
> +
> +MINIMODEM_VERSION = 0.24
> +MINIMODEM_SOURCE = minimodem-$(MINIMODEM_VERSION).tar.gz

 This is the default value so no need to specify it. I think check-package
reports that, no?

> +MINIMODEM_SITE = http://www.whence.com/minimodem
> +MINIMODEM_LICENSE = GPL-3.0+
> +MINIMODEM_LICENSE_FILES = COPYING
> +
> +ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
> +MINIMODEM_CONF_OPTS += --without-alsa

 You also need to add a dependency, to make sure the alsa-lib package is built
first. Also, please add the --with-also explicitly. So:

ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
MINIMODEM_DEPENDENCIES += alsa-lib
MINIMODEM_CONF_OPTS += --with-alsa
else
MINIMODEM_CONF_OPTS += --without-alsa
endif

 Same for the next two.

 Regards,
 Arnout

> +endif
> +
> +ifneq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +MINIMODEM_CONF_OPTS += --without-pulseaudio
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LIBSNDFILE),y)
> +MINIMODEM_CONF_OPTS += --without-sndfile
> +endif
> +
> +$(eval $(autotools-package))
> 
