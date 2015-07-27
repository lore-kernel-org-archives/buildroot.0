From: Steve Kenton <skenton@ou.edu>
Date: Mon, 27 Jul 2015 13:55:51 -0500
Subject: [Buildroot] udevadm: missing or unknown command
Message-ID: <55B67EB7.4090402@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have an (x86) application where the end users can hot plug disks drives.
Since I have no control over what they put where, labels etc are of limited use
so I switched from mdev to eudev so I could match the actual SATA port in use
These rules added to a file in /etc/udev/rules.d seem to do the trick

# Bind the drive names to the physical port they connect too - udev no longer allow renaming device nodes so set up HDi* symlinks instead
DEVPATH=="/devices/pci0000:00/0000:00:1f.2/ata1/host0/target0:0:0/0:0:0:0/block/sd*", ENV{ID_TYPE}=="disk", SYMLINK+="HDia%n"
DEVPATH=="/devices/pci0000:00/0000:00:1f.2/ata2/host1/target1:0:0/1:0:0:0/block/sd*", ENV{ID_TYPE}=="disk", SYMLINK+="HDib%n"
DEVPATH=="/devices/pci0000:00/0000:00:1f.2/ata3/host2/target2:0:0/2:0:0:0/block/sd*", ENV{ID_TYPE}=="disk", SYMLINK+="HDie%n"
DEVPATH=="/devices/pci0000:00/0000:00:1f.2/ata4/host3/target3:0:0/3:0:0:0/block/sd*", ENV{ID_TYPE}=="disk", SYMLINK+="HDif%n"
DEVPATH=="/devices/pci0000:00/0000:00:1f.2/ata5/host4/target4:0:0/4:0:0:0/block/sd*", ENV{ID_TYPE}=="disk", SYMLINK+="HDic%n"
DEVPATH=="/devices/pci0000:00/0000:00:1f.2/ata6/host5/target5:0:0/5:0:0:0/block/sd*", ENV{ID_TYPE}=="disk", SYMLINK+="HDid%n"

They create the symlinks I was wanting and which do indeed track the SATA cables regardless of the order the drives are plugged

$ ls -l /dev/H*
lrwxrwxrwx 1 root root 3 Jul 27 13:38 /dev/HDia -> sda
lrwxrwxrwx 1 root root 4 Jul 27 13:38 /dev/HDia1 -> sda1
lrwxrwxrwx 1 root root 4 Jul 27 13:38 /dev/HDia2 -> sda2
lrwxrwxrwx 1 root root 3 Jul 27 13:38 /dev/HDib -> sdb
lrwxrwxrwx 1 root root 4 Jul 27 13:38 /dev/HDib1 -> sdb1
lrwxrwxrwx 1 root root 3 Jul 27 13:38 /dev/HDic -> sdc
lrwxrwxrwx 1 root root 4 Jul 27 13:38 /dev/HDic1 -> sdc1
lrwxrwxrwx 1 root root 4 Jul 27 13:38 /dev/HDic2 -> sdc2
lrwxrwxrwx 1 root root 4 Jul 27 13:38 /dev/HDic5 -> sdc5

However, when I try to run udevadm - which does exist:

$ ls -l /sbin/udevadm
lrwxrwxrwx 1 root root 16 Jul 27 10:55 sbin/udevadm -> /usr/bin/udevadm

$ ls -l /usr/bin/udevadm
-rwxr-xr-x 1 root root 253568 Jul 27 12:38 usr/bin/udevadm


And appears to be a valid executable file

$ file udevadm
udevadm: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, stripped


I get this message

$ ./udevadm
udevadm: missing or unknown command


Missing dependency Somewhere maybe? Anyone have a clue? Because I'm stuck.


Thanks, Steve
