From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 21:37:02 +0100
Subject: [Buildroot] [PATCH v9 2/8] rust-bin: new package
In-Reply-To: <20171228155146.18193-3-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-3-eric.le.bihan.dev@free.fr>
Message-ID: <20171228213702.469a4358@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 16:51:40 +0100, Eric Le Bihan wrote:
> This package provides a pre-built version of rustc, the compiler for the
> Rust programming language, fetched from the upstream project.
> 
> A pre-built version of the standard library for the host as well as one
> for the chosen target are also fetched and installed.

I was wondering if a separate package could be used to install the
standard library, in order to avoid the extra downloads and custom
extract step.

One possibility would be to have a rust-std-bin package, which rust-bin
depends on. The target version of rust-std-bin would install the target
libraries, while the host version would install the host libraries. The
weird thing is that the target libraries are installed in $(HOST_DIR),
while one would expect them to be in $(STAGING_DIR). Is this something
we can tell rustc about perhaps ?

Even if we keep the single package approach, having the target
libraries in $(STAGING_DIR) would be more logical. But that's a soft
requirement, so if it's too tedious to achieve with rustc, we can live
with them being in HOST_DIR.

> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> new file mode 100644
> index 0000000000..29f94b7f2d
> --- /dev/null
> +++ b/package/rust-bin/rust-bin.mk
> @@ -0,0 +1,63 @@
> +################################################################################
> +#
> +# rust-bin
> +#
> +################################################################################
> +
> +RUST_BIN_VERSION = 1.22.1
> +RUST_BIN_SITE = https://static.rust-lang.org/dist
> +RUST_BIN_LICENSE = Apache-2.0 or MIT
> +RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +
> +HOST_RUST_BIN_PROVIDES = host-rustc
> +
> +HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
> +HOST_RUST_BIN_LIBSTD_SOURCES = \
> +	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz \
> +	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.xz
> +
> +HOST_RUST_BIN_EXTRA_DOWNLOADS = $(HOST_RUST_BIN_LIBSTD_SOURCES)

Assuming we keep the single package approach, then why not use
HOST_RUST_BIN_EXTRA_DOWNLOADS directly ? HOST_RUST_BIN_LIBSTD_SOURCES
looks a bit useless.

> +HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
> +
> +define HOST_RUST_BIN_LIBSTD_EXTRACT
> +	mkdir -p $(@D)/std
> +	for file in $(addprefix $(DL_DIR)/,$(HOST_RUST_BIN_LIBSTD_SOURCES)); do \
> +		$(TAR) -C $(@D)/std -xJf $${file}; \

This would benefit from using $(foreach ...) and should use
suitable-extractor. Something like (untested):

	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
		$(call suitable-extractor,$(f)) $(DL_DIR)/$(f) | \
			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
	)

> +	done
> +	(\
> +		cd $(@D)/rustc/lib/rustlib; \
> +		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME) \
> +	)

There's no need for this command to run in a sub-shell, so:

	cd $(@D)/rustc/lib/rustlib; \
		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME)

should be sufficient.

> +endef
> +
> +HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
> +
> +HOST_RUST_BIN_INSTALL_OPTS = \
> +	--prefix=$(HOST_DIR) \
> +	--disable-ldconfig
> +
> +ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)

Why do you have this conditional ? If the package isn't built, then
those definitions aren't used anyway.

The rest looks good to me. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
