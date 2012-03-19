From: bifferos <bifferos@yahoo.co.uk>
Date: Mon, 19 Mar 2012 12:36:39 +0000
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <201203182240.17492.arnout@mind.be>
References: <201203031529.36487.arnout@mind.be>
 <201203181813.30601.arnout@mind.be> <4F664B9E.7080604@yahoo.co.uk>
 <201203182240.17492.arnout@mind.be>
Message-ID: <4F672857.4050609@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2012 09:40 PM, Arnout Vandecappelle wrote:
> On Sunday 18 March 2012 21:54:54 bifferos wrote:
>> What kernel command-line should this system be using?
>   I would expect it should work with an empty command line.
That's what I thought.  I was hoping there was some init= or initrd= 
option that I might have got wrong.

It seems the file /init always gets executed from initramfs, and this is 
not configured in the kernel command-line, so I presume it must be 
hard-coded somewhere in the kernel.  I tried removing this file and 
re-making the cpio, but that didn't help.

When I add the 'misc' exe format to the kernel I simply get a boot log 
ending with this:

TCP cubic registered
Warning: unable to open an initial console.
Freeing unused kernel memory: 520k freed
Write protecting the kernel text: 1052k
Write protecting the kernel read-only data: 160k

And stopping there.  So no segfault, but it doesn't seem to be doing 
anything.

So the next thing I tried was hard-coding /bin/sh as the program to 
execute in main/init.c, passed into run_init_process(), and eventually 
ending in fs/exec.c:

http://lxr.linux.no/#linux+v3.3/fs/exec.c#L1453

This function executes OK (retval ==0) according to the printk's I 
scattered through it so now I'm really stuck.

So back to what actually does work.

The following fs layout *does* work:

drwxr-xr-x root/root         0 2012-03-19 12:24 ./
drwxr-xr-x root/root         0 2012-03-19 12:20 ./home/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./config/
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./bin -> sbin
drwxr-xr-x root/root         0 2012-03-19 12:20 ./usr/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./usr/bin/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./usr/share/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./usr/share/udhcpc/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./usr/sbin/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./var/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./var/log/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./var/run/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./sys/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./sbin/
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/ls -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/chgrp -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/killall -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/chown -> ./busybox
-rwxr-xr-x root/root    296664 2012-03-19 12:20 ./sbin/busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/arp -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/cttyhack -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/reboot -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/syslogd -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/halt -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/cp -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/lsmod -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/ifconfig -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/hostname -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/df -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/dmesg -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/login -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/umount -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/shutdown -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/mkdir -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/insmod -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/poweroff -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/ps -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/inetd -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/ping -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/hush -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/kill -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/telnetd -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/logger -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/logread -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/ln -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/init -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/chmod -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/wget -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/httpd -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/rm -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/mknod -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/mount -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/getty -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/stty -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/mdev -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/ftpd -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/sh -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/cat -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/rmdir -> ./busybox
lrwxrwxrwx root/root         0 2012-03-19 12:20 ./sbin/klogd -> ./busybox
drwxr-xr-x root/root         0 2012-03-19 12:20 ./proc/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./etc/
-rw-r--r-- root/root        95 2012-03-19 12:20 ./etc/inittab
-rwxr-xr-x root/root       285 2012-03-19 12:20 ./etc/rc-kexec
-rw-r--r-- root/root       463 2012-03-19 12:20 ./etc/passwd
drwxr-xr-x root/root         0 2012-03-19 12:20 ./etc/init.d/
-rwxr-xr-x root/root       584 2012-03-19 12:20 ./etc/init.d/rcS
-rw-r--r-- root/root       218 2012-03-19 12:20 ./etc/group
-rw-r--r-- root/root        20 2012-03-19 12:20 ./etc/hosts
-rwxr-xr-x root/root       559 2012-03-19 12:20 ./etc/rc
-rw-r--r-- root/root       185 2012-03-19 12:20 ./etc/mdev.conf
drwxr-xr-x root/root         0 2012-03-19 12:20 ./tmp/
drwxr-xr-x root/root         0 2012-03-19 12:20 ./dev/
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/ttyS0
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/console
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/tty5
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/tty0
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/tty3
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/ptmx
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/sda1
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/tty4
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/tty1
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/tty2
-rw-r--r-- root/root         0 2012-03-19 12:20 ./dev/null

Note:  That's the same busybox binary copied from 
buildroot/output/target/bin/busybox.

my inittab is:
::sysinit:/etc/init.d/rcS
::respawn:/bin/sh
::restart:/sbin/init
::shutdown:/bin/umount -a -r

my rcS is:
#!/bin/sh

echo "* Mounting /proc..."
mount -t proc /proc /proc

echo "* Mounting /sys..."
mount -t sysfs none /sys

echo "* Mounting /dev/pts..."
mkdir /dev/pts
mount -t devpts devpts /dev/pts

echo "* Mounting /dev/shm..."
mkdir /dev/shm
mount -t tmpfs none /dev/shm

echo "* Starting system loggers..."
syslogd

echo "* Creating devices..."
/sbin/mdev -s

echo "* Configuring loopback interface..."
ifconfig lo 127.0.0.1

echo "* Configuring networ..."
ifconfig eth0 192.168.1.12

echo "* Setting hostname..."
hostname bifferboard

echo "* Starting telnetd..."
telnetd -l /bin/sh


So when I have a solution that works, I'm a bit of an idiot to be 
slogging away for days to get a solution the 'neat' way with buildroot.  
I can still use buildroot to build busybox, just not the whole rootfs, 
and I think I'll leave it at that unless you've anything else I can try.


cheers,
Biff.
