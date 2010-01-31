From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sun, 31 Jan 2010 09:39:11 -0800 (PST)
Subject: [Buildroot] BE: Buildroot How-To for QEMU/ARM (Jim Thomas)
In-Reply-To: <965922.2943.qm@web44814.mail.sp1.yahoo.com>
References: <mailman.7759.1264608677.5110.buildroot@busybox.net>
	<1531E53627F1F749B4FE809BF2A4EB6701653FAE@WETMEX10.loepfe.com>
	<965922.2943.qm@web44814.mail.sp1.yahoo.com>
Message-ID: <411591.91959.qm@web44811.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've made some progress.

If I use the Linux kernel built based on the following *Buildroot* defconfig:

  integrator926_defconfig - Build for integrator926

then the kernel does not boot at all.  There is no console output after 'Uncompressing Linux... done, booting the kernel.'.

If I build the kernel using the *Linux* (not Buildroot) defconfig:

  integrator_defconfig - Build for integrator

then the kernel still does not boot.

However, if I build the kernel using the *Linux* (not Buildroot) defconfig:

  versatile_defconfig - Build for versatile

then the kernel boots!  (Not all the way, more on that below, but much more works now.)

This may account for Noel's success, where he mentioned in his posting that he uses 'versatile'.

Part of my confusion is because Buildroot offers 'integrator926_defconfig', whereas the kernel offers 'integrator_defconfig', and Buildroot does not appear to offer 'versatile_defconfig' corresponding to the kernel 'versatile_defconfig'.

Since it is probably easier to change Buildroot than the kernel build environment, an improvement might be end-to-end consistency, where Buildroot offers 'integrator_defconfig' and 'versatile_defconfig' that flow uniformly through to the kernel build.

If it is practical to change Buildroot 'integrator926_defconfig' to 'integrator_defconfig', that might also be a step towards eliminating the issue where BR2_TARGET_UBOOT_BOARDNAME must be manually changed to avoid U-Boot build failure since U-Boot recognizes 'integratorcp' but not 'integrator926' (I ran into this U-Boot issue, which is discussed elsewhere in this mailing list).

The kernel built as 'versatile' above now boots until it reaches the end of the init.d/S* startup processing, so QEMU and the kernel are seeing the RFS built by Buildroot.  However, a login prompt does not appear.

If I use that same locally built RFS, but replace the locally built kernel with the pre-built kernel from the QEMU arm-test-0.2.tar.gz, then QEMU boots Linux all the way, including the login prompt.  I can log in an navigate the locally built RFS.

So -- the RFS built by Buildroot is correct, and there must be some final issue in the build of the kernel using 'versatile_defconfig' that prevents the login from running.  I'm pretty close.

I think the Buildroot adoption rate might be higher if there were a documented, streamlined way to build the kernel/RFS and execute it under QEMU, with an end-to-end Buildroot build process triggered by a single 'some_arm_defconfig'.  It might serve as a very useful hardware independent reference platform.

Thanks.

Jim



----- Original Message ----
From: Jim Thomas <jimthomasembedded@yahoo.com>
To: buildroot at busybox.net
Sent: Sat, January 30, 2010 11:01:49 AM
Subject: Re: [Buildroot] BE: Buildroot How-To for QEMU/ARM (Jim Thomas)

Hi Noel,

  > If you want I can send you a kernel config ... that is working for my
  > QEMU build (it is based on the kernel versatile_defconfig).

I would be interested in looking over your .config file.

I think what I am missing may be on the QEMU side, not the Buildroot side.

What qemu-system-arm command do you use to bring up your virtual machine?

Thanks.

Jim



----- Original Message ----
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: buildroot at busybox.net
Sent: Thu, January 28, 2010 3:46:24 AM
Subject: [Buildroot] BE: Buildroot How-To for QEMU/ARM (Jim Thomas)

Hi JIM 

>>From: Jim Thomas <jimthomasembedded@yahoo.com>
>>Subject: [Buildroot] Buildroot How-To for QEMU/ARM

>> Now I want to use QEMU to boot a Linux kernel and RFS that I built
myself for ARM using buildroot-2009.11.
>>?
>>I have not had much luck. Based on web searching, I have tried
twisting knobs in 'make menuconfig' and rebuilt 
>>perhaps a couple of dozen times.
>>
>> Rather than do a core dump here of the details, I thought I would
ask:
>>?
>>Has anyone used buildroot-2009.11 to build a kernel and RFS for ARM
that boot successfully under qemu-0.12.2?

Yes, I did this some time ago (for the 2009.11). 

{It was qemu-system-arm --version QEMU PC emulator version 0.11.0
(qemu-kvm-0.11.0), Copyright (c) 2003-2008 Fabrice Bellard, BUTY this
will not make the difference I guess}

The whole trick is that no need to have a KERNEL config to start with
(the file system... is nothing special) 
If you want I can send you a kernel config ... that is working for my
QEMU build (it is based on the kernel versatile_defconfig).
{ I even have build a booting ARM-QEMU from the buildroot-git a couple
of days a go.}

>>Do step-by-step notes exist for how to do this for ARM that were
written for these latest versions of Buildroot and >>QEMU, or that have
been verified as still complete and correct?

Booting the kernel and roofs in QEMU can be done by a 1000ways, it
depends on your creativity and Linux-skills how you do this (disk-image/
nfs-boot / .... etc ) 

>>Ultimately, I might like to get Buildroot/QEMU working for a
particular ARM processor, but for now, a working
>>configuration for any virtualized ARM target is good enough.

I know ... having BUILDROOT 'build-in' support for a QEMU-ARM platform
(as well as other QEMU platforms) would be nice, and I guess it is on
many buildroot users their wish-list.

>>A general purpose Buildroot/QEMU howto for ARM might serve as both a
worthwhile regression test, and primary support >>document visible at
the Buildroot web site.

Regards Noel.

Message: 3
Date: Wed, 27 Jan 2010 16:10:35 +0000 (UTC)
From: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: [Buildroot] Buildroot How-To for QEMU/ARM
To: buildroot at uclibc.org
Message-ID: <hjpohq$hh6$1@ger.gmane.org>
Content-Type: text/plain; charset=us-ascii

On 2010-01-27, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
> Hello,
>
> I can build qemu-0.12.2 under Ubuntu 9.10 and boot Linux in QEMU using

> the pre-built kernel and RFS in arm-test-0.2, also from the QEMU 
> project.
>
> Now I want to use QEMU to boot a Linux kernel and RFS that I built 
> myself for ARM using buildroot-2009.11.
>
> I have not had much luck. Based on web searching, I have tried 
> twisting knobs in 'make menuconfig' and rebuilt perhaps a couple of 
> dozen times.
>
> Rather than do a core dump here of the details, I thought I would ask:
>
> Has anyone used buildroot-2009.11 to build a kernel and RFS for ARM 
> that boot successfully under qemu-0.12.2?

I built for arm-integrator using HEAD back in November/December, and it
ran fine on qemu-0.9.1.  I didn't do much with it other than boot it up,
log in, and test the virtual serial ports.

> Do step-by-step notes exist for how to do this for ARM that were 
> written for these latest versions of Buildroot and QEMU, or that have 
> been verified as still complete and correct?

Not that I've found.  There were some articles written a couple years
ago that have step-by-step instructions, but they're missing a step or
two and are also now out of date in a few spots.

Here's the .config file I last used -- AFAIR it was working at that
point:

# Automatically generated make config: don't edit # Wed Dec 16 09:10:07
2009 # BR2_HAVE_DOT_CONFIG=y BR2_VERSION="2009.11-git"
# BR2_alpha is not set
<snip>

-- 
Grant Edwards                   grante             Yow! I'm having fun
                                  at               HITCHHIKING to
CINCINNATI
                              visi.com            or FAR ROCKAWAY!!



------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 43, Issue 62
*****************************************
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



      

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



      
