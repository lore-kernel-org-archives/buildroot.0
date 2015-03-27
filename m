From: Steve Kenton <skenton@ou.edu>
Date: Thu, 26 Mar 2015 23:14:35 -0500
Subject: [Buildroot] Where is /dev/console created when using devtmpfs?
In-Reply-To: <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
References: <5512F41A.3080208@ou.edu>
 <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
Message-ID: <5514D92B.4050305@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/26/2015 02:51 PM, Rob Landley wrote:
> On Wed, Mar 25, 2015 at 12:44 PM, Steve Kenton <skenton@ou.edu> wrote:
>> I'm currently running with devtmpfs only but am looking into using mdev
> 
> As the original author of mdev and the guy who did:
> 
> http://lkml.iu.edu/hypermail/linux/kernel/1306.3/04204.html
> 
> I should probably poke my nose in here. :)
Thank you very much for taking the time!

> 
>> so I spent some time looking at my device usage and for the life of me
>> I can't find where /dev/console gets created during the build process.
> 
> The console PID 1 inherits at process launch is the /dev/console in
> initramfs. When you don't have initramfs, the init/noinitramfs.c code
> literally does:
Yes, this is my configuration - initramfs not linked into kernel by buildroot
# BR2_TARGET_ROOTFS_INITRAMFS is not set

> 
>         err = sys_mkdir((const char __user __force *) "/dev", 0755);
>         if (err < 0)
>                 goto out;
> 
>         err = sys_mknod((const char __user __force *) "/dev/console",
>                         S_IFCHR | S_IRUSR | S_IWUSR,
>                         new_encode_dev(MKDEV(5, 1)));
> 
> And then init/main.c does:
> 
>         /* Open the /dev/console on the rootfs, this should never fail */
>         if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
>                 printk(KERN_WARNING "Warning: unable to open an
> initial console.\n");
If I understand correctly all of which occurs on rootfs in ram and does not
touch whatever disk based filesystem may eventually get mounted on /?
> 
>         (void) sys_dup(0);
>         (void) sys_dup(0);
> 
> The devtmpfs mount happens later in the boot, and in fact I have a
> pending todo item to submit a patch to make the kernel DEVTMPFS_MOUNT
> config option actually _apply_ to initramfs. (Last I checked it would
> only mount devtmpfs on /dev in the fallback root that root= switches
> you to when you didn't have an executable /init in initramfs. I should
Apparently still the case, at least buildroot 2015.02 supplied this as /init:

#!/bin/sh
# devtmpfs does not get automounted for initramfs
/bin/mount -t devtmpfs devtmpfs /dev
exec 0</dev/console
exec 1>/dev/console
exec 2>/dev/console
exec /sbin/init $*

> make it so that if it's about to exec /init out of rootfs, it does the
> above mknod /dev trick (ignore failure if it's already there) and then
> mounts devtmpfs on it (and if _that_ fails some crazy person probably
> made a file called /dev and they get to keep the pieces).
grin
> 
>> Looking at the root filesystem when it's not running shows this in /dev
>>
>> drwxrwxr-x 2 root root 4096 Mar  1 15:26 pts
>> lrwxrwxrwx 1 root root   10 Mar  1 15:26 log -> ../tmp/log
>> crw--w--w- 1 root root 5, 1 Mar 22 21:52 console
>>
>> and I see that pts and log come from the skeleton but I can't find console.
> 
> Possibly I'm answering the wrong question.
Since I'm trying to understand what's going on it's a very good answer
and I've read it multiple time while perusing the kernel code, but yes
I was originally wondering where /dev/console was created on the target
filesystem as part of the buildroot make process.

> 
> devtmpfs is a synthetic filesystem, like /proc or /sys. You're not
> talking to any sort of backing store when you mount it, instead the
> driver is hallucinating contents for you to read and write from on the
> fly, and when you interact with it you talk to functions in the driver
> that send/receive some data they just made up to humor your request.
Again if I under stand correctly the contents of the on-disk  /dev on the
root filesystem in my case (initramfs not linked into kernel) are unused
and normally inaccessible because of devtmpfs mount on top?

> 
> I wrote a thing about the four different types of filesystems a while back:
> 
> http://landley.livejournal.com/52326.html
Another very good read - thanks for that too

> 
>> I'm running an x86_64 system using the default vga console if that matters.
>> I'm obviously missing something but I can't find a mknod or mkdevs for it.
>>
>> Where is /dev/console created when using devtmpfs?
I was thinking in terms of the buildroot "use devtmpfs only" as opposed with mdev,
eudev, or systemd

> 
> The same place /proc/mounts is created on procfs?
> 
> The name "console" comes from drivers/tty/tty_io.c:
> 
>         consdev = device_create(tty_class, NULL, MKDEV(TTYAUX_MAJOR, 1), NULL,
>                               "console");
OK
> 
> That sticks an entry into some kernel linked list (or possibly tree),
> which is interpreted by devtmpfs to give you a console device. It's
> also interpreted by sysfs to give you a "console" directory under
> /sys/class/tty. Both filesystem drivers are parsing the same kernel
> internal data to produce different types of output. They do so on the
> fly, when you open the relevant directory and list its contents.
Thanks again for your time and detailed explaination.

Steve

> 
>> Thanks,
>>
>> Steve
> 
> Rob
> 
