From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Aug 2018 00:29:07 +0200
Subject: [Buildroot] Intel MediaSDK package w. Quicksync (h264,
 h265 HW encoding)
In-Reply-To: <20180814224210.5427ea5c@windsurf>
References: <ea-mime-5b7336a6-c6c-5874a42@www-1.netcourrier.com>
 <20180814224210.5427ea5c@windsurf>
Message-ID: <8bc186fd-f3f5-e9de-e6be-0c2be0510b48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-18 22:42, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Aug 2018 22:08:06 +0200 (CEST), lpdev at cordier.org wrote:
> 
>> Working on buildroot for 3 weeks now, I would like to congrat
>> everyone that participated to this wonderful project.
> 
> Thanks!
> 
>> Today I have finished to integrate the the Intel MediaSDK to
>> buildroot. The Intel MediaSDK features Intel QuickSync through the
>> libmfx API, allowing all the cool kids to make use of hardware
>> encoding/decoding for popular video format such as h264, h265, jpeg,
>> vp9, etc. Even though there are no real benchmark against vaapi, MFX
>> layer promise better performances than the former. There is currently
>> a working implementation of this layer in ffmpeg that is working very
>> well even on little 'embedded' computers (I did some testing on an
>> Intel Computestick STK2MV64CC).
> 
> It's a good idea to package this indeed.
> 
>> I would like to submit a patch to buildroot for this new package,
>> intel-mediasdk. However I am running into small issues that need to
>> be addressed before the submission.
>>
>> 1. Currently there are some strong restriction around the kernel
>> version that needs to be 4.14.16. 

 Really? 4.14.16, not 4.14.17 or later? That's really unlikely... Or do you mean
that it needs a specific fork?

>>
>>   1.1 Is it possible for a package to force the Kernel version?
> 
> No. But we already have packages that depend on a specific fork of the
> Linux kernel. We simply indicate something like this in Config.in:
> 
> comment "imx-vpuwrap needs an imx-specific Linux kernel to be built"
>         depends on BR2_arm
>         depends on !BR2_LINUX_KERNEL

 This is for when the package requires the linux kernel sources to be present.
IIRC, what you really need is a runtime dependency on a specific kernel version.
In that case, you can use a dependency on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14.

> 
> See package/freescale-imx/imx-vpuwrap/Config.in.
> 
>> 2. libva and libva-utils need to be recompiled using Intel forks
>> (respectively https://github.com/intel/libva and
>> https://github.com/intel/libva-utils).
> 
> Argh. That's annoying.
> 
>> I have no idea of how I can switch the version in buildroot. I have
>> currently modified the source site of both package using the repo
>> above. 
>>
>> ? 2.1 Should I add a special switch like
>> BR2_PACKAGE_LIBVA_INTEL_QUICKSYNC that switches between these 2
>> versions? 
>>
>> ? 2.2 Is it the cleaner way? 
>>
>> ? 2.3 Is wrapping these 2 packages into a virtual-package better? If
>> not, how this can be integrated in Buildroot?
> 
> In this situation, I don't really see the need to have two copies of
> those packages. Instead, just add a Config.in sub-option to select
> between "upstream" and "Intel" versions. It's annoying, but hopefully
> Intel will get its code merged in libva and libva-utils.

 It really depends on the plans for upstreaming the changes, and how much
changes there are. If Intel's libva is really the libva version we carry at the
moment with some innocent changes to them, and it is intended to be upstreamed
in the very short term, then I'd be OK to just temporarily switch to the Intel
version. If, on the other hand, there is a risk that the fork will stay a fork,
then I think we need to add libva-intel and libva-utils-intel and virtual
packages. That would be really annoying though.

 Regards,
 Arnout

> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
