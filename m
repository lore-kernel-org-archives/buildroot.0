From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 22:31:24 +0100
Subject: [Buildroot] [PATCH v2 2/4] wpebackend-fdo: new package
In-Reply-To: <20190205204152.10376-3-francois.perrad@gadz.org>
References: <20190205204152.10376-1-francois.perrad@gadz.org>
 <20190205204152.10376-3-francois.perrad@gadz.org>
Message-ID: <20190211223124.0d289abc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 21:41:50 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> new file mode 100644
> index 000000000..06392c93f
> --- /dev/null
> +++ b/package/wpebackend-fdo/Config.in
> @@ -0,0 +1,19 @@
> +comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable backend"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_WPEBACKEND_FDO
> +	bool "wpebackend-fdo"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> +	depends on BR2_USE_WCHAR # gettext
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_PACKAGE_HAS_LIBEGL

I changed this like this:

+       depends on !BR2_STATIC_LIBS # wayland
+       depends on BR2_INSTALL_LIBSTDCPP
+       depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
+       depends on BR2_USE_WCHAR # libglib2
+       depends on BR2_USE_MMU # libglib2
+       depends on BR2_PACKAGE_HAS_LIBEGL

i.e we care more about why this particular package needed those "depends
on" rather than why those "depends on" where needed by the packages we
are selecting.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
