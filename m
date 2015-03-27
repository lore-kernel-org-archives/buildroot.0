From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Mar 2015 23:14:16 +0100
Subject: [Buildroot] Where is /dev/console created when using devtmpfs?
In-Reply-To: <5514D92B.4050305@ou.edu>
References: <5512F41A.3080208@ou.edu>
 <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
 <5514D92B.4050305@ou.edu>
Message-ID: <5515D638.9090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/03/15 05:14, Steve Kenton wrote:
> On 03/26/2015 02:51 PM, Rob Landley wrote:
>> On Wed, Mar 25, 2015 at 12:44 PM, Steve Kenton <skenton@ou.edu> wrote:
[snip]
>>> so I spent some time looking at my device usage and for the life of me
>>> I can't find where /dev/console gets created during the build process.
>>
>> The console PID 1 inherits at process launch is the /dev/console in
>> initramfs. When you don't have initramfs, the init/noinitramfs.c code
>> literally does:
> Yes, this is my configuration - initramfs not linked into kernel by buildroot
> # BR2_TARGET_ROOTFS_INITRAMFS is not set

 Just to be clear "initramfs not linked into kernel" is BR2_TARGET_ROOTFS_CPIO,
"initramfs linked into the kernel" is BR2_TARGET_ROOTFS_INITRAMFS. But for the
purpose of the contents of the rootfs, that doesn't make a difference.

 But so in your case, Steve, I believe you _do_ have an initramfs, i.e. you have
selected BR2_TARGET_ROOTFS_CPIO. Otherwise /dev/console wouldn't have been
created :-).

> 
>>
>>         err = sys_mkdir((const char __user __force *) "/dev", 0755);
>>         if (err < 0)
>>                 goto out;
>>
>>         err = sys_mknod((const char __user __force *) "/dev/console",
>>                         S_IFCHR | S_IRUSR | S_IWUSR,
>>                         new_encode_dev(MKDEV(5, 1)));

 Note again that this stuff is only done when there is no initramfs. In other
words, when there is an initramfs, this initramfs must contain /dev/console or
you have no console.

 That's why buildroot adds it explicitly in fs/cpio/cpio.mk:

PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)

>>
>> And then init/main.c does:
>>
>>         /* Open the /dev/console on the rootfs, this should never fail */
>>         if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
>>                 printk(KERN_WARNING "Warning: unable to open an
>> initial console.\n");
> If I understand correctly all of which occurs on rootfs in ram and does not
> touch whatever disk based filesystem may eventually get mounted on /?

 Indeed.

[snip]
>>
>> devtmpfs is a synthetic filesystem, like /proc or /sys. You're not
>> talking to any sort of backing store when you mount it, instead the
>> driver is hallucinating contents for you to read and write from on the
>> fly, and when you interact with it you talk to functions in the driver
>> that send/receive some data they just made up to humor your request.
> Again if I under stand correctly the contents of the on-disk  /dev on the
> root filesystem in my case (initramfs not linked into kernel) are unused
> and normally inaccessible because of devtmpfs mount on top?

 Indeed, its contents becomes inaccessible as soon as devtmpfs is mounted on
top. In case of initramfs, that is when /init is executed and it is mounted
explicitly; in case of non-initramfs, it is mounted just after / is mounted and
before /sbin/init is executed (Rob, correct me if I'm wrong).

 So with initramfs, you will have two versions of /dev/console: one real
mknod'ed one in the initramfs itself, and a virtual one in the devtmpfs. After
devtmpfs is mounted, the one in initramfs is no longer accessible.

> 
>>
>> I wrote a thing about the four different types of filesystems a while back:
>>
>> http://landley.livejournal.com/52326.html
> Another very good read - thanks for that too
> 
>>
>>> I'm running an x86_64 system using the default vga console if that matters.
>>> I'm obviously missing something but I can't find a mknod or mkdevs for it.
>>>
>>> Where is /dev/console created when using devtmpfs?
> I was thinking in terms of the buildroot "use devtmpfs only" as opposed with mdev,
> eudev, or systemd

 Actually, all four of these use devtmpfs. The only thing that mdev, eudev, and
systemd-udev add is the possibility to do more processing (e.g. creating
symlinks) when the device is created. But the kernel itself will always create
the device node in devtmpfs.


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
