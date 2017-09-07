From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 7 Sep 2017 21:58:43 +0200
Subject: [Buildroot] [Patch v7 06/10] rust: new package
In-Reply-To: <9e396e75-a1d9-30ff-4c04-db70651ca7a1@mind.be>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-7-eric.le.bihan.dev@free.fr>
 <9e396e75-a1d9-30ff-4c04-db70651ca7a1@mind.be>
Message-ID: <20170907195843.GD6001@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-08-11 01:38:08, Arnout Vandecappelle wrote:
>
>
> On 23-07-17 10:12, Eric Le Bihan wrote:
> > This new package provides rustc, the compiler for the Rust programming
> > language, built from source.
> >
> > Currently, only the host variant is built.
> >
> > The Rust compiler uses LLVM as its backend: a copy of LLVM source code
> > is provided and CMake is used to build it. It is possible to use a
> > pre-built external copy. When LLVM/clang will be available in Buildroot,
> > it would be possible to benefit from this feature and thus decrease
> > build time.
> >
> > LLVM is configured to generate code for x86, ARM, PowerPC and MIPS
> > architectures.
> >
> > The Rust compiler uses Cargo as its build system and is written in Rust.
> > Therefore this package depends on cargo-bootstrap and rust-bootstrap.
> >
> > The internal build process is as follows:
> >
> >  1. rustc-stage0, provided by rust-bootstrap, is used to build
> >     rustc-stage1.
> >  2. rust-stage1 builds the final Rust compiler (rust-stage2)
> >     and the standard library for the host architecture.
>
>  If rust-bootstrap is replaced by host-rustc-bin, then I think we could jump
> directly to stage2, right?

AFAIK, I do not think so.

> >  3. the standard library for the target architecture is built.
>
>  And the source of the standard library is included in rustc-src.tar.xz, right?

Yes.

> So adding a rust-std package doesn't make much sense, I guess, only rust-std-bin.

As suggested previously, how about a rust-std virtual package? host-rust
would provide host-rustc and host-rust-std.

> [snip]
> > +define HOST_RUST_CONFIGURE_CMDS
> > +	(cd $(@D); \
> > +		echo '[build]' > config.toml; \
> > +		echo 'target = ["$(RUST_TARGET_NAME)"]' >> config.toml; \
> > +		echo 'cargo = "$(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo"' >> config.toml; \
> > +		echo 'rustc = "$(HOST_RUST_BOOTSTRAP_DIR)/rustc/bin/rustc"' >> config.toml; \
>
>  Is it really necessary to refer to the build directories? Can't we copy stuff
> to HOST_DIR and use it from there?

IHMO, these bootstrap binaries are "disposable" and not worth ending up
in $(HOST_DIR)/bin, hence the reference to the build directories. If
they do land in $(HOST_DIR)/bin, then they should be renamed to
{cargo,rustc}-bootstrap. Would it not confuse the user to have some many
versions of rustc/cargo in $(HOST_DIR)/bin?

> > +		echo 'python = "$(HOST_DIR)/bin/python2"' >> config.toml; \
>
>  The only reason to depend on host-python is because it needs python2 and not
> python3, right? I think we should just add in dependencies.sh a check for
> python2 instead of just python, so we can avoid building host-python. Or does it
> need python2.7.x?

The Python code looks compatible with Python 3.x. Needs some testing
though.

> > +		echo 'submodules = false' >> config.toml; \
> > +		echo 'vendor = true' >> config.toml; \
> > +		echo 'compiler-docs = false' >> config.toml; \
> > +		echo 'docs = false' >> config.toml; \
> > +		echo 'verbose = $(HOST_RUST_VERBOSITY)' >> config.toml; \
> > +		echo '[install]' >> config.toml; \
> > +		echo 'prefix = "$(HOST_DIR)"' >> config.toml; \
> > +		echo '[rust]' >> config.toml; \
> > +		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)' >> config.toml; \
> > +		echo '[target.$(RUST_TARGET_NAME)]' >> config.toml; \
> > +		echo 'cc = "$(TARGET_CROSS)gcc"' >> config.toml; \
> > +		echo 'cxx = "$(TARGET_CROSS)g++"' >> config.toml; \
>
>  Doesn't rust/llvm have a way to specify the target CPU? Target optimisation
> options? Floating point?

I'll see if there are some options for this.

> > +		echo $(HOST_RUST_JEMALLOC_CONF) >> config.toml; \
> > +	)
>
>  All these lines are quite ugly... Could be de-uglified a little bit by
> putting a single redirect after the closing )

Will do!

> > +endef
> > +
> > +define HOST_RUST_BUILD_CMDS
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
>                                                           ^^^^^^^
>                                                       Make that an explicit
> $(HOST_DIR)/bin/python2

OK.

>  HOST_RUST_MAKE_ENV is never assigned to, right?

Yes. It is useless. I will remove it.

> > +		build $(HOST_RUST_BUILD_OPTS))
> > +endef
> > +
> > +define HOST_RUST_INSTALL_LIBSTD_TARGET
> > +	(cd $(@D)/build/tmp/dist/rust-std-$(RUST_VERSION)-dev-$(RUST_TARGET_NAME); \
> > +		./install.sh \
> > +			--prefix=$(HOST_DIR) \
> > +			--docdir=$(HOST_DIR)/share/doc/rust \
> > +			--libdir=$(HOST_DIR)/lib \
>
>  So both the host and the target stdlib will go here? What if the host is a
> corei7 and target is atom?

Yes, I should handle the case where $(HOSTARCH) == $(ARCH).

> > +			--mandir=$(HOST_DIR)/share/man \
> > +			--disable-ldconfig)
> > +endef
> > +
> > +define HOST_RUST_INSTALL_CMDS
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
> > +		dist $(HOST_RUST_BUILD_OPTS))
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
> > +		install $(HOST_RUST_BUILD_OPTS))
> > +	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
>
>  So, "install" doesn't actually install it, it just puts stuff in
> build/tmp/dist/... ? Isn't there a way to tell it to put stuff directly into
> HOST_DIR?

The `dist` command generates the install.sh scripts that are called by
the `install` command.

> > +endef
> > +
> > +$(eval $(host-generic-package))
> > diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> > index 7f2c276..30bab8f 100644
> > --- a/package/rustc/Config.in.host
> > +++ b/package/rustc/Config.in.host
> > @@ -26,6 +26,20 @@ choice
> >  	help
> >  	  Choose a provider for the Rust compiler.
> >
> > +config BR2_PACKAGE_HOST_RUST
> > +	bool "host rust"
> > +	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
> > +	# triggers ICE on trunc_int_for_mode, at explow.c:56
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
> > +	select BR2_PACKAGE_HAS_HOST_RUSTC
> > +	help
> > +	  This package will build the compiler for the host as well as
> > +	  a cross-compiled version of the Rust standard library for the
> > +	  target.
> > +
> > +comment "host-rust needs a toolchain w/ gcc >= 5"
> > +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_aarch64
>
>  Split in two lines:
>
> 	depends on BR2_aarch64
> 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5

OK.

--
ELB
