From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Sep 2019 21:22:53 +0200
Subject: [Buildroot] [PATCH 0/6] Cargo virtual and Rust 1.38.0
In-Reply-To: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
Message-ID: <e6d594bc-f2e1-fb71-a2c4-5e88a4a05d28@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/09/2019 19:16, Eric Le Bihan wrote:
> Cargo source code is not provided anymore as a separate tarball but is now
> built along with the Rust compiler.
> 
> This patch series converts cargo to a virtual package and declare cargo-bin
> and rust are providers. Versions for each package are also bumped to latest
> ones.

 Why do we need the virtual package? I would think that cargo just becomes a
sub-option of rust. Or, given how cargo and rust really go hand in hand, we
could just remove the cargo package entirely and always build cargo as part of
rust. For host packages, we don't care about size (too much), the only possible
issue is build time. But I expect building rust with cargo isn't going to be
that much longer.

> 
> Eric Le Bihan (6):
>   package/cargo: convert to virtual package
>   package/cargo-bin: declare as cargo provider
>   package/rust: declare as cargo provider

 You can't do this until the version has been bumped, because in the current
version (AFAIU) rust doesn't have the cargo sources yet.

 In other words, it has to go in the same patch that bumps rust.

 Regards,
 Arnout

>   package/cargo-bin: bump version to 0.38.0
>   package/rust-bin: bump version to 1.38.0
>   package/rust: bump version to 1.38.0
> 
>  package/cargo-bin/cargo-bin.hash              |  18 +-
>  package/cargo-bin/cargo-bin.mk                |  10 +-
>  package/cargo/Config.in.host                  |  38 ++-
>  package/cargo/cargo.mk                        |  79 +-----
>  package/rust-bin/rust-bin.hash                |  90 +++---
>  package/rust-bin/rust-bin.mk                  |   2 +-
>  ...esence-of-LLVM-library-in-stage0-lib.patch | 264 ------------------
>  ...disabling-deny-warnings-for-bootstra.patch | 116 ++++++++
>  package/rust/rust.hash                        |   6 +-
>  package/rust/rust.mk                          |  26 +-
>  10 files changed, 245 insertions(+), 404 deletions(-)
>  delete mode 100644 package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch
>  create mode 100644 package/rust/0001-rustbuild-allow-disabling-deny-warnings-for-bootstra.patch
> 
> --
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
