From: Kyle Hayes <kyle@greenmonitor.com>
Date: Fri, 14 Jan 2011 09:00:16 -0800
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <20110114104016.252e7f90@surf>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
Message-ID: <AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Will,

I'll update in-line below.

On Fri, Jan 14, 2011 at 1:40 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 14 Jan 2011 09:24:19 -0000
> "Will Moore" <will.moore@beraninstruments.com> wrote:
>
>> > Hard to say since we can't reproduce without having the hardware. I
>> > suspect that on a "normal" x86 CPU, sshd and ssh-keygen are working
>> > fine.
>>
>> I am working on a *similar* platform (vortex86dx VDX6354 embedded PC104)
>> with buildroot for some time. ?I have dropbear working without problems.
>
> Ok, good to know. We don't know if Kyle is using dropbear of the
> full-fledged openssh. That might make a difference.

Sorry, it is the full OpenSSH version.  I need to use OpenVPN too, so
I thought I would try to use the same tools I am currently using.

>> > Are you sure that the Vortex 86DX supports all instructions of i486 ?
>>
>> I think it does.

I am sure of it.  I can run Ubuntu 8.04 on the box with only a custom
kernel.  Everything else is completely stock from Ubuntu 8.04.  As far
as I know, Ubuntu is configured (or was) for either a 486 or a Pentium
when you run it as stock for x86.

>> > Are you sure that the FPU is compatible ?
>>
>> I think it is.
>>
>> Certainly I have had no problems associated with running a buildroot
>> generated i486 toolchain.
>
> Ok, great.

See above.  I am not sure what Ubuntu 8.04 assumes, but I'm fairly
sure it is not using software FPU.

>> I think your problem may be the kernel config. ?Can I suggest that you
>> download the X-Linux sources from http://www.dmp.com.tw/tech/os-xlinux/ then
>> use the kernel configuration for the vortex86dx as your kernel
>> configuration? ?X-Linux is currently stuck at 2.6.29.6 and I have had
>> problems moving to more recent kernels (gdbserver no longer stopped at
>> breakpoints, kernel panics at boot). ?YMMV. ?As X-Linux is provided by DM&P
>> who make the vortex86dx I have taken the "safe" approach and stuck with
>> 2.6.29.6 too and used their kernel configuration verbatim. ?Please note: I
>> am unclear what is in the eBOX 3100 and so what the differences between this
>> and the VDX6354 are. ?If the eBOX is actually a vortex86sx (no FPU) then I
>> have also previously used the VSX6154 which contains the vortex86sx with
>> buildroot using the X-Linux kernel configuration for vortex86sx.
>
> You could probaby diff their 2.6.29.6 kernel with the official
> 2.6.29.6, and see what their changes were, port them over to a new
> kernel release and even get them merged so that you can benefit from
> newer kernel versions.

I had some problems with their kernel when I started and was able to
get in contact with their developers and get a custom patch.  The
problem I was seeing was that one of the three USB ports did not have
an interrupt.  There was an interrupt sharing problem with their
kernel.  I got a patch from them and then ported it forward for both
the Vortex86DX and the Vortex86MX until about 2.6.33:

Linux test-host 2.6.33.2-vortex86mx #1 Fri Apr 16 08:46:19 PDT 2010
i586 GNU/Linux

The next time I checked the kernel, all the patches were already in
it.  I am now using 2.6.37 without any patches and it seems to work
absolutely fine.  Note that I selected _Pentium_ for the kernel and it
is working fine.  Of all the code that will exercise the CPU, the
kernel is probably the most demanding.  I may try selecting that for
the Buildroot build and see what happens.

For anyone using this SoC, I found references on the net that the EHCI
hardware is broken on the DX.  I do not know about the MX.  I have had
to enable the watchdog hardware to catch hangs related to this.  At
least I believe the hangs are related to this.  The boxes sometimes
hang when there is a USB serial device plugged in (for our proprietary
hardware) and seem to be completely stable when the USB serial device
is not plugged in.  Even though the USB serial device is not using the
EHCI controller, the machines seem more stable with the EHCI driver
completely removed from the kernel.  However, it seems to be vaguely
power-quality related.  Machines on cheap UPSes almost never (or
never) hang and machines on flaky local power hang more often.

I had to make custom kernels because I needed a specific, FTDI, USB
serial driver that is not included in the standard kernel builds for
some reason.  It is one of the more popular USB/serial chips, so I'm
not sure why the stock kernel does not include it.  I also needed to
enable the IDE and Ethernet drivers.  Both work fine in my 2.6.37
kernel.  I can post the .config file if someone wants it.

I am currently using a custom distro based on Ubuntu 8.04 with as many
packages trimmed as I can easily do.  This still makes the base CF
card image more than 400MB.  Buildroot is making a base image of about
6MB.  I intend to use extlinux' ability to concatenate multiple
initramfs files to keep our software (which revs fairly often)
separate from OpenVPN config (which doesn't change too often) separate
from the core root filesystem.

I will try dropbear and see if that works any better.  OpenSSH works
fine out-of-the box for the Ubuntu 8.04 version so I'm suspicious that
it is something about the way it is built or with the current version
of OpenSSH.

Best,
Kyle
