From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 15 Sep 2020 12:24:57 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/pkg-meson: move
 crosscompilation support out of package
In-Reply-To: <20200915100546.806157-3-nolange79@gmail.com>
References: <20200915100546.806157-1-nolange79@gmail.com>
 <20200915100546.806157-3-nolange79@gmail.com>
Message-ID: <CADYdroN=17dVhBHUwys1o6SVoMdoxEDvxYiLvbpVufTCYSz2UQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

should prolly change back the last line to
TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF

it was changed in 48d2606e28c41e22971e2b6ee163a6cedf041813,
but I believe with this patchset the point is no longer valid,
we are using TARGET_CXX which should point to the right spot, and
source template
'support/misc/cross-compilation.conf.in' is now always used.

Am Di., 15. Sept. 2020 um 12:05 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> install the cross-compilation.conf file when setting up the
> toolchain, not as part of host-meson.
> This allows external usage of the buildroot toolchain through meson,
> whether the host-meson package is built or not (similar to other build systems).
>
> Removed a few variables, as they were only used to communicate between
> meson package and pkg-meson and are needed anymore.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/meson/meson.mk                        | 32 -------
>  package/pkg-meson.mk                          | 90 ++++++++++++-------
>  .../misc}/cross-compilation.conf.in           |  0
>  3 files changed, 60 insertions(+), 62 deletions(-)
>  rename {package/meson => support/misc}/cross-compilation.conf.in (100%)
>
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 8633a2f717..acbd21b6f1 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -13,38 +13,6 @@ MESON_SETUP_TYPE = setuptools
>  HOST_MESON_DEPENDENCIES = host-ninja
>  HOST_MESON_NEEDS_HOST_PYTHON = python3
>
> -HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
> -HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
> -
> -# https://mesonbuild.com/Reference-tables.html#cpu-families
> -ifeq ($(BR2_arcle)$(BR2_arceb),y)
> -HOST_MESON_TARGET_CPU_FAMILY = arc
> -else ifeq ($(BR2_arm)$(BR2_armeb),y)
> -HOST_MESON_TARGET_CPU_FAMILY = arm
> -else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> -HOST_MESON_TARGET_CPU_FAMILY = aarch64
> -else ifeq ($(BR2_i386),y)
> -HOST_MESON_TARGET_CPU_FAMILY = x86
> -else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> -HOST_MESON_TARGET_CPU_FAMILY = mips
> -else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> -HOST_MESON_TARGET_CPU_FAMILY = mips64
> -else ifeq ($(BR2_powerpc),y)
> -HOST_MESON_TARGET_CPU_FAMILY = ppc
> -else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> -HOST_MESON_TARGET_CPU_FAMILY = ppc64
> -else ifeq ($(BR2_riscv),y)
> -HOST_MESON_TARGET_CPU_FAMILY = riscv64
> -else ifeq ($(BR2_sparc),y)
> -HOST_MESON_TARGET_CPU_FAMILY = sparc
> -else ifeq ($(BR2_sparc64),y)
> -HOST_MESON_TARGET_CPU_FAMILY = sparc64
> -else ifeq ($(BR2_x86_64),y)
> -HOST_MESON_TARGET_CPU_FAMILY = x86_64
> -else
> -HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
> -endif
> -
>  # Avoid interpreter shebang longer than 128 chars
>  define HOST_MESON_SET_INTERPRETER
>         $(SED) '1s:.*:#!/usr/bin/env python3:' $(HOST_DIR)/bin/meson
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 3a34ba703b..a9ded9fe5a 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -57,29 +57,17 @@ $(2)_NINJA_ENV              ?=
>  ifndef $(2)_CONFIGURE_CMDS
>  ifeq ($(4),target)
>
> -$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
> -$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
> -$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
> -
>  # Configure package for target
>  #
>  #
>  define $(2)_CONFIGURE_CMDS
>         rm -rf $$($$(PKG)_SRCDIR)/build
>         mkdir -p $$($$(PKG)_SRCDIR)/build
> -       sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
> -           -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
> -           -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
> -           -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
> -           -e "s%@TARGET_CFLAGS@%$$(call make-sq-comma-list,$$($(2)_CFLAGS))%g" \
> -           -e "s%@TARGET_LDFLAGS@%$$(call make-sq-comma-list,$$($(2)_LDFLAGS))%g" \
> -           -e "s%@TARGET_CXXFLAGS@%$$(call make-sq-comma-list,$$($(2)_CXXFLAGS))%g" \
> -           -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
> -           -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> -           -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
> -           -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
> +       sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
>             -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
> -           package/meson/cross-compilation.conf.in \
> +           $$(call PKG_MESON_CROSSCONFIG_SED,$$(if $$($(2)_CFLAGS),$(2)_CFLAGS,TARGET_CFLAGS), \
> +                   $$(if $$($(2)_CXXFLAGS),$(2)_CXXFLAGS,TARGET_CXXFLAGS), \
> +                   $$(if $$($(2)_LDFLAGS),$(2)_LDFLAGS,TARGET_LDFLAGS)) \
>             > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>         PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
>                 --prefix=/usr \
> @@ -178,30 +166,72 @@ meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname
>  host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
>
>  ################################################################################
> -# Generation of the Meson cross-compilation.conf file
> +# Generation of the Meson compile flags and cross-compilation file
>  ################################################################################
>
> +# https://mesonbuild.com/Reference-tables.html#cpu-families
> +ifeq ($(BR2_arcle)$(BR2_arceb),y)
> +PKG_MESON_TARGET_CPU_FAMILY = arc
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +PKG_MESON_TARGET_CPU_FAMILY = arm
> +else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> +PKG_MESON_TARGET_CPU_FAMILY = aarch64
> +else ifeq ($(BR2_i386),y)
> +PKG_MESON_TARGET_CPU_FAMILY = x86
> +else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> +PKG_MESON_TARGET_CPU_FAMILY = mips
> +else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> +PKG_MESON_TARGET_CPU_FAMILY = mips64
> +else ifeq ($(BR2_powerpc),y)
> +PKG_MESON_TARGET_CPU_FAMILY = ppc
> +else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> +PKG_MESON_TARGET_CPU_FAMILY = ppc64
> +else ifeq ($(BR2_riscv),y)
> +PKG_MESON_TARGET_CPU_FAMILY = riscv64
> +else ifeq ($(BR2_sparc),y)
> +PKG_MESON_TARGET_CPU_FAMILY = sparc
> +else ifeq ($(BR2_sparc64),y)
> +PKG_MESON_TARGET_CPU_FAMILY = sparc64
> +else ifeq ($(BR2_x86_64),y)
> +PKG_MESON_TARGET_CPU_FAMILY = x86_64
> +else
> +PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
> +endif
> +
> +# Generates sed patterns for patching the cross-compilation.conf template,
> +# since Flags might contain commas the arguments are passed indirectly by
> +# variable name (stripped to deal with whitespaces).
> +# Aruments are variable containing cflags, cxxflags, ldflags.
> +define PKG_MESON_CROSSCONFIG_SED
> +        -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
> +        -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
> +        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
> +        -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> +        -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
> +        -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
> +        -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
> +        -e "s%@TARGET_ENDIAN@%$(call LOWERCASE,$(BR2_ENDIAN))%g" \
> +        -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
> +        -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
> +        -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
> +        -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
> +        -e "s%@PKG_CONFIG_HOST_BINARY@%$(PKG_CONFIG_HOST_BINARY)%g" \
> +        -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
> +        -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
> +        $(TOPDIR)/support/misc/cross-compilation.conf.in
> +endef
> +
>  # Generate a Meson cross-compilation.conf suitable for use with the
>  # SDK; also install the file as a template for users to add their
>  # own flags if they need to.
>  define PKG_MESON_INSTALL_CROSS_CONF
>         mkdir -p $(HOST_DIR)/etc/meson
> -       sed -e 's%@TARGET_CROSS@%$(TARGET_CROSS)%g' \
> -           -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
> -           -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
> -           -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
> -           -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
> +       sed -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
>             -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
>             -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
> -           -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
> -           -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
> -           -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
> -           $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> +           $(call PKG_MESON_CROSSCONFIG_SED) \
>             > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
> -       sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
> -           -e 's%@PKG_TARGET_LDFLAGS@%%g' \
> -           -e 's%@PKG_TARGET_CXXFLAGS@%%g' \
> -           $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
> +       sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
>             > $(HOST_DIR)/etc/meson/cross-compilation.conf
>  endef
>
> diff --git a/package/meson/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
> similarity index 100%
> rename from package/meson/cross-compilation.conf.in
> rename to support/misc/cross-compilation.conf.in
> --
> 2.28.0
>
