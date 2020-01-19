From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 19 Jan 2020 22:31:02 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
Message-ID: <20200119213102.GA2894@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2020-01-18 19:46, Alex Corcoles wrote:
> Hi guys,
>
> I'm trying to build mipsel Rust stuff, and I've had to do this:
[...]
>
>  HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
>
> +RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
> +
[...]
> To advance things up (I'm currently compiling LLVM, apparently), as
> otherwise the config.toml created is wrong. I'm attaching the .config I'm
> using (I'm using the non-pre-built host rust- the pre-built one apparently
> doesn't have std).
>
> I certainly doubt what I'm doing is "correct", but maybe you guys want to
> take a look at it.

The RUSTC_TARGET_NAME variable is defined in rustc.mk only if the symbol
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is selected. This symbols is
used to ensure all the conditions to build a rust package are met. One
of them is that the toolchain is glibc-based. This is required, because
the standard library provided by the pre-built host Rust toolchain is
built against glibc.

In your defconfig, the toolchain is uclibc-based and the host Rust
toolchain is built from source.

Hence BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not defined and so
is RUSTC_TARGET_NAME.

So there is a bug: the restriction on having a glibc-based toolchain
should apply either when using a pre-built rust toolchain or building
one from source. I'll see how to fix it.

The list of supported platforms [1] mentions GNU glibc and musl, but not
uclibc. Does the build with your defconfig and patch successful?

[1] https://forge.rust-lang.org/release/platform-support.html

Regards,

--
ELB
