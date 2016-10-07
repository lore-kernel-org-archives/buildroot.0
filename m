From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:59:41 +0200
Subject: [Buildroot] [PATCH 1/2] fwts: new package
In-Reply-To: <1475592743-4058-1-git-send-email-nunes.erico@gmail.com>
References: <1475592743-4058-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161007155941.180d0d29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Oct 2016 16:52:22 +0200, Erico Nunes wrote:

> +++ b/package/fwts/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_FWTS
> +	bool "fwts"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c

You forgot to propagate this dependency...

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_JSON_C
> +	help
> +	  Firmware Test Suite (FWTS) is a test suite that performs
> +	  sanity checks on firmware. It is intended to identify BIOS and
> +	  ACPI errors and if appropriate it will try to explain the
> +	  errors and give advice to help workaround or fix firmware
> +	  bugs.
> +
> +	  dtc (libfdt) is an optional dependency for fdt related tests.
> +
> +	  https://wiki.ubuntu.com/FirmwareTestSuite
> +
> +comment "fwts needs a glibc toolchain w/ wchar, threads"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
> +	depends on BR2_USE_MMU

... here.

So I've added that.

> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_USES_GLIBC
> +FWTS_VERSION = V16.09.00
> +FWTS_SITE = http://fwts.ubuntu.com/release
> +FWTS_STRIP_COMPONENTS = 0
> +FWTS_LICENSE = GPLv2, LGPL, Custom

The LGPL version is 2.1, so I've changed LGPL to LGPLv2.1.

Committed with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
