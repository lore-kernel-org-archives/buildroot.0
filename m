From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Jun 2018 22:42:55 +0200
Subject: [Buildroot] [PATCH v3,2/2] librsvg: bump to version 2.42.5
In-Reply-To: <87k1r369n9.fsf@dell.be.48ers.dk>
References: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
 <20180610133857.4737-2-fontaine.fabrice@gmail.com>
 <20180610162547.6a5d946c@windsurf>
 <874li88p8t.fsf@dell.be.48ers.dk>
 <CAPi7W82Dpby1yZCmpzG7_MXm=c3xeowOt3tHyW_gPYbnTA2NXA@mail.gmail.com>
 <87k1r369n9.fsf@dell.be.48ers.dk>
Message-ID: <20180612224255.75df55bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jun 2018 22:18:50 +0200, Peter Korsgaard wrote:

>  >> This also causes a number of issues for host-librsvg (which is a
>  >> dependency of libgtk3 and midori) when building for architectures not
>  >> supported by rust:
>  >>   
>  > The issue isn't related to libgtk3 and midori as this build fails (
>  > http://autobuild.buildroot.net/results/f33/f335ed517b402c094ed3b10a3da4cdc23620dbd6/defconfig)
>  > even if these packages are not selected.  
> 
> It is a bit more tricky than that because it can also be about
> host-libgtk3. For this configuration it is adwaita-icon-theme which
> pulls in host-libgtk3 -> host-librsvg -> host-cargo -> host-rustc

I think there is an issue in how we handle rust in fact. Indeed, the
BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS option indicates if the Rust
compiler is capable to act as a cross-compiler for the selected target.

But we haven't accounted for the fact that the Rust compiler can also
do native builds, like it does for host-librsvg. In the case of native
builds, we don't care whether Rust has support for the target
architecture: we care about it having support for the host architecture.

So basically, the fact that Rust is both a native compiler and a
cross-compiler is not properly accounted today.

Perhaps we need to have two separate
BR2_PACKAGE_HOST_RUSTC_something_ARCH_SUPPORTS options, to use
depending on whether you need Rust support for the target, or Rust
support for the host ?

Eric, what do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
