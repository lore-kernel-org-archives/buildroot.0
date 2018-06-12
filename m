From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Jun 2018 21:47:51 +0200
Subject: [Buildroot] [PATCH v3,2/2] librsvg: bump to version 2.42.5
In-Reply-To: <874li88p8t.fsf@dell.be.48ers.dk>
References: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
 <20180610133857.4737-2-fontaine.fabrice@gmail.com>
 <20180610162547.6a5d946c@windsurf>
 <874li88p8t.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W82Dpby1yZCmpzG7_MXm=c3xeowOt3tHyW_gPYbnTA2NXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

2018-06-12 8:58 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > Hello,
>  > On Sun, 10 Jun 2018 15:38:57 +0200, Fabrice Fontaine wrote:
>  >> - Add a dependency to host-cargo
>  >> - Add a patch to set RUST_TARGET
>  >> - Add a dependency to BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  >> - Forward this dependency to efl svg, enlightment, gst-plugins-bad and
>  >> gst1-plugins-bad
>  >> - Add hash for license file
>  >>
>  >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>  > I've applied, after fixing the gst-plugins-bad and gst1-plugins-bad
>  > packages, in which you forgot to propagate the new dependency to the
>  > existing Config.in comments.
>
>  > Generally speaking, I find it a bit annoying that those packages start
>  > using Rust. Not because I have anything against Rust, but because:
>
>  >  (1) It limits the support to a much smaller set of architectures. For
>  >      example, it is not longer possible to build librsvg or its reverse
>  >      dependencies on ARMv5 platforms.
>
>  >  (2) It adds a fair amount of build time.
>
>  > But well, if that's upstream decision, there's not much we can do
>  > against it.
>
> This also causes a number of issues for host-librsvg (which is a
> dependency of libgtk3 and midori) when building for architectures not
> supported by rust:
>
The issue isn't related to libgtk3 and midori as this build fails (
http://autobuild.buildroot.net/results/f33/f335ed517b402c094ed3b10a3da4cdc23620dbd6/defconfig)
even if these packages are not selected.

I'm not an expert in virtual package but it seems we try to build
host-rustc even if BR2_PACKAGE_HOST_RUSTC is not selected by the user
(which is allowed).

The issue is that BR2_PACKAGE_PROVIDES_HOST_RUSTC is not defined if
BR2_PACKAGE_HOST_RUSTC is not set (see rustc/Config.in.host).
Moreover, we define it like this:

 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
        string
        default "host-rust" if BR2_PACKAGE_HOST_RUST
        default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN

As a result, if the user does not select host-rust or host-rust-bin, then
there is no provider for host-rustc.

I would like your advice on this point, should we change this definition
like this:
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
        string
        default "host-rust" if BR2_PACKAGE_HOST_RUST
        default "host-rust-bin" if !BR2_PACKAGE_HOST_RUST

or do you prefer:

config BR2_PACKAGE_PROVIDES_HOST_RUSTC
        string
        default "host-rust" if BR2_PACKAGE_HOST_RUST
        default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
        default "host-rust-bin" if !BR2_PACKAGE_HOST_RUST ||
!BR2_PACKAGE_HOST_RUST

Indeed, HOST_RUST_BIN doesn't have any dependencies

>
> http://autobuild.buildroot.net/?reason=host-rustc
>
> Care to take a look at propagating these new dependencies here?
>
> --
> Bye, Peter Korsgaard
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180612/5f989c6f/attachment.html>
