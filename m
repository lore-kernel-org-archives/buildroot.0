From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 20:07:44 +0100
Subject: [Buildroot] [PATCH 4/4] package/udisks: bump version to 2.8.4
In-Reply-To: <20200217143030.5031-5-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-5-giulio.benetti@benettiengineering.com>
Message-ID: <20200217200744.0190e55e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 15:30:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump to version 2.8.4 of udisks. All patches have been upstremed, so
> drop them all.

Considering the complexity of the bump, it would be nice to have more
details in the commit log.

> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> index 04a632dd8d..909b3c8bd4 100644
> --- a/package/udisks/Config.in
> +++ b/package/udisks/Config.in
> @@ -4,21 +4,27 @@ config BR2_PACKAGE_UDISKS
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
>  	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
>  	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
>  	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
> +	depends on BR2_SYSTEM_ENABLE_NLS # volume_key

There is no such dependency in volume_key.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey, gobject-introspection
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
> -	depends on BR2_USE_MMU # lvm2
> +	depends on BR2_USE_MMU # lvm2, gobject-introspection
>  	depends on BR2_USE_WCHAR # dbus-glib -> glib2
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2, parted
>  	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Why is this dependency on glibc needed? Coming from GOI ? Also, it
makes the !BR2_TOOLCHAIN_USES_UCLIBC dependency no longer needed.

In addition, you did not propagate all the dependencies of volume_key I
believe (such as SYNC_4). Could you check this ?

>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_DBUS_GLIB
> -	select BR2_PACKAGE_SG3_UTILS
> -	select BR2_PACKAGE_POLKIT
> -	select BR2_PACKAGE_PARTED
> -	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
>  	select BR2_PACKAGE_LIBATASMART
> +	select BR2_PACKAGE_LIBBLOCKDEV
>  	select BR2_PACKAGE_LIBGUDEV
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_PARTED
> +	select BR2_PACKAGE_POLKIT
> +	select BR2_PACKAGE_SG3_UTILS
> +	select BR2_PACKAGE_LIBXSLT

Alphabetic ordering would be nice.

> -comment "udisks needs a glibc or musl toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
> +comment "udisks support needs NLS enabled"
> +	depends on !BR2_SYSTEM_ENABLE_NLS

As said above, I don't think that it is true.

> +comment "udisks needs a glibc toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
> -	depends on !BR2_ENABLE_LOCALE || BR2_TOOLCHAIN_USES_UCLIBC || \
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> +	depends on !BR2_ENABLE_LOCALE || \
> +		!BR2_TOOLCHAIN_USES_GLIBC || \
>  		!BR2_INSTALL_LIBSTDCPP || \
>  		BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \

Of course, this will have to be updated.

Overall, it is really crazy. A stupid daemon that manages storage
devices need a Javascript interpreter and GOI.

There was some discussion at
https://github.com/storaged-project/udisks/issues/615 about running
udisks without polkit.

Or maybe we need to package https://wiki.gentoo.org/wiki/Udevil as an
alternative, but it's not maintained since 2015, so not great at all.
See https://github.com/IgnorantGuru/udevil/commits/master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
