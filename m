From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 2 Jan 2018 18:49:38 +0100
Subject: [Buildroot] [PATCH v9 8/8] cargo: new package
In-Reply-To: <20171228223238.69698252@windsurf>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-9-eric.le.bihan.dev@free.fr>
 <20171228223238.69698252@windsurf>
Message-ID: <20180102174938.GA22123@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-28 22:32:38, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 28 Dec 2017 16:51:46 +0100, Eric Le Bihan wrote:
> > This new package provides Cargo, the Rust official package manager.
> > Cargo is written in Rust and uses Cargo as its build system. It also
> > depends on other Rust packages.
> >
> > Normally, a previously installed version of Cargo would be used to:
> >
> >  1. Fetch the dependencies.
> >  2. Build the new version of Cargo, using the available Rust compiler.
> >
> > But the fetching step prevents offline builds. So instead two features
> > of Cargo are levelled: vendoring [1] and local registry.
>
> Did you want to say "leveraged" instead of "levelled" ?

That's the word I was looking for!

> > diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
> > new file mode 100644
> > index 0000000000..0f1ca305c6
> > --- /dev/null
> > +++ b/package/cargo/Config.in.host
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_HOST_CARGO
> > +	bool "host cargo"
> > +	depends on BR2_PACKAGE_HAS_HOST_RUSTC
> > +	help
> > +	  Cargo is the package manager for the Rust programming
> > +	  language.
> > +
> > +	  https://crates.io/
>
> How would "host cargo" be used in the context of Buildroot ? Would it
> be used by packages that are written in Rust as part of their build
> process ? What would such packages look like ?

I will add a new file named docs/manual/adding-packages-rust.txt to
document Cargo usage, with an example for adding a package for a Rust
program.

> > diff --git a/package/cargo/cargo.hash b/package/cargo/cargo.hash
> > new file mode 100644
> > index 0000000000..2b2ae43f6b
> > --- /dev/null
> > +++ b/package/cargo/cargo.hash
> > @@ -0,0 +1,4 @@
> > +# Locally generated
> > +sha256 f4bbe2a8719dbb8da20842235093f7f70f034d01633189e83f75897d68cd274f  cargo-0.23.0.tar.gz
> > +sha512 9060ec6e67b54f7fad7da8dd8450dd051d62b3f8ed4606196fc238a98beba1c3b43087c787f35d012d9b641c8572e70f50b95b0e01fdd75ed82932b6e6efbbf0  cargo-0.23.0-vendor.tar.xz
> > +sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
>
> Why are you using sha256 sometimes, and sha512 sometimes? Seems like
> for the cargo-0.23.0-vendor tarball, the hash is not exactly locally
> generated, but really comes from upstream.

Yes, the SHA512 comes from upstream, so I'll add its source URL and keep
SHA256 for the locally generated ones.

> > +HOST_CARGO_DEPENDENCIES = \
> > +	host-cmake \
>
> Do you need host-cmake absolutely here, or can you use
> $(BR2_CMAKE_HOST_DEPENDENCY) instead ?

$(BR2_CMAKE_HOST_DEPENDENCY) should do the trick.

> > +	host-pkgconf \
> > +	host-openssl \
> > +	host-libhttpparser \
> > +	host-libssh2 \
> > +	host-libcurl \
> > +	host-rustc \
> > +	host-cargo-bin
> > +
> > +HOST_CARGO_SNAP_BIN = $(HOST_CARGO_BIN_DIR)/cargo/bin/cargo
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
> > +	( \
> > +		echo "[source.crates-io]"; \
> > +		echo "registry = 'https://github.com/rust-lang/crates.io-index'"; \
> > +		echo "replace-with = 'vendored-sources'"; \
> > +		echo "[source.vendored-sources]"; \
> > +		echo "directory = '$(@D)/vendor'"; \
> > +	) > $(@D)/.cargo/config
> > +endef
> > +
> > +HOST_CARGO_PRE_CONFIGURE_HOOKS += HOST_CARGO_SETUP_DEPS
> > +
> > +HOST_CARGO_SNAP_OPTS = --release
> > +HOST_CARGO_SNAP_OPTS += $(if $(VERBOSE),--verbose)
>
> A single assignment would be prettier:
>
> HOST_CARGO_SNAP_OPTS = \
> 	--release \
> 	$(if $(VERBOSE),--verbose)

OK.

> > +HOST_CARGO_ENV = \
> > +	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
> > +	CARGO_HOME=$(HOST_DIR)/share/cargo
>
> Why don't you use $(HOST_CARGO_HOME) here ?

Leftover for previous patch version.

> > +define HOST_CARGO_BUILD_CMDS
> > +	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(HOST_CARGO_SNAP_BIN) \
> > +		build $(HOST_CARGO_SNAP_OPTS))
> > +endef
> > +
> > +define HOST_CARGO_INSTALL_CMDS
> > +	$(INSTALL) -d -m 0755 $(HOST_DIR)/bin
>
> This is not needed, just use the -D option in the command command
> installing the cargo binary.

Of course!

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
>
> This should be moved inside HOST_CARGO_INSTALL_CMDS, there is no need
> for a separate post-install hook.
>
> Also, I'm wondering of your choice between generating config files from
> the .mk file, or having a template that gets tweaked using SED. In this
> cargo.mk, you are producing a 5 lines file in HOST_CARGO_SETUP_DEPS
> where only a single value varies (and would need to be tweaked with
> sed). But on the other hand, you create a two lines share/cargo/config
> file from a template. Perhaps we should settle on one or the other
> solution ?

For the Meson cross-compilation configuration file, I used a
template/sed combination as some values were used multiple times. So
generating it from the .mk file would have decreased its readability.
Besides it is a file to be installed in $(HOST_DIR), so it is
"important".

As $(HOST_DIR)/share/cargo/config belongs to the same category, I used
the same method, though the file is (currently?) less complex.

On the other side $(@D)/.cargo/config file is just some kind of build
artefact, with a limited lifetime. Hence the generation from the .mk
file.

Is there a general rule?

Regards,

--
ELB
