From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:30:31 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add missing
 host-uboot-tools select
In-Reply-To: <20190723132437.niyaqas7gezbe6mp@sapphire.tkos.co.il>
References: <20190723013424.1827-1-danomimanchego123@gmail.com>
 <20190723040220.scotkwrqgsxjcsjl@sapphire.tkos.co.il>
 <CANxTyt6eBFuMTicjL7ZGGGGwkQX9kOWx621aJEZ6bxaYR92nsA@mail.gmail.com>
 <20190723132437.niyaqas7gezbe6mp@sapphire.tkos.co.il>
Message-ID: <20190724003031.39c99f92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Jul 2019 16:24:37 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> > Well, why isn't the dependency enough in xvisor for the
> > BR2_PACKAGE_XVISOR_CREATE_UBOOT_IMAGE option?  Why isn't it enough in
> > cpio for the BR2_TARGET_ROOTFS_CPIO_UIMAGE option?  I don't know, but
> > I imagine that the answer is partially due to "truth in advertising"
> > with regards to the menu configuration (because "host uboot-tools" can
> > *appear* to be deselected but it gets built anyway if something
> > depends on it but does not select it).
> > 
> > Isn't consistency with the other places reason enough?  
> 
> It definitely is. But usually host dependencies are not selected at the 
> Kconfig level. We have 33 matches to select.*PACKAGE_HOST_. Of these, 7 are 
> BR2_PACKAGE_HOST_UBOOT_TOOLS. On the other hand, we have thousands of make 
> level host dependencies that are not selected.
> 
> Not sure what the rule is.

The rule is pretty much we don't care. For example, we have tons of
package that depend on host-pkgconf, but none of them select
BR2_PACKAGE_HOST_PKGCONF, even though this option exists.

All the packages using the cmake-package infrastructure use host-cmake,
but they don't select BR2_PACKAGE_HOST_CMAKE.

We have discussed several times adding in a systematic fashion
Config.in options for all host packages, and make sure they are all
selected properly, just like we do with target packages. However, last
time we discussed this, we felt the burden was way too high. For
example, all autotools-package that have AUTORECONF = YES would have to
select BR2_PACKAGE_HOST_AUTOCONF, BR2_PACKAGE_HOST_AUTOMAKE and
BR2_PACKAGE_HOST_LIBTOOL. This quickly gets pretty annoying.

So for now, we've decided to stick with what we have today: a very
clear rule for target packages, and a much fuzzier situation for host
packages.

Does this clarify the unclear situation ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
