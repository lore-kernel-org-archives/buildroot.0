From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 11 Jul 2011 21:06:44 +0000
Subject: [Buildroot] /tmp puzzle
In-Reply-To: <CALo-6+h28+HSpczw86fD=Jk0GJa3m+JR9hmHswTpvE59xvMKig@mail.gmail.com>
References: <CALo-6+h28+HSpczw86fD=Jk0GJa3m+JR9hmHswTpvE59xvMKig@mail.gmail.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60401F1@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I need to ask a slighly different question in my desire to
> understand
> what is going on.

the config should be something like:
CONFIG_SHMEM=y
# CONFIG_DEVTMPFS is not set
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y

These two options are found in the following two locations:
General setup  --->
  [*] Configure standard kernel features (for small systems)  --->
    -*-   Use full shmem filesystem

File systems  --->
  Pseudo filesystems  --->
    -*- Virtual memory file system support (former shm fs)

Earlier, you posted something about CONFIG_DEVTMPFS, but that
is not the same thing as CONFIG_TMPFS.

HTH,
Andy

> 
> If I disable "devtmpfs", I build my kernel and rootfilesystem and
> when
> it is mounted, I have a /tmp directory with *stuff* in it, but it
> is
> mounted at /var/tmp. I dont understand how /tmp got mounted. Would
> someone be willing to help me understand how "/tmp" got mounted
> when
> it is not in the result of "mount" ?
> 
> # cat /etc/fstab
> # /etc/fstab: static file system information.
> #
> # <file system> <mount pt>     <type>   <options>         <dump>
> <pass>
> /dev/root       /              jffs2    rw,noauto         0      1
> proc            /proc          proc     defaults          0      0
> devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0
> 0
> tmpfs           /tmp           tmpfs    defaults          0      0
> sysfs           /sys           sysfs    defaults          0      0
> 
> # mount
> rootfs on / type rootfs (rw)
> /dev/root on / type jffs2 (rw,relatime)
> proc on /proc type proc (rw,relatime)
> devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
> sysfs on /sys type sysfs (rw,relatime)
> 
> # mount -a
> mount: mounting tmpfs on /tmp failed: Invalid argument
> #
> 
> # ls /tmp
> dropbear.pid     log              sshd
> ifstate          messages         subsys
> ldconfig         portmap_mapping  utmp
> #
> 
> --
> Charles Krinke
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
