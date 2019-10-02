From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:39:35 +0200
Subject: [Buildroot] [PATCH] ripgrep: new package
In-Reply-To: <20191001013703.771049-1-sam.voss@gmail.com>
References: <20191001013703.771049-1-sam.voss@gmail.com>
Message-ID: <20191002213935.4aef345f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

+Eric Le Bihan on Cc to get some review on this cargo/rust related
package.

On Mon, 30 Sep 2019 20:37:03 -0500
sam.voss at gmail.com wrote:

> From: Sam Voss <sam.voss@gmail.com>
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>

The commit title should be "package/ripgrep: new package".


> diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
> new file mode 100644
> index 0000000000..b7eaf115ae
> --- /dev/null
> +++ b/package/ripgrep/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_RIPGREP
> +	bool "ripgrep"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS

I believe you need:

	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS

Indeed, I built on ARMv5, and it failed with:

PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/libexec/python3-sphinx:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo build --release --target= --manifest-path=/home/thomas/projets/buildroot/output/build/ripgrep-0.8.1/Cargo.toml
error: Couldn't load Cargo configuration

Caused by:
  could not parse TOML configuration in `/home/thomas/projets/buildroot/output/host/share/cargo/config`

Caused by:
  could not parse input as TOML

Caused by:
  expected a table key, found a right bracket at line 1
make[1]: *** [package/pkg-generic.mk:241: /home/thomas/projets/buildroot/output/build/ripgrep-0.8.1/.stamp_built] Error 101
make: *** [Makefile:84: _all] Error 2

This is due to RUSTC_TARGET_NAME being empty when
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is false.

Then you don't need the dependency on
BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS, because
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS depends on it.

> +	select BR2_PACKAGE_HOST_CARGO
> +	help
> +	  ripgrep is a line-oriented search tool that
> +	  recursively searches your current directory
> +	  for a regex pattern while respecting your gitignore
> +	  rules.
> +
> +	  ripgrep is similar to other popular search tools like
> +	  The Silver Searcher, ack and grep.
> +
> +	  https://github.com/BurntSushi/ripgrep
> diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
> new file mode 100644
> index 0000000000..d590bf66fa
> --- /dev/null
> +++ b/package/ripgrep/ripgrep.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz

Please include a hash for the license file.

> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> new file mode 100644
> index 0000000000..3bb4ca0604
> --- /dev/null
> +++ b/package/ripgrep/ripgrep.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# ripgrep
> +#
> +################################################################################
> +
> +RIPGREP_VERSION = 0.8.1
> +RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
> +RIPGREP_LICENSE = MIT
> +RIPGREP_LICENSE_FILES = LICENSE-MIT
> +
> +RIPGREP_DEPENDENCIES = host-cargo
> +RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> +RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
> +
> +RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
> +
> +RIPGREP_CARGO_OPTS = \
> +	--$(RIPGREP_CARGO_MODE) \
> +		--target=$(RUSTC_TARGET_NAME) \
> +		--manifest-path=$(@D)/Cargo.toml

Keep all lines aligned:

FOO = \
	baz \
	bar \
	foobaz

> +
> +define RIPGREP_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(RIPGREP_CARGO_ENV) \
> +		cargo build $(RIPGREP_CARGO_OPTS)
> +endef
> +
> +define RIPGREP_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(RIPGREP_BIN_DIR)/rg \
> +		$(TARGET_DIR)/usr/bin/rg
> +endef
> +
> +$(eval $(generic-package))

Could you fix those issues, and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
