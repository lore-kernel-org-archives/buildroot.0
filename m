From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:46:21 +0200
Subject: [Buildroot] [PATCH] package/sentry-cli: new package
In-Reply-To: <20200915205738.2144347-1-joseph.kogut@gmail.com>
References: <20200915205738.2144347-1-joseph.kogut@gmail.com>
Message-ID: <20200919224621.5ba27624@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 13:57:38 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Thanks, I have applied, after doing a number of changes. See below.

> diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
> new file mode 100644
> index 0000000000..b71f7f2f9b
> --- /dev/null
> +++ b/package/sentry-cli/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_SENTRY_CLI
> +	bool "sentry-cli"

Changed to:

	bool "host sentry-cli"

as pointed by Titouan.

> diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
> new file mode 100644
> index 0000000000..55bc03d1ec
> --- /dev/null
> +++ b/package/sentry-cli/sentry-cli.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# sentry-cli
> +#
> +################################################################################
> +
> +SENTRY_CLI_VERSION = 1.57.0
> +SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
> +SENTRY_CLI_LICENSE = BSD-3-clause
> +SENTRY_CLI_LICENSE_FILES = LICENSE
> +
> +SENTRY_CLI_DEPENDENCIES = host-rustc
> +
> +HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> +
> +HOST_SENTRY_CLI_BIN_DIR = target/$(SENTRY_CLI_CARGO_BIN_SUBDIR)/

This was not needed, I'll explain below why.

> +
> +HOST_SENTRY_CLI_CARGO_OPTS = \
> +	$(if $(BR2_ENABLE_DEBUG),,--release) \

BR2_ENABLE_DEBUG affects target packages, but not host packages. We
build host packages in release mode only, so I've made this an
unconditional --release.

And this explains why HOST_SENTRY_CLI_BIN_DIR was not needed: it is
always target/release/.

> +	--manifest-path=$(@D)/Cargo.toml
> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +SENTRY_CLI_CARGO_BIN_SUBDIR = debug
> +else
> +SENTRY_CLI_CARGO_OPTS += --release
> +SENTRY_CLI_CARGO_BIN_SUBDIR = release
> +endif

This was not needed, and was anyway setting variables that were not
used anywhere.

> +
> +define HOST_SENTRY_CLI_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \

When building a host package, HOST_MAKE_ENV should be used, not
TARGET_MAKE_ENV.

> +		cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
> +endef
> +
> +define HOST_SENTRY_CLI_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(HOST_SENTRY_CLI_BIN_DIR)/sentry-cli \

So I've used target/release/ instead of $(HOST_SENTRY_CLI_BIN_DIR)

> +		$(HOST_DIR)/bin

You need a full destination path, i.e $(HOST_DIR)/bin/sentry-cli

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
