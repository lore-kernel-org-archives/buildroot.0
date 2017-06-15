From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:25:23 +0200
Subject: [Buildroot] [PATCH 1/5] libressl: new package
In-Reply-To: <20170615142928.31927-1-aduskett@codeblue.com>
References: <20170615142928.31927-1-aduskett@codeblue.com>
Message-ID: <20170615232523.6adeb951@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Thanks for working on the libressl topic, definitely a useful change.
See some comments below.

On Thu, 15 Jun 2017 10:29:24 -0400, Adam Duskett wrote:
>     Libressl is a fork of openssl from OpenSSL in 2014.  It's goal is to
>     modernize the OpenSSL codebase, improve security, and apply best practice
>     development processes.
> 
>     Right now, libressl is API compatible with OpenSSL 1.0.1, but does not yet
>     include all new APIs from OpenSSL 1.0.2 and later.
> 
>     The main source is libressl-portable, which "Includes the build scaffold
>     and compatibility layer that builds portable LibreSSL from the OpenBSD
>     source code."
> 
>     Before the build process can begin, autogen.sh must be ran manually,
>     as it pulls from the upstream OpenBSD source which adds several
>     directories to the source, along with several other steps necessary
>     before building can begin. Setting LIBRESSL_AUTORECONF = YES fails
>     with several "No such file or directory" errors as well.
> 
>     This package has been tested with the following architectures and c libraries:
>     - armv4
>     - aarch64
>     - ppc
>     - ppc64
>     - ppc64le
>     - x86_64
>     - uClibc-ng
>     - glibc 2.24
>     - musl

Why is this entire commit log indented with 4 spaces? Could you just
start the lines, well, at the beginning of the lines?


> +LIBRESSL_VERSION = v2.5.4
> +LIBRESSL_SITE = https://github.com/libressl-portable/portable.git
> +LIBRESSL_SITE_METHOD = git

Please use the "github" helper function instead.

Or even better, use release tarballs from
http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/. This way, you don't need
to call autogen.sh.

> +LIBRESSL_LICENSE = ISC, BSD-3-Clause, OpenSSL or SSLeay

Where do this license list comes from?

> +LIBRESSL_LICENSE_FILES = COPYING

I don't see any file named "COPYING" in the repository at
https://github.com/libressl-portable/portable/tree/v2.5.4.

> +LIBRESSL_INSTALL_STAGING = YES
> +
> +# autogen.sh needs to be ran manually as it pulls from the upstream
> +# OpenBSD source which adds several directories to the source.
> +# Setting LIBRESSL_AUTORECONF = YES fails with several
> +# "No such file or directory" errors.
> +define LIBRESSL_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +LIBRESSL_POST_PATCH_HOOKS += LIBRESSL_RUN_AUTOGEN

Not needed if you use the release tarballs, as suggested above.

> +
> +ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
> +define LIBRESSL_REMOVE_BIN
> +	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
> +endef
> +LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
> +endif
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
