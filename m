From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 15 Jan 2016 02:53:11 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: update kernel to
 4.1.13 and u-boot to 2015.10
In-Reply-To: <20160113095153.6b4f95cb@free-electrons.com>
References: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160113095153.6b4f95cb@free-electrons.com>
Message-ID: <56985107.2090006@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Deat Thomas & All,

thanks for looking into this, please see the answers inline...

On 01/13/2016 09:51 AM, Thomas Petazzoni wrote:
> Zoltan,
> 
> On Wed, 13 Jan 2016 03:52:22 +0100, Zoltan Gyarmati wrote:
> 
>> This patch is basically the cleaned-up version of Chris
>> LaRocque's patch from his mail
> 
> Thanks for respining this patch.
> 
>> "[PATCH 1/2] Updated the Beaglebone configuration, 01/03/2016
>> 10:01 PM" and the cleanup followed Arnout's corresponding
>> answers. Changes to Chris' patches: * dtc patches fetched from GH
>> and placed in 'board/beaglebone/patches/dtc' *
>> BR2_GLOBAL_PATCH_DIR set accordingly * added seperated kernel
>> defconfig instead of patching the upstream defconfig * cleanups
>> in uEnv.txt * fix u-boot version to 2015.10
>> 
>> The heavy-lifting was done by Chris here, the rest is mostly
>> cosmetics. If anything els seems to be tweaked, please let us
>> know.
>> 
>> 
>> board/beaglebone/linux-3.12.config                 |  251 --- 
>> board/beaglebone/linux_4.1.13_bb.org_defconfig     | 2043
>> ++++++++++++++++++++
> 
> Looking at its size, this file looks like a full config file and
> not a defconfig. Please use a defconfig.

It's indeed a defconfig (generated with `make linux-savedefconfig`),
but it enables tons of modules (it's just a slightly modified version
of the upstream one, see at
https://github.com/beagleboard/linux/blob/4.1/arch/arm/configs/bb.org_de
fconfig)
 I'm going to cook a shrinker defconfig version of this for Buildroot,
with just a basic set of modules enabled, especially as this version
also takes a lot of time to build...

> 
> Or better: please use the defconfig that is inside the kernel tree,
> and if you need additional tweaks, use config fragments.
> 
>> ...comment-block-of-fdt_get_property_namelen.patch |   32 + 
>> .../0002-fdt-Add-a-function-to-count-strings.patch |  246 +++ 
>> ...d-a-function-to-get-the-index-of-a-string.patch |  159 ++ 
>> ...004-fdt-Add-functions-to-retrieve-strings.patch |  173 ++
> 
> I am not supper happy with the solution of having those DTC
> patches specifically for the BeagleBone platform. If I understand
> correctly, those patches are needed to get the DT overlay to work,
> right ?
> 
> We had the same problem for the C.H.I.P platform, so it would also
> be useful for us to have a overlay-capable DTC. You can see what
> my colleague Antoine T?nart did:
> 
> https://github.com/NextThingCo/CHIP-buildroot/commit/1a73b514d204d0c6e
9100d53011a11d99fd8b778
>
> 
https://github.com/NextThingCo/CHIP-buildroot/commit/f3334df58611ff3cae5
fd62906423fdce3d80d24
> https://github.com/NextThingCo/CHIP-buildroot/commit/c4457eba3099f5ca5
14c06bb35b42772178a151a
>
>  It is not ideal because it relies on a separate dtc-overlay
> package, which packages a different version of dtc, which Antoine
> has cooked on his own github repository.
> 
> We really need to find a solution that is acceptable in the
> upstream Buildroot, and applies to multiple platforms.
> 
>> ...cache-flush-management-symbols-when-MULTI.patch |   34 - 
>> .../0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch   |  754
>> ++++++++
> 
> This huge U-Boot patch is really ugly and mixes lots of stuff. Why
> do you need it?

Agreed, it's an ugly patch, coming from
https://github.com/eewiki/u-boot-patches/blob/master/v2015.10/0001-am335
x_evm-uEnv.txt-bootz-n-fixes.patch
, and i couldn't find a nicer patchset. Looking ahead to 2016.01,
there is a smaller patch for it
(https://github.com/eewiki/u-boot-patches/blob/master/v2016.01/0001-am33
5x_evm-uEnv.txt-bootz-n-fixes.patch),
where most of the changes are config-related and just a small actual
code is patched, i'm going to test it and and report. (maybe we can go
with a small patch extracted from the linked one, and a custom
defconfig file?)

> 
> 
>> -# bootloader BR2_TARGET_UBOOT=y 
>> BR2_TARGET_UBOOT_BOARDNAME="am335x_evm" 
>> BR2_TARGET_UBOOT_CUSTOM_VERSION=y 
>> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10" 
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10" 
>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> 
> So this is going to use the host-dtc package for U-Boot, but isn't
> the kernel still going to use its internal copy of dtc ? If so, how
> are your dtc patches useful for the kernel ?
> 
> Thanks!
> 
> Thomas
> 

Thanks, regards
zgyarmati
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJWmFEGAAoJEAGmEeeR8iVhCVgIAKQpqvofRUQXyy10wKcAGCvg
8SPtWt09Cl69Y7sNx32kSkrfAWDHI0O3ez+Arz3lodIORAyV0Dq//BwYkof4l/ed
uHkI5v+bH9g1JnkxbJ4dssVO2hTFE95rtxmsIwXSTmmoXG9hsHMaXkY34Ka615AJ
ZoLQTnY5KL16MINA1N0vfi9KypRHQ69UUJugO9NoNhOpiwwXoTQMCCWmCIdnkcH5
Xn8ahqymgMuXPlA/KqIg54hsEj3/qHx2zvSsNIOSz+efRgCBtkVcH51wqHv04vYi
8/ME1pneG7OA1v5Ki/A9PG1xszlpXxaSA2B/Pxxm0plj30eB5SziYLFVrXzLc6s=
=WJ8j
-----END PGP SIGNATURE-----
