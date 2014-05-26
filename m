From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 May 2014 23:19:09 +0200
Subject: [Buildroot] [PATCH 1/1] WIP: libudev: New package
In-Reply-To: <1401129061-25216-2-git-send-email-bernd.kuhls@t-online.de>
References: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
 <1401129061-25216-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140526211909.GA13529@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-26 20:31 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/libudev/Config.in b/package/libudev/Config.in
> new file mode 100644
> index 0000000..f3f1b59
> --- /dev/null
> +++ b/package/libudev/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBUDEV
> +	bool "libudev"
> +	depends on !BR2_INIT_SYSTEMD
> +	depends on !BR2_PACKAGE_EUDEV

Maybe replace those two 'depends on' with simply:

    depends on !BR2_PACKAGE_HAS_UDEV

[--SNIP--]
> diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
> new file mode 100644
> index 0000000..9dfd214
> --- /dev/null
> +++ b/package/libudev/libudev.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# libudev
> +#
> +################################################################################
> +
> +LIBUDEV_VERSION = v1.6
> +LIBUDEV_SITE = $(call github,gentoo,eudev,$(LIBUDEV_VERSION))
> +LIBUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
> +LIBUDEV_LICENSE_FILES = COPYING

I was wondering if we could somehow keep this in sync with the eudev
package, to avoid duplicating the versions, so we can bump both in a
single change.

> +LIBUDEV_INSTALL_STAGING = YES
> +LIBUDEV_AUTORECONF = YES
> +
> +LIBUDEV_DEPENDENCIES = host-pkgconf
> +
> +LIBUDEV_CONF_OPT += \
> +	--disable-manpages \
> +	--with-rootlibdir=/lib \
> +	--libexecdir=/lib \
> +	--with-firmware-path=/lib/firmware \
> +	--disable-introspection \

Would it be possible to build the library with introspection?
That would require adding gobject-introspection, though...
But I'm not too fluent in udev itself, so I won;t complain! ;-)

> +	--disable-keymap \
> +	--disable-libkmod \
> +	--disable-modules \
> +	--disable-selinux \
> +	--disable-rule-generator \
> +	--disable-gtk-doc \
> +	--disable-gudev \
> +	--enable-split-usr
> +
> +define LIBUDEV_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
> +endef
> +
> +define LIBUDEV_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +define LIBUDEV_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(autotools-package))

Otherwise, looks good to me.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
