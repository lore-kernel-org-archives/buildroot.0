From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 09:21:51 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: update kernel to
 4.1.13 and u-boot to 2015.10
In-Reply-To: <56987FDD.5060508@gmail.com>
References: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160113095153.6b4f95cb@free-electrons.com>
 <56981620.5020805@mind.be> <56987FDD.5060508@gmail.com>
Message-ID: <20160115092151.5452f93c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan,

On Fri, 15 Jan 2016 06:13:01 +0100, Zoltan Gyarmati wrote:

> I looked into this a bit more:
> * The u-boot doesn't need the host DTC (even though the
> BR2_TARGET_UBOOT_NEEDS_DTC is set in the patch i sent, something i'll
> need to fix in the next iteration)
> 
> * As the shipped .dtb files are built with the dtc version included in
> the linux tree from https://github.com/beagleboard/linux.git, which
> has the support for the overlays, so for merely getting a booting
> system, no need to hack the dtc package
> 
> * As the kernel build also installs this dtc version as
> 'output/host/usr/bin/linux-dtc', if one needs to compile overlays on
> the build host, s/he can use that one (although this need to be
> documented at least in the board's README)

So in fact, for the purpose of the beaglebone defconfig itself, we
don't need to package an overlay-capable DTC, right?

If that's the case, then I would suggest that we separate the problem
in two parts: first get an updated beaglebone defconfig merged, then
work on packaging an overlay-capable DTC.

> So as far i can see the options are (and none of them is ideal):
> 
> 1. Implementing a similar solution as Antoine with an additional
> dtc-overlay package with a custom upstream repo.
> 
> 2. Stick to the current package and upstream, but introduce a config
> variable like "BR2_PACKAGE_DTC_SUPPORT_OVERLAY", and if it's set, the
> needed patchset is applied (or just using an other upstream)
> 
> 3. Create a virtual package and 2 implementations as dtc-kernel-org
> and a dtc-overlay
> 
> 4. Only add the needed patches on the boards where needed and patch
> dtc by setting BR2_GLOBAL_PATCH_DIR
> 
> 5. Introducing custom repository/custom patch dir config options for
> the dtc package like for u-boot and linux (maybe also with an option
> to use the dtc source coming with the kernel tree?)

Do we really need to package the two variants of DTC ? The
overlay-capable version is perfectly backward compatible with the
mainline DTC. So why don't we simply include in package/dtc/ the
patches needed to make DTC overlay-capable ?

Yes, this is moving away from our general rule of not including patches
that add new features. But general rules are meant to have exceptions,
and in this specific case, the upstream DTC project is so slow at
integrating major changes such as overlays, and this feature is now
being used so often (BeagleBone, Raspberry Pi, CHIP, etc.) that it
makes sense to support it.

Arnout ? Antoine ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
