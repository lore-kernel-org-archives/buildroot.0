From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 22:42:10 +0200
Subject: [Buildroot] Intel MediaSDK package w. Quicksync (h264,
 h265 HW encoding)
In-Reply-To: <ea-mime-5b7336a6-c6c-5874a42@www-1.netcourrier.com>
References: <ea-mime-5b7336a6-c6c-5874a42@www-1.netcourrier.com>
Message-ID: <20180814224210.5427ea5c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 22:08:06 +0200 (CEST), lpdev at cordier.org wrote:

> Working on buildroot for 3 weeks now, I would like to congrat
> everyone that participated to this wonderful project.

Thanks!

> Today I have finished to integrate the the Intel MediaSDK to
> buildroot. The Intel MediaSDK features Intel QuickSync through the
> libmfx API, allowing all the cool kids to make use of hardware
> encoding/decoding for popular video format such as h264, h265, jpeg,
> vp9, etc. Even though there are no real benchmark against vaapi, MFX
> layer promise better performances than the former. There is currently
> a working implementation of this layer in ffmpeg that is working very
> well even on little 'embedded' computers (I did some testing on an
> Intel Computestick STK2MV64CC).

It's a good idea to package this indeed.

> I would like to submit a patch to buildroot for this new package,
> intel-mediasdk. However I am running into small issues that need to
> be addressed before the submission.
> 
> 1. Currently there are some strong restriction around the kernel
> version that needs to be 4.14.16. 
> 
>   1.1 Is it possible for a package to force the Kernel version?

No. But we already have packages that depend on a specific fork of the
Linux kernel. We simply indicate something like this in Config.in:

comment "imx-vpuwrap needs an imx-specific Linux kernel to be built"
        depends on BR2_arm
        depends on !BR2_LINUX_KERNEL

See package/freescale-imx/imx-vpuwrap/Config.in.

> 2. libva and libva-utils need to be recompiled using Intel forks
> (respectively https://github.com/intel/libva and
> https://github.com/intel/libva-utils).

Argh. That's annoying.

> I have no idea of how I can switch the version in buildroot. I have
> currently modified the source site of both package using the repo
> above. 
> 
> ? 2.1 Should I add a special switch like
> BR2_PACKAGE_LIBVA_INTEL_QUICKSYNC that switches between these 2
> versions? 
> 
> ? 2.2 Is it the cleaner way? 
> 
> ? 2.3 Is wrapping these 2 packages into a virtual-package better? If
> not, how this can be integrated in Buildroot?

In this situation, I don't really see the need to have two copies of
those packages. Instead, just add a Config.in sub-option to select
between "upstream" and "Intel" versions. It's annoying, but hopefully
Intel will get its code merged in libva and libva-utils.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
