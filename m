From: =?gb18030?B?usPSsMjL?= <15422908@qq.com>
Date: Mon, 6 Jun 2016 17:02:49 +0800
Subject: [Buildroot] busybox SIGSEGV,
	is there a bug in buildroot-created cross-compiler?
Message-ID: <tencent_0DD5D06E27341CF67DA372AC@qq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I used buildroot-2016.02 as my cross-compiler creator, I need run a Linux kernel in a BCM47xx like CPU. 
When I made some modification, the kernel that built with the buildroot-created cross-compiler seems
work correctly, but the BUSYBOX, if I  add some features such as ifconfig function or something else, the
BUSYBOX will execute fail, the kernel send a SIGSEGV to it, the key logs list below:


[    0.788135] 8021q: 802.1Q VLAN Support v1.8
[    0.804399] Freeing unused kernel memory: 444K (80461000 - 804d0000)
[    0.816859] Cpu0[linuxrc:1:00465348:1:801681f4]
[    0.863554] Cpu0[linuxrc:1:004002d0:0:004002d0]
[    0.918064] Cpu0[linuxrc:1:004649fc:0:004002e8]
[    0.972430] Cpu0[linuxrc:1:0044392c:0:0044392c]
[    1.026880] Cpu0[linuxrc:1:00478a00:1:0044395c]
[    1.131620] Cpu0[linuxrc:1:7fe01fd0:1:0044376c]
[    1.182241] Cpu0[linuxrc:1:0047b458:1:0044a544]
[    1.232461] Cpu0[linuxrc:1:0042c798:0:0042c798]
[    1.287007] Cpu0[linuxrc:1:004514d4:0:801683f8]
[    1.332925] random: linuxrc urandom read with 4 bits of entropy available
[    1.344316] Cpu0[linuxrc:1:004646a4:1:00443850]
[    1.394684] Cpu0[linuxrc:1:0002b920:0:00439464]
[    1.436187] 
do_page_fault(): sending SIGSEGV to linuxrc for invalid read access from 0002b920
[    1.444743] epc = 00439464 in busybox[400000+55000]
[    1.449808] ra  = 004350dc in busybox[400000+55000]
[    1.454803] 
[    1.461958] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.461958] 
[    1.471133] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.471133] 
[   33.241764] random: nonblocking pool is initialized



The log shows EPC is 00439464, then I disassemble the busybox, the key asm code list below:


00439450 <__GI_isatty>:
  439450:   3c1c0003    lui gp,0x3
  439454:   279c3570    addiu   gp,gp,13680
  439458:   0399e021    addu    gp,gp,t9
  43945c:   27bdffa8    addiu   sp,sp,-88
  439460:   afb00050    sw  s0,80(sp)
  439464:   8f9083b0    lw  s0,-31824(gp)
  439468:   8f99809c    lw  t9,-32612(gp)
  43946c:   8e020000    lw  v0,0(s0)
  439470:   afbc0010    sw  gp,16(sp)
  439474:   afbf0054    sw  ra,84(sp)
  439478:   afa2004c    sw  v0,76(sp)
  43947c:   0411004c    bal 4395b0 <__GI_tcgetattr>
  439480:   27a50018    addiu   a1,sp,24
  439484:   8fa4004c    lw  a0,76(sp)
  439488:   8e030000    lw  v1,0(s0)
  43948c:   10830004    beq a0,v1,4394a0 <__GI_isatty+0x50>
  439490:   8fbc0010    lw  gp,16(sp)
  439494:   8f9983bc    lw  t9,-31812(gp)
  439498:   0320f809    jalr    t9
  43949c:   00000000    nop
  4394a0:   8fbf0054    lw  ra,84(sp)
  4394a4:   8fb00050    lw  s0,80(sp)
  4394a8:   2c420001    sltiu   v0,v0,1



If I do not add much features in BUSYBOX or do not add ifconfig in busybox, the busybox seems
can work normally.


I don't know what's wrong, is there a bug in buildroot-created cross-compilter? or a bug in uclibc?


The softwares that I used are:
buildroot-2016.02, used uclibc as the C library.
Linux kernel 4.5.3, with initramfs as the root file system.
Busybox 1.24.0 with static build config.


I can also post my configuration files about above files. Could someone can give me some help,
thanks very much.


Best Regards,
John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160606/395f464a/attachment.html>
