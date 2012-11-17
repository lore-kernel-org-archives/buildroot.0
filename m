From: Juha Lumme <juha.lumme@gmail.com>
Date: Sat, 17 Nov 2012 17:22:27 +0900
Subject: [Buildroot] Built a file system,
	have a working kernel - how to login ?
Message-ID: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm new to buildroot, and actually also to creating linux systems. I really
need help understanding some basics of how a system bring up should happen..
I have been working on a custom system of mine, running currently on a
reference HW from Olimex.

I have built a working kernel, and now I created a file system with
buildroot with all the settings default. Well, I did change the default
console to ttyAMA0, as that is passed to the kernel by the loader.

Now, the system boots up to the mounting filesystem, and then just hangs
there:
.....
[    3.130000] VFS: Mounted root (ext3 filesystem) on device 179:2.
[    3.140000] Freeing init memory: 144K
Starting logging: OK
Starting network...
ip: RTNETLINK answers: Operation not permitted
ip: SIOCSIFFLAGS: Permission denied

(The whole boot log is here: http://paste.ubuntu.com/1364407/ )

Can someone please educate me a bit what are the steps needed to get a
login prompt, and to be able to access the system ? I don't really
understand how the TTY links in /dev/ work, and how I need to tie them to
the kernel configuration..

My understanding is that inittab is the file I should modify.. Contents of
that is:
# Startup the system
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mkdir -p /dev/shm
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Put a getty on the sttyAMA0::respawn:/sbin/getty -L ttyAMA0 115200 vt100
# GENERIC_SERIAL

# Stuff to do for the 3-finger salute
::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
null::shutdown:/etc/init.d/rcK
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff -a

Thank you for any advice or tips in advance!
Juha
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121117/3187a9ec/attachment.html>
