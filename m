From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Feb 2020 18:10:51 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/glslsandbox-player: new
 package
In-Reply-To: <20190823205711.23894-1-juju@cotds.org>
References: <20190704212523.11818-1-juju@cotds.org>
 <20190823205711.23894-1-juju@cotds.org>
Message-ID: <758da3b8-5d26-8472-483c-172013013b48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Julien,

 We finally applied, with a few changes.

On 23/08/2019 22:57, Julien Olivain wrote:
[snip]
> diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
> new file mode 100644
> index 0000000000..973b8f6c98
> --- /dev/null
> +++ b/package/glslsandbox-player/Config.in
> @@ -0,0 +1,108 @@
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER
> +	bool "glslsandbox-player"
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGLES

 I added this:

	# Doesn't really depend on threads, but this makes sure we have at least
	# one native windowing system available, and is good enough in practice.
	depends on BR2_TOOLCHAIN_HAS_THREADS

Makes sense?

[snip]
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
> +	bool "Install scripts"
> +	depends on !BR2_PACKAGE_PYTHON # python3
> +	depends on !BR2_STATIC_LIBS # python3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> +	depends on BR2_USE_MMU # bash, python3
> +	depends on BR2_USE_WCHAR # python3
> +	select BR2_PACKAGE_BASH # runtime
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash

 This creates a problem if busybox is not selected so it should be

	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash

> +	select BR2_PACKAGE_COREUTILS # runtime (timeout)

 If it is just for timeout, do you really need coreutils? Busybox has a timeout
utility as well. Anyway, I didn't change this.


 Thanks!
 Regards,
 Arnout

[snip]
