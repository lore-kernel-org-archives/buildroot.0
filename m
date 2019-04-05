From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Apr 2019 06:18:31 +0000
Subject: [Buildroot] [Bug 11756] New: package/syslinux: MBR's don't fit
 because of binutils new .note.gnu.property section
Message-ID: <bug-11756-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11756

            Bug ID: 11756
           Summary: package/syslinux: MBR's don't fit because of binutils
                    new .note.gnu.property section
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

Corresponding bug reports:

 - https://bugs.archlinux.org/task/60405
 - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414


Build failure: 

workspaces/qemu/host/bin/x86_64-buildroot-linux-gnu-ld  -T
workspaces/qemu/build/syslinux-6.03/mbr/i386/mbr.ld -e _start -o mbr.elf mbr.o  
objcopy -O binary mbr.elf mbr.bin
perl workspaces/qemu/build/syslinux-6.03/mbr/checksize.pl mbr.bin
mbr.bin: too big (452 > 440)
make[7]: *** [workspaces/qemu/build/syslinux-6.03/mbr/Makefile:42: mbr.bin]
Error 1


Description:

objcopy -O binary mbr.elf mbr.bin
perl /build/syslinux/src/syslinux/mbr/checksize.pl mbr.bin
mbr.bin: too big (452 > 440)

Fixed in Archlinux32 by stripping the .note.gnu.property in the linker scripts
of the MBRs.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
