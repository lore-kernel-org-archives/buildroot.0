From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 22 Apr 2008 10:50:42 +1000
Subject: [Buildroot] Improper device nodes created
	inside	project_build_arm/uclibc/root/dev/
In-Reply-To: <16819059.post@talk.nabble.com>
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com>
Message-ID: <20080422005042.GA19794@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 21, 2008 at 05:12:30PM -0700, Hebbar wrote:
>     I use the root directory as it is for nfs boot. i put this directory
> inside /etc/exports and mount it on my board at boot time. when i do this
> linux kernel and busybox complains about missing /dev/console, /dev/ttyAMA0.
> 
> So i have delete previous device nodes and create a fresh node. Basically
> device_table and fakeroot fails to create proper device nodes.

Ah. The build process is not intended to create proper device nodes on
desk (non-root user can't do that); the image generation tools either
add the devices directly to the image or we use fakeroot to fake them.

> If this is what it is suppose to do, then how to mount the same for NFS
> boot. 

You could mount a generated image file somewhere via the loopback
device. Then you would have the devices that are in the image. ext2
would be a good choice. Do you want to write back to the root or not?

Alternatively you could add a new target output format for NFS root.

Finally you could use something other than NFS root, if you don't need
to write back to it. Perhaps have your boot loader load a ramdisk via tftp.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
