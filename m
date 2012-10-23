From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 18:42:15 +0200
Subject: [Buildroot] [PATCH 9/9] firefox: GNU gnash flash,
 an open source Adobe Flash player & plugin
In-Reply-To: <5083E62E.80705@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
 <5082C97A.4090207@mind.be> <5083E62E.80705@petroprogram.com>
Message-ID: <5086C8E7.6070209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/12 14:10, Stefan Fr?berg wrote:
> 20.10.2012 18:55, Arnout Vandecappelle kirjoitti:
>> On 05/09/12 16:29, Stefan Fr?berg wrote:
>>>
[snip]
>>> --with-npapi-plugindir=$(TARGET_DIR)/usr/lib/mozilla/plugins \
>>> +           --enable-renderer=agg,cairo --enable-doublebuf
>>> --enable-visibility --enable-offscreen --enable-ssl
>>
>>   Shouldn't cairo be a dependency as well?
>>
>
> My mistake, it's optional. Or actually it's only one of the supported
> renderers.
> I intended to later make subconfig option where user could select what
> renderer to use (agg, cairo,opengl or all).
>
> If I understanded correctly from the Gnash website, the agg renderer is
> the fastest and preferred way and only
> after that comes the rest.


  Then I'd start with supporting only the agg renderer, and leave a
comment in the .mk file that mentions the absence of support for
cairo and opengl.

[snip]
> Tell me Arnout, is the ARM-world really this ... complicated ?
>
> I mean, there at least two dozens of defconfig files for various arm
> vendor boards under linux source tree arch/arm/config.
> And those config-files are just for boards right ??
>
> Am I correct to presume that there are at least almost hundred of
> different vendor board + arm cpu compinations that
> are more or less incompatible with each other ?

  Yes, there are two reasons for that:

- Unlike for PCs, there is no BIOS in embedded platforms to hide the
board configuration.  So the BSP has to be part of the kernel.  That is
partially solved with a device tree, but even so you have to select a
device tree for your particular board.

- Unlike for PowerPC, the ARM core is used by many SoC vendors who make
completely different CPUs out of it.  Since an OS is actually about
managing everything around the CPU core itself, there's a big impact on
the Linux kernel. That's why you'll often see SoC-specific kernel
patches.

  However, this complexity shouldn't affect your use of buildroot too
much - at least if there's a defconfig for your board available in
U-Boot and in the kernel.


> And in addition to that, I must take into account if the arm-cpu Im
> cross-compiling stuff for has softfp or hardfp and the type of fp (vpf,
> neon etc....) ?

  That's in fact the same on x86, only nobody uses things like -mfpmath=sse
and just uses generic 387 code.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
