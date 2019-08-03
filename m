From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 19:19:19 +0200
Subject: [Buildroot] [PATCH 2/4] bitcoin: new package
In-Reply-To: <1538143163-20596-3-git-send-email-fabiorush@gmail.com>
References: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
 <1538143163-20596-3-git-send-email-fabiorush@gmail.com>
Message-ID: <20190803191919.683531bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! I have applied your patch, but after
making a significant number of changes. See below.

First, all new packages need an entry in DEVELOPERS file, so that the
original submitter (you!) can receive notifications about build issues
with this package.

On Fri, 28 Sep 2018 10:59:21 -0300
Fabio Urquiza <fabiorush@gmail.com> wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 2810d04..796383a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1971,6 +1971,10 @@ endif
>  	source "package/xtables-addons/Config.in"
>  	source "package/znc/Config.in"
>  
> +menu "Blockchain Applications"
> +	source "package/bitcoin/Config.in"
> +endmenu

Since we're for now only applying this package, having a new category
for blockchain applications was not really useful, so I moved it to
Miscellaneous applications.

> diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
> new file mode 100644
> index 0000000..cef0e73
> --- /dev/null
> +++ b/package/bitcoin/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_BITCOIN
> +	bool "bitcoin"
> +	select BR2_TOOLCHAIN_BUILDROOT_USE_SSP

You can't select this option, as it is only valid for internal
toolchain with the uClibc C library. The proper solution here was to
pass --disable-hardening, so that the bitcoin configure script doesn't
add any hardening-related CFLAGS. Buildroot has system-wide support for
hardening features, and if such features are enabled, it will pass the
appropriate CFLAGS.

> +	select BR2_INSTALL_LIBSTDCPP

You cannot select this, you can only depend on it, and it needs a
Config.in comment. See other packages.

Also, other dependencies were missing:

 - BR2_TOOLCHAIN_HAS_GCC_BUG_64735 due to the use of std::future

 - BR2_TOOLCHAIN_HAS_ATOMIC due to the use of std::atomic

 - A weird dependency was also needed because 8-byte atomics are not
   provided on ARM Cortex-M.

All these issues were found by using ./utils/testpkg on your package.

> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_THREAD
> +	select BR2_PACKAGE_BOOST_CHRONO
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBEVENT
> +	help
> +	  Bitcoin Core is an open source project which maintains and
> +	  releases Bitcoin client software called ?Bitcoin Core?.
> +
> +	  It is a direct descendant of the original Bitcoin software
> +	  client released by Satoshi Nakamoto after he published the
> +	  famous Bitcoin whitepaper.
> +
> +	  Bitcoin Core consists of both ?full-node? software for fully

We try to use only ASCII characters, and to cut the lines at 72
characters. This is something that "make check-package" tells you.

> +BITCOIN_VERSION = v0.16.3
> +BITCOIN_SITE = $(call github,bitcoin,bitcoin,$(BITCOIN_VERSION))
> +BITCOIN_AUTORECONF = YES
> +BITCOIN_LICENSE = MIT
> +BITCOIN_LICENSE_FILES = COPYING
> +BITCOIN_CONF_OPTS = --disable-wallet --disable-tests
> +BITCOIN_CONF_OPTS += --with-sysroot=$(STAGING_DIR)

The --with-sysroot option is not necessary.

> +BITCOIN_CONF_OPTS += --with-boost-libdir=$(STAGING_DIR)/usr/lib/

I grouped all those CONF_OPTS statements in just one statement.

See the final commit at:

  https://git.buildroot.org/buildroot/commit/?id=656fc50b51c03891d34471fd39003355678f7fde

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
