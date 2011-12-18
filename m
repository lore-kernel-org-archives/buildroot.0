From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Dec 2011 05:28:37 +0000 (UTC)
Subject: [Buildroot] [Bug 4634] New: Bigendian binary is output even if it
 is configured to output little endian
Message-ID: <bug-4634-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4634

           Summary: Bigendian binary is output even if it is configured to
                    output little endian
           Product: buildroot
           Version: 2011.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: matusita at k-micro.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I set build options as below in "make menuconfig" to build root filesystem:
  Target Architecture (mipsel)
  Target Architecture Variant (mips 32r2)
  Toolcain-Toolchain type (External toolchain)
  Toolcain-Toolchain (CodeSourcery MIPS 2011.03)

I expected that little enfian binary will be output because "mipsel" is
selected. But it was big endian.
I confirmed it by objdump with "-f" option like below.

  % mips-linux-gnu-objdump -f busybox
    busybox:     file format elf32-tradbigmips      <-- Big endian !!!
    architecture: mips:isa32r2, flags 0x00000112:
    EXEC_P, HAS_SYMS, D_PAGED
    start address 0x00403f00

So, I saw following file:
  toolchain/toolchain-external/ext-tool.mk

And I understand that this script get libraries' location by calling
(prefix)-gcc with following options:
  -print-sysroot
  -print-file-name=libc.a

But as for this toolchain(CodeSourcery MIPS 2011.03), it is need to set "-EL"
option as well to get correct location of little endian libraries.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
