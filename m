From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:38:53 +0100
Subject: [Buildroot] [PATCH v4] netsurf: new package
In-Reply-To: <20181201152347.6646-1-francois.perrad@gadz.org>
References: <20181201152347.6646-1-francois.perrad@gadz.org>
Message-ID: <20181203223853.3c3c60db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sat,  1 Dec 2018 16:23:47 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for this patch!

> diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
> new file mode 100644
> index 000000000..7bd3dee41
> --- /dev/null
> +++ b/package/netsurf/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_NETSURF
> +	bool "netsurf"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBGTK2 if BR2_PACKAGE_XORG7

You can't select BR2_PACKAGE_LIBGTK2 just like this, you need to
replicate its dependencies. Indeed, even if libgtk2 will only be
selected if xorg7 is available, libgtk2 has more dependencies than
xorg7. See:

config BR2_PACKAGE_LIBGTK2
        bool "libgtk2"
        depends on BR2_PACKAGE_XORG7
        depends on BR2_USE_WCHAR # glib2
        depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
        depends on BR2_USE_MMU # glib2
        depends on BR2_INSTALL_LIBSTDCPP # pango
        depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz

versus:

menuconfig BR2_PACKAGE_XORG7
        bool "X.org X Window System"
        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on !BR2_STATIC_LIBS # dlopen in xlib_libX11

One solution would be to do this:

	select BR2_PACKAGE_LIBGTK2 if (BR2_PACKAGE_XORG7 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_MMU && BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_SYNC_4)
	select BR2_PACKAGE_SDL if !(BR2_PACKAGE_XORG7 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_MMU && BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_SYNC_4)

Can also be written like this:

config BR2_PACKAGE_NETSURF_SUPPORTS_GTK2
	bool
	default y
        depends on BR2_PACKAGE_XORG7
        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_MMU
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HAS_SYNC_4

and then:

+config BR2_PACKAGE_NETSURF
+	bool "netsurf"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGTK2 if BR2_PACKAGE_NETSURF_SUPPORTS_GTK2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SDL if !BR2_PACKAGE_NETSURF_SUPPORTS_GTK2

But overall, perhaps the right solution is to have an explicit
Config.in choice. Even if you have X.org, you may want to have the SDL
version (SDL works under X) without gtk2.

And then with a choice, it becomes a bit easier to express, while
giving more freedom to the user. What do you think ?


> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +NETSURF_DEPENDENCIES += libiconv
> +define NETSURF_ICONV_CONFIGURE_CMDS
> +	echo "CFLAGS += -DWITH_ICONV_FILTER"            >> $(@D)/libparserutils/Makefile.config.override
> +	echo "override NETSURF_USE_LIBICONV_PLUG := NO" >> $(@D)/netsurf/Makefile.config
> +endef
> +endif

I am not sure what those variables are doing, but it is worth
mentioning that iconv support is available even if BR2_PACKAGE_LIBICONV
is *not* enabled. Indeed, BR2_PACKAGE_LIBICON is just providing a
replacement libicon library when the C library doesn't provide an iconv
implementation. But all of uClibc with locale, glibc and musl provide
an iconv implementation, even when BR2_PACKAGE_LIBICONV is disabled.

> +define NETSURF_CONFIGURE_CMDS
> +	echo "override NETSURF_USE_DUKTAPE := NO"       >  $(@D)/netsurf/Makefile.config

I don't know if this matters, but we do have a duktape package in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
