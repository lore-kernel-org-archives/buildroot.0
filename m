From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 23 Apr 2008 00:07:27 +1000
Subject: [Buildroot] Failing NFS root mount
In-Reply-To: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
Message-ID: <20080422140727.GA32518@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 22, 2008 at 02:34:08PM +0200, Guillaume Dargaud wrote:
> [    4.389172] VFS: Mounted root (nfs filesystem).
> [    4.392920] Freeing unused kernel memory: 76k init
> 
> And then it hangs.
> If I boot from /dev/xsa2, it then carries on with:

> A few additional hints that may be related (but then again, they may not):
> If I log from the local partition, I can mount the remote root by NFS fine, 
> for instance:
> 
> # mount -t nfs 
> 192.168.1.185:/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root 
> /mount
> 
> And then manipulate files both ways fine.
> 
> But if I try to chroot /mount while being in bash (an independant 
> executable) I get an endless loop:

An excellent test. However, fairly obviously I think, if the shell
doesn't start in the chroot it's not going to start in a direct boot
either. So you need to figure out why.

> If I'm using ash (linked to busybox), then I can chroot okay (problems with 
> /proc but I can run executables).

What if you boot the system in that configuration?

You will need to mount /proc in the chroot too btw, and maybe /tmp and
/dev/pts too depending on what you run in there.

If your target is an embedded system, then busybox's ash is a much
better choice than bloatware bash anyway.

> Question: if booting off NFS, do I need to change the /etc/fstab ?
> /dev/root       /              ext2     rw,noauto         0      1

I don't think you ever need to list /dev/root in the fstab.. the kernel
certainly isn't using it to mount the root and I don't think anything
else is either.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
