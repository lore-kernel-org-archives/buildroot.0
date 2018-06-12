From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 22:18:50 +0200
Subject: [Buildroot] [PATCH v3,2/2] librsvg: bump to version 2.42.5
In-Reply-To: <CAPi7W82Dpby1yZCmpzG7_MXm=c3xeowOt3tHyW_gPYbnTA2NXA@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 12 Jun 2018 21:47:51 +0200")
References: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
 <20180610133857.4737-2-fontaine.fabrice@gmail.com>
 <20180610162547.6a5d946c@windsurf> <874li88p8t.fsf@dell.be.48ers.dk>
 <CAPi7W82Dpby1yZCmpzG7_MXm=c3xeowOt3tHyW_gPYbnTA2NXA@mail.gmail.com>
Message-ID: <87k1r369n9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> This also causes a number of issues for host-librsvg (which is a
 >> dependency of libgtk3 and midori) when building for architectures not
 >> supported by rust:
 >> 
 > The issue isn't related to libgtk3 and midori as this build fails (
 > http://autobuild.buildroot.net/results/f33/f335ed517b402c094ed3b10a3da4cdc23620dbd6/defconfig)
 > even if these packages are not selected.

It is a bit more tricky than that because it can also be about
host-libgtk3. For this configuration it is adwaita-icon-theme which
pulls in host-libgtk3 -> host-librsvg -> host-cargo -> host-rustc


 > I'm not an expert in virtual package but it seems we try to build
 > host-rustc even if BR2_PACKAGE_HOST_RUSTC is not selected by the user
 > (which is allowed).

Indeed.

 > The issue is that BR2_PACKAGE_PROVIDES_HOST_RUSTC is not defined if
 > BR2_PACKAGE_HOST_RUSTC is not set (see rustc/Config.in.host).
 > Moreover, we define it like this:

 >  config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 >         string
 >         default "host-rust" if BR2_PACKAGE_HOST_RUST
 >         default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN

 > As a result, if the user does not select host-rust or host-rust-bin, then
 > there is no provider for host-rustc.

But that is expected. host-rustc is a mix of a host utility and data
specific to a target, so we really cannot use it if we are not on a
supported host system AND building for a supported target.

 > config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 >         string
 >         default "host-rust" if BR2_PACKAGE_HOST_RUST
 >         default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
 >         default "host-rust-bin" if !BR2_PACKAGE_HOST_RUST ||
 > !BR2_PACKAGE_HOST_RUST

 > Indeed, HOST_RUST_BIN doesn't have any dependencies

It does, in the sense that it downloads the following files:

HOST_RUST_BIN_EXTRA_DOWNLOADS = \
        rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz \
        rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz

And those files are only available for specific RUSTC_HOST_NAME and
RUSTC_TARGET_NAME values.

-- 
Bye, Peter Korsgaard
