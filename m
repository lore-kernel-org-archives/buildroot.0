From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  7 Feb 2020 19:08:19 +0100
Subject: [Buildroot] [PATCH v3 00/10] Merge rust and cargo
Message-ID: <20200207180829.165689-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The source code for Cargo, the build and package manager for Rust, is now
shipped along with the compiler and standard library.

So there can not be a standalone package for Cargo anymore.

This series does the following:
- move the installation of cargo config to toolchain post-install hook.
- update host-rust to build and install Cargo.
- install host-cargo-bin if host-rust-bin is selected instead of host-rust.
- update dependencies for package(s) using Cargo.
- remove cargo packaging.
- update the packaging documentation.
- bump rust (+cargo) to 1.40.
- remove cargo-bin as well (now bundled with rust binaries).

It was previously posted by Eric Le Bihan [1] and by Patrick Havelange
[2]. I wanted to merge it, but I made some invasive changes (the first
patch) so I'm reposting just to be sure.

Regards,
Arnout

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=140900
[2] http://patchwork.ozlabs.org/project/buildroot/list/?series=153317

Arnout Vandecappelle (Essensium/Mind) (1):
  package/rustc: install cargo config as toolchain post-install hook

Eric Le Bihan (7):
  package/rust: build and install cargo
  package/cargo-bin: install if rust-bin selected
  package/rust-bin: host variant depends on host-cargo-bin
  package/rust: drop dependency on host-cargo-bin
  package/ripgrep: depends on host-rustc
  package/cargo: drop package
  docs/manual: cargo packages depend on host-rustc

Patrick Havelange (2):
  package/rust: bump to 1.40
  package/cargo-bin: remove and use cargo-bin from rust-bin package

 DEVELOPERS                                    |   2 -
 docs/manual/adding-packages-cargo.txt         |   4 +-
 package/Config.in.host                        |   1 -
 package/cargo-bin/cargo-bin.hash              |  13 -
 package/cargo-bin/cargo-bin.mk                |  13 -
 package/cargo/Config.in.host                  |   9 -
 package/cargo/cargo.hash                      |   8 -
 package/cargo/cargo.mk                        |  91 ------
 package/ripgrep/Config.in                     |   2 +-
 package/ripgrep/ripgrep.mk                    |   2 +-
 package/rust-bin/rust-bin.hash                |  93 +++---
 package/rust-bin/rust-bin.mk                  |  29 +-
 ...esence-of-LLVM-library-in-stage0-lib.patch | 264 ------------------
 package/rust/rust.hash                        |   6 +-
 package/rust/rust.mk                          |   8 +-
 .../config.in => rustc/cargo-config.in}       |   0
 package/rustc/rustc.mk                        |  12 +
 support/testing/tests/package/test_rust.py    |   2 -
 18 files changed, 85 insertions(+), 474 deletions(-)
 delete mode 100644 package/cargo-bin/cargo-bin.hash
 delete mode 100644 package/cargo-bin/cargo-bin.mk
 delete mode 100644 package/cargo/Config.in.host
 delete mode 100644 package/cargo/cargo.hash
 delete mode 100644 package/cargo/cargo.mk
 delete mode 100644 package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch
 rename package/{cargo/config.in => rustc/cargo-config.in} (100%)

-- 
2.24.1
