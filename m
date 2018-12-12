From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 12 Dec 2018 23:50:41 +0100
Subject: [Buildroot] Building cargo with per-package directories
In-Reply-To: <20181211212705.GA13119@itchy>
References: <20181211171252.02ddb571@windsurf> <20181211212705.GA13119@itchy>
Message-ID: <20181212225041.GA15035@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-12-11 22:27, Eric Le Bihan wrote:
> Hi!
> On 2018-12-11 17:12, Thomas Petazzoni wrote:
> > Hello ?ric,
> >
> > As you probably know, I'm working on support for per-package
> > directories, which will allow to do top-level parallel in a reliable
> > way. As part of this effort, I've started an autobuilder that uses
> > per-package directories, and one of the package that is failing a lot
> > is host-cargo.
> >
> > It fails like this:
> >
> >   = note: /usr/bin/ld: cannot find -lhttp_parser
> >           collect2: error: ld returned 1 exit status
> >
> > error: aborting due to previous error
> > error: Could not compile `cargo`.
> >
> > The problem is that while libhttp_parser gets built properly, cargo is
> > not passing the appropriate -L flag to cargo's per-package host/lib
> > directory. So the linker doesn't find the libhttp_parser library, and
> > bails out.
> >
> > I've tried to look into this, but really the cargo build system is very
> > unique and weird, and I'm having a hard time finding my way. Do you
> > think you could help me a bit on this topic ?
>
> Of course!
>
> >
> > To reproduce, you need a machine where libhttp_parser is not installed
> > system-wide (so either remove it from your system, or build in a
> > chroot/docker/VM). Then, take this branch:
> >
> >   https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v7-work
> >
> > And build the following defconfig:
> >
> > BR2_arm=y
> > BR2_cortex_a9=y
> > BR2_ARM_ENABLE_VFP=y
> > BR2_PER_PACKAGE_DIRECTORIES=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2018.05.tar.bz2"
> > BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > BR2_INIT_NONE=y
> > BR2_SYSTEM_BIN_SH_NONE=y
> > # BR2_PACKAGE_BUSYBOX is not set
> > # BR2_TARGET_ROOTFS_TAR is not set
> > BR2_PACKAGE_HOST_CARGO=y
> >
> > You should get this failure:
> >
> >   http://code.bulix.org/fxjgrv-520980?raw
> >
> > Thanks in advance for your support,
>
> I added your clone as remote, checked out ppsh-v7-work branch and
> launched a Debian Stretch chroot. I'll keep you posted on the result.

The build ended as expected.

```
  = note: /usr/bin/ld: cannot find -lhttp_parser
          collect2: error: ld returned 1 exit status
```

The library libhttp_parser.so is required by one of the dependencies of
cargo: libgit2-sys, which provides the Rust interface to libgit2.

There is trick in vendor/libgit2-sys/build.rs to handle
libhttp_parser.so: if the pkgconfig file of libgit2 contains -lhttp_parser,
then pass it to rustc via "cargo:rustc-link-lib=http_parser".

See "Outputs of the Build Script" in Cargo Book [1] for details.

We want to use per-package/host-cargo/host/lib/libhttp_parser.so. Adding
"-Clink-arg=-L$(HOST_DIR)/lib" to the RUSTFLAGS environment variable
solves the issue on my system:

```
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 1b1053ba41..891901578e 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -70,7 +70,7 @@ HOST_CARGO_SNAP_OPTS = \
 	$(if $(VERBOSE),--verbose)

 HOST_CARGO_ENV = \
-	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
+	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib -Clink-arg=-L$(HOST_DIR)/lib" \
 	CARGO_HOME=$(HOST_CARGO_HOME)

 define HOST_CARGO_BUILD_CMDS
```

[1] https://doc.rust-lang.org/cargo/reference/build-scripts.html#outputs-of-the-build-script

Regards,

--
ELB
