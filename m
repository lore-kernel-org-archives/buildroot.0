From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:34:00 +0200
Subject: [Buildroot] [PATCH v3] faifa: new package
In-Reply-To: <1401284346-2929-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1401284346-2929-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140608183400.5c399805@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Wed, 28 May 2014 15:39:06 +0200, Maxime Hadjinlian wrote:

> diff --git a/package/faifa/Config.in b/package/faifa/Config.in
> new file mode 100644
> index 0000000..99abaab
> --- /dev/null
> +++ b/package/faifa/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_FAIFA
> +	bool "faifa"
> +	select BR2_PACKAGE_LIBPCAP
> +	help
> +	  Faifa can configure any Intellon-based Power Line Communication device
> +	  using Intellon INT5000 and INT6000 series chips (6000 and 6300 chips). It
> +	  supports all Intellon-specific management and control frames as well as
> +	  standard management frames.

These lines are too long and had to be wrapped to a shorter length.

I had to add a !BR2_PREFER_STATIC_LIB dependency, because this package
always builds a shared library.


> +FAIFA_VERSION = aa0b5f90b89a9fd1533137b68ebf85f5437aba53
> +FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
> +FAIFA_INSTALL_STAGING = YES
> +FAIFA_DEPENDENCIES = libpcap
> +FAIFA_LICENSE = GPLv2

GPLv2+.

> +FAIFA_LICENSE_FILES = COPYING
> +
> +define FAIFA_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +FAIFA_PRE_CONFIGURE_HOOKS += FAIFA_RUN_AUTOGEN

I've added a comment above this to explain what's going on, and added
the missing host-autoconf dependency.

> +
> +define FAIFA_INSTALL_TARGET_CMDS
> +    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +        PREFIX=/usr \
> +        STRIP=/bin/true \
> +        DESTDIR=$(TARGET_DIR) \
> +        install
> +endef
> +
> +define FAIFA_INSTALL_STAGING_CMDS
> +    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +        PREFIX=/usr \
> +        STRIP=/bin/true \
> +        DESTDIR=$(STAGING_DIR) \
> +        install
> +endef

The indentation was wrong, it should use tabs.

Committed with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
