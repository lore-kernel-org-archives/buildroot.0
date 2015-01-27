From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jan 2015 23:10:39 +0100
Subject: [Buildroot] [PATCH 4/8] package/libftdi1: new package
In-Reply-To: <1422220435-18689-5-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-5-git-send-email-s.martin49@gmail.com>
Message-ID: <54C80CDF.90105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/15 22:13, Samuel Martin wrote:
> From: Daniel Sangue <daniel.sangue@sangue.ch>
> 
> This version of libftdi can coexists beside the 0.x version.

 Perhaps this can be mentioned in the help text as well.

[snip]

> diff --git a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
> new file mode 100644
> index 0000000..487fc28
> --- /dev/null
> +++ b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
> @@ -0,0 +1,96 @@
> +From 7e57ff280b55b45e74329b9988279e8831d32eab Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Sun, 25 Jan 2015 09:45:04 +0100
> +Subject: [PATCH 1/2] cmake: use the standard CMake flag to drive the shared
> + object build
> +
> +Remove the STATICLIBS CMake option (and the code handling it) and let
> +the standard CMake flags drive the shared object build.

 Can upstream be convinced to take this patch?

[snip]

> diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
> new file mode 100644
> index 0000000..1bb0bfd
> --- /dev/null
> +++ b/package/libftdi1/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_LIBFTDI1
> +	bool "libftdi1"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +	select BR2_PACKAGE_LIBUSB
> +	help
> +	  Userspace access to FTDI USB interface chips (version 1.x)
> +
> +	  http://www.intra2net.com/en/developer/libftdi/index.php
> +
> +if BR2_PACKAGE_LIBFTDI1
> +
> +config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
> +	depends on BR2_INSTALL_LIBSTDCPP # boost
> +	depends on BR2_LARGEFILE # boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +	select BR2_PACKAGE_BOOST
> +	bool "libfdtipp1"
> +	help
> +	  C++ bindings for libftdi
> +
> +comment "libfdtipp1 needs a toolchain w/ C++, largefile, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	bool "python bindings"
> +	help
> +	  Python bindings for libftdi

 I wonder if it's worthwhile to make this configurable. Do the bindings occupy
significant space or take a long time to build?


 But basically I have no important comments, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout


> +
> +config BR2_PACKAGE_LIBTFDI1_FDTI_EEPROM
> +	select BR2_PACKAGE_LIBCONFUSE
> +	bool "ftdi_eeprom tool"
> +
> +endif # BR2_PACKAGE_LIBFTDI1
> +
> +comment "libftdi1 needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
