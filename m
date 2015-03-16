From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 14:12:17 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/libftdi1: new package
In-Reply-To: <1425813964-5295-3-git-send-email-s.martin49@gmail.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150316141217.6590b441@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  8 Mar 2015 12:26:02 +0100, Samuel Martin wrote:
> From: Daniel Sangue <daniel.sangue@sangue.ch>
> 
> This version of libftdi can coexists beside the 0.x version.
> 
> Signed-off-by: Daniel Sangue <daniel.sangue@sangue.ch>
> [Samuel Martin:
>   - libftdi1.mk: bump to version 1.2 and add hash
>   - cleanup uneeded libusb-compat stuff
>   - Config.in: add comment when ftdipp1 deps are not met
>   - fix typos in variable names and legit CMake options for *_CONF_OPTS
>   - add support for python bindings and ftdi_eeprom
>   - fix static build
>   - fix build with toolchain w/o C++ support
> ]
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

I've applied. But to be honest, I have *way* too many changes to make
to patches you send. Please be more careful. See below.


> +config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
> +	depends on BR2_INSTALL_LIBSTDCPP # boost
> +	depends on BR2_LARGEFILE # boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +	select BR2_PACKAGE_BOOST
> +	bool "libfdtipp1"

We usually always have the "bool" property first, then the "selects"
then the "depends on".

> +	help
> +	  C++ bindings for libftdi
> +
> +comment "libfdtipp1 needs a toolchain w/ C++, largefile, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

Comment about thread not needed, since the whole package depends on
threads anyway.

> +
> +config BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	bool "python bindings"

Ditto bool vs. depends on ordering.

> +	help
> +	  Python bindings for libftdi
> +
> +config BR2_PACKAGE_LIBTFDI1_FDTI_EEPROM
> +	select BR2_PACKAGE_LIBCONFUSE
> +	bool "ftdi_eeprom tool"

Ditto.

> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
> new file mode 100644
> index 0000000..608c29a
> --- /dev/null
> +++ b/package/libftdi1/libftdi1.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# libftdi1
> +#
> +################################################################################
> +
> +LIBFTDI1_VERSION = 1.2
> +LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
> +LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download/
> +LIBFTDI1_INSTALL_STAGING = YES
> +LIBFTDI1_DEPENDENCIES = libusb

Missing license information.

> +LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
> +
> +ifeq ($(BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1),y)
> +LIBFTDI1_DEPENDENCIES += boost
> +LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
> +else
> +LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS),y)
> +LIBFTDI1_DEPENDENCIES += $(if BR2_PACKAGE_PYTHON,python,python3) host-swig

How on earth can this work ? It should be:

LIBFTDI1_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3) host-swig

Committed with these things fixed. However, please make sure to
contribute your libftdi1 patches upstream.

I think you should really review your patches more carefully. Having so
many issues doesn't really increase the trust we can have in your
patches, which means we are less likely to apply them quickly. And I'm
not talking about actual testing, I'm really talking about reviewing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
