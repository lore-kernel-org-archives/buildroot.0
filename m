From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Sep 2014 12:38:24 +0200
Subject: [Buildroot] [PATCH v6 1/1] New package: openvmtools
In-Reply-To: <1407500851-6882-1-git-send-email-kaszak@gmail.com>
References: <1407500851-6882-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140902103824.GB4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-08-08 14:27 +0200, Karoly Kasza spake thusly:
> New package: openvmtools

Some comments below.

[--SNIP--]
> diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
> new file mode 100644
> index 0000000..65220f9
> --- /dev/null
> +++ b/package/openvmtools/Config.in
> @@ -0,0 +1,55 @@
> +config BR2_PACKAGE_OPENVMTOOLS
> +	bool "openvmtools"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	depends on BR2_LARGEFILE
> +	depends on BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  Open Virtual Machine Tools for VMware guest OS
> +
> +	  http://open-vm-tools.sourceforge.net/
> +
> +	  ICU locales and X11 tools are currently not supported.
> +
> +	  NOTE: Support for vmblock-fuse will be enabled in openvmtools if the
> +	        libfuse package is selected.
> +
> +if BR2_PACKAGE_OPENVMTOOLS
> +
> +config BR2_PACKAGE_OPENVMTOOLS_PROCPS
> +	bool "procps support"
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_PROCPS_NG
> +	help
> +	  Enable support for procps / meminfo
> +
> +comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
> +	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +
> +config BR2_PACKAGE_OPENVMTOOLS_DNET
> +	bool "dnet support"
> +	depends on BR2_INET_IPV6
> +	select BR2_PACKAGE_LIBDNET
> +	help
> +	  Enable support for libdnet / nicinfo
> +
> +comment "openvmtools dnet support needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_OPENVMTOOLS_PAM
> +	bool "PAM support"
> +	select BR2_PACKAGE_LINUX_PAM

linux-pam depends on !static, so you should propagate the dependency
here.

linux-pam also depends on locales and wchar, but they re handled by the
main symbols of openvmtools, so it is not needed to replicate them here.
A comment might be OK, though:

    # linux-pam needs locale and wchar, but we already have this
    # dependency on the main symbol, above.

> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> new file mode 100644
> index 0000000..4b6e0bb
> --- /dev/null
> +++ b/package/openvmtools/openvmtools.mk
> @@ -0,0 +1,76 @@
> +################################################################################
> +#
> +# openvmtools
> +#
> +################################################################################
> +
> +OPENVMTOOLS_VERSION = 9.4.6-1770165
> +OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
> +OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
> +OPENVMTOOLS_LICENSE = LGPLv2.1
> +OPENVMTOOLS_LICENSE_FILES = COPYING
> +OPENVMTOOLS_AUTORECONF = YES

Please add a comment saying why we need to autoreconf.

> +OPENVMTOOLS_CONF_OPT = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
> +
> +# -Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
> +# See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
> +OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-deprecated-declarations"
> +
> +OPENVMTOOLS_DEPENDENCIES = libglib2
> +
> +# When libfuse is available, openvmtools can build vmblock-fuse, so
> +# make sure that libfuse gets built first.
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +OPENVMTOOLS_DEPENDENCIES += libfuse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps LDFLAGS="-L$(TARGET_DIR)/usr/lib"

Why do you point to TARGET_DIR?

Usually, we consider the development files are installed in STAGING_DIR.
So, if you need to point to a library path, you should point to
STAGING_DIR here.

But STAGING_DIR/usr/lib is already searched for by our toolchain, so it
should not be necessary to add it.

If you really need that, explain why.

> +OPENVMTOOLS_CONF_OPT += --with-procps
> +OPENVMTOOLS_DEPENDENCIES += procps-ng
> +else
> +OPENVMTOOLS_CONF_OPT += --without-procps
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"

Ditto, STAGING_DIR/usr/include is already searched for by our toolchain,
so it should not be needed.

If you really need that, explain why.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
