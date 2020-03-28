From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Mar 2020 22:18:29 +0100
Subject: [Buildroot] [v2 1/1] package/bat: new package
In-Reply-To: <20200327174035.11503-1-david.pierret@smile.fr>
References: <20200327174035.11503-1-david.pierret@smile.fr>
Message-ID: <74538af2-c667-e50e-4cbb-681957f67a2d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

Le 27/03/2020 ? 18:40, David Pierret a ?crit?:
> bat is a cat(1) clone with syntax highlighting and Git integration.
> 
> This package need rust version 1.37.0 or later
> 
> Signed-off-by: David Pierret <david.pierret@smile.fr>
> 
> ----
> bat supports syntax highlighting for a large number of programming
> and markup languages. He can communicates with git to show
> modifications with respect to the index.
> For conveignance use, bat can pipe its own output to less if the
> output is too large for one screen.
> 
> v1 -> v2
> Add selection of less out of busybox for command line option
> compatibility
> ---
[...]
> +++ b/package/bat/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_BAT
> +	bool "bat"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_RUSTC
> +	# we need a full version of less
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	# less needs ncurses

This comment is useless.

> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_LESS

Add a comment "# Runtime dependency" for each.

> +	help
> +	  A cat(1) clone with syntax highlighting and Git integration.
> +
> +	  https://github.com/sharkdp/bat
> diff --git a/package/bat/bat.hash b/package/bat/bat.hash
> new file mode 100644
> index 0000000000..14438b8a6f
> --- /dev/null
> +++ b/package/bat/bat.hash
> @@ -0,0 +1,4 @@
> +# Locally generated
> +sha256 f4aee370013e2a3bc84c405738ed0ab6e334d3a9f22c18031a7ea008cd5abd2a  bat-0.13.0.tar.gz
> +sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
> +sha256 dc931b3f4376dc2b12486ded9f51487719099074587d757ea6125bb59deeb221  LICENSE-MIT
> diff --git a/package/bat/bat.mk b/package/bat/bat.mk
> new file mode 100644
> index 0000000000..89711ac33b
> --- /dev/null
> +++ b/package/bat/bat.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# bat
> +#
> +################################################################################
> +
> +BAT_VERSION = 0.13.0
> +BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
> +BAT_LICENSE = Apache-2.0 or MIT
> +BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +BAT_DEPENDENCIES = host-rustc
> +
> +BAT_CFLAGS = $(TARGET_CFLAGS)
> +
> +BAT_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> +BAT_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
> +
> +BAT_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(BAT_CARGO_MODE)
> +
> +BAT_CARGO_OPTS = \
> +		 --bins \
> +		 --$(BAT_CARGO_MODE) \
> +		 --target=$(RUSTC_TARGET_NAME) \
> +		 --manifest-path=$(@D)/Cargo.toml
> +
> +define BAT_BUILD_CMDS
> +	# we need to use the 'env' command to set the CC_<target> variable since
> +	# the rustc_target_name contain minus characters not allowed in bash.
> +	env $(TARGET_MAKE_ENV) $(BAT_CARGO_ENV) \
> +	CC_$(RUSTC_TARGET_NAME)=$(TARGET_CC) \
> +		cargo build $(BAT_CARGO_OPTS)
> +endef

David, can you add some details about the issue with CC_<target> ?

It would be great if you can use the upcoming cargo package infra, but this
infra doesn't handle CC_<target>.

As you noticed the build fail because we need to set CC_aarch64-none-linux-gnu
environment variable for aarch64 target build.

Arnout, Patrick. It seems David discovered a cross-compilation issue with cargo.
I reproduced the issue, cargo is using the host compiler instead of the
cross-compiler:

error: failed to run custom build command for `libloading v0.5.2`

Caused by:
  process didn't exit successfully:
`/home/naourr/buildroot/test/bat/build/bat-0.13.0/target/release/build/libloading-0c8de6c7b10afd2b/build-script-build`
(exit code: 1)
--- stdout
cargo:rustc-link-lib=dl
TARGET = Some("x86_64-unknown-linux-gnu")
OPT_LEVEL = Some("3")
HOST = Some("x86_64-unknown-linux-gnu")
CC_x86_64-unknown-linux-gnu = None
CC_x86_64_unknown_linux_gnu = None
HOST_CC = None
CC = Some("/home/naourr/buildroot/test/bat/host/bin/aarch64-none-linux-gnu-gcc")
CFLAGS_x86_64-unknown-linux-gnu = None
CFLAGS_x86_64_unknown_linux_gnu = None
HOST_CFLAGS = None
CFLAGS = Some("-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os  ")
CRATE_CC_NO_DEFAULTS = None
DEBUG = Some("false")
CARGO_CFG_TARGET_FEATURE = Some("fxsr,sse,sse2")
running: "/home/naourr/buildroot/test/bat/host/bin/aarch64-none-linux-gnu-gcc"
"-O3" "-ffunction-sections" "-fdata-sections" "-fPIC" "-m64"
"-D_LARGEFILE_SOURCE" "-D_LARGEFILE64_SOURCE" "-D_FILE_OFFSET_BITS=64" "-Os"
"-o"
"/home/naourr/buildroot/test/bat/build/bat-0.13.0/target/release/build/libloading-f48b6720ea7caaa6/out/src/os/unix/global_static.o"
"-c" "src/os/unix/global_static.c"
cargo:warning=aarch64-none-linux-gnu-gcc: error: unrecognized command line
option ?-m64?
exit code: 1

See:
https://stackoverflow.com/questions/54029117/why-is-the-target-environment-variable-reset-when-compiling-a-rust-program-in-a

Best regards,
Romain

> +
> +define BAT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(BAT_BIN_DIR)/bat \
> +		$(TARGET_DIR)/usr/bin/bat
> +endef
> +
> +$(eval $(generic-package))
> 
