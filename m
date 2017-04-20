From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:12:28 +0200
Subject: [Buildroot] [PATCH 8/9] xenomai: add support for registry
In-Reply-To: <20170419200007.12590-9-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
 <20170419200007.12590-9-patrickdepinguin@gmail.com>
Message-ID: <20170420231228.32fe94a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 22:00:06 +0200, Thomas De Schampheleire wrote:

> +config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
> +	bool "Enable registry"
> +	select BR2_PACKAGE_LIBFUSE
> +	depends on !BR2_STATIC_LIBS # libfuse
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> +	depends on BR2_USE_MMU # libfuse

Some "depends on" -> a Config.in comment is needed, so I've added one.

> +	help
> +	  Xenomai APIs can export their internal state through a
> +	  pseudo-filesystem, whose files may be read to obtain information about

Line too long. Please run check-package! :-)

> +	  Specify the root path of the registry here.
> +	  To use the Xenomai default (currently: /var/run/xenomai), leave this

Line too long. Please run check-package! :-)

> +ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY),y)
> +XENOMAI_DEPENDENCIES += libfuse
> +XENOMAI_CONF_OPTS += --enable-registry$(if $(call qstrip,$(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH)),=$(call qstrip,$(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH)))

Gah, this is really not pretty. I've changed this to:

XENOMAI_REGISTRY_PATH = $(call qstrip,$(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH))
ifeq ($(XENOMAI_REGISTRY_PATH),)
XENOMAI_CONF_OPTS += --enable-registry
else
XENOMAI_CONF_OPTS += --enable-registry=$(XENOMAI_REGISTRY_PATH)
endif

which I believe is a lot more readable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
