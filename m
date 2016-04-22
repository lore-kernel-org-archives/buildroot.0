From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 23:30:54 +0200
Subject: [Buildroot] [PATCH v1 3/4] openDHT: new package
In-Reply-To: <1461358628-9352-4-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-4-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <20160422233054.4f05c1a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution.

On Fri, 22 Apr 2016 16:57:07 -0400, Patrick Keroulas wrote:
> A lightweight C++11 Distributed Hash Table implementation originally
> based on https://github.com/jech/dht by Juliusz Chroboczek.

Please add your Signed-off-by here.

Also, the commit title should be in lower-case, to match the package
name:

	opendht: new package

> diff --git a/package/opendht/Config.in b/package/opendht/Config.in
> new file mode 100644
> index 0000000..10bfd23
> --- /dev/null
> +++ b/package/opendht/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_OPENDHT
> +	bool "opendht"
> +	depends on BR2_USE_WCHAR #gnutls

Space after #

> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 #msgpack

Ditto.

> +	select BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_READLINE
> +	select BR2_PACKAGE_MSGPACK
> +	help
> +		OpenDHT is lightweight C++11 Distributed Hash Table implementation.
> +
> +		https://github.com/savoirfairelinux/opendht

Indentation for the help text is one tab + 2 spaces.

> +comment "opendht needs a toolchain w/ C++, thread, dynamic library"
> +	depends on !BR2_INSTALL_LIBSTDCPP         \
> +				|| !BR2_USE_WCHAR             \
> +				|| !BR2_TOOLCHAIN_HAS_THREADS \
> +				|| !BR2_TOOLCHAIN_HAS_SYNC_4  \
> +				|| BR2_STATIC_LIBS

Please indent the follow-up lines with just one tab, and separate the \
with just one space. Also, the BR2_TOOLCHAIN_HAS_SYNC_4 is an
architecture dependency, so it needs to be handled differently.
Finally, you forgot the wchar dependency in the comment.

You want to have something like:

comment "opendht needs a toolchain w/ C++, thread, dynamic library, wchar"
	depends on BR2_TOOLCHAIN_HAS_SYNC_4
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

> diff --git a/package/opendht/opendht.hash b/package/opendht/opendht.hash
> new file mode 100644
> index 0000000..683957c
> --- /dev/null
> +++ b/package/opendht/opendht.hash
> @@ -0,0 +1,2 @@
> +# from local calculation

We normally write:

# Locally calculated

> +sha256 74ce5a5fc449509cf85912120d4243f93a006465e43ff3100c9c4fbd3001dc41 opendht-468331093345e718b5d269a71b3c52a2eea4797e.tar.gz
> diff --git a/package/opendht/opendht.mk b/package/opendht/opendht.mk
> new file mode 100644
> index 0000000..5bab245
> --- /dev/null
> +++ b/package/opendht/opendht.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# opendht
> +#
> +################################################################################
> +
> +OPENDHT_VERSION = 468331093345e718b5d269a71b3c52a2eea4797e
> +OPENDHT_SITE_METHOD = git
> +#OPENDHT_SITE = $(call github,savoirfairelinux,opendht,$(OPENDHT_VERSION))
> +OPENDHT_SITE = https://github.com/savoirfairelinux/opendht.git

Please use the github function call that you commented out, and remove
the _SITE_METHOD variable.

> +OPENDHT_LICENSE = GPLv3, X11

Which license applies to what part?

> +OPENDHT_LICENSE_FILES = COPYING
> +OPENDHT_AUTORECONF = YES
> +OPENDHT_INSTALL_STAGING = YES
> +OPENDHT_INSTALL_TARGET = YES

This last line is not needed, as it is the default.

> +OPENDHT_CONF_OPTS = --disable-static

Don't do this, let Buildroot pass --{enable,disable}-{static,shared}
depending on the configuration.

> +OPENDHT_CONF_ENV = \
> +	GNUTLS_CFLAGS="-I$(STAGING_DIR)/usr/include" \
> +	GNUTLS_LIBS="-I$(STAGING_DIR)/usr/lib -lgnutls -lnettle -lhogweed"

Why is this needed? The configure.ac is using pkg-config to find the
details about gnutls and other libraries, so there should really be no
need for such environment variables.

> +OPENDHT_DEPENDENCIES = \
> +	host-pkgconf       \
> +	gnutls             \
> +	readline           \
> +	msgpack
> +
> +$(eval $(autotools-package))

Could you rework your patch to take into account those comments, and
send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
