From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 15:15:24 +0100
Subject: [Buildroot] [PATCH v9 06/32] package/efl/libefl: new package
In-Reply-To: <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151212151524.0b711e40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 12 Dec 2015 14:33:09 +0100, Romain Naour wrote:

> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 7ce5a36..1c6f9e5 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -1,8 +1,13 @@
>  menuconfig BR2_PACKAGE_EFL
>  	bool "Enlightenment Foundation Libraries"
> -	depends on BR2_USE_WCHAR
> -	# libeina uses madvise(). To revisit when bumping EFL to 1.8
> -	depends on BR2_USE_MMU
> +	depends on BR2_INSTALL_LIBSTDCPP # libefl
> +	depends on BR2_PACKAGE_HAS_UDEV # libefl -> libudev
> +	depends on BR2_PACKAGE_LUA # lua 5.1 or better
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libefl
> +	depends on BR2_USE_MMU # libefl
> +	depends on BR2_USE_WCHAR # libefl
> +	depends on !BR2_STATIC_LIBS # libefl

So we have all these dependencies here in package/efl/Config.in and
then duplicated in package/efl/libefl/Config.in. Is this really needed?

> +	select BR2_PACKAGE_LIBEFL
>  	help
>  	  Enlightenment Foundation Libraries
>  
> @@ -13,6 +18,7 @@ if BR2_PACKAGE_EFL
>  source "package/efl/libeina/Config.in"
>  source "package/efl/libecore/Config.in"
>  source "package/efl/libeet/Config.in"
> +source "package/efl/libefl/Config.in"
>  source "package/efl/libefreet/Config.in"
>  source "package/efl/libeio/Config.in"
>  source "package/efl/libevas/Config.in"
> @@ -24,5 +30,12 @@ source "package/efl/libedbus/Config.in"
>  
>  endif # BR2_PACKAGE_EFL
>  
> -comment "EFL needs a toolchain w/ wchar"
> -	depends on !BR2_USE_WCHAR
> +comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
> +	depends on !BR2_PACKAGE_LUA || !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU
> +
> +comment "EFL needs lua"
> +	depends on !BR2_PACKAGE_LUA || !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU

So if I enable Lua but I don't enable udev, I am still seeing the
comment "EFL needs lua".

And ditto: if I don't enable Lua, but I have udev, C++, dynamic
library, threads and wchar, I will still see "EFL needs udev /dev
management and a toolchain w/ C++, dynamic library, threads, wchar".

Seems like the handling of dependencies is not good here. It should be:

> +comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU
> +
> +comment "EFL needs lua"
> +	depends on !BR2_PACKAGE_LUA
> +	depends on BR2_USE_MMU

Also, do you have a reason for not selecting Lua ?


> +if BR2_PACKAGE_LIBEFL
> +
> +config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
> +	bool "Use recommended and tested configurations"

configurations -> configuration

> +	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
> +	select BR2_PACKAGE_BULLET
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_LIBFRIBIDI
> +	select BR2_PACKAGE_LIBSNDFILE
> +	select BR2_PACKAGE_PULSEAUDIO
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +	default y
> +	help
> +	  Enable the basic set of recommended features.
> +
> +	  Without that, the EFL developpers consider the build to be
> +	  potentially broken and won't provide any support for it.
> +
> +	  This turns on the following features:
> +
> +	  - bullet: If you have chosen to disable physics support, this
> +	    disables lots of core functionality and is effectively never
> +	    tested. You are going to find features that suddenly don't work
> +	    and as a result cause a series of breakages. This is simply not
> +	    tested so you are on your own in terms of ensuring everything
> +	    works if you do this
> +
> +	  - fontconfig: If fontconfig is disabled, this is going to make
> +	    general font searching not work, and only some very direct
> +	    'load /path/file.ttf' will work alongside some old-school ttf
> +	    file path searching. This is very likely not what you want, so
> +	    highly reconsider turning fontconfig off. Having it off will
> +	    lead to visual problems like missing text in many UI areas
> +	    etc...
> +
> +	  - gstreamer 1.x: If Gstreamer 1.x support is disabled, it will
> +	    heavily limit your media support options and render some
> +	    functionality as useless, leading to visible application bugs.
> +
> +	  - libfribidi: Fribidi is used for handling right-to-left text
> +	    (like Arabic, Hebrew, Farsi, Persian etc.) and is very likely
> +	    not a feature you want to disable unless you know for absolute
> +	    certain you will never encounter and have to display such
> +	    scripts. Also note that we don't test with fribidi disabled so
> +	    you may also trigger code paths with bugs that are never
> +	    normally used.
> +
> +	  - libsndfile: If you disabled audio support in Ecore, this is not
> +	    tested and may create bugs for you due to it creating untested
> +	    code paths. Reconsider disabling audio.
> +
> +	  - pulseaudio: The only audio output method supported by Ecore
> +	    right now is via Pulseaudio. You have disabled that and likely
> +	    have broken a whole bunch of things in the process. Reconsider
> +	    your configure options.
> +	    NOTE: multisense support is automatically enabled with
> +	    pulseaudio.
> +
> +	  - util-linux' libmount: Libmount is used heavily inside Eeze for
> +	    support of removable devices etc... and disabling this will
> +	    hurt support for Enlightenment and its filemanager.

I am wondering if it is the right approach. Would it be better to have
sub-options for:

	[*] Enable bullet support (recommended)
	[*] Enable fontconfig support (recommended)
	[*] Enable gstreamer1 support (recommended)
	[*] Enable libfridi support (recommended)
	[*] Enable libsndfile support (recommended)
	[*] Enable pulseaudio support (recommended)
	[*] Enable libmount support (recommended)

Those options would be enabled by default, and if one of them is not
enabled, you can do:

comment "Warning: one of the recommended option for EFL is not enabled"
	depends on !BR2_PACKAGE_LIBEFL_BULLET || \
		!BR2_PACKAGE_LIBEFL_FONTCONFIG || \
		...

> +comment "libevas loaders"
> +
> +config BR2_PACKAGE_LIBEFL_PNG
> +	bool "libevas png loader"
> +	select BR2_PACKAGE_LIBPNG
> +	help
> +	  This enables the loader code that loads png files using
> +	  libpng.
> +
> +config BR2_PACKAGE_LIBEFL_JPEG
> +	bool "libevas jpeg loader"
> +	help
> +	  This enables the loader code that loads jpeg files using
> +	  libjpeg.
> +
> +config BR2_PACKAGE_LIBEFL_GIF
> +	bool "libevas gif loader"
> +	select BR2_PACKAGE_GIFLIB
> +	help
> +	  This enables the loader code that loads gif files using
> +	  libungif.
> +
> +config BR2_PACKAGE_LIBEFL_TIFF
> +	bool "libevas tiff loader"
> +	select BR2_PACKAGE_TIFF
> +	help
> +	  This enables the loader code that loads tiff files.
> +
> +endif # BR2_PACKAGE_LIBEFL

How do these options fit with the separate libevas-generic-loaders
package ?

> +# Prefer openssl (the default) over gnutls.
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBEFL_DEPENDENCIES += openssl
> +LIBEFL_CONF_OPTS += --with-crypto=openssl
> +else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
> +LIBEFL_DEPENDENCIES += gnutls libgcrypt
> +LIBEFL_CONF_OPTS += --with-crypto=gnutls \
> +	--with-libgcrypt-prefix=$(STAGING_DIR)/usr

Why do you need both gnutls and libgcrypt for gnutls support ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
