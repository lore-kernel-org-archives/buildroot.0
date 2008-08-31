From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 19:20:27 +0800
Subject: [Buildroot] HELP: the rootfs does not work
Message-ID: <ed4892840808310420n251bb8d1hf052f15b4713200e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I built a cramfs rootfs for my arm target. After burning it to the
flash and boot, I got:

...
scsi0 : SCSI emulation for USB Mass Storage devices
IP-Config: No network devices available.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing init memory: 84K
Can't open /dev/null: No such file or directory
...
Can't open /dev/null: No such file or directory
Can't open /dev/tty2: No such file or directory
Can't open /dev/ttyS0: No such file or directory
Can't open /dev/null: No such file or directory
...

I even did not know if the /bin/init got run :(

below are my etc/inittab:

------
# Startup the system
null::sysinit:/bin/mount -o remount,rw /
null::sysinit:/bin/mount -t proc proc /proc

null::sysinit:/bin/mount -t usbfs usb /proc/bus/usb
null::sysinit:/bin/mount -t ramfs ramfs /tmp
null::sysinit:/bin/mount -t ramfs ramfs /var
null::sysinit:/bin/mount -t ramfs ramfs /dev
null::sysinit:/bin/mkdir /dev/pts
null::sysinit:/bin/mount -t devpts devpts /dev/pts
null::sysinit:/bin/mount -t sysfs sysfs /sys
null::sysinit:/bin/mount -t vfat /dev/mmcblk0p1 /mnt/sd

null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Set up a couple of getty's
#tty1::respawn:/sbin/getty 38400 tty1
#tty2::respawn:/sbin/getty 38400 tty2
tty2::respawn:/sbin/getty 115200 /dev/tty2 vt100

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100

# Logging junk
null::sysinit:/bin/touch /var/log/messages
null::respawn:/sbin/syslogd -n -m 0
null::respawn:/sbin/klogd -n
#tty3::respawn:/usr/bin/tail -f /var/log/messages
...
----


Please help. Thanks in advance.
