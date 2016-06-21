From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 16:41:22 +0100
Subject: [Buildroot] [git commit] efivar: new package
In-Reply-To: <20160612140155.BE24D8041E@busybox.osuosl.org>
References: <20160612140155.BE24D8041E@busybox.osuosl.org>
Message-ID: <57696022.2060308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 12/06/16 14:59, Thomas Petazzoni wrote:
[snip]

> diff --git a/package/efivar/Config.in b/package/efivar/Config.in
> new file mode 100644
> index 0000000..c507584
> --- /dev/null
> +++ b/package/efivar/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_EFIVAR
> +	bool "efivar"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
> +	# doesn't build with uclibc due to lack of uchar.h
> +	# doesn't build with musl due to lack of __bswap_constant_16
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_POPT
> +	help
> +	  Tools and libraries to manipulate EFI variables
> +
> +	  https://github.com/rhinstaller/efivar
> +
> +comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> +		!BR2_TOOLCHAIN_USES_GLIBC

shouldn't be

comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
		BR2_TOOLCHAIN_USES_GLIBC

...?

The package is only compatible with glibc, so it depends on it. The
comment should depend on it as well.

[snip]

Regards,

Vincent.
