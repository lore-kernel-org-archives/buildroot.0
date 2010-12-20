From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Dec 2010 15:43:55 +0000 (UTC)
Subject: [Buildroot] [Bug 2995] New: -fstack-protector-all causes ssh to
	SIGSEGV
Message-ID: <bug-2995-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2995

           Summary: -fstack-protector-all causes ssh to SIGSEGV
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mario at klebsch.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi!

I bought an AMD Geode alix 2D13 board and tried to get linux running on it. I
compiled buildroot and from the first attempt on, every ssh program crashes
(SIGSEGV). During booting, ssh-keygen crashes, but the other ssh programs
started on the command line did not run, either.
:-(

To get some light on this, I built gdb for my target system and tried to run
ssh-keygen under debugger control. It turned out, that the SIGSEGV was caused
by the third assembly instruction in main. I added a small 'Hello World' to the
openssh source tree and this program also crashed due to the same cause.

Here is the disassembly of the small hello word (which was compiled to xxx.o):


ds9 src # objdump --disassemble openssh-5.1p1/xxx.o 

openssh-5.1p1/xxx.o:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:    8d 4c 24 04                     lea    0x4(%esp),%ecx
   4:    83 e4 f0                           and    $0xfffffff0,%esp
   7:    ff 71 fc                             pushl  -0x4(%ecx)
   a:    55                                         push   %ebp
   b:    89 e5                                mov    %esp,%ebp
   d:    51                                      push   %ecx
   e:    83 ec 20                           sub    $0x20,%esp
  11:65 a1 14 00 00 00          mov    %gs:0x14,%eax      <--- Here it crashed
  17:89 45 f8                            mov    %eax,-0x8(%ebp)
  1a:    31 c0                                 xor    %eax,%eax
  1c:    68 00 00 00 00               push   $0x0
  21:e8 fc ff ff ff                      call   22 <main+0x22>
  26:83 c4 10                           add    $0x10,%esp
  29:8b 55 f8                            mov    -0x8(%ebp),%edx
  2c:    65 33 15 14 00 00 00    xor    %gs:0x14,%edx
  33:75 08                                jne    3d <main+0x3d>
  35:8b 4d fc                            mov    -0x4(%ebp),%ecx
  38:c9                                       leave  
  39:8d 61 fc                            lea    -0x4(%ecx),%esp
  3c:    c3                                       ret    
  3d:e8 fc ff ff ff                       call   3e <main+0x3e>

BTW, the code runs fine on my development system

gdb showed, that the gs register on my target device has a value of 0, while it
is 33 on my development system.

It turned out, that the gcc option -fstack-protector-all, which is used for
openssh, causes the failing instruction to be inserted into the object code.

I have no idea, what the gs register is good for, I was not able to google
information about gs register usage on linux systems. Perhaps, my small linux
kernel is missing some option to initialize this register, perhaps buildroot
has an option to initialize the gs register,...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
