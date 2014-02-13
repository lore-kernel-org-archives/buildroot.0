From: =?UTF-8?B?fH7bnn58IGRlbW9uaWFyayB8ftuefnwg?= <demoniark@gmail.com>
Date: Fri, 14 Feb 2014 00:02:18 +0100
Subject: [Buildroot] USE_BX=n on armv4 generate bx instruction
Message-ID: <CAA3gGbm=kiMxE3S79dzUgF0jF7QiC+SLfGNhi7qAu2Qynt1E9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm tring to self compile a system for my ib-nas-4220-b which embed a fa526
cpu.
I'm using buildroot v2013.11 with compiling kernel 3.12.
My configs files are here:
buildroot config:
https://paste.ydct.org/?d7d79d21da6e34dc#cIrSeqbdDpbAvA3d55DoH36Eb417bDysMEjmtaYaaZU=
busybox config:
https://paste.ydct.org/?a1a61121ae4be30f#cBDY3H89/m4owEwtCO0Mv6nI0WFhScBuwJ92V/zyOPE=
kernel config:
https://paste.ydct.org/?a3035f3c2a153083#w7dWY4LuBgoSMXDWn7alrIuueR1x+Gc75Rt6nlZLS2I=
uclibc config:
https://paste.ydct.org/?91bbe608fe4be481#JRt/Zd/1I5VOmyYldmUK+2L1fxM0sSHDbplmZxGXPxM=
When I try to boot my kernel with internet found filesystem, the nas boots.
When the nas boot with the filesystem compiled with buildroot I get:
[    4.630000] init (1): undefined instruction: pc=b6f0df40
[    4.640000] Code: e5803180 e5802188 e580c18c e8bd4038 (e12fff1e)
[    4.650000] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000004
[    4.650000]
[    4.650000] CPU: 0 PID: 1 Comm: init Not tainted 3.12.1 #2
[    4.650000] Backtrace:
[    4.650000] [<c001119c>] (dump_backtrace+0x0/0x10c) from [<c001153c>]
(show_stack+0x18/0x1c)
[    4.650000]  r6:c7825be0 r5:c0c78de0 r4:c072c728 r3:00000204
[    4.650000] [<c0011524>] (show_stack+0x0/0x1c) from [<c05a3880>]
(dump_stack+0x20/0x28)
[    4.650000] [<c05a3860>] (dump_stack+0x0/0x28) from [<c059f8e0>]
(panic+0x80/0x1d4)
[    4.650000] [<c059f860>] (panic+0x0/0x1d4) from [<c001bf94>]
(do_exit+0x388/0x75c)
[    4.650000]  r3:c7829c40 r2:c7825cd0 r1:00000004 r0:c065552f
[    4.650000]  r7:c0c78e10
[    4.650000] [<c001bc0c>] (do_exit+0x0/0x75c) from [<c001c428>]
(do_group_exit+0x88/0xc4)
[    4.650000]  r7:c7829c40
[    4.650000] [<c001c3a0>] (do_group_exit+0x0/0xc4) from [<c0026018>]
(get_signal_to_deliver+0x40c/0x458)
[    4.650000]  r4:c7826000 r3:80000013
[    4.650000] [<c0025c0c>] (get_signal_to_deliver+0x0/0x458) from
[<c059f3c4>] (do_signal+0xa0/0x3c0)
[    4.650000] [<c059f324>] (do_signal+0x0/0x3c0) from [<c0010f28>]
(do_work_pending+0x64/0xbc)
[    4.650000] [<c0010ec4>] (do_work_pending+0x0/0xbc) from [<c000e9dc>]
(work_pending+0xc/0x20)
[    4.650000]  r6:ffffffff r5:60000010 r4:b6f0df40 r3:c7825be0
With objdump fautly code e12fff1e appears to be the assembly 'bx'
instruction. However, due to arm.com (
http://infocenter.arm.com/help/topic/com.arm.doc.dui0204j/Cihfddaf.html#Cihiiajh
),
I suppose that this instruction is not implemented in my farraday 526
processor (an old armv4).
In reference of this patch:
http://git.buildroot.net/buildroot/commit/?id=9474421da36d8602f56b84b150e4cf4c78e788b3
[*
Fix uClibc USE_BX logic, it was always on, this would break the new
FA526/626 support and broke StrongARM since it's a v4 core.] I understood
it was corrected.
So my question is next: what i'm doing wrong/missing?
I really want to boot a self compiled system on my nas so any help is
apreciated. Thanks.
P.S.: hello world with this toolchain:
https://paste.ydct.org/?4cfe9f291d296766#g/Gw0vXT7Cf7i8RXO0pzj1px62DD46UtBeE22jlsLao=
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140214/c50fcb5b/attachment.html>
