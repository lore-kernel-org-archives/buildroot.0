From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 25 Nov 2020 13:46:38 -0600
Subject: [Buildroot] [PATCH next 07/12] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
In-Reply-To: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
Message-ID: <CALq67GAGhUt56n2d9eLtufxH4jdNYPy14iuMwEK95qhkgWPvDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I've been testing out your pkg-mgr manager series branch over the last
few days. I've run into an issue with the cargo package infrastructure
in trying to build a package after doing a 'make clean'. The error is
follows:

>>> ripgrep 12.1.1 Extracting
gzip -d -c /home/ryan/.br-dl/ripgrep/ripgrep-12.1.1.tar.gz |
/home/ryan/projects/br/br-pkg-mgr/output/host/bin/tar
--strip-components=1 -C
/home/ryan/projects/br/br-pkg-mgr/output/build/ripgrep-12.1.1   -xf -
>>> ripgrep 12.1.1 Patching
>>> ripgrep 12.1.1 Configuring
>>> ripgrep 12.1.1 Building
PATH="/home/ryan/projects/br/br-pkg-mgr/output/host/bin:/home/ryan/projects/br/br-pkg-mgr/output/host/sbin:/home/ryan/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PATH="/home/ryan/projects/br/br-pkg-mgr/output/host/bin:/home/ryan/projects/br/br-pkg-mgr/output/host/sbin:/home/ryan/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
AR="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-ar"
AS="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-as"
LD="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-ld"
NM="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-nm"
CC="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-gcc"
GCC="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-gcc"
CPP="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-cpp"
CXX="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-g++"
FC="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-gfortran"
F77="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-gfortran"
RANLIB="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-ranlib"
READELF="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-readelf"
STRIP="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-strip"
OBJCOPY="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-objcopy"
OBJDUMP="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/ryan/projects/br/br-pkg-mgr/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/ryan/projects/br/br-pkg-mgr/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/ryan/projects/br/br-pkg-mgr/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/ryan/projects/br/br-pkg-mgr/output/host/lib
-Wl,-rpath,/home/ryan/projects/br/br-pkg-mgr/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-as"
DEFAULT_LINKER="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/x86_64-linux-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os
" PKG_CONFIG="/home/ryan/projects/br/br-pkg-mgr/output/host/bin/pkg-config"
STAGING_DIR="/home/ryan/projects/br/br-pkg-mgr/output/host/x86_64-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl
CARGO_HOME=/home/ryan/projects/br/br-pkg-mgr/output/host/share/cargo
cargo build --offline --target x86_64-unknown-linux-gnu --release
--manifest-path
/home/ryan/projects/br/br-pkg-mgr/output/build/ripgrep-12.1.1/Cargo.toml
--locked
error: no matching package named `aho-corasick` found
location searched: registry `https://github.com/rust-lang/crates.io-index`
required by package `globset v0.4.5
(/home/ryan/projects/br/br-pkg-mgr/output/build/ripgrep-12.1.1/crates/globset)`
As a reminder, you're using offline mode (--offline) which can
sometimes cause surprising resolution failures, if this error is too
confusing you may wish to retry without the offline flag.
make[1]: *** [package/pkg-generic.mk:250:
/home/ryan/projects/br/br-pkg-mgr/output/build/ripgrep-12.1.1/.stamp_built]
Error 101
make: *** [Makefile:84: _all] Error 2

I get this error by running the following commands:

make ripgrep
make clean ripgrep

The defconfig I used is:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
BR2_INIT_NONE=y
# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
# BR2_PACKAGE_BUSYBOX is not set

I have BR2_DL_DIR configured as follows:

declare -x BR2_DL_DIR="~/.br-dl"

I can work around the issue by running the following commands:

rm -rf ~/.br-dl/ripgrep/
make clean ripgrep

So it appears that after the rippackage has been downloaded there is
an issue with doing a clean build. I'm not familiar with cargo/rust
builds and how the offline component works but it appears that the
introduction of this cargo infrastructure and the downloading of
vendor dependencies is not currently reproducible.

Let me know if you need any additional information to reproduce the problem.

Thanks,
-Ryan


On Thu, Nov 19, 2020 at 3:37 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> From: Patrick Havelange <patrick.havelange@essensium.com>
>
> In order to be package agnostic, the install phase is now using cargo
> instead of install. TARGET_CONFIGURE_OPTS is now also set when running
> cargo in order to support cross compiling C code within cargo.
>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> [Thomas: add support for host-cargo-package]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/Makefile.in  |   1 +
>  package/pkg-cargo.mk | 123 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 package/pkg-cargo.mk
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 51f5cbce4f..2af123f36d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -427,3 +427,4 @@ include package/pkg-waf.mk
>  include package/pkg-golang.mk
>  include package/pkg-meson.mk
>  include package/pkg-qmake.mk
> +include package/pkg-cargo.mk
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> new file mode 100644
> index 0000000000..52c237aa3c
> --- /dev/null
> +++ b/package/pkg-cargo.mk
> @@ -0,0 +1,123 @@
> +################################################################################
> +# Cargo package infrastructure
> +#
> +# This file implements an infrastructure that eases development of package
> +# .mk files for Cargo packages. It should be used for all packages that use
> +# Cargo as their build system.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this Cargo infrastructure requires the .mk file
> +# to only specify metadata information about the package: name, version,
> +# download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different steps
> +# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
> +# it is used as the list of commands to perform to build the package,
> +# instead of the default Cargo behaviour. The package can also define some
> +# post operation hooks.
> +#
> +################################################################################
> +
> +################################################################################
> +# inner-cargo-package -- defines how the configuration, compilation and
> +# installation of a cargo package should be done, implements a few hooks
> +# to tune the build process for cargo specifities and calls the generic
> +# package infrastructure to generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +define inner-cargo-package
> +
> +# We need host-rustc to run cargo
> +$(2)_DEPENDENCIES += host-rustc
> +
> +$(2)_CARGO_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +ifeq ($(4),target)
> +define $(2)_BUILD_CMDS
> +       $$(TARGET_MAKE_ENV) \
> +               $$(TARGET_CONFIGURE_OPTS) \
> +               $$($(2)_CARGO_ENV) \
> +               cargo build \
> +                       --offline \
> +                       --target $$(RUSTC_TARGET_NAME) \
> +                       $$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
> +                       --manifest-path $$(@D)/Cargo.toml \
> +                       --locked \
> +                       $$($(2)_CARGO_BUILD_OPTS)
> +endef
> +else # ifeq ($(4),target)
> +define $(2)_BUILD_CMDS
> +       $$(HOST_MAKE_ENV) \
> +               RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
> +               $$($(2)_CARGO_ENV) \
> +               cargo build \
> +                       --offline \
> +                       --release \
> +                       --manifest-path $$(@D)/Cargo.toml \
> +                       --locked \
> +                       $$($(2)_CARGO_BUILD_OPTS)
> +endef
> +endif # ifeq ($(4),target)
> +endif # ifndef $(2)_BUILD_CMDS
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +       $$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
> +               cargo install \
> +                       --target $$(RUSTC_TARGET_NAME) \
> +                       --offline \
> +                       --root $$(TARGET_DIR)/usr/ \
> +                       --bins \
> +                       --path $$(@D) \
> +                       --force \
> +                       --locked \
> +                       $$($(2)_CARGO_INSTALL_OPTS)
> +endef
> +endif
> +
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +       $$(HOST_MAKE_ENV) \
> +               RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
> +               $$($(2)_CARGO_ENV) \
> +               cargo install \
> +                       --offline \
> +                       --root $$(HOST_DIR) \
> +                       --bins \
> +                       --path $$(@D) \
> +                       --force \
> +                       --locked \
> +                       $$($(2)_CARGO_INSTALL_OPTS)
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +
> +endef
> +
> +################################################################################
> +# cargo-package -- the target generator macro for Cargo packages
> +################################################################################
> +
> +cargo-package = $(call inner-cargo-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> +host-cargo-package = $(call inner-cargo-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> --
> 2.28.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
