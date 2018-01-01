From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 1 Jan 2018 21:13:31 +0100
Subject: [Buildroot] [PATCH v9 2/8] rust-bin: new package
In-Reply-To: <20171228213702.469a4358@windsurf>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-3-eric.le.bihan.dev@free.fr>
 <20171228213702.469a4358@windsurf>
Message-ID: <20180101201331.GB7252@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-28 21:37:02, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 28 Dec 2017 16:51:40 +0100, Eric Le Bihan wrote:
> > This package provides a pre-built version of rustc, the compiler for the
> > Rust programming language, fetched from the upstream project.
> >
> > A pre-built version of the standard library for the host as well as one
> > for the chosen target are also fetched and installed.
>
> I was wondering if a separate package could be used to install the
> standard library, in order to avoid the extra downloads and custom
> extract step.
>
> One possibility would be to have a rust-std-bin package, which rust-bin
> depends on. The target version of rust-std-bin would install the target
> libraries, while the host version would install the host libraries. The
> weird thing is that the target libraries are installed in $(HOST_DIR),
> while one would expect them to be in $(STAGING_DIR). Is this something
> we can tell rustc about perhaps ?

The idea of having a separate package for the standard library was
previously mentionned. The pros for it were the following:

 - smaller/cleaner packages
 - as Rust programs can be built without the standard library (e.g. for
   bare metal and microcontrollers), allowing the user to select the
   standard library separately looks sensible.

However, as a virtual package is used for the host Rust compiler (with
host-rust and host-rust-bin as its providers), does adding a separate
package for the binary standard library implies adding a virtual package
for the standard library too?

We would have:

 - host-rustc: virtual package for Rust compiler
 - host-rust-std: virtual package for Rust standard library
 - host-rustc-bin: provider for host-rustc (binary)
 - host-rust-std-bin: provider for host-rust-std (binary)
 - host-rust: provider for host-rustc and host-rust-std (built from source)

Would not that lead to too many compiler/library combinations?

Besides, compiling a program without standard library relies on a
compiler directive in the source code, so having a selectable standard
library package does not look that necessary from a user point of view.

So, to me, there are two options:

a) the current one:

  - host-rustc: virtual package for the compiler
  - host-rust-bin: provides host-rustc and standard library (binary)
  - host-rust: provides host-rustc and standard library (built from source)

b) a potentially cleaner version:

  - host-rustc: virtual package for the compiler
  - host-rustc-bin: provides host-rustc (binary), formerly known as
    host-rust-bin (renamed for clarity)
  - host-rust-std-bin: provides standard library (binary), a new dependency
    for host-rustc-bin, not selectable at user level.
  - host-rust: provides host-rustc and standard library (built from source)

> Even if we keep the single package approach, having the target
> libraries in $(STAGING_DIR) would be more logical. But that's a soft
> requirement, so if it's too tedious to achieve with rustc, we can live
> with them being in HOST_DIR.

The standard library tarball provides *.rlib (static Rust libraries) and
*.so (dynamic Rust libraries) files. The path to these files can be
passed to rustc using the --sysroot command line option, which can be
passed to Cargo (Rust package manager) by using the environment variable
RUSTFLAGS or the "rustflags" parameter in $(HOST_DIR)/share/cargo/config.

So it should be possible to relocate files from
$(HOST_DIR)/lib/rustlib/$(RUST_TARGET_NAME) to
$(STAGING_DIR)/lib/rustlib/$(RUST_TARGET_NAME):

- host-rust(-std)-bin: straightforward (change command line option to
  installation script).
- host-rust: install everything to $(HOST_DIR), then move target libraries to
  $(STAGING_DIR)

By default, all Rust programs are statically linked with the standard
library. It is possible to link dynamically [1] and in that case the
*.so files should indeed be copied to $(TARGET_DIR). So maybe in the
future support for $(BR2_SHARED_LIBS) should be added to handle this.

IMHO, the standard library should be managed more like libgcc.so than
glibc/uclibc/musl. (Things would have been simpler if there has been an
easy way to build the cross-compiled standard library separately from
the compiler).

> > diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> > new file mode 100644
> > index 0000000000..29f94b7f2d
> > --- /dev/null
> > +++ b/package/rust-bin/rust-bin.mk
> > @@ -0,0 +1,63 @@
> > +################################################################################
> > +#
> > +# rust-bin
> > +#
> > +################################################################################
> > +
> > +RUST_BIN_VERSION = 1.22.1
> > +RUST_BIN_SITE = https://static.rust-lang.org/dist
> > +RUST_BIN_LICENSE = Apache-2.0 or MIT
> > +RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > +
> > +HOST_RUST_BIN_PROVIDES = host-rustc
> > +
> > +HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
> > +HOST_RUST_BIN_LIBSTD_SOURCES = \
> > +	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz \
> > +	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.xz
> > +
> > +HOST_RUST_BIN_EXTRA_DOWNLOADS = $(HOST_RUST_BIN_LIBSTD_SOURCES)
>
> Assuming we keep the single package approach, then why not use
> HOST_RUST_BIN_EXTRA_DOWNLOADS directly ? HOST_RUST_BIN_LIBSTD_SOURCES
> looks a bit useless.

OK.

> > +HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
> > +
> > +define HOST_RUST_BIN_LIBSTD_EXTRACT
> > +	mkdir -p $(@D)/std
> > +	for file in $(addprefix $(DL_DIR)/,$(HOST_RUST_BIN_LIBSTD_SOURCES)); do \
> > +		$(TAR) -C $(@D)/std -xJf $${file}; \
>
> This would benefit from using $(foreach ...) and should use
> suitable-extractor. Something like (untested):
>
> 	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
> 		$(call suitable-extractor,$(f)) $(DL_DIR)/$(f) | \
> 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
> 	)

OK.

> > +	done
> > +	(\
> > +		cd $(@D)/rustc/lib/rustlib; \
> > +		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME) \
> > +	)
>
> There's no need for this command to run in a sub-shell, so:
>
> 	cd $(@D)/rustc/lib/rustlib; \
> 		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME)
>
> should be sufficient.

OK.

> > +endef
> > +
> > +HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
> > +
> > +HOST_RUST_BIN_INSTALL_OPTS = \
> > +	--prefix=$(HOST_DIR) \
> > +	--disable-ldconfig
> > +
> > +ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)
>
> Why do you have this conditional ? If the package isn't built, then
> those definitions aren't used anyway.
>
> The rest looks good to me. Thanks!

The idea is to define the installation commands only if the package is
selected at user level. This is the trick to use this package as a
bootstrap compiler to build Rust from source: in that case, this package
is added as a dependency and not selected at user level, so it is
downloaded and extracted but not installed in $(HOST_DIR). This prevents
polluting $(HOST_DIR) by installing rust-bin then rust on top of it.

[1] http://www.elebihan.com/posts/generating-dynamically-linked-programs-with-cargo.html

Regards,

--
ELB
