From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Mar 2021 22:51:35 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-1yT37yTQoO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #3 from ingineru_de_sistem at yahoo.com ---
This is the .config I used (see attached file).
Try to use it yourself on a Ubuntu 20.04 x64 VM as a host, to get a closer look
at the issues I found.


2.2) Also forgot about this one:  when compiling syslinux, it cannot find the
strlen function to link in file
..../buildroot/output/build/syslinux-6.03/libinstaller/syslxmod.c
Since it's the only thing used from <string.h>, it's easier to just comment out
/* #include <string.h> */
and enter a quick and dirty replacement for it:
#ifndef strlen
int strlen(char *s){
 int l=0;
 while (*s) { ++l;++s;}
 return l;
}
#endif

it seems to like it

4) someone else also noticed that buildroot doesn't build a gcc binary for the
targets, even though it does build other development tools.
Please note that it IS needed for anyone who needs to program on the target in
C, C++, perl, python, lua, fortran 2018+, etc. .
One can try musl, but it's not the same as GNU gcc.

5) I understand the connection with busybox, but I'd still like an option to
not use it on systems that can afford the drive space. If this option already
exists, please document it.

6) syslinux finally worked, but with very little documentation.
Here's how I did it:
a) install the mbr binary in the first 440 bytes of the hdd image.
b) partition the image, make a linux partition of the exact same size as
rootfs.ext2 then a small FAT16 partition. Make the FAT16 partition bootable.
c) find the 32 bit syslinux binary in the buildroot folder, install the 32 bit
libraries on the host Ubuntu 20.04, run the 32-bit syslinux to install in the
FAT16 partition
d) manually add bzImage to the FAT16 partition, then create a syslinux.cfg file
there (documentation on the Syslinux web site)

*Guessing* that if one has an older system that needs an upgrade and IF the
upgrade goes on a different disk, one could use the old LILO with the new
kernel and the new disk or partition, without syslinux. Haven't tried this yet.
The LILO documentation is on TLDP (watch out for the case when installing on a
hdd that is not in the same position as when it will boot; it is documented and
useful).

At any rate, syslinux is needed to boot on a naked VM (for testing the image)
without any older boot loader.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
