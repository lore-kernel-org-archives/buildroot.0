From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 04 Oct 2015 10:12:40 +0200
Subject: [Buildroot] [PATCH] openal: New package
References: <56100EB1.4010100@dawncrow.de>
Message-ID: <ok37ecxrt1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

several months ago I started hacking an openal package myself but
never finished it. Here I will compare my package to your version.

Am Sat, 03 Oct 2015 19:21:53 +0200 schrieb Andr? Hentschel:

> diff --git a/package/openal/Config.in b/package/openal/Config.in
> new file mode 100644
> index 0000000..8eb177b
> --- /dev/null
> +++ b/package/openal/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_OPENAL
> +	bool "openal"
> +	# OpenAL needs a backend
> +	depends on BR2_PACKAGE_ALSA_LIB || \
> +	           BR2_PACKAGE_PORTAUDIO || \
> +	           BR2_PACKAGE_PULSEAUDIO
> +	help
> +	  OpenAL provides capabilities for playing audio in a virtual
> +	  3D environment. Distance attenuation, doppler shift, and
> +	  directional sound emitters are among the features handled by
> +	  the API.
> +
> +comment "openal needs a backend"
> +	depends on !BR2_PACKAGE_ALSA_LIB && \
> +	           !BR2_PACKAGE_PORTAUDIO && \
> +	           !BR2_PACKAGE_PULSEAUDIO

What about having a choice option defaulting to, for example, alsa?

Please add

	http://kcat.strangesoft.net/openal.html

to Config.in. Openal also needs this

	depends on BR2_TOOLCHAIN_HAS_THREADS

	comment "openal needs a toolchain w/ threads"
		depends on !BR2_TOOLCHAIN_HAS_THREADS

Did you test a static build? I have this in openal.mk:

ifeq ($(BR2_STATIC_LIBS),y)
OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
endif

Regards, Bernd
