From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 16:04:50 +0100
Subject: [Buildroot] [PATCH] lldpd: new package
In-Reply-To: <1453112084-16105-1-git-send-email-julien.floret@6wind.com>
References: <1453112084-16105-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160118160450.0645b1db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Floret,

On Mon, 18 Jan 2016 11:14:44 +0100, Julien Floret wrote:
> lldpd is a 802.1ab implementation (LLDP) to help you locate neighbors
> of all your equipments.
> 
> LLDP is an industry standard protocol designed to supplant
> proprietary Link-Layer protocols such as EDP or CDP. The goal of LLDP
> is to provide an inter-vendor compatible mechanism to deliver
> Link-Layer notifications to adjacent network devices.
> 
> https://vincentbernat.github.io/lldpd/
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Thanks for this patch! Overall it looks good, I just have a few
comments here and there, see below.

> diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
> new file mode 100644
> index 000000000000..c152c559a9de
> --- /dev/null
> +++ b/package/lldpd/Config.in
> @@ -0,0 +1,91 @@
> +config BR2_PACKAGE_LLDPD
> +	bool "lldpd"
> +	select BR2_PACKAGE_LIBEVENT

BR2_PACKAGE_LIBEVENT has a "depends on !BR2_bfin" so you need to
duplicate this dependency in lldpd's Config.in file.

> +	help
> +	  lldpd is a 802.1ab implementation (LLDP) to help you locate neighbors
> +	  of all your equipments.
> +
> +	  LLDP allows you to know exactly on which port is a server
> +	  (and reciprocally).
> +
> +	  LLDP is an industry standard protocol designed to supplant
> +	  proprietary Link-Layer protocols such as EDP or CDP. The goal of LLDP
> +	  is to provide an inter-vendor compatible mechanism to deliver
> +	  Link-Layer notifications to adjacent network devices.
> +
> +	  lldpd is an ISC-licensed implementation of LLDP for various Unixes.
> +	  It also supports some proprietary protocols.
> +
> +	  https://vincentbernat.github.io/lldpd/
> +
> +if BR2_PACKAGE_LLDPD
> +
> +config BR2_PACKAGE_LLDPD_CDP
> +	bool "CDP"
> +	default y
> +	help
> +	  Enable Cisco Discovery Protocol
> +
> +config BR2_PACKAGE_LLDPD_FDP
> +	bool "FDP"
> +	default y
> +	help
> +	  Enable Foundry Discovery Protocol
> +
> +config BR2_PACKAGE_LLDPD_EDP
> +	bool "EDP"
> +	default y
> +	help
> +	  Enable Extreme Discovery Protocol
> +
> +config BR2_PACKAGE_LLDPD_SONMP
> +	bool "SONMP"
> +	default y
> +	help
> +	  Enable SynOptics Network Management
> +
> +config BR2_PACKAGE_LLDPD_LLDPMED
> +	bool "LLDP-MED"
> +	default y
> +	help
> +	  Enable LLDP-MED extension
> +
> +config BR2_PACKAGE_LLDPD_DOT1
> +	bool "DOT1"
> +	default y
> +	help
> +	  Enable Dot1 extension (VLAN stuff)
> +
> +config BR2_PACKAGE_LLDPD_DOT3
> +	bool "DOT3"
> +	default y
> +	help
> +	  Enable Dot3 extension (PHY stuff)
> +
> +config BR2_PACKAGE_LLDPD_CUSTOM

This option should be named BR2_PACKAGE_LLDPD_CUSTOM_TLV, because
BR2_PACKAGE_LLDPD_CUSTOM is a bit unspecific.

> +	bool "Custom TLV"
> +	default y
> +	help
> +	  Enable Custom TLV support
> +
> +config BR2_PACKAGE_LLDPD_PRIVSEP
> +	bool "Privilege separation"
> +	default y
> +	help
> +	  Enable Privilege separation
> +
> +config BR2_PACKAGE_LLDPD_PRIVSEP_USER
> +	string "Privilege separation user"
> +	depends on BR2_PACKAGE_LLDPD_PRIVSEP
> +	default "_lldpd"
> +	help
> +	  Which user to use for privilege separation
> +
> +config BR2_PACKAGE_LLDPD_PRIVSEP_GROUP
> +	string "Privilege separation group"
> +	depends on BR2_PACKAGE_LLDPD_PRIVSEP
> +	default "_lldpd"
> +	help
> +	  Which group to use for privilege separation

Do we really need to allow the configuration of the user and group? We
generally don't do this for most package. Also, are _lldpd a good
choice? Why the leading underscore?

If we're really talking about Unix user/group, then I would suggest to
just have an option to enable/disable privilege separation. And when
enabled, use lldpd as the user and group names.

Also, shouldn't these user and group names be created by Buildroot in
the target root filesystem?

> new file mode 100644
> index 000000000000..984991723894
> --- /dev/null
> +++ b/package/lldpd/lldpd.mk
> @@ -0,0 +1,88 @@
> +################################################################################
> +#
> +# lldpd
> +#
> +################################################################################
> +
> +LLDPD_VERSION = 0.7.19
> +LLDPD_SITE = http://media.luffy.cx/files/lldpd
> +LLDPD_SOURCE = lldpd-$(LLDPD_VERSION).tar.gz

This is the default value, so you can remove this definition.

> +LLDPD_DEPENDENCIES = host-pkgconf libevent
> +LLDPD_LICENSE = ISC

Please specifly LLDPD_LICENSE_FILES. You can point it to README.md,
which contains the license text.

> +
> +# Detection of c99 support in configure fails without WCHAR. To enable
> +# automatic detection of c99 support by configure, we need to enable
> +# WCHAR in toolchain. But actually we do not need WCHAR at lldpd
> +# runtime. So requesting WCHAR in toolchain just for automatic detection
> +# will be overkill. To solve this, explicitly -specify c99 here.
> +LLDPD_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
> +
> +LLDPD_CONF_OPTS = \
> +	--localstatedir=/var \

Not needed, this is already passed by the autotools-package
infrastructure.

> +	--with-readline=no \

--without-readline

Since readline is available in Buildroot, it might be good in a
separate patch to enable readline support. But this is definitely not
mandatory, just a suggestion.

> +	--with-embedded-libevent=no \

--without-embedded-libevent

(yes, --with-embedded-libevent=no is the same, but we normally use
--without-<foo> in Buildroot)

There are other features that would be good to disable explicitly if
you don't handle them:

	--without-xml \
	--without-snmp \
	--without-json \
	--without-seccomp

> +	--disable-hardening
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_CDP),y)
> +LLDPD_CONF_OPTS += --enable-cdp=yes
> +else
> +LLDPD_CONF_OPTS += --enable-cdp=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_FDP),y)
> +LLDPD_CONF_OPTS += --enable-fdp=yes
> +else
> +LLDPD_CONF_OPTS += --enable-fdp=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_EDP),y)
> +LLDPD_CONF_OPTS += --enable-edp=yes
> +else
> +LLDPD_CONF_OPTS += --enable-edp=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_SONMP),y)
> +LLDPD_CONF_OPTS += --enable-sonmp=yes
> +else
> +LLDPD_CONF_OPTS += --enable-sonmp=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_LLDPMED),y)
> +LLDPD_CONF_OPTS += --enable-lldpmed=yes
> +else
> +LLDPD_CONF_OPTS += --enable-lldpmed=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_DOT1),y)
> +LLDPD_CONF_OPTS += --enable-dot1=yes
> +else
> +LLDPD_CONF_OPTS += --enable-dot1=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_DOT3),y)
> +LLDPD_CONF_OPTS += --enable-dot3=yes
> +else
> +LLDPD_CONF_OPTS += --enable-dot3=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLDPD_CUSTOM),y)
> +LLDPD_CONF_OPTS += --enable-custom=yes
> +else
> +LLDPD_CONF_OPTS += --enable-custom=no
> +endif

As said above, we prefer --enable/--disable over
--enable-<foo>=yes/--enable-<foo>=no. Also, you could simplify the
above:

LLDPD_CONF_OPTS += \
	$(if $(BR2_PACKAGE_LLDPD_DOT3),--enable-dot3,--disable-dot3) \
	$(if $(......................),--enable-foo,--disable-foo)

> +ifeq ($(BR2_PACKAGE_LLDPD_PRIVSEP),y)
> +LLDPD_CONF_OPTS += --enable-privsep=yes
> +else
> +LLDPD_CONF_OPTS += --enable-privsep=no
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LLDPD_PRIVSEP_USER),)
> +LLDPD_CONF_OPTS += --with-privsep-user=$(BR2_PACKAGE_LLDPD_PRIVSEP_USER)
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LLDPD_PRIVSEP_GROUP),)
> +LLDPD_CONF_OPTS += --with-privsep-group=$(BR2_PACKAGE_LLDPD_PRIVSEP_GROUP)
> +endif

These two last conditions should be within the ifeq
($(BR2_PACKAGE_LLDPD_PRIVSEP),y), of course except if you remove those
two string options as suggested above.

If lldpd needs a daemon, it is generally a good idea to provide an init
script for it, and to support starting using systemd (I see that lldpd
has some systemd support). However, this is also not mandatory, and can
be considered for future improvements. It is even good to have a fairly
simple patch (like yours) for a first submission, and then improve on
top of that with additional patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
