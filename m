From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:38:08 +0200
Subject: [Buildroot] [Patch v7 06/10] rust: new package
In-Reply-To: <20170723081206.7774-7-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-7-eric.le.bihan.dev@free.fr>
Message-ID: <9e396e75-a1d9-30ff-4c04-db70651ca7a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:12, Eric Le Bihan wrote:
> This new package provides rustc, the compiler for the Rust programming
> language, built from source.
> 
> Currently, only the host variant is built.
> 
> The Rust compiler uses LLVM as its backend: a copy of LLVM source code
> is provided and CMake is used to build it. It is possible to use a
> pre-built external copy. When LLVM/clang will be available in Buildroot,
> it would be possible to benefit from this feature and thus decrease
> build time.
> 
> LLVM is configured to generate code for x86, ARM, PowerPC and MIPS
> architectures.
> 
> The Rust compiler uses Cargo as its build system and is written in Rust.
> Therefore this package depends on cargo-bootstrap and rust-bootstrap.
> 
> The internal build process is as follows:
> 
>  1. rustc-stage0, provided by rust-bootstrap, is used to build
>     rustc-stage1.
>  2. rust-stage1 builds the final Rust compiler (rust-stage2)
>     and the standard library for the host architecture.

 If rust-bootstrap is replaced by host-rustc-bin, then I think we could jump
directly to stage2, right?

>  3. the standard library for the target architecture is built.

 And the source of the standard library is included in rustc-src.tar.xz, right?
So adding a rust-std package doesn't make much sense, I guess, only rust-std-bin.

[snip]
> +define HOST_RUST_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		echo '[build]' > config.toml; \
> +		echo 'target = ["$(RUST_TARGET_NAME)"]' >> config.toml; \
> +		echo 'cargo = "$(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo"' >> config.toml; \
> +		echo 'rustc = "$(HOST_RUST_BOOTSTRAP_DIR)/rustc/bin/rustc"' >> config.toml; \

 Is it really necessary to refer to the build directories? Can't we copy stuff
to HOST_DIR and use it from there?

> +		echo 'python = "$(HOST_DIR)/bin/python2"' >> config.toml; \

 The only reason to depend on host-python is because it needs python2 and not
python3, right? I think we should just add in dependencies.sh a check for
python2 instead of just python, so we can avoid building host-python. Or does it
need python2.7.x?

> +		echo 'submodules = false' >> config.toml; \
> +		echo 'vendor = true' >> config.toml; \
> +		echo 'compiler-docs = false' >> config.toml; \
> +		echo 'docs = false' >> config.toml; \
> +		echo 'verbose = $(HOST_RUST_VERBOSITY)' >> config.toml; \
> +		echo '[install]' >> config.toml; \
> +		echo 'prefix = "$(HOST_DIR)"' >> config.toml; \
> +		echo '[rust]' >> config.toml; \
> +		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)' >> config.toml; \
> +		echo '[target.$(RUST_TARGET_NAME)]' >> config.toml; \
> +		echo 'cc = "$(TARGET_CROSS)gcc"' >> config.toml; \
> +		echo 'cxx = "$(TARGET_CROSS)g++"' >> config.toml; \

 Doesn't rust/llvm have a way to specify the target CPU? Target optimisation
options? Floating point?

> +		echo $(HOST_RUST_JEMALLOC_CONF) >> config.toml; \
> +	)

 All these lines are quite ugly... Could be de-uglified a little bit by
putting a single redirect after the closing )

> +endef
> +
> +define HOST_RUST_BUILD_CMDS
> +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
                                                          ^^^^^^^
                                                      Make that an explicit
$(HOST_DIR)/bin/python2

 HOST_RUST_MAKE_ENV is never assigned to, right?


> +		build $(HOST_RUST_BUILD_OPTS))
> +endef
> +
> +define HOST_RUST_INSTALL_LIBSTD_TARGET
> +	(cd $(@D)/build/tmp/dist/rust-std-$(RUST_VERSION)-dev-$(RUST_TARGET_NAME); \
> +		./install.sh \
> +			--prefix=$(HOST_DIR) \
> +			--docdir=$(HOST_DIR)/share/doc/rust \
> +			--libdir=$(HOST_DIR)/lib \

 So both the host and the target stdlib will go here? What if the host is a
corei7 and target is atom?

> +			--mandir=$(HOST_DIR)/share/man \
> +			--disable-ldconfig)
> +endef
> +
> +define HOST_RUST_INSTALL_CMDS
> +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
> +		dist $(HOST_RUST_BUILD_OPTS))
> +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
> +		install $(HOST_RUST_BUILD_OPTS))
> +	$(HOST_RUST_INSTALL_LIBSTD_TARGET)

 So, "install" doesn't actually install it, it just puts stuff in
build/tmp/dist/... ? Isn't there a way to tell it to put stuff directly into
HOST_DIR?


> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 7f2c276..30bab8f 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -26,6 +26,20 @@ choice
>  	help
>  	  Choose a provider for the Rust compiler.
>  
> +config BR2_PACKAGE_HOST_RUST
> +	bool "host rust"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
> +	# triggers ICE on trunc_int_for_mode, at explow.c:56
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
> +	select BR2_PACKAGE_HAS_HOST_RUSTC
> +	help
> +	  This package will build the compiler for the host as well as
> +	  a cross-compiled version of the Rust standard library for the
> +	  target.
> +
> +comment "host-rust needs a toolchain w/ gcc >= 5"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_aarch64

 Split in two lines:

	depends on BR2_aarch64
	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5


 Regards,
 Arnout


> +
>  config BR2_PACKAGE_HOST_RUST_BIN
>  	bool "host rust (pre-built)"
>  	select BR2_PACKAGE_HAS_HOST_RUSTC
> @@ -40,6 +54,7 @@ config BR2_PACKAGE_HAS_HOST_RUSTC
>  
>  config BR2_PACKAGE_PROVIDES_HOST_RUSTC
>  	string
> +	default "host-rust" if BR2_PACKAGE_HOST_RUST
>  	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
>  
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
