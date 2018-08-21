From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:06:16 +0200
Subject: [Buildroot] [PATCH] rust: Modify Rust to be usable as host-tool
 only
In-Reply-To: <20180717042953.23648-1-sam.voss@gmail.com>
References: <20180717042953.23648-1-sam.voss@gmail.com>
Message-ID: <20180821220616.03e21ea4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

Thanks for taking the lead on this!

On Mon, 16 Jul 2018 23:29:53 -0500, sam.voss at gmail.com wrote:
> From: Sam Voss <sam.voss@gmail.com>
> 
> Modify host-rust virtual package to default to host-rust-bin when no
> other selection has been made, as long as the host supports rust. This
> allows host only tools to still use rust when the target architecture
> does not support it.
> 
> Add target-specific variable which is used to differentiate host and
> target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).
> 
> A target package shall depend on this variable where a host package will
> use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new
> "target" version is selectable for the same set of architectures as
> before, but now depends on the host variant.
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>

I finally took a bit of time to look into this. Basically today, when
we build host-rustc, we get:

 - A Rust compiler capable of compiling code for the host machine, and
   cross-compiling code for the target.
 - A Rust standard library for the host machine
 - A Rust standard library for the target machine

However, this is restricted to Buildroot configurations where the
target architecture is supported by Rust. But there are some host
packages that we would like to build and run on the host (usually a x86
or x86-64 machine), and for these the restriction that host-rustc is
only available when the target architecture is supported by Rust is too
restrictive.

So basically, we would like:

 - host-rustc to continue to install a Rust compiler that does
   native+cross, the host standard library and target standard library
   when the target architecture is supported by Rust.

 - host-rustc to install a Rust compiler that does native build, and the
   host standard library, when the target architecture is NOT supported
   by Rust.

So the host-rustc package would have a different behavior depending on
whether the target architecture is supported by Rust or not.

> Note: this has been tested on x86_64 host compiling to:
> 
> - x86_64 qemu target (building package to be upstreamed shortly)
> - mips64el (based on librsvg build failures seen at
> http://autobuild.buildroot.net/results/f33/f335ed517b402c094ed3b10a3da4cdc23620dbd6/defconfig)
>   this target was only tested to compile, with no runtime tests.
> 
>  package/rust-bin/rust-bin.mk |  5 ++++-
>  package/rust/rust.mk         |  1 +
>  package/rustc/Config.in.host | 21 ++++++++++++++++++---
>  package/rustc/rustc.mk       |  2 ++
>  4 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index e10dbcebd0..c426da8d15 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -15,7 +15,10 @@ HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
>  
>  HOST_RUST_BIN_EXTRA_DOWNLOADS = \
>  	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz \

The ending backslash should be removed here, I guess it causes a
check-package warning.

> -	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
> +
> +ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
> +HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
> +endif
>  
>  HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME)/rust-std-$(RUSTC_HOST_NAME)
>  
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index af5c366495..c11dbb23b0 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -19,6 +19,7 @@ HOST_RUST_DEPENDENCIES = \
>  	host-python \
>  	$(BR2_CMAKE_HOST_DEPENDENCY)
>  
> +

Spurious change.

>  ifeq ($(BR2_PACKAGE_JEMALLOC),y)
>  HOST_RUST_DEPENDENCIES += jemalloc
>  HOST_RUST_JEMALLOC_ENABLED = true
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 2ae8f89d3f..d7f0efcd3f 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -14,6 +14,19 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

I think you need to remove all the architecture dependencies here:
host-rust is always available, as long as the host architecture is
x86-64 or x86. The glibc dependency should also be removed, as we don't
have any way of expressing a "we depend on a host machine with glibc"
dependency today.

> +config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +	default y if BR2_aarch64
> +	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 \
> +	        && !(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI)
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
> +	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
> +		&& BR2_MIPS_NABI64

The glibc dependency should be re-added here.

> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +
>  config BR2_PACKAGE_HOST_RUSTC_ARCH
>  	string
>  	default "armv7"  if BR2_ARM_CPU_ARMV7A
> @@ -66,9 +79,11 @@ config BR2_PACKAGE_HOST_RUST_BIN
>  
>  endchoice
>  
> +endif
> +
>  config BR2_PACKAGE_PROVIDES_HOST_RUSTC
>  	string
>  	default "host-rust" if BR2_PACKAGE_HOST_RUST
> -	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
> -
> -endif
> +	# Default to host-rust-bin as long as host arch supports it
> +	default "host-rust-bin" if !BR2_PACKAGE_HOST_RUST
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS

However, even with those changes, if I do:

$ cat > .config <<EOF
BR2_nios2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
EOF
$ make olddefconfig
$ make host-rustc

Then I see:

>>> host-rust-bin 1.27.1 Extracting
xzcat /home/thomas/dl/rust-bin/rustc-1.27.1-x86_64-unknown-linux-gnu.tar.xz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/host-rust-bin-1.27.1   -xf -
mkdir -p /home/thomas/projets/buildroot/output/build/host-rust-bin-1.27.1/std
xzcat /home/thomas/dl/rust-bin/rust-std-1.27.1-x86_64-unknown-linux-gnu.tar.xz | tar -C /home/thomas/projets/buildroot/output/build/host-rust-bin-1.27.1/std  -xf -
cd /home/thomas/projets/buildroot/output/build/host-rust-bin-1.27.1/rustc/lib/rustlib/x86_64-unknown-linux-gnu; ln -sf ../../../../std/rust-std-1.27.1-x86_64-unknown-linux-gnu/rust-std-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib
>>> host-rust-bin 1.27.1 Patching
>>> host-rust-bin 1.27.1 Configuring
>>> host-rust-bin 1.27.1 Building
>>> host-rust-bin 1.27.1 Installing to host directory

And nothing gets installed in output/host. This is because
BR2_PACKAGE_HOST_RUST_BIN is false, and therefore rust-bin.mk doesn't
do much. I am not sure why rust-bin.mk has this condition:

ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)

This condition shouldn't be necessary. So it should be removed, and
instead HOST_RUST_BIN_INSTALL_LIBSTD_TARGET should be put within ifeq
($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y).

With this fixed, it does install a Rust compiler and host standard
library, and I can successfully build and run a host Rust program, even
if the NIOSII target architecture is not supported by Rust.

Could you fix this issue and send an updated patch ?

Note: I think your current patch is correct that the "host-rustc"
package should *NOT* appear in menuconfig when the target architecture
is not supported by Rust. Indeed, in such a case, Rust can only build
host programs, and it's therefore a mere build dependency of some other
package.

Please add a comment above the definitions of
BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS that all packages that use
host-rustc to build host Rust programs should depend on this option.
And a comment above BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS to say
that all packages that use host-rustc to build target Rust programs
should depend on this option.

For the record, the current state of the patch I had after some fixes
is at http://code.bulix.org/pqww33-400669.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
