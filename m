From: Rob Landley <rob@landley.net>
Date: Sat, 28 Mar 2015 18:04:28 -0500
Subject: [Buildroot] Where is /dev/console created when using devtmpfs?
In-Reply-To: <5515D638.9090502@mind.be>
References: <5512F41A.3080208@ou.edu>
 <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
 <5514D92B.4050305@ou.edu> <5515D638.9090502@mind.be>
Message-ID: <5517337C.2090203@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/27/2015 05:14 PM, Arnout Vandecappelle wrote:
> On 27/03/15 05:14, Steve Kenton wrote:
>> On 03/26/2015 02:51 PM, Rob Landley wrote:
>>> On Wed, Mar 25, 2015 at 12:44 PM, Steve Kenton <skenton@ou.edu> wrote:
> [snip]
>>>> so I spent some time looking at my device usage and for the life of me
>>>> I can't find where /dev/console gets created during the build process.
>>>
>>> The console PID 1 inherits at process launch is the /dev/console in
>>> initramfs. When you don't have initramfs, the init/noinitramfs.c code
>>> literally does:
>> Yes, this is my configuration - initramfs not linked into kernel by buildroot
>> # BR2_TARGET_ROOTFS_INITRAMFS is not set
> 
>  Just to be clear "initramfs not linked into kernel" is BR2_TARGET_ROOTFS_CPIO,
> "initramfs linked into the kernel" is BR2_TARGET_ROOTFS_INITRAMFS. But for the
> purpose of the contents of the rootfs, that doesn't make a difference.
> 
>  But so in your case, Steve, I believe you _do_ have an initramfs, i.e. you have
> selected BR2_TARGET_ROOTFS_CPIO. Otherwise /dev/console wouldn't have been
> created :-).

I note that these are buildroot symbols and I was talking about kernel
config symbols, so you may have to trace through the build process a bit
to see what the kernel .config actually winds up with and thus what
happens at boot time. But it looks like you covered that.

>>> devtmpfs is a synthetic filesystem, like /proc or /sys. You're not
>>> talking to any sort of backing store when you mount it, instead the
>>> driver is hallucinating contents for you to read and write from on the
>>> fly, and when you interact with it you talk to functions in the driver
>>> that send/receive some data they just made up to humor your request.
>> Again if I under stand correctly the contents of the on-disk  /dev on the
>> root filesystem in my case (initramfs not linked into kernel) are unused
>> and normally inaccessible because of devtmpfs mount on top?
> 
>  Indeed, its contents becomes inaccessible as soon as devtmpfs is mounted on
> top. In case of initramfs, that is when /init is executed and it is mounted
> explicitly; in case of non-initramfs, it is mounted just after / is mounted and
> before /sbin/init is executed (Rob, correct me if I'm wrong).

I mentioned I've been meaning to send a patch to make initramfs honor
the kernel's auto-mount-devtmpfs config option. Last I checked it was
only happening for root=/dev/hda style mounts, not for initramfs mounts.
(So your /init script had to mount devtmpfs, I don't think the kernel
does it for you on initramfs. But it's quite possible somebody else
fixed it in the last year or so and I didn't notice. I've been off doing
toybox and banging on sh2 nommu stuff.)

Either way, if you mount another filesystem on top of /dev, the original
contents of /dev are inaccessable until you unmount the filesystem
blocking it. This is pretty much true of the contents of any directory
you mount stuff on: the mount renders the original contents
inaccessable. (Nobody said the directory you mounted on was empty...)

(Ok, that's not _quite_ true. You can mount a filesystem on $PWD but
still access the old contents through "." until you cd out of it. A new
traversal from root wouldn't get you _back_ there, but your current
position still links to the otherwise inaccessable directory. And yes,
back in the day people hacking into 1980's unix systems would hide their
files from the sysadmin by overmounting them. Each process has "/" and
"." as two process-local symlinks indicating your current chroot inode
and your current chdir inode, all paths start from one or the other.
This leads to a fun trick for breaking out of chroots where you make a
subdirectory, call chroot(2) to point / into that subdirectory but _not_
cd into it, then chroot ../../../.. until you stop moving, then chroot /
to get access to the full tree. There's only one chroot symlink you see,
and the test for "can't cd .. past it" is an == test which won't trigger
if your cwd is currently _above_ it.)

Sorry, digression. :)

>  So with initramfs, you will have two versions of /dev/console: one real
> mknod'ed one in the initramfs itself, and a virtual one in the devtmpfs. After
> devtmpfs is mounted, the one in initramfs is no longer accessible.

Neither is "real" or "virtual". Both are device nodes with "block/char",
"major", and "minor" telling the system which driver to talk to you when
you open it.

(If you loopback mount a squashfs that contains device nodes, is that
not a "real" filesystem? How about if rhw dilw you loopback mounted it
from is on a network mount?)

Rob
