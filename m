From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 May 2018 07:42:09 +0000
Subject: [Buildroot] [Bug 11051] New: runtime issue on STM32 with usage of
 binutils 2.29.x
Message-ID: <bug-11051-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11051

            Bug ID: 11051
           Summary: runtime issue on STM32 with usage of binutils 2.29.x
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christophe.priouzeau at st.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Since the default usage of binutils 2.29.x, on stm32 we have an issue at
runtime.

Error seen at runtime:
[    1.460000] Unhandled exception: IPSR = 00000006 LR = fffffff1
[    1.460000] CPU: 0 PID: 1 Comm: init Tainted: G        W       4.11.0 #2
[    1.460000] Hardware name: STM32 (Device Tree Support)
[    1.460000] task: 00822000 task.stack: 00828000
[    1.460000] PC is at ret_fast_syscall+0x2/0x4a
[    1.460000] LR is at tty_ioctl+0x327/0x7e4
[    1.460000] pc : [<08009942>]    lr : [<080c1013>]    psr: 4000000b
[    1.460000] sp : 00829fa8  ip : 0000001c  fp : 00a95600
[    1.460000] r10: 00000000  r9 : 00828000  r8 : 08009ae0
[    1.460000] r7 : 00000036  r6 : 00adcee0  r5 : 00000000  r4 : 00adcf3c
[    1.460000] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
[    1.460000] xPSR: 4000000b
[    1.460000] CPU: 0 PID: 1 Comm: init Tainted: G        W       4.11.0 #2
[    1.460000] Hardware name: STM32 (Device Tree Support)
[    1.460000] [<0800bdc5>] (unwind_backtrace) from [<0800b153>]
(show_stack+0xb/0xc)
[    1.460000] [<0800b153>] (show_stack) from [<0800b717>]
(__invalid_entry+0x4b/0x4c)


After a bisect, the issue are present since this commit : 
37e1e6cf6d133afeed1be98c5d5542cd00664efb package/binutils: switch to use 2.29.x
as the default version

How to reproduce:
  git clone git://git.buildroot.net/buildroot
  cd buildroot
  git checkout -b work 2018.05-rc3
  make stm32f469_disco_defconfig
  make 
  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/

Regards
Christophe Priouzeau

-- 
You are receiving this mail because:
You are on the CC list for the bug.
