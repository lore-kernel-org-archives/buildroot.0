From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 19:22:43 +0100
Subject: [Buildroot] [PATCH v9 3/4] gobject-introspection: new package
In-Reply-To: <20181215233555.98482-3-aduskett@gmail.com>
References: <20181215233555.98482-1-aduskett@gmail.com>
 <20181215233555.98482-3-aduskett@gmail.com>
Message-ID: <20190205192243.720c9707@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are a number of other comments, in addition to the live
discussion we had.

On Sat, 15 Dec 2018 18:35:54 -0500
aduskett at gmail.com wrote:

> diff --git a/Makefile b/Makefile
> index c5b78b3274..7068bdb0ca 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -719,6 +719,8 @@ target-finalize: $(PACKAGES) host-finalize
>  		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
>  		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
>  	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
> +	find $(TARGET_DIR)/usr/share/ -name '*.gir' -print0 | xargs -0 rm -f
> +	find $(TARGET_DIR)/usr/share/ -name '*.rnc' -print0 | xargs -0 rm -f

Probably this should be moved to gobject-introspection.mk into a
GOBJECT_INTROSPECTION_TARGET_FINALIZE_HOOKS.


> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> new file mode 100644
> index 0000000000..1da3cfa000
> --- /dev/null
> +++ b/package/gobject-introspection/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> +	bool "gobject-introspection"
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi, libglib2
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_MMU # python3, libglib2
> +	depends on BR2_USE_WCHAR # python3, libglib2 -> gettext
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_MIPS_NABI32

A comment above this one to explain why ?

> +	select BR2_PACKAGE_LIBFFI
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_HOST_PRELINK_CROSS
> +	select BR2_PACKAGE_HOST_QEMU
> +	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> +	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> +	help
> +	  GObject introspection is a middleware layer between C
> +	  libraries (using GObject) and language bindings. The C library
> +	  can be scanned at compile time and generate a metadata file,
> +	  in addition to the actual native C library. Then at runtime,
> +	  language bindings can read this metadata and automatically
> +	  provide bindings to call into the C library.
> +
> +	  https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
> +
> +comment "gobject-introspection needs a glibc toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS_TARGET

This option does not exist anywhere. It should be
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS + !BR2_MIPS_NABI32

> diff --git a/package/gobject-introspection/g-ir-compiler.in b/package/gobject-introspection/g-ir-compiler.in
> new file mode 100644
> index 0000000000..b2f97ea870
> --- /dev/null
> +++ b/package/gobject-introspection/g-ir-compiler.in
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +$STAGING_DIR/usr/bin/g-ir-scanner-qemuwrapper $STAGING_DIR/usr/bin/g-ir-compiler.real "$@"

Instead of $STAGING_DIR/usr/bin, please use $(dirname $0)

> diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> new file mode 100644
> index 0000000000..12b064e4ad
> --- /dev/null
> +++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +${HOST_DIR}/sbin/prelink-rtld --root=${STAGING_DIR} "$@"

We also want to use paths based on $(dirname $0) so that those tools
work even when HOST_DIR and STAGING_DIR are not defined.

> diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> new file mode 100644
> index 0000000000..e793ce193f
> --- /dev/null
> +++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +# Use a modules directory which does not exist so we don't load random things
> +# which may then get deleted (or their dependencies) and potentially segfault
> +export GIO_MODULE_DIR=$STAGING_DIR/usr/lib/gio/modules-dummy

Does this needs to be exported, instead of being passed on the command
line below ?

> +PSEUDO_UNLOAD=1 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ -L $STAGING_DIR -E LD_LIBRARY_PATH=$GIR_EXTRA_LIBS_PATH:.libs:$STAGING_DIR/usr/lib:$STAGING_DIR/lib "$@"

Is the PSEUDO_UNLOAD=1 variable really needed ? It seems to be related
to the "pseudo" tool that OpenEmbedded is using, so we probably don't
care.

Maybe this line could be written as:

GIO_MODULE_DIR=... \
	-r ... \
	-L ... \
	-E ... \
	"$@"

Also, like the ther scripts above, I think we prefer to avoid using
$STAGING_DIR.

> diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
> new file mode 100644
> index 0000000000..71b1871cfd
> --- /dev/null
> +++ b/package/gobject-introspection/g-ir-scanner.in
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +export GI_SCANNER_DISABLE_CACHE=1
> +$HOST_DIR/bin/g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=$STAGING_DIR/usr/bin/g-ir-scanner-qemuwrapper --use-ldd-wrapper=$STAGING_DIR/usr/bin/g-ir-scanner-lddwrapper --add-include-path=$STAGING_DIR/usr/share/gir-1.0 "$@"

Same comments here.

> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> new file mode 100644
> index 0000000000..d36db1d66f
> --- /dev/null
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -0,0 +1,101 @@
> +################################################################################
> +#
> +# gobject-introspection
> +#
> +################################################################################
> +
> +GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.56
> +GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
> +GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
> +GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
> +GOBJECT_INTROSPECTION_DEPENDENCIES = libffi zlib libglib2 host-qemu host-gobject-introspection host-prelink-cross
> +GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
> +GOBJECT_INTROSPECTION_AUTORECONF = YES
> +GOBJECT_INTROSPECTION_LICENSE = Dual LGPLv2+/GPLv2+

LGPL-2.0+ or GPL-2.0+

(but I haven't checked the actual licensing)

> +GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL
> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = host-libglib2 host-flex host-bison
> +
> +GOBJECT_INTROSPECTION_CONF_OPTS = \
> +	--enable-host-gi \
> +	--disable-static \

As we discussed, this option should go away.

> +	--enable-gi-cross-wrapper=$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper \
> +	--enable-gi-ldd-wrapper=$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper \
> +	--enable-introspection-data
> +
> +ifeq ($(BR2_PACKAGE_CAIRO),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += cairo

Please add the appropriate with/without options.

> +endif
> +ifeq ($(BR2_PACKAGE_LIBFFI),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += libffi
> +endif

This is not needed, libffi is a mandatory dependency.

> +
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += python
> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES += host-python
> +GOBJECT_INTROSPECTION_PYTHON_PATH="$(STAGING_DIR)/usr/bin/python2"

Spaces around =, no need for double quotes. Please name
this ...PYTHON_CONFIG, and make it point to python config. Calling this
PYTHON_PATH is confusing, because PYTHON_PATH is generally "where
Python modules are installed".

> +else
> +GOBJECT_INTROSPECTION_DEPENDENCIES += python3
> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES += host-python3
> +GOBJECT_INTROSPECTION_PYTHON_PATH="$(STAGING_DIR)/usr/bin/python3"

Ditto.

> +endif
> +
> +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> +HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
> +	GI_SCANNER_DISABLE_CACHE=1 \
> +	HOST_GOBJECT_INTROSPECTION_GIR_EXTRA_LIBS_PATH=$(@D)/.libs

Why HOST_GOBJECT_INTROSPECTION_CONF_ENV contains a variable that itself
is prefixed with HOST_GOBJECT_INTROSPECTION ? this looks weird.

> +
> +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> +GOBJECT_INTROSPECTION_CONF_ENV = \
> +	GI_SCANNER_DISABLE_CACHE=1 \
> +	GOBJECT_INTROSPECTION_GIR_EXTRA_LIBS_PATH=$(@D)/.libs \

Same question.

> +	PYTHON_INCLUDES="`$(GOBJECT_INTROSPECTION_PYTHON_PATH)-config --includes`"

Use PYTHON_CONFIG as we discussed live.

> +
> +# Make sure g-ir-tool-template uses the host python.
> +define GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> +	sed -i -e '1s,#!.*,#!$(HOST_DIR)/bin/python,' $(@D)/tools/g-ir-tool-template.in

I'm not sure why you need this. g-ir-tool-template.in contains:

#!/usr/bin/env @PYTHON@

Where @PYTHON@ is I guess replaced by the autoconf machinery with the
detected Python, which should be $(HOST_DIR)/bin/python.

> +endef
> +GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS = GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> +HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS = GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH

Use += when registering hooks.

> +
> +GOBJECT_INTROSPECTION_WRAPPERS = \
> +	g-ir-compiler \
> +	g-ir-scanner

This list is only used once, I'm not sure it's really useful to have it
as a separate variable.

> +
> +# These wrappers allow gobject-introspection to build the internal introspection
> +# libraries during the build process.
> +define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
> +	$(INSTALL) -D -m 755 package/gobject-introspection/g-ir-scanner-lddwrapper.in $(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
> +	$(INSTALL) -D -m 755 package/gobject-introspection/g-ir-scanner-qemuwrapper.in $(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> +	$(SED) "s|@QEMU_USER@|$(QEMU_USER)|g" $(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> +	$(SED) "s|@TOOLCHAIN_HEADERS_VERSION@|$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)|g" $(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper

Could you split those long lines ?

I'm wondering if preparing those wrappers belong to the target variant
or not, but the boundary between what the host variant and what the
target variant does is still a bit fuzzy to me. Let's keep herere for
now.

> +	# Use a modules directory which does not exist so we don't load random things
> +	# which may then get deleted (or their dependencies) and potentially segfault
> +	mkdir -p $(STAGING_DIR)/usr/lib/gio/modules-dummy
> +endef
> +GOBJECT_INTROSPECTION_POST_PATCH_HOOKS = GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS

+=

> +# In order for gobject-introspection to work, qemu needs to run temporarily
> +# to create binaries on the fly by g-ir-scanner. This involves creating
> +# several wrapper scripts to accomplish the task:
> +# g-ir-scanner-qemuwrapper, g-ir-compiler-wrapper,
> +# g-ir-scanner-lddwrapper, g-ir-scanner-wrapper, g-ir-compiler-wrapper.

Well, the below only does something with g-ir-compiler and g-ir-scanner.

> +define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> +	# Move the real binaries to their names.real, then replace them with
> +	# the wrappers.
> +	$(foreach w,$(GOBJECT_INTROSPECTION_WRAPPERS),
> +		mv $(STAGING_DIR)/usr/bin/$(w) $(STAGING_DIR)/usr/bin/$(w).real
> +		$(INSTALL) -D -m 755 \
> +		package/gobject-introspection/$(w).in $(STAGING_DIR)/usr/bin/$(w)

Indent this second line.

> +	)
> +	$(SED) "s at g_ir_scanner=.*@g_ir_scanner=/usr/bin/g-ir-scanner at g" \
> +	$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc

Ditto.

> +
> +	# The pkgconfig file needs to point towards the wrappers instead of the native
> +	# binaries.
> +	$(SED) "s at g_ir_compiler=.*@g_ir_compiler=/usr/bin/g-ir-compiler at g" \
> +	$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc

Ditto.

Maybe you can standardize a bit on the SED separator, you're using
comma, @ and | within this package.

> +endef
> +GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS = GOBJECT_INTROSPECTION_INSTALL_WRAPPERS

+=

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 45de99356f..06021f95c1 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -162,6 +162,7 @@ endif
>  
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPTS			?=
> +$(2)_GIR_EXTRA_LIBS_PATH	?=

Why ?

>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_OPTS                ?= install
> @@ -239,6 +240,8 @@ endef
>  endif
>  endif
>  
> +export GIR_EXTRA_LIBS_PATH=$$($$(PKG)_GIR_EXTRA_LIBS_PATH)

This is horrible and just doesn't work. You're going to export
GIR_EXTRA_LIBS_PATH with the value of whatever is the last parsed
package. I don't see how this can work, and it's anyway not the
Buildroot way of doing things.

Could you explain what you are trying to achieve ? Infrastructure
changes also probably need to be split into a separate patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
