From: Graham Leva <celaxodon@gmail.com>
Date: Tue, 24 Nov 2020 10:30:30 -0600
Subject: [Buildroot] [PATCH v4 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <df06db36-3e78-9303-e811-bdc1c5cf095a@smile.fr>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-4-christian@paral.in>
 <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
 <CA+h8R2pOAr8qXM23Na9KeB+a-vLyY2QaM21dK114DUfM7SAVOQ@mail.gmail.com>
 <df06db36-3e78-9303-e811-bdc1c5cf095a@smile.fr>
Message-ID: <CAA7H50u8hKH-w9h9reZ2RW-uLE9CDEW-8hg2dR8o4fFuwRR7+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

I wanted to follow up here with some feedback. I work for NVIDIA and have
been working on similar things as you, integrating the Jetson line of
boards into Buildroot. Usual disclaimer, all opinions expressed here are my
own and do not reflect those of my employer. I'm very excited to see others
working on this though!

I don't want to derail this discussion in any way, but I thought I might be
able to help some. A couple of issues I noticed:

1. Package name -- this should be "tegra210" or "tegra210-linux" -- this
package is for the BSP (Board Support Package), not Linux4Tegra, the custom
kernel NVIDIA provides for its Tegra line of chips. Other boards require
different BSPs, and still use Linux4Tegra for the kernel.

2. Root permissions -- you can remove the root permissions requirement by
not using the flash.sh script NVIDIA provides. It's really a high-level
wrapper around other scripts and image signing tools that require root.
This should eliminate the need for your custom patch
(0001-Adjust-flash.sh-for-flashing-Buildroot-produced-disk.patch). Happy to
work with you on this. The way NVIDIA flashes boards and defines the
partition layout through xml files and parsing can be difficult to
translate to genimage or another Buildroot-compatibile tool. The way I've
gone here was to define a layout based on the output from NVIDIA's scripts,
and then target different layouts based on the board configuration
parameters. This is more work up-front and requires some thinking about how
each of the boards can be structured within Buildroot, but I think the
flexibility (and not having root permissions) outweighs. I personally find
having a genimage.cfg much clearer than the XML files for referencing
partition layouts too.

3. BSP software (everything under nv_tegra directory) -- this is a tough
issue. Ideally, I would like to see NVIDIA offer some static download URLs
for each of these pieces of software so we could create them as individual
Buildroot packages, rather than just installed altogether as part of the
BSP. I think this would be more in line with Buildroot's approach towards
building minimal firmware with only the packages you need. I understand if
this works for your use case, but there's a lot of system setup also
included in this directory (nv_tegra/config.tbz2) that has implications on
the Buildroot port and currently assumes you're building an Ubuntu-based
system. How to handle udev configuration, for example -- I would suggest
copying configurations over should be opt-in based on whether the user has
selected BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y.

> Cuda libraries requires a specific gcc version, see the tegra-demo-distro
layer
> [1]. I guess nivida only use gcc 7 (or maybe gcc 8) because they are using
> ubuntu on this platform.
>
> Also, the kernel you use come from github OE4T [2] where ~20 kernel
patches have
> been backported to fix gcc >= 8 issues. But this is not really the kernel
from
> Nvidia SDK.

Romain is correct about the Linux4Tegra kernel here. I have a patch (really
a series) I started to submit to add this in to Buildroot (see:
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-1-package-linux-nvidia-for-Jetson-Nano-SD-td269064.html#a269065),
and hopefully you can build on it. L4T should be able to work and compile
fine with GCC 8 or 9, but the kernel compilation currently breaks with 10.x.

Kind regards,
Graham Leva

On Tue, Nov 24, 2020 at 8:52 AM Romain Naour <romain.naour@smile.fr> wrote:

> Hello Christian,
>
> Le 24/11/2020 ? 00:07, Christian Stewart a ?crit :
> > Hi Romain,
> >
> > On Thu, Nov 19, 2020 at 5:40 AM Romain Naour <romain.naour@smile.fr>
> wrote:
> >>> +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package
> Toolchain"
> >>> +BR2_TOOLCHAIN_BUILDROOT=y
> >>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >>> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> >>> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> >>> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> >>> +BR2_BINUTILS_VERSION_2_32_X=y
> >>> +BR2_GCC_VERSION_7_X=y
> >>
> >> This means that you are not working on Buildroot master because gcc 7
> has been
> >> removed already.
> >>
> >> This is anoying... either the latest NVIDIA SDK (jetpack 4.4.1) is
> already out
> >> of date because it require an old gcc version or gcc is moving too fast
> for such
> >> sdk.
> >
> > I have tested this against GCC 8 and Buildroot 2020.08.x:
> >
> > BR2_TOOLCHAIN_BUILDROOT=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> > BR2_BINUTILS_VERSION_2_32_X=y
> > BR2_GCC_VERSION_8_X=y
> > BR2_USE_MMU=y
> >
> > ... and all works fine. Why do you think it won't work with GCC 8?
>
> Cuda libraries requires a specific gcc version, see the tegra-demo-distro
> layer
> [1]. I guess nivida only use gcc 7 (or maybe gcc 8) because they are using
> ubuntu on this platform.
>
> Also, the kernel you use come from github OE4T [2] where ~20 kernel
> patches have
> been backported to fix gcc >= 8 issues. But this is not really the kernel
> from
> Nvidia SDK.
>
> I understand that the nvidia sdk is difficult to package into Buildroot or
> Yocto. My review is absolutely not a no-go for merging this BSP. You did a
> great
> job since you're able to use it with Buildroot :)
>
> [1]
>
> https://github.com/OE4T/tegra-demo-distro/blob/master/layers/meta-tegrademo/conf/distro/tegrademo.conf#L58
> [2] https://github.com/OE4T/linux-tegra-4.9
>
> Best regards,
> Romain
>
> >
> > Best,
> > Christian
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201124/93014645/attachment.html>
