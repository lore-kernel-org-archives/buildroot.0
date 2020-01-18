From: Alex Corcoles <alex@corcoles.net>
Date: Sat, 18 Jan 2020 20:58:21 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
Message-ID: <CAPAYC_zxRuBmRvkx_eGZxb=yquwPPsARyt8NLPStrvJr+vTPXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After patching, after some long compilation I get:

8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<
Building stage0 tool fabricate (x86_64-unknown-linux-gnu)
    Finished release [optimized] target(s) in 0.40s
Install docs stage2 (Some("x86_64-unknown-linux-gnu"))
touch: cannot touch '/usr/local/lib/rust-install-probe': Permission denied
install: error: can't write to destination. consider `sudo`.


command did not execute successfully: "sh"
"/home/alex/git/buildroot/output/build/host-rust-1.33.0/build/tmp/dist/rust-docs-1.33.0-dev-x86_64-unknown-linux-gnu/install.sh"
"--prefix=/usr/local" "--sysconfdir=/etc" "--datadir=/usr/local/share"
"--docdir=/usr/local/share/doc/rust" "--bindir=/usr/local/bin"
"--libdir=/usr/local/lib" "--mandir=/usr/local/share/man"
"--disable-ldconfig"
expected success, got: exit code: 1


failed to run:
/home/alex/git/buildroot/output/build/host-rust-1.33.0/build/bootstrap/debug/bootstrap
install
Build completed unsuccessfully in 0:01:12
make: *** [package/pkg-generic.mk:271:
/home/alex/git/buildroot/output/build/host-rust-1.33.0/.stamp_host_installed]
Error 1
8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<

I'd rather not sudo, as it seems that would bork my rustup-installed Rust?

Cheers,

?lex


On Sat, Jan 18, 2020 at 7:46 PM Alex Corcoles <alex@corcoles.net> wrote:

> Hi guys,
>
> I'm trying to build mipsel Rust stuff, and I've had to do this:
>
> 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<
> From 8c3f68a687b4f94a7c2e20e2020fd1e6f9e2c414 Mon Sep 17 00:00:00 2001
> From: alex <alex@pdp7.net>
> Date: Sat, 18 Jan 2020 19:24:57 +0100
> Subject: [PATCH 1/1] Set RUSTC_TARGET_NAME
>
> Signed-off-by: alex <alex@pdp7.net>
> ---
>  package/rust/rust.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 5d14fc6682..258daef331 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -38,6 +38,8 @@ endef
>
>  HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
>
> +RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
> +
>  define HOST_RUST_CONFIGURE_CMDS
>   ( \
>   echo '[build]'; \
> --
> 2.20.1
>
> 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<
>
> To advance things up (I'm currently compiling LLVM, apparently), as
> otherwise the config.toml created is wrong. I'm attaching the .config I'm
> using (I'm using the non-pre-built host rust- the pre-built one apparently
> doesn't have std).
>
> I certainly doubt what I'm doing is "correct", but maybe you guys want to
> take a look at it.
>
> BTW, tried to cc: Eric as instructed by get-developers, but mail to him
> bounced...
>
> Cheers,
>
> ?lex
> --
>    ___
>  {~._.~}
>   ( Y )
>  ()~*~()  mail: alex at corcoles dot net
>  (_)-(_)  http://alex.corcoles.net/
>
>
>
> --
>    ___
>  {~._.~}
>   ( Y )
>  ()~*~()  mail: alex at corcoles dot net
>  (_)-(_)  http://alex.corcoles.net/
>
>

-- 
   ___
 {~._.~}
  ( Y )
 ()~*~()  mail: alex at corcoles dot net
 (_)-(_)  http://alex.corcoles.net/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200118/192cf596/attachment.html>
