From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 May 2020 21:30:41 +0200
Subject: [Buildroot] [PATCH] package/rustc: RUSTC_TARGET_NAME is needed
 to build host-rust
In-Reply-To: <20200508152739.1625844-1-romain.naour@gmail.com>
References: <20200508152739.1625844-1-romain.naour@gmail.com>
Message-ID: <20200517213041.1632c486@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 May 2020 17:27:39 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> As reported on bugzilla [1], the host-rust package fail when
> the target architecture or the target libc is not supported.
> 
> The error is the following:
> failed to parse TOML configuration 'config.toml': expected a table key, found a right bracket at line 15
> 
> In such case BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is
> not set thus RUSTC_TARGET_NAME is also not set [2].
> 
> But RUSTC_TARGET_NAME is needed to generate the file config.toml [3]
> 
> Add BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS in the host-rust
> dependency.
> 
> The commit [4] that allowed to select host-rust when the target
> architecture or the target libc is not supported, should have
> allowed to select only host-rustc-bin.
> 
> Fixes:
> Bug #12691
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=12691
> [2] https://git.buildroot.net/buildroot/tree/package/rustc/rustc.mk?h=2020.05-rc1#n10
> [3] https://git.buildroot.net/buildroot/tree/package/rust/rust.mk?h=2020.05-rc1#n41
> [4] 025b863e6facb7b219b82ee6ee7a7916c2c3c47e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Sam Voss <sam.voss@gmail.com>
> ---
>  package/rustc/Config.in.host | 3 +++
>  1 file changed, 3 insertions(+)

I have applied to master, because it's the most obvious workaround, but
I'm not sure to be entirely happy about it.

Indeed, the whole point of commit
025b863e6facb7b219b82ee6ee7a7916c2c3c47e was to ensure we could use
Rust as a host-only tool, even when the target architecture is not
supported by rust. This would allow to support building some host tools
that are written in Rust.

This is properly supported by the host-rust-bin package, which does not
install the target Rust library when
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is false.

Shouldn't the host-rust package be changed to also build just a host
compiler (without cross-compilation capabilities) ? Or is host-rust
anyway using host-rust-bin as the host compiler ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
