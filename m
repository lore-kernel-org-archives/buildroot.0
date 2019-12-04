From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 16:16:37 +0100
Subject: [Buildroot] [PATCH 1/7] libyang: Optional C++ bindings
In-Reply-To: <f70195c8c44e4950257e1548b25083254362b266.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <f70195c8c44e4950257e1548b25083254362b266.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191204161637.610e2d79@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Oct 2017 07:48:35 +0200
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> +if BR2_PACKAGE_LIBYANG
> +
> +config BR2_PACKAGE_LIBYANG_CPP
> +	bool "Enable libyang C++ bindings"

Just:

	bool "enable C++ bindings"

no need to repeat the package name.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

I suppose you also need:

	depends on BR2_INSTALL_LIBSTDCPP

> +	help
> +	  Build the C++ wrapper around libyang.

You also need a Config.in comment to document the C++ and gcc >= 4.8
dependencies.

> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index cfec08cd16..87a1a4ef7c 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -21,5 +21,12 @@ HOST_LIBYANG_CONF_OPTS = \
>  	-DENABLE_VALGRIND_TESTS=OFF \
>  	-DGEN_PYTHON_BINDINGS=OFF
>  
> +ifdef BR2_PACKAGE_LIBYANG_CPP

should be:

ifeq ($(BR2_PACKAGE_LIBYANG_CPP),y)

> +	LIBYANG_DEPENDENCIES += host-swig
> +	HOST_LIBYANG_DEPENDENCIES += host-swig
> +	LIBYANG_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF
> +	HOST_LIBYANG_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF

This is not good: BR2_PACKAGE_LIBYANG_CPP is a target configuration
option, it should not affect how the host variant of libyang is built.

Unless you need the C++ bindings in host-libyang, just make
BR2_PACKAGE_LIBYANG_CPP=y enable the C++ bindings in the target package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
