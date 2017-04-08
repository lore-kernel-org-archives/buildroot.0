From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 8 Apr 2017 12:09:25 +0200
Subject: [Buildroot] [Patch v4 3/3] rust: new package
In-Reply-To: <1491549522.26127.8.camel@embedded.rocks>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-4-eric.le.bihan.dev@free.fr>
 <1491549522.26127.8.camel@embedded.rocks>
Message-ID: <20170408100925.GC32154@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-04-07 09:18:42, J?rg Krause wrote:
> Hi Eric,
>
> On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:
> > This new package provides the compiler for the Rust programming
> > language.
> >
> > Currently, only the host variant is built.
> >
> > The Rust compiler uses LLVM as its backend: a copy of LLVM source
> > code
> > is provided and CMake is used to build it. It is possible to use a
> > pre-built external copy. When LLVM/clang will be available in
> > Buildroot,
> > it would be possible to benefit from this feature and thus decrease
> > build time.
> >
> > LLVM is configured to generate code for x86, ARM, PowerPC and MIPS
> > architectures.
> >
> > The Rust compiler uses Cargo as its build system and is written in
> > Rust.
> > Therefore this package depends on cargo-bootstrap and rust-bootstrap.
> >
> > The internal build process is as follows:
> >
> > ?1. rustc-stage0, provided by rust-bootstrap, is used to build
> > ????rustc-stage1.
> > ?2. rust-stage1 builds the final Rust compiler (rust-stage2)
> > ????and the standard library for the host architecture.
> > ?3. the standard library for the target architecture is built.
>
> So, we are doing the following: fetch the predecessor rust version
> 1.15.1 as binary to use it as stage0 compiler for building the latest
> rust stable version 1.16.0. Why not just fetch the latest stable
> version and install it into the host dir? The same goes with libstd and
> cargo. I mean, we have to fetch some binaries anyway, so why do the
> time-consuming build steps anyway? Shouldn't there be at least the
> option just to fetch the latest stable version?
>
It is true that building the Rust compiler is time consuming. As stated
in the comment, this can be decreased if LLVM was already available. But
if LLVM itself is built from source and not fetched as binary from
Internet, then the issue is still there.

Currently Buildroot only offers downloading binary versions of the C/C++
cross-compilers. It does not take into account alternative C/C++
cross-compilers like LLVM/Clang or compilers for new languages like
Rust, D, or Haskell (though I do not know if Haskell is useful on
embedded systems).

So, would it help to have a "Programming Languages" section in
menuconfig where you can select Rust (or any other language) and choose
between a using a pre-built compiler or build it from source?

And where shoud LLVM/clang be exposed?

Note: Building a cross-compiler for D can be done via a patch to GCC
thanks to GDC [1], but IIRC cross-compiling libphobos, the standard
library, is another matter.

[1] https://github.com/D-Programming-GDC/GDC/releases

> > The target architecture to support is given by the GNU/LLVM target
> > triple. Rust supports some predefined targets [1]. As the build
> > system
> > expects the triple to be in the form of <arch>-unknown-<system> and
> > Buildroot toolchain wrapper uses <arch>-buildroot-<system>, the
> > package
> > Makefile defines the $(RUST_TARGET_NAME) and uses it instead of
> > $(GNU_TARGET_NAME).
> >
> > When compiling Rust code with this compiler, the generated program
> > only
> > depends on the target C library, as it is statically linked to the
> > Rust
> > standard library and any other code from Rust packages (a.k.a.
> > "crates").
> >
> > If the jemalloc package is selected, support for this memory
> > allocator
> > will be enabled in the target standard library.
> >
> > [1] https://forge.rust-lang.org/platform-support.html
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> > ?DEVELOPERS??????????????????|??1 +
> > ?package/Config.in.host??????|??1 +
> > ?package/rust/Config.in.host | 33 ++++++++++++++++++
> > ?package/rust/rust.hash??????|??2 ++
> > ?package/rust/rust.mk????????| 85
> > +++++++++++++++++++++++++++++++++++++++++++++
> > ?5 files changed, 122 insertions(+)
> > ?create mode 100644 package/rust/Config.in.host
> > ?create mode 100644 package/rust/rust.hash
> > ?create mode 100644 package/rust/rust.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 1fed408..c0e7833 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -450,6 +450,7 @@ F:	package/hicolor-icon-theme/
> > ?F:	package/jemalloc/
> > ?F:	package/ninja/
> > ?F:	package/rust-bootstrap
> > +F:	package/rust
> > ?F:	package/s6/
> > ?F:	package/s6-dns/
> > ?F:	package/s6-linux-init/
> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index 38f919a..ef5f23f 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -39,6 +39,7 @@ menu "Host utilities"
> > ?	source "package/python-lxml/Config.in.host"
> > ?	source "package/qemu/Config.in.host"
> > ?	source "package/raspberrypi-usbboot/Config.in.host"
> > +	source "package/rust/Config.in.host"
> > ?	source "package/s6-rc/Config.in.host"
> > ?	source "package/sam-ba/Config.in.host"
> > ?	source "package/squashfs/Config.in.host"
> > diff --git a/package/rust/Config.in.host
> > b/package/rust/Config.in.host
> > new file mode 100644
> > index 0000000..384a071
> > --- /dev/null
> > +++ b/package/rust/Config.in.host
> > @@ -0,0 +1,33 @@
> > +config BR2_PACKAGE_HOST_RUST_ARCH_SUPPORTS
> > +	bool
> > +	default y
> > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> > +	depends on??BR2_i386 || BR2_x86_64 \
> > +		|| BR2_arm??|| BR2_aarch64 \
> > +		|| BR2_powerpc??|| BR2_powerpc64 \
> > +		|| BR2_mips || BR2_mipsel || BR2_mips64 ||
> > BR2_mips64el
> > +	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> > +	depends on !BR2_MIPS_NABI32
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
> > +	# triggers ICE on trunc_int_for_mode, at explow.c:56
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
> > +
> > +comment "host-rust needs a toolchain w/ gcc >= 5"
> > +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_aarch64
> > +
> > +config BR2_PACKAGE_HOST_RUST
> > +	bool "host rust"
> > +	depends on BR2_PACKAGE_HOST_RUST_ARCH_SUPPORTS
> > +	help
> > +	??Compiler for the Rust programming language.
> > +
> > +	??This package will build the compiler for the host as well
> > as
> > +	??a cross-compiled version of the Rust standard library for
> > the
> > +	??target.
> > +
> > +	??Note that the target standard library does not need to be
> > +	??present on the target root filesystem, as it is statically
> > +	??linked to the program.
> > +
> > +	??http://www.rust-lang.org
> > diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> > new file mode 100644
> > index 0000000..3b04dfd
> > --- /dev/null
> > +++ b/package/rust/rust.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256
> > f966b31eb1cd9bd2df817c391a338eeb5b9253ae0a19bf8a11960c560f96e8b4??rus
> > tc-1.16.0-src.tar.gz
> > diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> > new file mode 100644
> > index 0000000..12f4428
> > --- /dev/null
> > +++ b/package/rust/rust.mk
> > @@ -0,0 +1,85 @@
> > +####################################################################
> > ############
> > +#
> > +# rust
> > +#
> > +####################################################################
> > ############
> > +
> > +RUST_VERSION = 1.16.0
> > +RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.gz
> > +RUST_SITE = https://static.rust-lang.org/dist
> > +RUST_LICENSE = Apache-2.0 or MIT
> > +RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > +
> > +HOST_RUST_DEPENDENCIES = \
> > +	toolchain \
> > +	host-rust-bootstrap \
> > +	host-cargo-bootstrap \
> > +	host-python \
> > +	host-cmake
> > +
> > +ifeq ($(BR2_PACKAGE_JEMALLOC),y)
> > +HOST_RUST_DEPENDENCIES += jemalloc
> > +HOST_RUST_JEMALLOC_ENABLED = true
> > +HOST_RUST_JEMALLOC_CONF = 'jemalloc =
> > "$(STAGING_DIR)/usr/lib/libjemalloc_pic.a"'
> > +else
> > +HOST_RUST_JEMALLOC_ENABLED = false
> > +endif
> > +
> > +HOST_RUST_BUILD_OPTS = $(if $(VERBOSE),--verbose)
> > +
> > +RUST_TARGET_NAME := $(subst buildroot,unknown,$(GNU_TARGET_NAME))
> > +
> > +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> > +RUST_TARGET_NAME := $(subst arm-,armv7-,$(RUST_TARGET_NAME))
> > +endif
> > +
> > +ifeq ($(BR2_MIPS_NABI64),y)
> > +RUST_TARGET_NAME := $(subst -gnu,-gnuabi64,$(RUST_TARGET_NAME))
> > +endif
> > +
> > +define HOST_RUST_CONFIGURE_CMDS
> > +	(cd $(@D); \
> > +		echo '[build]' > config.toml; \
> > +		echo 'target = ["$(RUST_TARGET_NAME)"]' >>
> > config.toml; \
> > +		echo 'cargo =
> > "$(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo"' >> config.toml; \
> > +		echo 'rustc =
> > "$(HOST_RUST_BOOTSTRAP_DIR)/rustc/bin/rustc"' >> config.toml; \
> > +		echo 'python = "$(HOST_DIR)/usr/bin/python2"' >>
> > config.toml; \
> > +		echo 'submodules = false' >> config.toml; \
> > +		echo 'vendor = true' >> config.toml; \
> > +		echo 'compiler-docs = false' >> config.toml; \
> > +		echo 'docs = false' >> config.toml; \
> > +		echo '[install]' >> config.toml; \
> > +		echo 'prefix = "$(HOST_DIR)/usr"' >> config.toml; \
> > +		echo '[rust]' >> config.toml; \
> > +		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'
> > >> config.toml; \
> > +		echo '[target.$(RUST_TARGET_NAME)]' >> config.toml;
> > \
> > +		echo 'cc = "$(TARGET_CROSS)gcc"' >> config.toml; \
> > +		echo 'cxx = "$(TARGET_CROSS)g++"' >> config.toml; \
> > +		echo $(HOST_RUST_JEMALLOC_CONF) >> config.toml; \
> > +	)
> > +endef
> > +
> > +define HOST_RUST_BUILD_CMDS
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2
> > x.py \
> > +		build $(HOST_RUST_BUILD_OPTS))
> > +endef
> > +
> > +define HOST_RUST_INSTALL_LIBSTD_TARGET
> > +	(cd $(@D)/build/tmp/dist/rust-std-$(RUST_VERSION)-dev-
> > $(RUST_TARGET_NAME); \
> > +		./install.sh \
> > +			--prefix=$(HOST_DIR)/usr \
> > +			--docdir=$(HOST_DIR)/usr/share/doc/rust \
> > +			--libdir=$(HOST_DIR)/usr/lib \
> > +			--mandir=$(HOST_DIR)/usr/share/man \
> > +			--disable-ldconfig)
> > +endef
> > +
> > +define HOST_RUST_INSTALL_CMDS
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2
> > x.py \
> > +		dist $(HOST_RUST_BUILD_OPTS))
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2
> > x.py \
> > +		dist --install $(HOST_RUST_BUILD_OPTS))
> > +	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
> > +endef
> > +
> > +$(eval $(host-generic-package))
>
> Best regards,
> J?rg Krause

--
ELB
