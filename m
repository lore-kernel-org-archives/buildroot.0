From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Feb 2020 00:18:27 +0000
Subject: [Buildroot] [Bug 12521] New: RISCV RV32IA selected, RV64GC output
Message-ID: <bug-12521-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12521

            Bug ID: 12521
           Summary: RISCV RV32IA selected, RV64GC output
           Product: buildroot
           Version: 2019.11
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lelassal at hushmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I selected RV32IA (no option without A) and ILP32 as target. Output is ELF
format using VMLinux which has been disassembled using
riscv64-unknown-elf-objdump. I get this:


ffffffe000000000 <_start>:
ffffffe000000000:       10401073                csrw    sie,zero
ffffffe000000004:       007a6197                auipc   gp,0x7a6
ffffffe000000008:       d9418193                addi    gp,gp,-620 #
ffffffe0007a5d98 <__global_pointer$>
ffffffe00000000c:       6299                    lui     t0,0x6
ffffffe00000000e:       1002b073                csrc    sstatus,t0
ffffffe000000012:       21018693                addi    a3,gp,528 #
ffffffe0007a5fa8 <hart_lottery>
ffffffe000000016:       4605                    li      a2,1
ffffffe000000018:       00c6a6af                amoadd.w        a3,a2,(a3)
ffffffe00000001c:       e2e9                    bnez    a3,ffffffe0000000de
<relocate+0x64>
ffffffe00000001e:       007a8697                auipc   a3,0x7a8
ffffffe000000022:       fe268693                addi    a3,a3,-30 #
ffffffe0007a8000 <swapper_pmd>
ffffffe000000026:       00872717                auipc   a4,0x872
ffffffe00000002a:       e3a70713                addi    a4,a4,-454 #
ffffffe000871e60 <__bss_stop>
ffffffe00000002e:       00e6d763                bge     a3,a4,ffffffe00000003c
<clear_bss_done>

ffffffe000000032 <clear_bss>:
ffffffe000000032:       0006b023                sd      zero,0(a3)
ffffffe000000036:       06a1                    addi    a3,a3,8
ffffffe000000038:       fee6cde3                blt     a3,a4,ffffffe000000032
<clear_bss>

...

ffffffe00000079c:       6314                    ld      a3,0(a4)
ffffffe00000079e:       0074b617                auipc   a2,0x74b
ffffffe0000007a2:       53260613                addi    a2,a2,1330 #
ffffffe00074bcd0 <__start___param>
ffffffe0000007a6:       0074e797                auipc   a5,0x74e
ffffffe0000007aa:       d0278793                addi    a5,a5,-766 #
ffffffe00074e4a8 <__stop___param>
ffffffe0000007ae:       8f91                    sub     a5,a5,a2
ffffffe0000007b0:       878d                    srai    a5,a5,0x3
ffffffe0000007b2:       02d786bb                mulw    a3,a5,a3
ffffffe0000007b6:       19018793                addi    a5,gp,400 #
ffffffe0007a5f28 <static_command_line>
ffffffe0000007ba:       638c                    ld      a1,0(a5)
ffffffe0000007bc:       00000897                auipc   a7,0x0



As you can see, it uses compressed instructions, is 64 bit and more (like
multiplication).

Thank you.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
