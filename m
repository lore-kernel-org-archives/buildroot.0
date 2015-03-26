From: Rob Landley <rob@landley.net>
Date: Thu, 26 Mar 2015 14:51:46 -0500
Subject: [Buildroot] Where is /dev/console created when using devtmpfs?
In-Reply-To: <5512F41A.3080208@ou.edu>
References: <5512F41A.3080208@ou.edu>
Message-ID: <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 25, 2015 at 12:44 PM, Steve Kenton <skenton@ou.edu> wrote:
> I'm currently running with devtmpfs only but am looking into using mdev

As the original author of mdev and the guy who did:

http://lkml.iu.edu/hypermail/linux/kernel/1306.3/04204.html

I should probably poke my nose in here. :)

> so I spent some time looking at my device usage and for the life of me
> I can't find where /dev/console gets created during the build process.

The console PID 1 inherits at process launch is the /dev/console in
initramfs. When you don't have initramfs, the init/noinitramfs.c code
literally does:

        err = sys_mkdir((const char __user __force *) "/dev", 0755);
        if (err < 0)
                goto out;

        err = sys_mknod((const char __user __force *) "/dev/console",
                        S_IFCHR | S_IRUSR | S_IWUSR,
                        new_encode_dev(MKDEV(5, 1)));

And then init/main.c does:

        /* Open the /dev/console on the rootfs, this should never fail */
        if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
                printk(KERN_WARNING "Warning: unable to open an
initial console.\n");

        (void) sys_dup(0);
        (void) sys_dup(0);

The devtmpfs mount happens later in the boot, and in fact I have a
pending todo item to submit a patch to make the kernel DEVTMPFS_MOUNT
config option actually _apply_ to initramfs. (Last I checked it would
only mount devtmpfs on /dev in the fallback root that root= switches
you to when you didn't have an executable /init in initramfs. I should
make it so that if it's about to exec /init out of rootfs, it does the
above mknod /dev trick (ignore failure if it's already there) and then
mounts devtmpfs on it (and if _that_ fails some crazy person probably
made a file called /dev and they get to keep the pieces).

> Looking at the root filesystem when it's not running shows this in /dev
>
> drwxrwxr-x 2 root root 4096 Mar  1 15:26 pts
> lrwxrwxrwx 1 root root   10 Mar  1 15:26 log -> ../tmp/log
> crw--w--w- 1 root root 5, 1 Mar 22 21:52 console
>
> and I see that pts and log come from the skeleton but I can't find console.

Possibly I'm answering the wrong question.

devtmpfs is a synthetic filesystem, like /proc or /sys. You're not
talking to any sort of backing store when you mount it, instead the
driver is hallucinating contents for you to read and write from on the
fly, and when you interact with it you talk to functions in the driver
that send/receive some data they just made up to humor your request.

I wrote a thing about the four different types of filesystems a while back:

http://landley.livejournal.com/52326.html

> I'm running an x86_64 system using the default vga console if that matters.
> I'm obviously missing something but I can't find a mknod or mkdevs for it.
>
> Where is /dev/console created when using devtmpfs?

The same place /proc/mounts is created on procfs?

The name "console" comes from drivers/tty/tty_io.c:

        consdev = device_create(tty_class, NULL, MKDEV(TTYAUX_MAJOR, 1), NULL,
                              "console");

That sticks an entry into some kernel linked list (or possibly tree),
which is interpreted by devtmpfs to give you a console device. It's
also interpreted by sysfs to give you a "console" directory under
/sys/class/tty. Both filesystem drivers are parsing the same kernel
internal data to produce different types of output. They do so on the
fly, when you open the relevant directory and list its contents.

> Thanks,
>
> Steve

Rob
