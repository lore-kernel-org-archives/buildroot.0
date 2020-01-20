From: Alex Corcoles <alex@corcoles.net>
Date: Mon, 20 Jan 2020 17:31:05 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <20200119213102.GA2894@ned>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
 <20200119213102.GA2894@ned>
Message-ID: <CAPAYC_xA2zkmmADgr9G2mspcS=Ej16wOM75rT-aCKbK42hzk5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

The RUSTC_TARGET_NAME variable is defined in rustc.mk only if the symbol
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is selected. This symbols is
> used to ensure all the conditions to build a rust package are met. One
> of them is that the toolchain is glibc-based. This is required, because
> the standard library provided by the pre-built host Rust toolchain is
> built against glibc.
>
> In your defconfig, the toolchain is uclibc-based and the host Rust
> toolchain is built from source.
>
> Hence BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not defined and so
> is RUSTC_TARGET_NAME.
>
> So there is a bug: the restriction on having a glibc-based toolchain
> should apply either when using a pre-built rust toolchain or building
> one from source. I'll see how to fix it.
>
> The list of supported platforms [1] mentions GNU glibc and musl, but not
> uclibc. Does the build with your defconfig and patch successful?
>
> [1] https://forge.rust-lang.org/release/platform-support.html
>

I think I built it successfully after introducing my hack, but as far as I
understand, it is not guaranteed to build in the future (and the opposite
is true, perhaps if it doesn't build today, it will tomorrow). In the link
you sent, mipsel-unknown-linux-uclibc is Tier 3 with std.

If I have some time I will play around with it and see you some results.

IMHO, perhaps you should hide non Tier-1 platforms behind an "enable this
option for non-Tier 1 Rust builds which are not guaranteed to work", or
something like that.

Cheers,

?lex

-- 
   ___
 {~._.~}
  ( Y )
 ()~*~()  mail: alex at corcoles dot net
 (_)-(_)  http://alex.corcoles.net/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200120/bc14caa5/attachment.html>
