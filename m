From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 7 Feb 2020 15:19:57 -0600
Subject: [Buildroot] [PATCH v3 00/10] Merge rust and cargo
In-Reply-To: <20200207180829.165689-1-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
Message-ID: <CANQCQpaLJEZa4f6FjZ_v4GJ-F9nDNSn1=AAOrdu8tr6YEWoDCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


On Fri, Feb 7, 2020 at 12:09 PM Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
>
> The source code for Cargo, the build and package manager for Rust, is now
> shipped along with the compiler and standard library.
>
> So there can not be a standalone package for Cargo anymore.
>
> This series does the following:
> - move the installation of cargo config to toolchain post-install hook.
> - update host-rust to build and install Cargo.
> - install host-cargo-bin if host-rust-bin is selected instead of host-rust.
> - update dependencies for package(s) using Cargo.
> - remove cargo packaging.
> - update the packaging documentation.
> - bump rust (+cargo) to 1.40.
> - remove cargo-bin as well (now bundled with rust binaries).
>

Build and runtime tested (x86 32bit )

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> It was previously posted by Eric Le Bihan [1] and by Patrick Havelange
> [2]. I wanted to merge it, but I made some invasive changes (the first
> patch) so I'm reposting just to be sure.
>
> Regards,
> Arnout
>
> [1] http://patchwork.ozlabs.org/project/buildroot/list/?series=140900
> [2] http://patchwork.ozlabs.org/project/buildroot/list/?series=153317
>
> Arnout Vandecappelle (Essensium/Mind) (1):
>   package/rustc: install cargo config as toolchain post-install hook
>
> Eric Le Bihan (7):
>   package/rust: build and install cargo
>   package/cargo-bin: install if rust-bin selected
>   package/rust-bin: host variant depends on host-cargo-bin
>   package/rust: drop dependency on host-cargo-bin
>   package/ripgrep: depends on host-rustc
>   package/cargo: drop package
>   docs/manual: cargo packages depend on host-rustc
>
> Patrick Havelange (2):
>   package/rust: bump to 1.40
>   package/cargo-bin: remove and use cargo-bin from rust-bin package
>
>  DEVELOPERS                                    |   2 -
>  docs/manual/adding-packages-cargo.txt         |   4 +-
>  package/Config.in.host                        |   1 -
>  package/cargo-bin/cargo-bin.hash              |  13 -
>  package/cargo-bin/cargo-bin.mk                |  13 -
>  package/cargo/Config.in.host                  |   9 -
>  package/cargo/cargo.hash                      |   8 -
>  package/cargo/cargo.mk                        |  91 ------
>  package/ripgrep/Config.in                     |   2 +-
>  package/ripgrep/ripgrep.mk                    |   2 +-
>  package/rust-bin/rust-bin.hash                |  93 +++---
>  package/rust-bin/rust-bin.mk                  |  29 +-
>  ...esence-of-LLVM-library-in-stage0-lib.patch | 264 ------------------
>  package/rust/rust.hash                        |   6 +-
>  package/rust/rust.mk                          |   8 +-
>  .../config.in => rustc/cargo-config.in}       |   0
>  package/rustc/rustc.mk                        |  12 +
>  support/testing/tests/package/test_rust.py    |   2 -
>  18 files changed, 85 insertions(+), 474 deletions(-)
>  delete mode 100644 package/cargo-bin/cargo-bin.hash
>  delete mode 100644 package/cargo-bin/cargo-bin.mk
>  delete mode 100644 package/cargo/Config.in.host
>  delete mode 100644 package/cargo/cargo.hash
>  delete mode 100644 package/cargo/cargo.mk
>  delete mode 100644 package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch
>  rename package/{cargo/config.in => rustc/cargo-config.in} (100%)
>
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



--

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
