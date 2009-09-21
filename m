From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Mon, 21 Sep 2009 11:04:52 +0200
Subject: [Buildroot] Buildroot 2009.08 fails to build working rootfs
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69B00E3F@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB69B00E3F@MAIL-UA.ccs.local>
Message-ID: <330EC2471BF24E48B513AF1A6975EB69B00F9F@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found a reason why my rootfs wasn't working. The libraries were missing!

 

And now the cause. It seems that if I remove the
project_build_arm/projectname/root and
project_build_arm/projectname/.root and make the buildroot, the
buildroot won't copy the libraries to new root anymore. If I remove the
build_arm- directory too and let the buildroot compile more stuff the
root will be more complete although then there will be way too much
stuff. More than what is said in .config - file in buildroot
root-directory. Maybe that's because removing that build_arm - directory
like that.

 

It seems for me like buildroot bug, since the old buildroot generated
root always right after it was removed.

 

Teemu Keskinarkaus

 

________________________________

From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Teemu Keskinarkaus
Sent: 18. syyskuuta 2009 12:53
To: buildroot at busybox.net
Subject: [Buildroot] Buildroot 2009.08 fails to build working rootfs

 

First of all I'm using AT91-version of the buildroot-2009.08, but I'm
guessing (or more like hoping) that it has nothing to do with the
problem I'm having.

 

I finally got the buildroot build okay with external toolchain.
Toolchain is glibc eabi toolchain (Codesourcery) and kernel (2.6.30.4)
is configured for eabi too. Kernel boots up just fine and get's rootfs
mounted, but then panics because init is not found.

 

VFS: Mounted root (ubifs filesystem) readonly on device 253:1.

Freeing init memory: 100K

Kernel panic - not syncing: No init found.  Try passing init= option to
kernel.

 

I manually compiled busybox and made my own small rootfs. Then with the
same kernel as before, the system booted up nicely. 

 

I tried to be sneaky and replaced the busybox binary that buildroot was
compiled, with the one I had compiled and let buildroot regenerate
rootfs, but that didn't help. I still got the same error.

 

I programmed the rootfs image as a second partition to unit and booted
up with older buildroot and checked what was that new rootfs like and it
seemed to be just fine. I couldn't see anything that was causing the
problem. And the image was working just fine too.

 

Kernel command line on both working and non-working case is the same:

 

Kernel command line: mem=128M console=ttyS0,115200 ubi.mtd=1 ubi.mtd=2
root=ubi0:rootfs ro rootfstype=ubifs ubi.mtd=3

 

I'm guessing this must be some simple thing, but I just can't figure it
out. Has anyone else had similar problems and how did you solve it?

 

Teemu Keskinarkaus

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090921/9bde5f79/attachment.htm>
