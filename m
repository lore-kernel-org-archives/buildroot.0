From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 00:34:15 +0100
Subject: [Buildroot] build hangs when building kernel
In-Reply-To: <FB5BA32813A44818B6499769D61985DF@JohanW7>
References: <FB5BA32813A44818B6499769D61985DF@JohanW7>
Message-ID: <50EB5B77.3010800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 17:16, Sagaert Johan wrote:
> Hi
>
> Using the latest pull:
>
> The build hangs when it is building the kernel
>
> snip....
>
>    LD [M]  fs/fuse/cuse.ko
>    LD [M]  fs/fuse/fuse.ko
>    LD [M]  lib/crc-ccitt.ko
>    LD [M]  fs/nls/nls_iso8859-15.ko
> make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
> PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
> local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
> PERLLIB="/home/buildroot12git/output/host/usr/lib/perl" /usr/bin/make -j8 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
> INSTALL_MOD_PATH=/home/buildroot12git/output/target CROSS_COMPILE="
> /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" DEPMOD=/home/buildroot12git/output/host/usr/sbin/depmod
> -C /home/buildroot12git/output/build/linux-3.4.24 tx53.dtb
> make[1]: Entering directory `/home/buildroot12git/output/build/linux-3.4.24'
>    DTC     arch/arm/boot/tx53.dtb
> DTC: dts->dtb  on file "arch/arm/boot/dts/tx53.dts"
> make[1]: Leaving directory `/home/buildroot12git/output/build/linux-3.4.24'
> # dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
> cat>>  /home/buildroot12git/output/build/linux-3.4.24/arch/arm/boot/zImage
>
>
>
> It looks like the missing cat parameter is causing this.

  Peter,

  The $(wildcard ) doesn't work for LINUX_APPEND_DTB, because the .dtb 
doesn't exist yet at that point.

  It works for LINUX_INSTALL_DTB because that one is only expanded after 
the kernel (and the .dtb) has already been built.

  Simplest option is to change it into a shell condition. Untested patch 
follows.

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
