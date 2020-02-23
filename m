From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 09:19:06 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/python-gobject: bump
 version to 3.34.0
In-Reply-To: <20200223003234.4062316-1-aduskett@gmail.com>
References: <20200223003234.4062316-1-aduskett@gmail.com>
Message-ID: <20200223081906.GE8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-02-22 16:32 -0800, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Convert the package to a meson package.
>   - Remove 0001-add-PYTHON_INCLUDES-override.patch as it no longer applies.
>   - Add gobject-introspection as a dependency.
>   - Add the package under myself in the DEVELOPERS file.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks for continuing yout GOI efforts! :-)

[--SNIP--]
> diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
> index 36ddffebb0..fd647e62f6 100644
> --- a/package/python-gobject/Config.in
> +++ b/package/python-gobject/Config.in
> @@ -1,16 +1,17 @@
>  config BR2_PACKAGE_PYTHON_GOBJECT
>  	bool "python-gobject"
> -	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_PACKAGE_PYTHON # Broken with python 3.8
> -	select BR2_PACKAGE_LIBGLIB2

Here you remove the select to libglib2, but it is still listed in the
build dependencies, below...

So, either pytgon-gobject needs libglib2 in which case it should select
it (and depend on all the reverse dependencies) as well as build-depend
on it, or it does not depend on it at all and thus should drop it even
from the build-dependencies [0].

That gobject-introspection already caries those dependencies is not a
reason to drop them from pygobject.

> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
> +	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection

Dependencies order is:
  - arch deps
  - toolchain deps
  - package deps

> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
>  	help
>  	  Python bindings for the GLib/GObject library
>  
>  	  https://wiki.gnome.org/action/show/Projects/PyGObject
>  
> -comment "python-gobject needs a toolchain w/ wchar, threads"
> -	depends on BR2_PACKAGE_PYTHON
> +comment "python-gobject needs a glibc toolchain, gcc >= 4.9"
>  	depends on BR2_USE_MMU

You dropped the dependency on MMU in the main symbol, but not here.
(Hint: I think you should not drop it.)

> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
> index 0c093f3306..958c022a18 100644
> --- a/package/python-gobject/python-gobject.hash
> +++ b/package/python-gobject/python-gobject.hash
> @@ -1,4 +1,3 @@
> -# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.28/pygobject-2.28.6.sha256sum
> -sha256	fb8a1d4f665130a125011659bd347c7339c944232163dbb9a34fd0686577adb8  pygobject-2.28.6.tar.xz
> -# Locally computed
> +# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.34/pygobject-3.34.0.sha256sum
> +sha256  87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a  pygobject-3.34.0.tar.xz
>  sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
> diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
> index cf5c874151..427e7b60ac 100644
> --- a/package/python-gobject/python-gobject.mk
> +++ b/package/python-gobject/python-gobject.mk
> @@ -4,36 +4,29 @@
>  #
>  ################################################################################
>  
> -PYTHON_GOBJECT_VERSION_MAJOR = 2.28
> -PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).6
> +PYTHON_GOBJECT_VERSION_MAJOR = 3.34
> +PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
>  PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
> -PYTHON_GOBJECT_SITE = http://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
> +PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
>  PYTHON_GOBJECT_LICENSE = LGPL-2.1+
>  PYTHON_GOBJECT_LICENSE_FILES = COPYING
> -PYTHON_GOBJECT_DEPENDENCIES = host-pkgconf libglib2
> -PYTHON_GOBJECT_CONF_OPTS = --disable-introspection
> -# for 0001-add-PYTHON_INCLUDES-override.patch
> -PYTHON_GOBJECT_AUTORECONF = YES
> +PYTHON_GOBJECT_INSTALL_STAGING = YES
> +PYTHON_GOBJECT_DEPENDENCIES = \
> +	gobject-introspection \
> +	host-pkgconf \
> +	libglib2 \

[0] here.

Regards,
Yann E. MORIN.

> +	python3
>  
> -ifeq ($(BR2_PACKAGE_PYTHON),y)
> -PYTHON_GOBJECT_DEPENDENCIES += python host-python
> +PYTHON_GOBJECT_CONF_OPTS += \
> +	-Dpycairo=false \
> +	-Dtests=false
>  
> -PYTHON_GOBJECT_CONF_ENV = \
> -	PYTHON=$(HOST_DIR)/bin/python2 \
> -	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`"
> -else
> -PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
> +# A sysconfigdata_name must be manually specified or the resulting .so
> +# will have a x86_64 prefix, which causes "import gi" to fail.
> +# A pythonpath must be specified or the host python path will be used resulting
> +# in a "not a valid python" error.
> +PYTHON_GOBJECT_CONF_ENV += \
> +	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
> +	PYTHONPATH=$(PYTHON3_PATH)
>  
> -PYTHON_GOBJECT_CONF_ENV = \
> -	PYTHON=$(HOST_DIR)/bin/python3 \
> -	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`"
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBFFI),y)
> -PYTHON_GOBJECT_CONF_OPTS += --with-ffi
> -PYTHON_GOBJECT_DEPENDENCIES += libffi
> -else
> -PYTHON_GOBJECT_CONF_OPTS += --without-ffi
> -endif
> -
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.24.1
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
