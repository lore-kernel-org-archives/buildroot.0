From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 16:16:19 +0000
Subject: [Buildroot] [Bug 10471] New: Building a mipsel kernel format
 vmlinuz (+ gzip + initrd) generates non-compressed, non-bootable image
Message-ID: <bug-10471-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10471

            Bug ID: 10471
           Summary: Building a  mipsel kernel format vmlinuz (+ gzip +
                    initrd) generates non-compressed, non-bootable image
           Product: buildroot
           Version: 2017.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: a.enchevich at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7376
  --> https://bugs.busybox.net/attachment.cgi?id=7376&action=edit
My buildroot's .config file

I have sources + images provided by Broadcom for their 7362a0 set top box
boards. The kernel image there is has initrd linked in and is:

$ ls -l 
-rw-r--r-- 1  me users  5669240 Sep 20 17:52 vmlinuz-initrd-7362a0

$ file vmlinuz-initrd-7362a0
vmlinuz-initrd-7362a0: gzip compressed data, last modified: Wed Sep 20 14:52:20
2017, max compression, from Unix

So the vmlinuz that works is about 5.7MB, gzipped, with the initrd.

 = = =

When I try generating a vmlinuz kernel in buildroot, however, I am getting a
file which is ELF and DOES NOT have the initrd and can not be booted:
-rw-r--r-- 1  me users  8814700 Oct 31 14:04 vmlinuz-from-BR2

$ file vmlinuz-from-BR2 
vmlinuz-from-BR2: ELF 32-bit LSB executable, MIPS, MIPS32 version 1 (SYSV),
statically linked, stripped

The reasons I am saying that initrd is not linked in, is because:
a) the vmlinuz image dies very early during the TFTP transfer (packet 8 or 9).
b) because I also tried compiling a vmlinux image+initrd. That one is about
21MB and about 8.8MB stripped and gzipped. I tried booting the gzipped vmlinux
and it works fine. I do not yet know the reason why it is so much bigger than
Broadcom's original vmlinuz image, but I suppose it is because I linked in
various packages to play with - DirectFB, SDL, SDL2, etc...

 = = =

So firstly, it seems that the option 'initial RAM filesystem linked into linux
kernel' from the Filesystem images menu is ignored in the case of vmlinuz.

Secondly, I was expecting a gzipped data (not and ELF binary) when option
'Kernel compression format (gzip compression)' is selected (regardless of
vmlinux/vmlinuz).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
