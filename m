From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Oct 2017 12:03:53 +0100
Subject: [Buildroot] [RESEND PATCH v4] libostree: new package
References: <20171029093756.23671-1-marcus.folkesson@gmail.com>
Message-ID: <p5pgcexorq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcus,

Am Sun, 29 Oct 2017 10:37:56 +0100 schrieb Marcus Folkesson:

you need to propagate some dependencies from packages libostree depends 
on.

> diff --git a/package/libostree/Config.in b/package/libostree/Config.in
> new file mode 100644
> index 0000000000..520e76ce6a
> --- /dev/null
> +++ b/package/libostree/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBOSTREE
> +	bool "libostree"
> +	select BR2_PACKAGE_LIBGLIB2

libglib2 contains:

	depends on BR2_USE_WCHAR # gettext
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_USE_MMU # fork()

> +	select BR2_PACKAGE_PKGCONF

Is pkgconf really needed for the target?

> +	select BR2_PACKAGE_XZ
> +	select BR2_PACKAGE_E2FSPROGS

e2fsprogs contains:

	depends on BR2_USE_MMU # util-linux/libblkid

> +	select BR2_PACKAGE_LIBFUSE

libfuse contains:

	depends on !BR2_STATIC_LIBS
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_USE_MMU # fork()

> +	select BR2_PACKAGE_LIBGPGME

libgpgme contains:

	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
	depends on BR2_USE_MMU # libassuan

> +	help
> +	  OSTree is an upgrade system for Linux-based operating systems.
> +
> +	  https://ostree.readthedocs.io/en/latest/
> diff --git a/package/libostree/libostree.mk b/package/libostree/
libostree.mk
> new file mode 100644
> index 0000000000..5d0483665c
> --- /dev/null
> +++ b/package/libostree/libostree.mk
> @@ -0,0 +1,22 @@
> 
+################################################################################
> +#
> +# libostree
> +#
> 
+################################################################################
> +
> +LIBOSTREE_VERSION = v2017.12
> +LIBOSTREE_SITE = https://github.com/ostreedev/ostree.git
> +LIBOSTREE_SITE_METHOD = git
> +LIBOSTREE_GIT_SUBMODULES = yes

What about using the tarball provided by upstream?

LIBOSTREE_VERSION = 2017.12
LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v
$(LIBOSTREE_VERSION)

It contains the git submodules as well so you can drop autoreconf and 
patch 0001. Please also add a hash file.

> +LIBOSTREE_LICENSE = GPLv2
> +LIBOSTREE_LICENSE_FILES = COPYING
> +LIBOSTREE_AUTORECONF = YES
> +LIBOSTREE_DEPENDENCIES = libgpgme libglib2 xz libfuse pkgconf e2fsprogs

Please sort this list alphabetically and add host-pkgconf as it is used 
by configure.

> +# Use their special autogen.sh script to workaround automake bug with 
subdir-objects and computed paths

Please wrap this line to 72 chars.

> +define LIBOSTREE_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +LIBOSTREE_PRE_CONFIGURE_HOOKS += LIBOSTREE_RUN_AUTOGEN
> +
> +$(eval $(autotools-package))

Please add openssl as optional dependency:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBOSTREE_CONF_OPTS += --with-openssl
LIBOSTREE_DEPENDENCIES += openssl
else
LIBOSTREE_CONF_OPTS += --without-openssl
endif

Same for avahi, libarchive, libcurl, libsoup and systemd.

Please note that curl support also needs libsoup

configure: error: Curl enabled, but libsoup is not; libsoup is needed for 
tests

To solve this configure error:

checking for gpgme-config... no
checking for OT_DEP_GPGME... no
checking for GPGME pthread - version >= 1.1.8... no
configure: error: Need GPGME_PTHREAD version 1.1.8 or later

I needed to add

LIBOSTREE_CONF_OPTS += --with-gpgme-prefix=$(STAGING_DIR)/usr

Regards, Bernd
