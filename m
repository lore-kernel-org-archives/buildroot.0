From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:33 +0200
Subject: [Buildroot] [Patch v5 0/7] Add support for the Rust programming
	language
Message-ID: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the Rust programming language by adding the
following packages:

 - rustc: a virtual package for the Rust compiler.
 - rust-bin: provides a pre-built version of rustc.
 - rust: builds rustc from source.

Both providers are able to cross-compile code for ARM, MIPS, PowerPC and
x86_64 architectures. Only the host variants are provided.

The rustc virtual package is inspired by the mysql one.

As the Rust compiler is written in Rust and uses Cargo, the Rust package
manager, as build system, two additional packages are provided: rust-bootstrap
and cargo-bootstrap.

v4 -> v5:

 - add rustc virtual package
 - add rust-bin, provider for rustc
 - rework rust to be a provider for rustc
 - rework some commit messages

v3 -> v4:

 - bump rust to 1.16.0
 - bump rust-bootstrap to 1.15.1
 - add cargo-bootstrap
 - use built-in target specifications
 - drop external Python script to generate target specifications
 - enable support for PowerPC
 - expose host variant in menuconfig

v2 -> v3:

 - bump rust to 1.10.0
 - rework and bump rust-bootstrap to 1.9.0
 - host-rust requires at least GCC 4.7 because of LLVM (suggested by R. Naour)
 - rust requires a glibc-based cross-compiler
 - rust requires GCC 5.x or above for Aarch64

v1 -> v2:

 - bump rust to version 1.9.0.
 - drop patch for bzip2 support in host-python.
 - add package for jemalloc.
 - add dependency on host being a x86 machine.
 - add dependency on toolchain.
 - use dedicated package to provide bootstrapping binary: rust-bootstrap.
 - let ./configure find out host/build on its own.
 - remove entry from configuration menu.
 - clarify some comments.
Eric Le Bihan (7):
  pkg-virtual: fix host dependencies handling
  rustc: new virtual package
  rust-bin: new package
  rustc: expose host variant in menuconfig
  rust-bootstrap: new package
  cargo-bootstrap: new package
  rust: new package

 DEVELOPERS                                   |  4 ++
 package/Config.in.host                       |  1 +
 package/cargo-bootstrap/cargo-bootstrap.hash |  3 ++
 package/cargo-bootstrap/cargo-bootstrap.mk   | 14 +++++
 package/pkg-virtual.mk                       |  4 ++
 package/rust-bin/rust-bin.hash               | 30 +++++++++++
 package/rust-bin/rust-bin.mk                 | 41 +++++++++++++++
 package/rust-bootstrap/rust-bootstrap.hash   |  5 ++
 package/rust-bootstrap/rust-bootstrap.mk     | 27 ++++++++++
 package/rust/rust.hash                       |  2 +
 package/rust/rust.mk                         | 77 ++++++++++++++++++++++++++++
 package/rustc/Config.in.host                 | 61 ++++++++++++++++++++++
 package/rustc/rustc.mk                       | 21 ++++++++
 13 files changed, 290 insertions(+)
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk
 create mode 100644 package/rust-bin/rust-bin.hash
 create mode 100644 package/rust-bin/rust-bin.mk
 create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
 create mode 100644 package/rust-bootstrap/rust-bootstrap.mk
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk
 create mode 100644 package/rustc/Config.in.host
 create mode 100644 package/rustc/rustc.mk

-- 
2.9.3
