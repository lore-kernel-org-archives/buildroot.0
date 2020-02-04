From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Feb 2020 11:53:54 +0100
Subject: [Buildroot] [PATCH v14 5/5] package/gobject-introspection: new
 package
In-Reply-To: <20191021200438.97453-6-aduskett@gmail.com>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-6-aduskett@gmail.com>
Message-ID: <72517f25-5427-0dbf-3ca9-1ca4b539a6a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Just a few minor comments :-)


On 21/10/2019 22:04, aduskett at gmail.com wrote:
[snip]
> There are seven total patches and four different wrapper files needed
> to successfully cross-compile and run this package, many of them are
> from open-embedded, but two of them are of my own doing.
> 
> 1) Revert a previous, incomplete attempt at adding cross-compiling support.
> 
> 2) Add support for cross compiling with meson.
> 
> 3) Disable tests when cross-compiling.
> 
> 4) Add support for the various wrappers. (See patch for details.)
> 
> 5) Add an option to use a binary wrapper; this patch will force
>    giscanner to use a wrapper executable to run binaries it's producing,
>    instead of attempting to run them from the host.
> 
> 6) Add an option to use an LDD wrapper, again, useful for cross-compiled
>    environments.
> 
> 7) Add a --lib-dirs-envar option to pass to giscanner. (See patch for details.)
> 
> 8) Add rpath-links to ccompiler: when passing the PACKAGE_GIR_EXTRA_LIBS_PATH
>    to the ccompiler.py script, ccompiler.py needs to add -Wl,-rpath-link to the
>    environment for the package to correctly link against the passed on paths.
> 
> 9) Ignore error return codes from ldd-wrapper because prelink-rtld returns 127
>    when it can't find a library, which will break subprocess.check_output().

 I count just 8 patches, and only one of them is by you.

[snip]
> +++ b/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
> @@ -0,0 +1,29 @@
> +From 72a427bc50daee8f1ded0e9221e53dbbf2a80f08 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Wed, 14 Mar 2018 12:07:10 -0400
> +Subject: [PATCH] Add rpath links to ccompiler
> +
> +This patch allows gobject-introspection to process extra paths passed to the
> +compiler via the GIR_EXTRA_LIBS_PATH variable.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

 Did you send this patch upstream? Looks perfectly upstreamable to me.

> +---
> + giscanner/ccompiler.py | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
> +index a8bd5b1..51bb9bc 100644
> +--- a/giscanner/ccompiler.py
> ++++ b/giscanner/ccompiler.py
> +@@ -229,6 +229,8 @@ class CCompiler(object):
> + 
> +         for envvar in runtime_path_envvar:
> +             if envvar in os.environ:
> ++                for envvar_path in os.environ[envvar].split(':'):
> ++                    args.append("-Wl,-rpath-link," + envvar_path)
> +                 os.environ[envvar] = \
> +                     os.pathsep.join(runtime_paths + [os.environ[envvar]])
> +             else:[snip]
> +GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.62
> +GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
> +GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
> +GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
> +GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
> +GOBJECT_INTROSPECTION_AUTORECONF = YES
> +GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+ or GPL-2.0+

 It's AND, not OR, so 'GPL-2.0+, LGPL-2.0+' (I prefer to put GPL first because
it's stronger).

 Also some files are BSD-2-Clause.

> +GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL

 Unfortunately no license file for the BSD, so the best we can do is
giscanner/scannerlexer.l

> +
> +GOBJECT_INTROSPECTION_DEPENDENCIES = \
> +	host-autoconf-archive \
> +	host-gobject-introspection \
> +	host-prelink-cross \
> +	python3 \
> +	host-qemu \
> +	libffi \
> +	libglib2 \
> +	zlib

 Nitpick: I like dependences to be sorted.


> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
> +	host-bison \
> +	host-flex \
> +	host-libglib2 \
> +	host-python3
> +
> +# g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
> +GOBJECT_INTROSPECTION_NINJA_ENV += \
> +	CC="$(TARGET_CC)"
> +
> +# Use the host gi-scanner to prevent the scanner from generating incorrect
> +# elf classes.
> +GOBJECT_INTROSPECTION_CONF_OPTS = \
> +	-Denable-host-gi=true \
> +	-Denable-gi-cross-wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper" \
> +	-Denable-gi-ldd-wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
> +	-Denable-introspection-data=true
> +
> +ifeq ($(BR2_PACKAGE_CAIRO),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
> +GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=true
> +endif
> +
> +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> +HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
> +	GI_SCANNER_DISABLE_CACHE=1
> +
> +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> +GOBJECT_INTROSPECTION_CONF_ENV = \
> +	GI_SCANNER_DISABLE_CACHE=1

 Nitpick: we usually put the target first, then the host (which is not entirely
logical, because you first build the host and then the target; but ok). Also, no
need to repeat the comment.

# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
GOBJECT_INTROSPECTION_CONF_ENV = \
	GI_SCANNER_DISABLE_CACHE=1
HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
	GI_SCANNER_DISABLE_CACHE=1

> +# Make sure g-ir-tool-template uses the host python.
> +define GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> +	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python%' $(@D)/tools/g-ir-tool-template.in
> +endef
> +GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> +HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> +
> +# These wrappers allow gobject-introspection to build the internal introspection
> +# libraries during the build process.
> +define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
> +	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
> +	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-qemuwrapper.in \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> +	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> +	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> +	# Use a modules directory which does not exist so we don't load random things
> +	# which may then get deleted (or their dependencies) and potentially segfault
> +	mkdir -p $(STAGING_DIR)/usr/lib/gio/modules-dummy
> +endef
> +GOBJECT_INTROSPECTION_POST_PATCH_HOOKS += GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS

 Don't mess with staging in a post-patch hook. Ideally it should be done in a
install hook, but that's difficult in this case. But still, move it to a
pre-configure or pre-build hook.

 Or maybe better: install them in HOST_DIR/bin during the install of
host-gobject-introspection. It means we can't use the relative paths to
STAGING_DIR in those scripts any more, but we can just use the STAGING_DIR
environment variable (which gets exported anyway, just like HOST_DIR). Or better
yet, use the relative path $(dirname $0)/../@GNU_TARGET_NAME@/sysroot so it is
fully relocatable.

> +
> +# Move the real compiler and scanner to .real, and replace them with the wrappers.

 Can you add why the wrapper is needed?

> +define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> +	# Move the real binaries to their names.real, then replace them with
> +	# the wrappers.

 No need to repeat that comment :-)

> +	$(foreach w,g-ir-compiler g-ir-scanner,
> +		mv $(STAGING_DIR)/usr/bin/$(w) $(STAGING_DIR)/usr/bin/$(w).real
> +		$(INSTALL) -D -m 755 \
> +			$(GOBJECT_INTROSPECTION_PKGDIR)/$(w).in $(STAGING_DIR)/usr/bin/$(w)
> +	)

 I think it's better to put these in HOST_DIR as well. It's better for packages
that use g-ir-scanner/compiler, because they can find it in $PATH (with the
usual problem that there's no distinction between native and cross compilation,
but we don't really expect to need any native goi stuff, right?).

> +	$(SED) "s%toolsdir=.*%toolsdir=$(STAGING_DIR)/usr/bin%g" \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
> +endef
> +GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> +
> +# Only .typelib files are needed to run.

 Good call!

> +define GOBJECT_INTROSPECTION_REMOVE_DEVELOPMENT_FILES
> +	find $(TARGET_DIR)/usr/share/ -name '*.gir' -print0 | xargs -0 rm -f
> +	find $(TARGET_DIR)/usr/share/ -name '*.rnc' -print0 | xargs -0 rm -f

 I believe you can do

	find $(TARGET_DIR)/usr/share \( -name '*.gir' -o '*.rnc' \) -delete

 Regards,
 Arnout

> +endef
> +GOBJECT_INTROSPECTION_TARGET_FINALIZE_HOOKS += GOBJECT_INTROSPECTION_REMOVE_DEVELOPMENT_FILES
> +
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))
> 
