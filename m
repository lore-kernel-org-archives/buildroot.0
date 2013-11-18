From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Nov 2013 13:55:20 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131117233812.4ac14561@skate>
References: <20131116223632.462c6e60@skate> <20131117172917.GB4425@free.fr>
 <20131117233812.4ac14561@skate>
Message-ID: <528A0E38.9040905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/13 23:38, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Sun, 17 Nov 2013 18:29:17 +0100, Yann E. MORIN wrote:
>
[snip]
>> http://autobuild.humanoidz.org/results/889/889b3870c30d027af1aedb843648c4ddb7ed79f0/
>>    -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/microblaze-linux-gcc'
>>
>> http://autobuild.humanoidz.org/results/33f/33ff18fef818bba47eedaff2662142c25b53b4da/
>>    -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/aarch64-linux-gcc'
>>
>> http://autobuild.humanoidz.org/results/6aa/6aa47858a511e89b0bd6a3a472276baab65afb1c/
>>    -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/nios2-linux-gcc'
>>
>> For the last three failures above, can it be that the .config file is
>> improperly tweaked by the test framework?
>
> That's really weird. If you look at the config files of all of those
> builds, they have BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y, and
> BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y. Which doesn't make any sense
> when you look at the defconfig used as the base for those
> configurations:
>
>    http://autobuild.buildroot.org/toolchains/configs/free-electrons/microblazeel-unknown-linux-gnu.config
>    http://autobuild.buildroot.org/toolchains/configs/free-electrons/linaro-aarch64.config
>    http://autobuild.buildroot.org/toolchains/configs/free-electrons/sourcery-nios2.config
>
> Take any of these base configuration, run 'make menuconfig' on them,
> and you will definitely not have BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> defined, but instead the proper usage of an existing toolchain profile.

  I read:

config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
         bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
         depends on BR2_microblazeel
         depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
         depends on !BR2_PREFER_STATIC_LIB

  Is it possible that the autobuilder scripts randomly set 
BR2_PREFER_STATIC_LIB?  If that is set, then none of the official 
external toolchain profiles work and the default will be a custom 
preinstalled one...

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
