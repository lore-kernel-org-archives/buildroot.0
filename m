From: Steve Kenton <skenton@ou.edu>
Date: Fri, 27 Mar 2015 18:35:47 -0500
Subject: [Buildroot] Where is /dev/console created when using devtmpfs?
In-Reply-To: <5515D638.9090502@mind.be>
References: <5512F41A.3080208@ou.edu>
 <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
 <5514D92B.4050305@ou.edu> <5515D638.9090502@mind.be>
Message-ID: <5515E953.2010207@ou.edu>
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
I've been known to be confused once or twice :-)

Yes, BR2_TARGET_ROOTFS_CPIO was still explicitly set in my config from previous testing
and experimentation with initramfs even though BR2_TARGET_ROOTFS_INITRAMFS was not set.
Since BR2_TARGET_ROOTFS_INITRAMFS selects BR2_TARGET_ROOTFS_CPIO I must have been confused :-(
So even though I am currently using the tar version of the rootfs there is indeed
also a cpio version getting created and that process is where /dev/console comes from in
my on-disk rootfs. It should disappear when I clear the unneeded BR2_TARGET_ROOTFS_CPIO.


.../buildroot-2015.02/output/images$ ls -l
total 548980
-rw-rw-r-- 1 steve steve   5896640 Mar 26 22:44 bzImage
-rw-rw-r-- 1 steve steve    139560 Mar 22 19:59 grub.img
-rw-rw-r-- 1 steve steve 183162368 Mar 26 22:44 rootfs.cpio
-rw-rw-r-- 1 steve steve 213949440 Mar 26 22:44 rootfs.ext2
lrwxrwxrwx 1 steve steve        11 Mar 26 22:44 rootfs.ext4 -> rootfs.ext2
-rw-rw-r-- 1 steve steve 185610240 Mar 26 22:44 rootfs.tar
drwxr-xr-x 2 steve steve      4096 Mar 22 20:01 syslinux

Oops!

.../dev$ ls -l
total 4
crw--w--w- 1 root root 5, 1 Mar 25 22:54 console
lrwxrwxrwx 1 root root   10 Mar  1 15:26 log -> ../tmp/log
drwxrwxr-x 2 root root 4096 Mar  1 15:26 pts

And it makes sense now.


> 
>>
>>>
>>>         err = sys_mkdir((const char __user __force *) "/dev", 0755);
>>>         if (err < 0)
>>>                 goto out;
>>>
>>>         err = sys_mknod((const char __user __force *) "/dev/console",
>>>                         S_IFCHR | S_IRUSR | S_IWUSR,
>>>                         new_encode_dev(MKDEV(5, 1)));
> 
>  Note again that this stuff is only done when there is no initramfs. In other
> words, when there is an initramfs, this initramfs must contain /dev/console or
> you have no console.
> 
>  That's why buildroot adds it explicitly in fs/cpio/cpio.mk:
> 
> PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)

Ahhh! and that answers my original question of where the on-disk /dev/console come from.

Thanks everyone for the information.

Rob, my 2 cents worth says that todo item of yours is a good idea.

Steve

[snip]
