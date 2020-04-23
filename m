From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2020 22:58:20 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/python-slip-dbus: new package
In-Reply-To: <20200423173302.280424-1-aduskett@gmail.com>
References: <20200423173302.280424-1-aduskett@gmail.com>
Message-ID: <20200423205820.GS5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-04-23 10:33 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> This package provides a dbus.service.Object derivative that ends
> itself after a certain time without being used and/or if there
> are no clients anymore on the message bus.
> 
> The package also provides a set of convenience functions and decorators for
> integrating a dbus service with PolicyKit.
> 
> Firewalld depends on this package.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Combine dependency comment (Yann)
>   - Add a more detailed commit message. (Yann)
>   - Add an explination for the PYTHON_SLIP_DBUS_APPEND_VERSION hook. (Yann)
> 
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/python-slip-dbus/Config.in            | 27 +++++++++++++++++++
>  .../python-slip-dbus/python-slip-dbus.hash    |  3 +++
>  package/python-slip-dbus/python-slip-dbus.mk  | 23 ++++++++++++++++
>  5 files changed, 55 insertions(+)
>  create mode 100644 package/python-slip-dbus/Config.in
>  create mode 100644 package/python-slip-dbus/python-slip-dbus.hash
>  create mode 100644 package/python-slip-dbus/python-slip-dbus.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 56178ba100..e0ab2f61bf 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -74,6 +74,7 @@ F:	package/python-nested-dict/
>  F:	package/python-pbr/
>  F:	package/python-pip/
>  F:	package/python-psycopg2/
> +F:	package/python-slip-dbus/
>  F:	package/python-smmap2/
>  F:	package/python-sqlalchemy/
>  F:	package/python-sqlparse/
> diff --git a/package/Config.in b/package/Config.in
> index a9c6f6fcbc..918052bc38 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1149,6 +1149,7 @@ menu "External python modules"
>  	source "package/python-singledispatch/Config.in"
>  	source "package/python-sip/Config.in"
>  	source "package/python-six/Config.in"
> +	source "package/python-slip-dbus/Config.in"
>  	source "package/python-slob/Config.in"
>  	source "package/python-smbus-cffi/Config.in"
>  	source "package/python-smmap2/Config.in"
> diff --git a/package/python-slip-dbus/Config.in b/package/python-slip-dbus/Config.in
> new file mode 100644
> index 0000000000..3e1c8adc03
> --- /dev/null
> +++ b/package/python-slip-dbus/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_PYTHON_SLIP_DBUS
> +	bool "python-slip-dbus"
> +	depends on BR2_USE_MMU # libglib2, gobject-introspection
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Is it a real dependency of py-slip-dbus, or is it inherited from dbus?

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> +	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection

gobject-introspection, really? You're not selecting it below, but you
are selecting python-gobject. So you should reference the inheritance
being on python-gobject, not goi:

    depends on BR2_PACKAGE_PYTHON3 # python-gobject

> +	select BR2_PACKAGE_DBUS # runtime
> +	select BR2_PACKAGE_DBUS_PYTHON # runtime

You must inherit the wchar dependency from dbus-python.

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
> +comment "python-slip-dbus needs python3, and a glibc toolchain w/ gcc >= 4.9, threads"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_PYTHON3
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
> index 0000000000..5c2f416f5d
> --- /dev/null
> +++ b/package/python-slip-dbus/python-slip-dbus.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# python-slip-dbus
> +#
> +################################################################################
> +
> +PYTHON_SLIP_DBUS_VERSION = 0.6.5
> +PYTHON_SLIP_DBUS_SOURCE = python-slip-$(PYTHON_SLIP_DBUS_VERSION).tar.gz
> +PYTHON_SLIP_DBUS_SITE = https://github.com/nphilipp/python-slip/archive

This line is the expeansion of the github helper.

However, you should not use that, but the relased tarball, which is only
available as a .tar.bz2:

    PYTHON_SLIP_DBUS_SOURCE = python-slip-$(PYTHON_SLIP_DBUS_VERSION).tar.bz2
    PYTHON_SLIP_DBUS_SITE = https://github.com/nphilipp/python-slip/releases/download/python-slip-$(PYTHON_SLIP_DBUS_VERSION)

> +PYTHON_SLIP_DBUS_LICENSE = GPL-2.0+
> +PYTHON_SLIP_DBUS_LICENSE_FILES = COPYING
> +PYTHON_SLIP_DBUS_SETUP_TYPE = distutils
> +PYTHON_SLIP_DBUS_DEPENDENCIES = python-gobject
> +
> +# Python-slip-dbus only packages a setup.py.in file with a @VERSION@ variable,
> +# so we must create the file ourselves and sed the appropriate version number.
> +define PYTHON_SLIP_DBUS_APPEND_VERSION
> +	cd $(@D) && \
> +		sed -e 's/@VERSION@/$(PYTHON_SLIP_DBUS_VERSION)/g' setup.py.in > setup.py

Useless use of cd:

    sed -e 's/@VERSION@/$(PYTHON_SLIP_DBUS_VERSION)/g' \
        $(@D)/setup.py.in >$(@D)/setup.py

Regards,
Yann E. MORIN.

> +endef
> +PYTHON_SLIP_DBUS_PRE_CONFIGURE_HOOKS += PYTHON_SLIP_DBUS_APPEND_VERSION
> +
> +$(eval $(python-package))
> -- 
> 2.25.3
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
