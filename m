From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 19:54:22 +0100
Subject: [Buildroot] [PATCH 05/13] lockdev: new package
In-Reply-To: <b997b137fd4de75941873cc414dfe8e0d6f5722b.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <b997b137fd4de75941873cc414dfe8e0d6f5722b.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302211954.23165.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> library for locking devices
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index 01eeee8..2106391 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -555,6 +555,7 @@ source "package/libffi/Config.in"
>  source "package/gsl/Config.in"
>  source "package/libglib2/Config.in"
>  source "package/libical/Config.in"
> +source "package/lockdev/Config.in"

Alphabetical order, please.

[--SNIP--]
> diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
> new file mode 100644
> index 0000000..2012211
> --- /dev/null
> +++ b/package/lockdev/lockdev.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# lockdev
> +#
> +#############################################################
> +
> +LOCKDEV_VERSION = 1.0.3
> +LOCKDEV_SITE = http://ftp.de.debian.org/debian/pool/main/l/lockdev
> +LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
> +LOCKDEV_INSTALL_STAGING = YES
> +LOCKDEV_LICENSE = LGPLv2.1
> +LOCKDEV_LICENSE_FILES = LICENSE
> +
> +define LOCKDEV_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIM= -C $(@D) V=1 shared

No 'V=1' please. Add building the static version (if possible).

> +endef
> +
> +define LOCKDEV_INSTALL_STAGING_CMDS
> +	$(MAKE) basedir=$(STAGING_DIR)/usr -C $(@D) install
> +	ln -s $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
> +	ln -s $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1

And install the static version, too. ;-)

> +endef
> +
> +define LOCKDEV_INSTALL_TARGET_CMDS
> +	$(MAKE) basedir=$(TARGET_DIR)/usr -C $(@D) install
> +	ln -s $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so
> +	ln -s $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
> +endef
> +
> +$(eval $(generic-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
