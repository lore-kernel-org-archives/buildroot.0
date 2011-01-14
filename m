From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 14 Jan 2011 09:24:19 -0000
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <20110114090752.5f01ade5@surf>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
Message-ID: <469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> On Behalf Of Thomas Petazzoni
> Sent: 14 January 2011 08:08
> Hello Kyle,
> 
> On Thu, 13 Jan 2011 13:29:42 -0800
> Kyle Hayes <kyle@greenmonitor.com> wrote:
> 
> > I am getting a seg fault when ssh-keygen tries to run and when sshd
> > tries to start.  Here is my set up:
> >
> > Buildroot: GIT checkout from 1/11/11
> > Kernel: 2.6.37
> > Initrd type: CPIO/gzip
> >
> > machine: DMP eBox 3100 (PC-compatible x86 machine w/256MB of RAM)
> >
> > I've got extlinux installed, the kernel boots fine and I get a login
> > prompt.  However, I see errors that ssh-keygen and sshd are seg
> > faulting.
> >
> > I would appreciate any tips on how to debug/fix this.  Buildroot is
> > exactly the system I was looking for.
> 
> Hard to say since we can't reproduce without having the hardware. I
> suspect that on a "normal" x86 CPU, sshd and ssh-keygen are working
> fine.

I am working on a *similar* platform (vortex86dx VDX6354 embedded PC104)
with buildroot for some time.  I have dropbear working without problems.

> 
> So the best you could do is use gdbserver on the target and a
> cross-gdb (both can be built by Buildroot) and start ssh-keygen without
> gdbserver in order to find the location of the segfault in ssh-keygen.
> That would really in understanding the issue.
> 
> Are you sure that the Vortex 86DX supports all instructions of i486 ?

I think it does.

> Are you sure that the FPU is compatible ?

I think it is.

Certainly I have had no problems associated with running a buildroot
generated i486 toolchain.

 The documentation of the
> Vortex 86DX states that it has a FPU, but I don't know if it's the same
> as the one in normal x86 CPUs. Maybe you could try to build Buildroot
> with BR2_SOFT_FLOAT=y (config options: "Use software floating point by
> default").

I think your problem may be the kernel config.  Can I suggest that you
download the X-Linux sources from http://www.dmp.com.tw/tech/os-xlinux/ then
use the kernel configuration for the vortex86dx as your kernel
configuration?  X-Linux is currently stuck at 2.6.29.6 and I have had
problems moving to more recent kernels (gdbserver no longer stopped at
breakpoints, kernel panics at boot).  YMMV.  As X-Linux is provided by DM&P
who make the vortex86dx I have taken the "safe" approach and stuck with
2.6.29.6 too and used their kernel configuration verbatim.  Please note: I
am unclear what is in the eBOX 3100 and so what the differences between this
and the VDX6354 are.  If the eBOX is actually a vortex86sx (no FPU) then I
have also previously used the VSX6154 which contains the vortex86sx with
buildroot using the X-Linux kernel configuration for vortex86sx.

> 
> Regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
