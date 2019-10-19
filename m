From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 01:55:07 +0200
Subject: [Buildroot] [RFC PATCH v2 14/30] package/libcef: New package
In-Reply-To: <20191017152929.49153-15-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-15-michael.drake@codethink.co.uk>
Message-ID: <5b9ab816-4082-7a14-71d6-9408bdcfe441@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/10/2019 17:29, Michael Drake wrote:
> Coauthored-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Jon duSaint <jdusaint@tesla.com>
> Cc: Enis Lavery <elavery@tesla.com>
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  package/Config.in                             |    1 +
>  .../0001-fix-one-euro-filter-build.patch      |   33 +
>  .../0002-link-against-harfbuzz-subset.patch   |   50 +
>  package/libcef/Config.in                      |   75 ++
>  package/libcef/libcef.license-files.inc       | 1130 +++++++++++++++++
>  package/libcef/libcef.mk                      |  372 ++++++
>  .../libcef/scripts/gather-license-files.sh    |   53 +
>  package/libcef/scripts/version.sh             |   48 +
>  package/libcef/templates/cef_version.h        |   70 +
>  package/libcef/toolchain/BUILD.gn             |   70 +

 I think a patch with this kind of diffstat deserves a commit message with some
text...


[snip]
> +config BR2_PACKAGE_LIBCEF
> +	bool "libcef"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # gn requires -std=c++14
> +	depends on BR2_INSTALL_LIBSTDCPP # icu
> +	depends on BR2_USE_WCHAR # icu
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7

 Please put package dependencies after the toolchain dependencies.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
> +	depends on !BR2_BINFMT_FLAT # icu

 I'm a bit surprised that with such a long list of selects, icu is the only one
with any dependencies...

> +	select BR2_PACKAGE_AT_SPI2_ATK
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_COMPILER_RT
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FLAC
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_HARFBUZZ
> +	select BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
> +	select BR2_PACKAGE_HOST_CLANG
> +	select BR2_PACKAGE_HOST_JPEG_TURBO
> +	select BR2_PACKAGE_HOST_ICU
> +	select BR2_PACKAGE_HOST_LLD
> +	select BR2_PACKAGE_HOST_LLVM
> +	select BR2_PACKAGE_HOST_NINJA
> +	select BR2_PACKAGE_HOST_LIBKRB5
> +	select BR2_PACKAGE_HOST_LIBNSS
> +	select BR2_PACKAGE_HOST_NODEJS
> +	select BR2_PACKAGE_HOST_PKGCONF
> +	select BR2_PACKAGE_HOST_PYTHON
> +	select BR2_PACKAGE_HOST_WEBP

 It is normally not needed to select host packages. Some of these symbols don't
even exist, e.g. ninja.

> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_JPEG_TURBO
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBERATION # runtime
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_LIBGTKGLEXT
> +	select BR2_PACKAGE_LIBKRB5
> +	select BR2_PACKAGE_LIBNSS
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_PCIUTILS
> +	select BR2_PACKAGE_PANGO
> +	select BR2_PACKAGE_WEBP
> +	select BR2_PACKAGE_WEBP_MUX
> +	select BR2_PACKAGE_WEBP_DEMUX
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
> +	select BR2_PACKAGE_XLIB_LIBXCURSOR
> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
> +	select BR2_PACKAGE_XLIB_LIBXV
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Chromium Embedded Framework

 A bit more help text could be useful. Just take a sentence from the website.

 Also, a link to the website is mandatory.


> +
> +if BR2_PACKAGE_LIBCEF
> +
> +config BR2_PACKAGE_LIBCEF_TARGET_ARCH
> +	string
> +	default "arm" if BR2_arm
> +	default "arm64" if BR2_aarch64
> +	default "mips" if BR2_mips
> +	default "x86" if BR2_i386
> +	default "x64" if BR2_x86_64

 This implies that you'll need BR2_PACKAGE_LIBCEF_ARCH_DEPENDS.

 You can move this symbol out of the condition to the beginning of the file, and
then just do:

config BR2_PACKAGE_LIBCEF_ARCH_DEPENDS
	bool
	default y
	depends on BR2_PACKAGE_LIBCEF_TARGET_ARCH != ""

> +
> +comment "CEF needs toolchain w/ Glibc"

 Same name as the package, so libcef, and lowercase glibc.

> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

 If you put this inside the condition, it will never be visible.

 Also, you're missing all the other dependencies.

 Don't forget that the comment should depend on the negated toolchain
dependencies (libc, wchar, gcc version, ..) but should also depend on the arch
dependencies (binfmt_flat).

> +
> +comment "CEF depends on X.org and needs an OpenGL backend"
> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL

 Here also the arch dependencies should be repeated.

> +
> +endif
> diff --git a/package/libcef/libcef.license-files.inc b/package/libcef/libcef.license-files.inc
> new file mode 100644
> index 0000000000..03fd700f24
> --- /dev/null
> +++ b/package/libcef/libcef.license-files.inc
> @@ -0,0 +1,1130 @@
> +LIBCEF_LICENSE_FILES = \
> +	base/third_party/cityhash/COPYING \
> +	base/third_party/dmg_fp/LICENSE \

 Are all of these really used? Well, I guess trying to weed out the really
required ones manually is a bit too much work...

 Could you add a comment in front that it is automatically generated?

[snip]
> diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
> new file mode 100644
> index 0000000000..fe69cabb2c
> --- /dev/null
> +++ b/package/libcef/libcef.mk
> @@ -0,0 +1,372 @@
> +################################################################################
> +#
> +# libcef
> +#
> +################################################################################
> +
> +# Run $(LIBCEF_PKGDIR)/scripts/version.sh to generate these values.
> +# Don't bother trying to update these by hand, LIBCEF_CEF_VERSION is too
> +# dependant on git to assemble ourselves.
> +LIBCEF_VERSION = f3890bec3b21b01c2b5b026c50f96a9f2f070e7c
> +LIBCEF_CEF_COMMIT_NUMBER = 2044
> +LIBCEF_CEF_VERSION = 77.1.4+gf3890be+chromium-77.0.3865.90
> +LIBCEF_CEF_VERSION_MAJOR = 3
> +LIBCEF_CEF_VERSION_MINOR = 1
> +LIBCEF_CEF_VERSION_PATCH = 4
> +LIBCEF_CHROMIUM_VERSION_MAJOR = 77
> +LIBCEF_CHROMIUM_VERSION_MINOR = 0
> +LIBCEF_CHROMIUM_VERSION_BUILD = 3865
> +LIBCEF_CHROMIUM_VERSION_PATCH = 90
> +# End version.sh generated values
> +
> +LIBCEF_SITE = https://bitbucket.org/chromiumembedded/cef.git
> +LIBCEF_SITE_METHOD = git

 Bitbucket has an auto-archive feature just like github, so we could use that:

https://bitbucket.org/chromiumembedded/cef/get/f3890bec3b21b01c2b5b026c50f96a9f2f070e7c.tar.bz2

 I don't know how stable the tarballs are though, so maybe git is better after all.

 Something to mention in the commit message :-)

> +LIBCEF_STRIP_COMPONENTS = 0
> +
> +LIBCEF_INSTALL_STAGING = YES
> +LIBCEF_INSTALL_STAGING_INCLUDE_PATH=$(STAGING_DIR)/usr/include/cef
> +LIBCEF_INSTALL_STAGING_LIBRARY_PATH=$(STAGING_DIR)/usr/lib/cef

 In general, I'm no fan of defining variables for things where there is little
variance, like for these values.

 More importantly, though: define the variables closer to where they're used.
And definitely after all the generic stuff.

> +
> +LIBCEF_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception

 I haven't checked, but I'd be surprised if a packages with such a *load of
bundled dependencies only has those four licenses...

> +include package/libcef/libcef.license-files.inc
> +
> +# The Chromium source is fetched from a release tarball.
> +LIBCEF_CHROMIUM_VERSION = $(LIBCEF_CHROMIUM_VERSION_MAJOR).$(LIBCEF_CHROMIUM_VERSION_MINOR).$(LIBCEF_CHROMIUM_VERSION_BUILD).$(LIBCEF_CHROMIUM_VERSION_PATCH)

 The commit message should *definitely* explain that chromium itself is bundled,
and why.

> +LIBCEF_EXTRA_DOWNLOADS = https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$(LIBCEF_CHROMIUM_VERSION).tar.xz
> +
> +LIBCEF_DEPENDENCIES = \
> +	alsa-lib \
> +	at-spi2-atk \
> +	at-spi2-core \
> +	atk \
> +	cairo \
> +	compiler-rt \
> +	dbus \
> +	ffmpeg \
> +	flac \
> +	fontconfig \
> +	freetype \
> +	harfbuzz \
> +	host-clang \
> +	host-jpeg-turbo \
> +	host-libkrb5 \
> +	host-libnss \
> +	host-libxml2 \
> +	host-ninja \
> +	host-nodejs \
> +	host-pkgconf \
> +	host-python \
> +	host-webp \
> +	jpeg-turbo \
> +	libdrm \
> +	libglib2 \
> +	libgtk3 \
> +	libgtkglext \
> +	libkrb5 \
> +	libnss \
> +	libxml2 \
> +	libxslt \
> +	pango \
> +	webp \
> +	xlib_libXcomposite \
> +	xlib_libXcursor \
> +	xlib_libXrandr \
> +	xlib_libXScrnSaver
> +
> +LIBCEF_HOST_PKG_CONFIG_WRAPPER = $(@D)/br-host-pkg-config.sh
> +
> +LIBCEF_GN_DEFINES = \
> +	audio_processing_in_audio_service_supported=false \
> +	clang_use_chrome_plugins=false \
> +	closure_compile=false \
> +	custom_toolchain=\"//build/toolchain/linux/unbundle:default\" \
> +	enable_basic_print_dialog=false \
> +	enable_nacl=false \
> +	enable_service_discovery=false \
> +	enable_vr=false \
> +	forbid_non_component_debug_builds=false \
> +	host_pkg_config=\"$(LIBCEF_HOST_PKG_CONFIG_WRAPPER)\" \
> +	host_toolchain=\"//build/toolchain/linux/unbundle:host\" \
> +	is_cfi=false \
> +	is_unsafe_developer_build=false \
> +	link_pulseaudio=false \
> +	linux_use_bundled_binutils=false \
> +	target_cpu=\"$(BR2_PACKAGE_LIBCEF_TARGET_ARCH)\" \
> +	treat_warnings_as_errors=false \
> +	use_bundled_fontconfig=false \
> +	use_gnome_keyring=false \
> +	use_gtk=false \
> +	use_jumbo_build=true \
> +	use_sysroot=false \

 That's a bit surprising... We do use a sysroot.

> +	use_system_freetype=true \
> +	use_system_harfbuzz=true \
> +	use_system_libjpeg=true \
> +	use_viz_devtools=false
> +
> +# Use Buildroot system libraries instead of Chromium third_party libraries
> +LIBCEF_SYSTEM_LIBS = \
> +	ffmpeg \
> +	flac \
> +	fontconfig \
> +	freetype \
> +	harfbuzz-ng \
> +	libjpeg \
> +	libvpx \
> +	libwebp \
> +	libxml \
> +	libxslt \
> +	openh264 \
> +	yasm
> +
> +LIBCEF_BUILD_TARGETS = cef chrome_sandbox
> +
> +# Use the HOSTLD rather than target linker, which warns about host include dirs
> +LIBCEF_HOST_LDFLAGS = $(HOST_LDFLAGS) -fuse-ld=$(HOSTLD)
> +
> +# Use the target sysroot when building for the target
> +LIBCEF_TARGET_CFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)

 The need for this --sysroot is surprising, since the toolchain wrapper already
forces --sysroot.

 Oooh, I see, it's using clang... Could you take a look at [1] and check if that
maybe simplifies things?

 (Again, a commit message would help to avoid that I have to find out these
things for myself.)

> +LIBCEF_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) --sysroot=$(STAGING_DIR)
> +LIBCEF_TARGET_LDFLAGS = $(TARGET_LDFLAGS) --sysroot=$(STAGING_DIR)
> +
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +# Tell clang where the external toolchain is and to use it
> +LIBCEF_TARGET_CFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR) \

 Can you explain why this --gcc-toolchain is needed? It can find it in $PATH, no?

> +		       --target=$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX)

 This is only valid for custom external toolchains. You want
TOOLCHAIN_EXTERNAL_PREFIX.

> +LIBCEF_TARGET_CXXFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR) \
> +		       --target=$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX)
> +LIBCEF_TARGET_LDFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR) \
> +		       --target=$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX)
> +else
> +# Tell clang to use the Buildroot toolchain
> +LIBCEF_TARGET_CFLAGS += --target=$(GNU_TARGET_NAME)
> +LIBCEF_TARGET_CXXFLAGS += --target=$(GNU_TARGET_NAME)
> +LIBCEF_TARGET_LDFLAGS += --target=$(GNU_TARGET_NAME)

 So --target needs as argument $(TARGET_CROSS), but without the path and without
the trailing -. Maybe it would be better to define a variable for that in
Makefile.in and use it here?


> +endif
> +
> +ifeq ($(BR2_i386)$(BR2_x86_64),y)
> +LIBCEF_SYSTEM_LIBS += yasm
> +LIBCEF_DEPENDENCIES += host-yasm
> +endif
> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +LIBCEF_BUILD_OUTPUT_DIR = out/Debug
> +LIBCEF_GN_DEFINES += \
> +	is_debug=true \
> +	is_official_build=false
> +else
> +LIBCEF_BUILD_OUTPUT_DIR = out/Release
> +LIBCEF_GN_DEFINES += \
> +	is_debug=false \
> +	is_official_build=true

 I don't know if we ever can call it an offical build, but OK.

> +endif
> +
> +# We have two build directories.  One uses the bundled LLVM libcxx, and the
> +# other uses the system C++ standard library.  One is used for libcef.so, and
> +# the other is for libcef_dll_wrapper.a, that dependant projects statically
> +# link against.
> +LIBCEF_BUILD_OUTPUT_DIR_SYSTEM_LIBCXX = $(LIBCEF_BUILD_OUTPUT_DIR)_system_libcxx
> +
> +# tcmalloc has portability issues
> +LIBCEF_GN_DEFINES += use_allocator=\"none\"
> +
> +ifeq ($(BR2_CCACHE),y)
> +LIBCEF_GN_DEFINES += cc_wrapper=\"ccache\"

 I would expect $(CCACHE) here.

> +endif
> +
> +# LLD is unsupported on i386, and fails during linking
> +ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +LIBCEF_GN_DEFINES += use_lld=false
> +# Disable gold as well, to force usage of our toolchain's ld.bfd
> +LIBCEF_GN_DEFINES += use_gold=false
> +else
> +LIBCEF_GN_DEFINES += use_lld=false
> +LIBCEF_GN_DEFINES += use_gold=false

 Both branches have the same content...

> +endif
> +
> +ifeq ($(BR2_PACKAGE_CUPS),y)
> +LIBCEF_DEPENDENCIES += cups
> +LIBCEF_GN_DEFINES += use_cups=true
> +else
> +LIBCEF_GN_DEFINES += use_cups=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PCIUTILS),y)
> +LIBCEF_DEPENDENCIES += pciutils
> +LIBCEF_GN_DEFINES += use_libpci=true
> +else
> +LIBCEF_GN_DEFINES += use_libpci=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +LIBCEF_DEPENDENCIES += pulseaudio
> +LIBCEF_GN_DEFINES += use_pulseaudio=true
> +else
> +LIBCEF_GN_DEFINES += use_pulseaudio=false
> +endif
> +
> +define LIBCEF_EXTRACT_CMDS
> +	# Extract Chromium source code
> +	tar -C $(@D) \
> +		--strip-components=1 \
> +		-xf $(LIBCEF_DL_DIR)/chromium-$(LIBCEF_CHROMIUM_VERSION).tar.xz
> +
> +	# Extract CEF to cef dir inside Chromium source code
> +	mkdir $(@D)/cef
> +	tar -C $(@D)/cef \
> +		--strip-components=1 \
> +		-xf $(LIBCEF_DL_DIR)/libcef-$(LIBCEF_VERSION).tar.gz

 So Buildroot first extracts (with --strip-components=0) in the top directory,
then chromium gets extracted next to it, and then we extract libcef again in a
subdirectory... That sounds a bit like a roundabout approach, no?

 I guess you intended to just do a move here, like

	mv $(@D)/libcef-$(LIBCEF_VERSION) $(@D)/cef

 Or maybe even better, a symlink.

	ln -sf $(@D)/libcef-$(LIBCEF_VERSION) $(@D)/cef

> +
> +	# Patch the Chromium source with the CEF patches
> +	( cd $(@D); \
> +		for cef_patch in cef/patch/patches/*.patch; do \
> +			patch -p0 -u -i "$$cef_patch"; \

 Patching would be better to do in a pre- or post-patch hook.

 Also, you could use APPLY_PATCHES:

	$(APPLY_PATCHES) $(@D) $(@D)/cef/patch/patches *.patch


> +		done; \
> +	)
> +
> +	# Copy the toolchain folder into the build directory
> +	cp -r $(LIBCEF_PKGDIR)/toolchain $(@D)/
> +endef
> +
> +LIBCEF_TARGET_CONFIGURE_ENV = \
> +	$(TARGET_MAKE_ENV) \
> +	BUILD_CC="clang" \
> +	BUILD_CXX="clang++" \
> +	BUILD_AR="$(HOSTAR)" \
> +	BUILD_NM="$(HOSTNM)" \
> +	BUILD_CFLAGS="$(HOST_CFLAGS)" \
> +	BUILD_CXXFLAGS="$(HOST_CXXFLAGS)" \
> +	BUILD_LDFLAGS="$(LIBCEF_HOST_LDFLAGS)" \
> +	CC="clang" \
> +	CXX="clang++" \
> +	AR="ar" \
> +	NM="nm" \
> +	CFLAGS="$(LIBCEF_TARGET_CFLAGS)" \
> +	CXXFLAGS="$(LIBCEF_TARGET_CXXFLAGS)" \
> +	LDFLAGS="$(LIBCEF_TARGET_LDFLAGS)"
> +
> +define LIBCEF_CONFIGURE_CMDS
> +	# Make the host pkg-config wrapper
> +	echo "#!/bin/bash" > $(LIBCEF_HOST_PKG_CONFIG_WRAPPER)
> +	echo $(HOST_MAKE_ENV) $(HOST_DIR)/bin/pkg-config '"$${@}"' >> \
> +		$(LIBCEF_HOST_PKG_CONFIG_WRAPPER)
> +	chmod +x $(LIBCEF_HOST_PKG_CONFIG_WRAPPER)

 I think this host pkg-config wrapper could be useful in other places as well,
so I'd move it to the pkgconf package and to $(HOST_DIR)/bin. Yes, we can
bikeshed on its name, but for now it can be called anything.

> +
> +	# Create include/cef_version.h
> +	sed -e "s/{{ cef_version }}/$(LIBCEF_CEF_VERSION)/; \
> +		s/{{ cef_version_major }}/$(LIBCEF_CEF_VERSION_MAJOR)/; \
> +		s/{{ cef_version_minor }}/$(LIBCEF_CEF_VERSION_MINOR)/; \
> +		s/{{ cef_version_patch }}/$(LIBCEF_CEF_VERSION_PATCH)/; \
> +		s/{{ cef_commit_number }}/$(LIBCEF_CEF_COMMIT_NUMBER)/; \
> +		s/{{ cef_commit_hash }}/$(LIBCEF_VERSION)/; \
> +		s/{{ year }}/$$(date +%Y)/; \
> +		s/{{ chrome_version_major }}/$(LIBCEF_CHROMIUM_VERSION_MAJOR)/; \
> +		s/{{ chrome_version_minor }}/$(LIBCEF_CHROMIUM_VERSION_MINOR)/; \
> +		s/{{ chrome_version_build }}/$(LIBCEF_CHROMIUM_VERSION_BUILD)/; \
> +		s/{{ chrome_version_patch }}/$(LIBCEF_CHROMIUM_VERSION_PATCH)/;" \
> +		$(LIBCEF_PKGDIR)/templates/cef_version.h > \
> +			$(@D)/cef/include/cef_version.h
> +
> +	# Update the CEF API in case someone has patched it
> +	( cd $(@D)/cef/tools; $(TARGET_MAKE_ENV) ./translator.sh )
> +
> +	# Shim headers allow us to link to unbundled system libraries.  Normally
> +	# this isn't allowed in "official"/release builds.
> +	# Disable the build time error for official builds with system libs.
> +	( cd $(@D); \
> +		sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
> +			tools/generate_shim_headers/generate_shim_headers.py \
> +	)
> +
> +	mkdir -p $(@D)/third_party/node/linux/node-linux-x64/bin
> +	ln -sf $(HOST_DIR)/bin/node $(@D)/third_party/node/linux/node-linux-x64/bin/
> +
> +	# Use python2 by default
> +	mkdir -p $(@D)/bin
> +	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python

 Why is this needed? If host-python is built, $(HOST_DIR)/bin/python will point
to it (even if host-python3 is built as well).

 BTW, $(HOST_DIR)/usr no longer exists (since a bit more than a year...)


[snip]


 This is as far as I got with my preliminary review. I can tell you, it's not
going to be trivial to merge this...

 Regards,
 Arnout



[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=129565
