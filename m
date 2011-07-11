From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 11 Jul 2011 10:36:04 -0700
Subject: [Buildroot] tmpfs puzzle
In-Reply-To: <201107111218.34789.minimod@morethan.org>
References: <CALo-6+iVEYuZm=Tr9opt-VOz+4ZqnGQJ8LbD-tV-dEojfdXMMA@mail.gmail.com>
 <201107111218.34789.minimod@morethan.org>
Message-ID: <CALo-6+j1ofn_HEEAY3_P2G-1=uzVnZ6Hj1uPad35KnD5AH4jVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andy & Michael:

Thanks for starting out Monday on a high note. With a tiny bit of
seriousness here is a cat of /proc/filesystems

# cat /proc/filesystems
nodev   sysfs
nodev   rootfs
nodev   bdev
nodev   proc
nodev   tmpfs
nodev   devtmpfs
nodev   sockfs
nodev   pipefs
nodev   anon_inodefs
nodev   devpts
nodev   ramfs
        vfat
        msdos
nodev   jffs2
nodev   mqueue
#

Additionally, in the kernel's .config file, I have:

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_SHMEM=y

I also have a /tmp (which puzzles me a bit)
# ls /tmp
dropbear.pid     ldconfig         portmap_mapping  subsys
ifstate          messages         sshd             utmp
#

Getting to the real issue, it is the failure of the sem_open() call
which returns ENOSYS. So, I go through glibc source and look at the
sem_open.c file which seems dependent on either "/dev/shm" or
/proc/mounts returning a mnt_type of "tmpfs" and not "devtmpfs". So, I
am really trying to "humourously" find my way through a slightly
mysterious part of Linux. Mysterious being that I am a driver/kernel
guy struggling with mounts, libraries and the like.



On Mon, Jul 11, 2011 at 10:18 AM, Michael S. Zick <minimod@morethan.org> wrote:
> On Mon July 11 2011, Charles Krinke wrote:
>> I am puzzled why "tmpfs" is not mounting in my buildroot glibc root
>> filesystem and would appreciate a "clue" or at least a sarcastic
>> "RTFM" if one could tell me *which* "FM" and what its URL might be.
>>
>
> I'm crude, I can do that for you!
> cat /proc/filesystems
>
> Just on the chance it isn't enabled in your kernel build.
> Mike
>>
>> Here is my /etc/fstab, a cat or /proc/mounts and the result of "mount
>> -a", which fails on tmpfs.
>>
>> # cat /etc/fstab
>> # /etc/fstab: static file system information.
>> #
>> # <file system> <mount pt> ? ? <type> ? <options> ? ? ? ? <dump> <pass>
>> /dev/root ? ? ? / ? ? ? ? ? ? ?ext2 ? ? rw,noauto ? ? ? ? 0 ? ? ?1
>> proc ? ? ? ? ? ?/proc ? ? ? ? ?proc ? ? defaults ? ? ? ? ?0 ? ? ?0
>> devpts ? ? ? ? ?/dev/pts ? ? ? devpts ? defaults,gid=5,mode=620 ? 0 ? ? ?0
>> tmpfs ? ? ? ? ? /tmp ? ? ? ? ? tmpfs ? ?defaults ? ? ? ? ?0 ? ? ?0
>> sysfs ? ? ? ? ? /sys ? ? ? ? ? sysfs ? ?defaults ? ? ? ? ?0 ? ? ?0
>> #
>> #
>> # cat /proc/mounts
>> rootfs / rootfs rw 0 0
>> /dev/root / jffs2 rw,relatime 0 0
>> devtmpfs /dev devtmpfs rw,relatime,mode=0755 0 0
>> proc /proc proc rw,relatime 0 0
>> devpts /dev/pts devpts rw,relatime,gid=5,mode=620 0 0
>> sysfs /sys sysfs rw,relatime 0 0
>> #
>> #
>> #
>> # mount -a
>> mount: mounting tmpfs on /tmp failed: Invalid argument
>> #
>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
