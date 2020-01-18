From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 22:27:56 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
Message-ID: <20200118212756.GG32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2020-01-18 19:46 +0100, Alex Corcoles spake thusly:
> Hi guys,
> I'm trying to build mipsel Rust stuff, and I've had to do this:
> 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<
> From 8c3f68a687b4f94a7c2e20e2020fd1e6f9e2c414 Mon Sep 17 00:00:00 2001
> From: alex < [1]alex@pdp7.net>
> Date: Sat, 18 Jan 2020 19:24:57 +0100
> Subject: [PATCH 1/1] Set RUSTC_TARGET_NAME
> 
> Signed-off-by: alex < [2]alex@pdp7.net>
> ---
> ?package/rust/ [3]rust.mk | 2 ++
> ?1 file changed, 2 insertions(+)
> 
> diff --git a/package/rust/ [4]rust.mk b/package/rust/ [5]rust.mk
> index 5d14fc6682..258daef331 100644
> --- a/package/rust/ [6]rust.mk
> +++ b/package/rust/ [7]rust.mk
> @@ -38,6 +38,8 @@ endef
> ?
> ?HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
> ?
> +RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)

RUSTC_TARGET_NAME is defined in package/rustc/rustc.mk:

    10 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
    11 RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
    12 endif

So, it is only defined if BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is
set, and this is defined in package/rustc/Config.in.host. It needs a
glibc toolchain (and an x86 or x86_64 host machine).

But your configuration uses uClibc-ng, not glibc, so this is the reason
that it does not work for you.

If you believe the dependency on glibc is too stringent, then this is
the place to fix stuff, not redefine the variable as you suggested.

Regards,
Yann E. MORIN.

> ?define HOST_RUST_CONFIGURE_CMDS
> ? ( \
> ? echo '[build]'; \
> --
> 2.20.1
> 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<
> To advance things up (I'm currently compiling LLVM, apparently), as otherwise the config.toml created is wrong. I'm attaching the
> .config I'm using (I'm using the non-pre-built host rust- the pre-built one apparently doesn't have std).
> I certainly doubt what I'm doing is "correct", but maybe you guys want to take a look at it.
> BTW, tried to cc: Eric as instructed by get-developers, but mail to him bounced...
> Cheers,
> ?lex
> --
> ? ?___
> ?{~._.~}
> ? ( Y )
> ?()~*~()? mail: alex at corcoles dot net
> ?(_)-(_) ? [8]http://alex.corcoles.net/
> 
> --
> ? ?___
> ?{~._.~}
> ? ( Y )
> ?()~*~()? mail: alex at corcoles dot net
> ?(_)-(_) ? [9]http://alex.corcoles.net/
> 
> Links:
> 1. mailto:alex at pdp7.net
> 2. mailto:alex at pdp7.net
> 3. http://rust.mk
> 4. http://rust.mk
> 5. http://rust.mk
> 6. http://rust.mk
> 7. http://rust.mk
> 8. http://alex.corcoles.net/
> 9. http://alex.corcoles.net/


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
