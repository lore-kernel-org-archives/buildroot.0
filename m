From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 23:28:35 +0200
Subject: [Buildroot] [PATCH 1/1] new package: fwup (host and target)
In-Reply-To: <1459884735-16102-1-git-send-email-niziak@spox.org>
References: <1459884735-16102-1-git-send-email-niziak@spox.org>
Message-ID: <20160612232835.1d2819d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Apr 2016 21:32:15 +0200, Wojciech Nizinski wrote:
> To easily generate bootable binary image of SD card.
> BR package files comes from project https://github.com/fhunleth/bbb-
> buildroot-fwup
> 
> Signed-off-by: Wojciech Nizinski <niziak@spox.org>

Thanks, I've merged your patch, after doing a number of changes. See
below for the details.

> diff --git a/package/fwup/Config.in b/package/fwup/Config.in
> new file mode 100644
> index 0000000..67736b2
> --- /dev/null
> +++ b/package/fwup/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_FWUP
> +	bool "fwup"
> +	depends on BR2_USE_MMU

You missed the wchar dependency here... even though you had a comment
for it.

> +	select BR2_PACKAGE_LIBARCHIVE
> +	select BR2_PACKAGE_ZLIB        # required by libarchive to include zip compression

I've put the comment above the select, since the comment is pretty long.

> +	select BR2_PACKAGE_LIBCONFUSE
> +	select BR2_PACKAGE_LIBSODIUM
> +	help
> +	  Fwup is a scriptable embedded Linux firmware update creator and runner.

I've rewrapped the help text, this line was slightly too long.

> +
> +	  https://github.com/fhunleth/fwup
> +
> +comment "fwup needs a toolchain w/ wchar"

I've added:

	depends on BR2_USE_MMU

here since we don't want this comment to be shown on platforms where
fwup can anyway not be enabled.

> +	depends on !BR2_USE_WCHAR
> diff --git a/package/fwup/Config.in.host b/package/fwup/Config.in.host
> new file mode 100644
> index 0000000..ae71a33
> --- /dev/null
> +++ b/package/fwup/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_FWUP
> +	bool "host fwup"
> +	help
> +	  Fwup is a scriptable embedded Linux firmware update creator and runner.

I rewrapped this.

> +
> +	  https://github.com/fhunleth/fwup
> diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
> new file mode 100644
> index 0000000..1feee07
> --- /dev/null
> +++ b/package/fwup/fwup.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# fwup
> +#
> +#############################################################
> +
> +FWUP_VERSION = v0.6.1

I've updated to 0.7.0? which has been released since then.

> +FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
> +FWUP_LICENSE = Apache-2.0
> +FWUP_LICENSE_FILES = LICENSE
> +FWUP_AUTORECONF = YES
> +FWUP_DEPENDENCIES = libconfuse libarchive libsodium
> +
> +define FWUP_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +HOST_FWUP_PRE_CONFIGURE_HOOKS += FWUP_RUN_AUTOGEN
> +FWUP_PRE_CONFIGURE_HOOKS += FWUP_RUN_AUTOGEN

I've replaced this hook by a hook that simply creates the m4 directory,
which is all what was missing to make autoreconf work.

I've submitted a patch fixing this upstream:
https://github.com/fhunleth/fwup/pull/32.

Also, fwup failed to build for the target with the uClibc C library,
which is our default C library. I had to make a patch for the source
code (it was failing even with your original patch based on 0.6.1).
I've submitted the patch upstream:
https://github.com/fhunleth/fwup/pull/31.

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 206de3f..f45335e 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -93,3 +93,4 @@ LIBARCHIVE_CONF_OPTS += --without-lzma
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

This should have been part of a separate patch, so I've split it. Also,
adding this line is not sufficient: by default HOST_<pkg>_DEPENDENCIES
is derived from <pkg>_DEPENDENCIES.

So when you have:

ifeq ($(BR2_PACKAGE_NETTLE),y)
LIBARCHIVE_DEPENDENCIES += nettle
else
LIBARCHIVE_CONF_OPTS += --without-nettle
endif

if you don't do anything, then HOST_LIBARCHIVE_DEPENDENCIES will
contain host-nettle. Except that there is no host-nettle package, so
the build would fail.

To avoid this, I added explicitly:

# The only user of host-libarchive needs zlib support
HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
HOST_LIBARCHIVE_CONF_OPTS = \
        --disable-bsdtar \
        --disable-bsdcpio \
        --disable-acl \
        --disable-xattr \
        --without-bz2lib \
        --without-expat \
        --without-libiconv-prefix \
        --without-xml2 \
        --without-lzo2 \
        --without-nettle \
        --without-openssl \
        --without-lzma


> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> index 09bc777..fd89ced 100644
> --- a/package/libsodium/libsodium.mk
> +++ b/package/libsodium/libsodium.mk
> @@ -15,3 +15,4 @@ LIBSODIUM_CONF_OPTS += --disable-pie
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

I've also split this to a separate patch.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
