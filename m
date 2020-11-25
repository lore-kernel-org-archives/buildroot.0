From: Christian Stewart <christian@paral.in>
Date: Tue, 24 Nov 2020 17:53:46 -0800
Subject: [Buildroot] [PATCH v4 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <CAA7H50u8hKH-w9h9reZ2RW-uLE9CDEW-8hg2dR8o4fFuwRR7+w@mail.gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-4-christian@paral.in>
 <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
 <CA+h8R2pOAr8qXM23Na9KeB+a-vLyY2QaM21dK114DUfM7SAVOQ@mail.gmail.com>
 <df06db36-3e78-9303-e811-bdc1c5cf095a@smile.fr>
 <CAA7H50u8hKH-w9h9reZ2RW-uLE9CDEW-8hg2dR8o4fFuwRR7+w@mail.gmail.com>
Message-ID: <CA+h8R2rK+jqqFW7w+yzriqDUGTN7pJ8jFuz-_2=FX4_r8Fk_VQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Graham,

On Tue, Nov 24, 2020 at 8:30 AM Graham Leva <celaxodon@gmail.com> wrote:
> I wanted to follow up here with some feedback. I work for NVIDIA and have been working on similar things as you, integrating the Jetson line of boards into Buildroot. Usual disclaimer, all opinions expressed here are my own and do not reflect those of my employer. I'm very excited to see others working on this though!

Glad to hear there is interest in supporting this effort in Buildroot
from NVIDIA.

If you have a series you've written for L4T that provides LibGL
properly, it'd be quite helpful if that could be merged into this
and/or if we could use your series instead.

My primary goal is to provide support for the Jetson TX2 and Nano that
works as reliably as possible while not falling too far behind on
compiler and/or glibc versions.

> I don't want to derail this discussion in any way, but I thought I might be able to help some. A couple of issues I noticed:
>
> 1. Package name -- this should be "tegra210" or "tegra210-linux" -- this package is for the BSP (Board Support Package), not Linux4Tegra, the custom kernel NVIDIA provides for its Tegra line of chips. Other boards require different BSPs, and still use Linux4Tegra for the kernel.

The download for this package comes from this page -

https://developer.nvidia.com/embedded/linux-tegra-archive

Which is named "linux-tegra-archive" - "L4T Archive" - "NVIDIA L4T is
the board support package for Jetson."

The branding is pretty explicit that this board support package is
named "linux4tegra" which includes the kernel as part of the bundle.
This is why I chose this package name for the series.

The package supports fetching multiple variants, either the t210 or t186ref.

Given the large quantity of license files and hashes in this package,
it would be (IMO) best to maintain a single package for all of the
board variants, if possible. The contents of the different versions of
l4t are nearly identical and are processed identically.

If it is indeed necessary / better to duplicate the package several
times and make one per variant, I can make that change + the naming
changes.

> 2. Root permissions -- you can remove the root permissions requirement by not using the flash.sh script NVIDIA provides. It's really a high-level wrapper around other scripts and image signing tools that require root. This should eliminate the need for your custom patch (0001-Adjust-flash.sh-for-flashing-Buildroot-produced-disk.patch). Happy to work with you on this.

Actually, the purpose of the patch is not to remove the requirement
for root. It's to prevent the script from generating a new ext4 rootfs
image. This step is unnecessary, Buildroot does it already.

Instead what happens, with the patch applied, is that the script will
flash the buildroot produced ext4 partition image directly to the
target emmc device, rather than building a ext4 image from scratch
unnecessarily.

I use this to flash the emmc on the TX2 over USB (as mentioned in the
readme.txt).

> The way NVIDIA flashes boards and defines the partition layout through xml files and parsing can be difficult to translate to genimage or another Buildroot-compatibile tool.

Indeed but this is a separate issue than the flash.sh patch. I believe
flash.sh can still produce rootless images anyway even with the patch
applied.

> The way I've gone here was to define a layout based on the output from NVIDIA's scripts, and then target different layouts based on the board configuration parameters.
> This is more work up-front and requires some thinking about how each of the boards can be structured within Buildroot, but I think the flexibility (and not having root permissions) outweighs. I personally find having a genimage.cfg much clearer than the XML files for referencing partition layouts too.

This is a lot of extra effort that I don't think I would be willing to
maintain (can't speak for the other developers).

At the moment for practical purposes the flash.sh script works
perfectly to flash the device over USB and/or produce the device
images. Is there any reason why we shouldn't use that script?

If a custom partition layout is possible it would be quite good.

> 3. BSP software (everything under nv_tegra directory) -- this is a tough issue. Ideally, I would like to see NVIDIA offer some static download URLs for each of these pieces of software so we could create them as individual Buildroot packages, rather than just installed altogether as part of the BSP. I think this would be more in line with Buildroot's approach towards building minimal firmware with only the packages you need. I understand if this works for your use case, but there's a lot of system setup also included in this directory (nv_tegra/config.tbz2) that has implications on the Buildroot port and currently assumes you're building an Ubuntu-based system. How to handle udev configuration, for example -- I would suggest copying configurations over should be opt-in based on whether the user has selected BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y.

Well, it's of course possible to filter which files we copy based on
these conditions, even without splitting this into separate packages.
I wonder though if (for an initial version in the tree) there's any
harm in installing udev rules when udev is not enabled? This won't
have any effect, right? So it shouldn't be a showstopper for v0.

> > Cuda libraries requires a specific gcc version, see the tegra-demo-distro layer
> > [1]. I guess nivida only use gcc 7 (or maybe gcc 8) because they are using
> > ubuntu on this platform.
> >
> > Also, the kernel you use come from github OE4T [2] where ~20 kernel patches have
> > been backported to fix gcc >= 8 issues. But this is not really the kernel from
> > Nvidia SDK.

It works with GCC 8 but I am seeing some errors loading the tegra_xusb firmware.

> Romain is correct about the Linux4Tegra kernel here. I have a patch (really a series) I started to submit to add this in to Buildroot (see: http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-1-package-linux-nvidia-for-Jetson-Nano-SD-td269064.html#a269065), and hopefully you can build on it. L4T should be able to work and compile fine with GCC 8 or 9, but the kernel compilation currently breaks with 10.x.

That patch, as far as I can see, just downloads l4t from a git source
via package-generic?

Which parts should I take from there for this series?

Thanks again for the support on this.

Best regards,
Christian Stewart
