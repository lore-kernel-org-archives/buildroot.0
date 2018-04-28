From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:58:39 +0200
Subject: [Buildroot] [PATCH] bluez-alsa: new package
In-Reply-To: <20180406081924.4473-1-joerg.krause@embedded.rocks>
References: <20180406081924.4473-1-joerg.krause@embedded.rocks>
Message-ID: <20180428185839.1417a42d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 10:19:24 +0200, J?rg Krause wrote:

> diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
> new file mode 100644
> index 0000000000..6713c089a2
> --- /dev/null
> +++ b/package/bluez-alsa/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_BLUEZ_ALSA
> +	bool "bluez-alsa"
> +	depends on !BR2_STATIC_LIBS # bluez5 uses dlfcn
> +	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with bluez4 version

No need to duplicate the explanation about those options, just write
where they come from, i.e just "bluez5" in this case.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5
> +	depends on BR2_USE_MMU # bluez5 -> dbus
> +	depends on BR2_USE_WCHAR # libglib2
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_BLUEZ5_UTILS
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_SBC
> +	help
> +	  Bluetooth Audio ALSA Backend.
> +
> +	  https://github.com/Arkq/bluez-alsa
> +
> +comment "bluez-alsa needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_USE_MMU

This comment should either go at the top of the Config.in file, or at
the bottom. If you put it like this between the main option and the
sub-options, the sub-options are no longer indented properly by
"menuconfig".

Also, I've added a "depends on !BR2_PACKAGE_BLUEZ_UTILS" so that the
comment doesn't appear when bluez4 is enabled.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
