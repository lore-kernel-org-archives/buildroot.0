From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 23:02:53 +0200
Subject: [Buildroot] [PATCH 3/5] package/python-slip-dbus: new package
In-Reply-To: <20200330234616.1665466-3-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
 <20200330234616.1665466-3-aduskett@gmail.com>
Message-ID: <20200406210253.GV22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-03-30 16:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> A dbus.service.Object derivative that ends
> itself after a certain time without being used and/or if there
> are no clients anymore on the message bus, as well as
> convenience functions and decorators for integrating a dbus
> service with PolicyKit.

Repeating the package description in the commit log is usally not very
useful.

However, see below for what should appear in a commit log...

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-slip-dbus/Config.in b/package/python-slip-dbus/Config.in
> new file mode 100644
> index 0000000000..98bc762055
> --- /dev/null
> +++ b/package/python-slip-dbus/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_PYTHON_SLIP_DBUS
> +	bool "python-slip-dbus"
> +	depends on BR2_PACKAGE_DBUS # runtime

I think we want it to select dbus.

So it needs threads as well.

> +	depends on BR2_USE_MMU # libglib2, gobject-introspection
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> +	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
> +	select BR2_PACKAGE_DBUS_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON_DECORATOR  # runtime
> +	select BR2_PACKAGE_PYTHON_GOBJECT  # runtime
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	help
> +	  A dbus.service.Object derivative that ends
> +	  itself after a certain time without being used and/or if there
> +	  are no clients anymore on the message bus, as well as
> +	  convenience functions and decorators for integrating a dbus
> +	  service with PolicyKit.
> +
> +	  https://github.com/nphilipp/python-slip
> +
> +comment "python-slip-dbus needs python3"
> +	depends on !BR2_PACKAGE_PYTHON3
> +
> +comment "python-slip-dbus needs a glibc toolchain, gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

I don't like it when there are two comments about the dependencies of a
single package. What about;

    comment "python-slip-dbus needs python3, and a glibc toolchain w/ gcc >= 4.9, threads"
        depends on BR2_USE_MMU
        depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC \
                || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_PYTHON3

> diff --git a/package/python-slip-dbus/python-slip-dbus.hash b/package/python-slip-dbus/python-slip-dbus.hash
> new file mode 100644
> index 0000000000..8a88533169
> --- /dev/null
> +++ b/package/python-slip-dbus/python-slip-dbus.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  7a52ebe49945cd27d06a1172042a55eb5c79cfda49b742153fa076d1d9bd99a1  python-slip-0.6.5.tar.gz
> +sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
> diff --git a/package/python-slip-dbus/python-slip-dbus.mk b/package/python-slip-dbus/python-slip-dbus.mk
> new file mode 100644
> index 0000000000..20b587fd5c
> --- /dev/null
> +++ b/package/python-slip-dbus/python-slip-dbus.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# python-slip-dbus
> +#
> +################################################################################
> +
> +PYTHON_SLIP_DBUS_VERSION = 0.6.5
> +PYTHON_SLIP_DBUS_SOURCE = python-slip-$(PYTHON_SLIP_DBUS_VERSION).tar.gz
> +PYTHON_SLIP_DBUS_SITE = https://github.com/nphilipp/python-slip/archive
> +PYTHON_SLIP_DBUS_LICENSE = GPL-2.0+
> +PYTHON_SLIP_DBUS_LICENSE_FILES = COPYING
> +PYTHON_SLIP_DBUS_SETUP_TYPE = distutils
> +PYTHON_SLIP_DBUS_DEPENDENCIES = python-gobject
> +
> +define PYTHON_SLIP_DBUS_APPEND_VERSION
> +	cd $(@D); sed -e 's/@VERSION@/$(PYTHON_SLIP_DBUS_VERSION)/g' setup.py.in > setup.py
> +endef
> +PYTHON_SLIP_DBUS_PRE_CONFIGURE_HOOKS += PYTHON_SLIP_DBUS_APPEND_VERSION

Explanations for this hook should appear in the commit log, bewcause it
is far from obvious why this is needed.

I've marked as changes requested; care to address those and respin,
please?

Thanks!

Regards,
Yann E. MORIN.

> +$(eval $(python-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
