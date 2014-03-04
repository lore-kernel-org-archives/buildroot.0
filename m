From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 22:38:45 +0100
Subject: [Buildroot] [PATCH v2] bluez5_utils: new package
In-Reply-To: <1383600898-25441-1-git-send-email-marcin@bis.org.pl>
References: <CAAXf6LXLSDeRgXT9T+v77i=Wh3Ti-5G02U-7J7F4DAPJYUg2rA@mail.gmail.com>
 <1383600898-25441-1-git-send-email-marcin@bis.org.pl>
Message-ID: <20140304213845.GG11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin, All,

Thanks for your patch. Here are a few comments below...

On 2013-11-04 22:34 +0100, Marcin Bis spake thusly:
> This patch adds support for BlueZ 5.x.
> 
> API is not backwards compatible with BlueZ 4. It uses kernel interface
> introduced in 3.4 (3.5 for Low Energy).

So it has a dependency on the Linux kernel headers installed with the
toolchain, right? We now have a way to express this kind of
dependencies:

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4

See the current manual:
    http://nightly.buildroot.org/#dependencies-target-toolchain-options

[--SNIP--]
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> new file mode 100644
> index 0000000..718699d
> --- /dev/null
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# bluez5_utils
> +#
> +################################################################################
> +
> +BLUEZ5_UTILS_VERSION = 5.10

There's 5.15, now...

> +BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
> +BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
> +BLUEZ5_UTILS_INSTALL_STAGING = YES
> +BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 libical readline
> +BLUEZ5_UTILS_CONF_OPT = --enable-test --enable-tools --enable-library

Maybe make tests optional?

> +BLUEZ5_UTILS_AUTORECONF = YES

Why is autoreconf needed? The tarballs do have ./configure.

configure.ac uses PKG_PROG_PKG_CONFIG, so you'd need:
    BLUEZ5_UTILS_DEPENDENCIES += host-pkgconf

Also, configure.ac uses AC_DISABLE_STATIC, so it looks like they do not
intend to support static linking. You'll need in Config.in:
    depends on !BR2_PREFER_STATIC_LIB

> +BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
> +BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
> +
> +# experimental plugins
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
> +BLUEZ5_UTILS_CONF_OPT += --enable-experimental
> +else
> +BLUEZ5_UTILS_CONF_OPT += --disable-experimental
> +endif
> +
> +# use udev if available
> +ifeq ($(BR2_PACKAGE_UDEV),y)
> +        BLUEZ5_UTILS_CONF_OPT += --enable-udev
> +        BLUEZ5_UTILS_DEPENDENCIES += udev
> +else
> +        BLUEZ5_UTILS_CONF_OPT += --disable-udev
> +endif
> +
> +# integrate with systemd if available
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +        BLUEZ5_UTILS_CONF_OPT += --enable-systemd
> +        BLUEZ5_UTILS_DEPENDENCIES += systemd
> +else
> +        BLUEZ5_UTILS_CONF_OPT += --disable-systemd
> +endif

Bluez4 has more config knobs: are they no longer applicable to Bluez5?
  - Audio
  - USB support
  - GATT support

Since you mention the subject in the commit log: is there a way to
enable/disable support for BTLE?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
