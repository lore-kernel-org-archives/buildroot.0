From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  4 Feb 2018 19:07:39 +0100
Subject: [Buildroot] [PATCH v10 00/10] Add support for the Rust programming
 language
Message-ID: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the Rust programming language by adding the
following packages:

 - rustc: a virtual package for the Rust compiler.
 - rust-bin: provides a pre-built version of rustc.
 - cargo-bin: provides a pre-built version of Rust package manager.
 - rust: builds rustc from source.
 - cargo: builds Rust package manager from source.

Only the host variants are provided.

The rustc virtual package is inspired by the mysql one.

v9 -> v10:

 - add test cases in support/testing
 - add documentation about adding cargo-based packages
 - bump cargo to 0.24.0
 - bump rust to 1.23.0
 - bump cargo-bin to 0.24.0
 - bump rust-bin to 1.23.0
 - clarify origin of some hashes
 - reword some comments
 - use $(BR2_CMAKE_HOST_DEPENDENCY) wherever needed
 - move some options management from *.mk to Config.in

v8 -> v9:

 - replace giant patch by post-extract hook
 - drop rust-cargo virtual package
 - explicitly enable SSL support in host-libcurl

v7 -> v8:

 - replace cargo-bootstrap by cargo-bin
 - drop rust-bootstrap and use rust-bin instead
 - rust-bin and rust versions are the same
 - cargo-bin and cargo versions are the same
 - bump cargo to 0.23.0
 - bump rust to 1.22.1
 - add rust-cargo virtual package

v6 -> v7:

 - add cargo 0.20.0
 - bump rust to 1.19.0
 - bump rust-bootstrap to 1.18.0
 - bump cargo-bootstrap to 0.19.0
 - bump rust-bin to 1.19.0
 - fix mips64 target name in rustc

v5 -> v6:

 - bump rust to 1.18.0
 - bump rust-bootstrap to 1.17.0
 - bump rust-bin to 1.18.0

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

Eric Le Bihan (10):
  rustc: new virtual package
  rust-bin: new package
  cargo-bin: new package
  rust: new package
  libssh2: add host variant
  libhttpparser: add host variant
  libcurl: add host variant
  cargo: new package
  docs/manual: document cargo-based packages
  support/testing: add tests for Rust

 DEVELOPERS                                 |   4 ++
 docs/manual/adding-packages-cargo.txt      | 110 +++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt            |   2 +
 package/Config.in.host                     |   2 +
 package/cargo-bin/cargo-bin.hash           |   8 +++
 package/cargo-bin/cargo-bin.mk             |  13 ++++
 package/cargo/Config.in.host               |   8 +++
 package/cargo/cargo.hash                   |   8 +++
 package/cargo/cargo.mk                     |  91 ++++++++++++++++++++++++
 package/cargo/config.in                    |   2 +
 package/libcurl/libcurl.mk                 |  14 ++++
 package/libhttpparser/libhttpparser.mk     |   9 +++
 package/libssh2/libssh2.mk                 |   6 ++
 package/rust-bin/rust-bin.hash             |  33 +++++++++
 package/rust-bin/rust-bin.mk               |  61 ++++++++++++++++
 package/rust/rust.hash                     |   5 ++
 package/rust/rust.mk                       |  79 +++++++++++++++++++++
 package/rustc/Config.in.host               |  79 +++++++++++++++++++++
 package/rustc/rustc.mk                     |  20 ++++++
 support/testing/tests/package/test_rust.py | 107 ++++++++++++++++++++++++++++
 20 files changed, 661 insertions(+)
 create mode 100644 docs/manual/adding-packages-cargo.txt
 create mode 100644 package/cargo-bin/cargo-bin.hash
 create mode 100644 package/cargo-bin/cargo-bin.mk
 create mode 100644 package/cargo/Config.in.host
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in
 create mode 100644 package/rust-bin/rust-bin.hash
 create mode 100644 package/rust-bin/rust-bin.mk
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk
 create mode 100644 package/rustc/Config.in.host
 create mode 100644 package/rustc/rustc.mk
 create mode 100644 support/testing/tests/package/test_rust.py

--
2.14.3
