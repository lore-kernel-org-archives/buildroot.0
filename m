From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jul 2014 23:15:49 +0200
Subject: [Buildroot] [PATCH v4 1/1] New package: openvmtools
In-Reply-To: <1406635032-34970-1-git-send-email-kaszak@gmail.com>
References: <y>
 <1406635032-34970-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140729211549.GA5846@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-07-29 13:57 +0200, Karoly Kasza spake thusly:
> New package: openvmtools

Thanks for this new package!

See below for a few comments.

> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
[--SNIP--]
> diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
> new file mode 100644
> index 0000000..b1ede00
> --- /dev/null
> +++ b/package/openvmtools/Config.in
> @@ -0,0 +1,56 @@
> +config BR2_PACKAGE_OPENVMTOOLS
> +	bool "openvmtools"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Are all those dependencies just inherited from libglib2, or are they
real dependencies on openvmtools?

If they are only inherited from libglib2, they it is customary to
indicate the package as a comment to the dependency, like:

    depends on BR2_USE_MMU # libglib2
    depends on BR2_USE_WCHAR # libglib2

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
> +menu "openvmtools options"

Do not put it in a sub-menu, the options will be properly indented in
the frontends.

We only do sub-menus when there are a *lot* of sub-options (there is no
written rule on this, but above ~8 warants a sub-menu, otherwise
indentation is considered enough.)

> +config BR2_PACKAGE_OPENVMTOOLS_PROCPS
> +	bool "openvmtools procps support"

Do not repeat 'openvmtools' in the prompts. Since it depends on
BR2_PACKAGE_OPENVMTOOLS, the frontends wil properly indent the
sub-options, so that it is obvious they are options to openvmtools.

> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

I know we alkready have one package and one systm option that select
busybox-show-others, but they are a bit special: one is systemd, the
other is sysvinit. All other packages depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
instead.

For openvmtools, I would use a depends rather than a select, something
like:

    config BR2_PACKAGE_OPENVMTOOLS_PROCPS
        bool "procps support"
        depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
        select BR2_PACKAGE_PROCPS_NG

    comment "procps support needs that BUSYBOX_SHOW_OTHERS be set"
        depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

I'm not much satisfied with the comment text, however. If you find a
better wording, feel free to adapt.

> +	select BR2_PACKAGE_PROCPS_NG
> +	help
> +	  Enable support for procps / meminfo
> +
> +config BR2_PACKAGE_OPENVMTOOLS_DNET
> +	bool "openvmtools dnet support"

Ditto: do not repeat 'openvmtools' in the prompts.

> +	depends on BR2_INET_IPV6
> +	select BR2_PACKAGE_LIBDNET
> +	help
> +	  Enable support for libdnet / nicinfo
> +
> +comment "openvmtools dnet support needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_OPENVMTOOLS_PAM
> +	bool "openvmtools PAM support"

Ditto.

> +	select BR2_PACKAGE_LINUX_PAM
> +	help
> +	  Support for PAM in openvmtools
> +
> +endmenu
> +
> +endif
> +
> +comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile, locale"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR ||!BR2_TOOLCHAIN_HAS_THREADS || \
> +	!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE || !BR2_ENABLE_LOCALE
> diff --git a/package/openvmtools/S10vmtoolsd b/package/openvmtools/S10vmtoolsd
> new file mode 100644
> index 0000000..3ab351e
> --- /dev/null
> +++ b/package/openvmtools/S10vmtoolsd
> @@ -0,0 +1,33 @@
> +#!/bin/sh
> +#
> +# Starts vmtoolsd for openvmtools
> +#
> +
> +PID=/var/run/vmtoolsd.pid
> +
> +case "$1" in
> +  start)
> +	echo -n "Starting vmtoolsd: "

This scripts uses a mix of tabs and spaces to do the indentation; for
example, the cases lines ("start)", "stop)"...) are indented with
spaces, while the rest is indented with tabs. Please be consistent.

> +
> +exit $?

No need to exit epxlicitly, it's implicit from POSIX, that a shell
script exits with the error code from the last command. Besides, we do
not care at all about the exit status of a startup script.

[--SNIP--]
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> new file mode 100644
> index 0000000..9771a1e
> --- /dev/null
> +++ b/package/openvmtools/openvmtools.mk
> @@ -0,0 +1,81 @@
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
> +OPENVMTOOLS_CONF_OPT = \
> +        --without-icu \
> +        --without-x \
> +        --without-gtk2 \
> +        --without-gtkmm \
> +        --without-kernel-modules

On a single line. If it is too long, just split it, like:

    OPENVMTOOLS_CONF_OPT = --without-icu --without-x \
            --without-gtk2 --without-gtkmm --without-kernel-modules

> +#-Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
> +#See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/

Nit-pick: space after the '#' symbol.

> +OPENVMTOOLS_CONF_ENV = CFLAGS+="-Wno-deprecated-declarations"

This should be:

    OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-deprecated-declarations"

> +OPENVMTOOLS_DEPENDENCIES = libglib2
> +
> +# When libfuse is available, openvmtools can build vmblock-fuse, so
> +# make sure that libfuse gets built first.
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +OPENVMTOOLS_DEPENDENCIES += libfuse

No --enable-fuse/--disable-fuse options (or the likes)?

> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps LDFLAGS="-L$(TARGET_DIR)/usr/lib"
> +OPENVMTOOLS_CONF_OPT += --with-procps
> +OPENVMTOOLS_DEPENDENCIES += procps-ng
> +else
> +OPENVMTOOLS_CONF_OPT += --without-procps
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"
> +OPENVMTOOLS_CONF_OPT += --with-dnet
> +OPENVMTOOLS_DEPENDENCIES += libdnet
> +else
> +OPENVMTOOLS_CONF_OPT += --without-dnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
> +OPENVMTOOLS_CONF_OPT += --with-pam
> +OPENVMTOOLS_MAKE_OPT += CFLAGS+="-Wno-unused-local-typedefs"
> +OPENVMTOOLS_DEPENDENCIES += linux-pam
> +else
> +OPENVMTOOLS_CONF_OPT += --without-pam
> +endif
> +
> +define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
> +#needed by lib/system/systemLinux.c (or will cry in /var/log/messages)

Do not put the comments in the macro; put them above the macro defintion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
