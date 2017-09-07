From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 7 Sep 2017 22:20:46 +0200
Subject: [Buildroot] [Patch v7 10/10] cargo: new package
In-Reply-To: <ba572cc7-0e55-3ef0-a6a6-a9fb930f1cf8@mind.be>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-11-eric.le.bihan.dev@free.fr>
 <ba572cc7-0e55-3ef0-a6a6-a9fb930f1cf8@mind.be>
Message-ID: <20170907202046.GE6001@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-08-11 01:58:34, Arnout Vandecappelle wrote:
>  I didn't do a thorough review of this one...
>
> On 23-07-17 10:12, Eric Le Bihan wrote:
> > This new package provides Cargo, the Rust official package manager.
> > Cargo is written in Rust and uses Cargo as its build system. It also
> > depends on other Rust packages.
>
>  Since we already have cargo-bootstrap anyway, could we do the same as for
> rustc, and have a cargo-bin instead of cargo-bootstrap package that the user
> could select directly? Or is the binary version never going to be adequate for
> real use?

Previously, the cargo bootstrap binary was not hosted on rust-lang.org,
and looked like being disposable. Now it is hosted along with rustc and
rust-std. It is a bigger than a compiled version, as it is statically
linked against libcurl and libssh2. So AFAIK, cargo-boostrap could be
converted to cargo-bin.

> >
> > Normally, a previously installed version of Cargo would be used to:
> >
> >  1. Fetch the dependencies.
> >  2. Build the new version of Cargo, using the available Rust compiler.
> >
> > But the fetching step prevents offline builds. So instead two features
> > of Cargo are levelled: vendoring [1] and local registry.
> >
> > First, a tarball of the build dependencies generated using `cargo
> > vendor` is fetched along with Cargo source code.
> >
> > Then, the build process is as follows:
> >
> >  1. The tarball of the build dependencies is uncompressed in a local
> >     registry.
> >  2. A snapshot of Cargo, provided by cargo-bootstrap, builds the final
> >     version of Cargo.
> >  3. A configuration file telling Cargo how to cross-compile programs for
> >     the target is generated and installed.
>
> [snip]
> > +CARGO_VERSION = 0.20.0
> > +CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
> > +CARGO_LICENSE = Apache-2.0 or MIT
> > +CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > +
> > +CARGO_DEPS_SITE = http://pkgs.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)
> > +CARGO_DEPS_SHA512 = 0e44ff3fd9c74c595220ea9a53867457cafa797302d0591ddf5f8f02ad021273d012413b45398799700eea9ae471804412fde4525406c5eb5b6f4b69e93594ed
>
>  Swap these two lines.
>
>  It would also be good to explain what this is, and why it can't be a separate
> package (but maybe it could be a separate package?), and why we fetch from
> Fedora instead of crates.io.

Cargo depends on 97 crates from crates.io. IMHO, adding so many
packages to Buildroot to build a host tool is not very sensible.

In a previous (unpublished) version of my cargo patch, I used a
post-download hook to fetch the dependencies from crates.io and fill the
local crate registry. But this does not fit for offline builds.

The `cargo vendor` command has been added to allow offline builds of
Rust programs. Debian and Fedora have chosen to use an archive of the
`cargo vendor` output, so I jumped on that train.

> > +CARGO_DEPS_SOURCE = cargo-$(CARGO_VERSION)-vendor.tar.xz
> > +
> > +CARGO_INSTALLER_VERSION = 4f994850808a572e2cc8d43f968893c8e942e9bf
> > +CARGO_INSTALLER_SITE = https://github.com/rust-lang/rust-installer/archive/$(CARGO_INSTALLER_VERSION)
>
>  github helper?

Of course!

> > +CARGO_INSTALLER_SOURCE = rust-installer-$(CARGO_INSTALLER_VERSION).tar.gz
> > +
> > +HOST_CARGO_EXTRA_DOWNLOADS = \
> > +	$(CARGO_DEPS_SITE)/$(CARGO_DEPS_SOURCE) \
> > +	$(CARGO_INSTALLER_SITE)/$(CARGO_INSTALLER_SOURCE)
> > +
> > +HOST_CARGO_DEPENDENCIES = \
> > +	host-cmake \
> > +	host-pkgconf \
> > +	host-openssl \
> > +	host-libhttpparser \
> > +	host-libssh2 \
> > +	host-libcurl \
> > +	host-rustc \
> > +	host-cargo-bootstrap
> > +
> > +HOST_CARGO_SNAP_BIN = $(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo
> > +HOST_CARGO_HOME = $(HOST_DIR)/share/cargo
> > +
> > +define HOST_CARGO_EXTRACT_DEPS
> > +	@mkdir -p $(@D)/vendor
> > +	$(call suitable-extractor,$(CARGO_DEPS_SOURCE)) \
> > +		$(DL_DIR)/$(CARGO_DEPS_SOURCE) | \
> > +		$(TAR) --strip-components=1 -C $(@D)/vendor $(TAR_OPTIONS) -
> > +endef
> > +
> > +HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_DEPS
> > +
> > +define HOST_CARGO_EXTRACT_INSTALLER
> > +	@mkdir -p $(@D)/src/rust-installer
> > +	$(call suitable-extractor,$(CARGO_INSTALLER_SOURCE)) \
> > +		$(DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
> > +		$(TAR) --strip-components=1 -C $(@D)/src/rust-installer $(TAR_OPTIONS) -
> > +endef
> > +
> > +HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_INSTALLER
> > +
> > +define HOST_CARGO_SETUP_DEPS
> > +	mkdir -p $(@D)/.cargo
> > +	(cd $(@D)/.cargo; \
> > +		echo "[source.crates-io]" > config; \
> > +		echo "registry = 'https://github.com/rust-lang/crates.io-index'" >> config; \
> > +		echo "replace-with = 'vendored-sources'" >> config; \
> > +		echo >> config; \
> > +		echo "[source.vendored-sources]" >> config; \
> > +		echo "directory = '$(@D)/vendor'" >> config; \
> > +	)
> > +endef
> > +
> > +HOST_CARGO_PRE_CONFIGURE_HOOKS += HOST_CARGO_SETUP_DEPS
> > +
> > +HOST_CARGO_SNAP_OPTS = --release
> > +HOST_CARGO_SNAP_OPTS += $(if $(VERBOSE),--verbose)
> > +
> > +HOST_CARGO_ENV = \
> > +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> > +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> > +	PKG_CONFIG_SYSROOT_DIR="/" \
> > +	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
>
>  How does this differ from HOST_MAKE_ENV?

Yes. The PKG_CONFIG* variables are redundant and can be removed.

> > +	CARGO_HOME=$(HOST_DIR)/share/cargo
> > +
> > +define HOST_CARGO_BUILD_CMDS
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(HOST_CARGO_SNAP_BIN) \
> > +		build $(HOST_CARGO_SNAP_OPTS))
> > +endef
> > +
> > +define HOST_CARGO_INSTALL_CMDS
> > +	$(INSTALL) -d -m 0755 $(HOST_DIR)/bin
> > +	$(INSTALL) -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
> > +endef
> > +
> > +define HOST_CARGO_INSTALL_CONF_FILE
> > +	$(INSTALL) -D package/cargo/config.in \
> > +		$(HOST_DIR)/share/cargo/config
> > +	$(SED) 's/@RUST_TARGET_NAME@/$(RUST_TARGET_NAME)/' \
> > +		$(HOST_DIR)/share/cargo/config
> > +	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
> > +		$(HOST_DIR)/share/cargo/config
> > +endef
> > +
> > +HOST_CARGO_POST_INSTALL_HOOKS += HOST_CARGO_INSTALL_CONF_FILE
> > +
> > +# No *RPATH tag is set in the Cargo binary, so provide a wrapper to find the
> > +# shared libraries
> > +define HOST_CARGO_INSTALL_WRAPPER
> > +	mv $(HOST_DIR)/bin/cargo $(HOST_DIR)/bin/cargo.real
> > +	$(INSTALL) -m 0755 package/cargo/cargo.in \
> > +		$(HOST_DIR)/bin/cargo
> > +	$(SED) 's;@HOST_DIR@;$(HOST_DIR);g' $(HOST_DIR)/bin/cargo
> > +endef
>
>  Where are the shared libs installed? How come that the cargo binary from
> cargo-bootstrap doesn't need this hack? How come the -Wl,-rpath,$(HOST_DIR)/lib
> we pass in HOST_LDFLAGS doesn't work? Possibly you just forgot to pass HOST_LDFLAGS?

Cargo will need the shared libs for libcurl and libssh2. The binary from
cargo-bootstrap is statically linked.

The build system does not handle LDFLAGS, but adding the following line
to $(HOST_CARGO_ENV) does the trick and thus allow removing the
wrapper:

    RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib"

--
ELB
