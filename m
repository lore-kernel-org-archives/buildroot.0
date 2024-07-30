Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79C1C3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 20:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D37C40B9A;
	Tue, 30 Jul 2024 20:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_0FSsg1l2Yg; Tue, 30 Jul 2024 20:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8871A4051A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8871A4051A;
	Tue, 30 Jul 2024 20:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A283E1BF423
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90FE880AE2
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOrjuQqzu4aD for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 20:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDD1B80AD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD1B80AD4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD1B80AD4
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 20:35:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 379D7C0002;
 Tue, 30 Jul 2024 20:35:43 +0000 (UTC)
Date: Tue, 30 Jul 2024 22:35:42 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20240730223542.273693e5@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722371743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5ycz/70Rp2HOky1le/yoFJQbnJzkmfwcmRmNISUI9lM=;
 b=DQMfylmwACg3LoFYOGt5BxyfKc2+kjBOUiHoY5oXfV334R4ejkl0d9RsqqsySOJmC3Dp8K
 nckwmUAyanbf4fo2PDFUL6kyT3BCdo4Zemy5RxU7AktPJV7D1RfdJGictQH+KKW2A9rvVF
 bEuU4oD3V33dZeq/In8Qrk1PbP9LH0H1Tn72Ivc2FIuIEW8kovU4nKdXeiUbRIvTPfwSx8
 wSdtfRmhtqL8LI8aNNU6pcY4Yt/jZ1FVxoBuqCZn7zgSW6QC/DD1XWczj4+s5KSXH3zaWB
 TjKMMHQm4inS10vacD7mtCtPjiTcDXTQOQzmlRa/KtsM+Oi5z4c86QW5hpJI8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQMfylmw
Subject: [Buildroot] Remaining issues detected with toolchain-builders
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@smile.fr>,
 Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

As part of preparing new pre-built toolchains based on Buildroot
2024.05 (hosted at toolchains.bootlin.com), I'm encountering a number
of issues, which I am summarizing in this e-mail.

The toolchains and tests are built based on the Buildroot branch at:

  https://github.com/bootlin/buildroot-toolchains/tree/toolchains.bootlin.com-2024.05

Which is basically 2024.05 + a number of backports and a small number
of extra fixes.

Based on this, for each architecture/libc configuration, a toolchain
is built, packed as a tarball, and is then used as an external
toolchain to build a kernel+rootfs that is booted under Qemu (using
our Qemu defconfigs, but to use an external toolchain instead of the
internal toolchain).

sh-sh4
======

https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/1391146782

All toolchains built fine, but the test system did not boot in any of
the toolchain combinations.

In the sh-sh4--glibc--bleeding-edge_test
(https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446074815),
Qemu complained with:

**
ERROR:../hw/intc/sh_intc.c:168:sh_intc_locate: code should not be reached
Bail out! ERROR:../hw/intc/sh_intc.c:168:sh_intc_locate: code should not be reached
Aborted (core dumped)
Connection problem, exiting.

With all other toolchains, there were no messages at all from Qemu:

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446074827
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446074831
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446074832
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446074833
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446074834

One point worth mentioning is that the tests were all sucessful for
the sh-sh4aeb toolchains:

https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/1379541813

riscv32-ilp32d
==============

Here, only the riscv32-ilp32d--uclibc--stable_test fails to boot:

  https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7446076680

This has already been reported on the list, and an initial
investigation has been done by Waldemar. It seems like it could be a
time64 issue: the uClibc stable toolchain uses 4.19 kernel headers
(which predate time64) and generates a broken system, while the uClibc
bleeding edge toolchain, which uses 5.4 kernel headers, generates a
working system.

mips32r5el
==========

For this architecture, what we do is we use the qemu_mips32r2el_malta
defconfig, but we build it for MIPS32R5, and we boot it under Qemu
with the "-cpu P5600" argument, which is a MIPS32R5 CPU.

And all toolchains generate a system that fails to boot:

Run /sbin/init as init process
process '/bin/busybox' started with executable stack
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

mips32r5el--glibc--bleeding-edge_test
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377823322
mips32r5el--glibc--stable_test
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377823324

mips32r5el--musl--bleeding-edge_test
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377823325
mips32r5el--musl--stable_test
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377823326

mips32r5el--uclibc--bleeding-edge_test
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377823327
mips32r5el--uclibc--stable_test
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377823329

The interesting thing is that those images boot fine with Qemu v8.2.6,
but they fail to boot with Qemu v9.0.2.

Is it a regression in Qemu, or something that we were doing that was
working by chance and that is now better emulated and in fact not
correct?

m68k-68xxx
==========

See https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/1379452858

The stable toolchains are working fine, but the bleeding edge
configurations are generating systems that don't boot.

With glibc:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377699056

mmap: kernel BUG at mm/mmap.c:3259!
*** TRAP #7 ***   FORMAT=0
Current process id is 41
BAD KERNEL TRAP: 00000000
Modules linked in:
PC: [<000a3c22>] insert_vm_struct+0x0/0xee
SR: 2000  SP: cecacd44  a2: 00ab49c0
d0: 00000023    d1: 00000000    d2: 00000008    d3: 00000048
d4: 000a1560    d5: 00a3e360    a0: 00abfd1c    a1: 004b93c6
Process rcS (pid: 41, task=d2eb12e9)
Frame format=0 
Stack from 00abfd98:
        00468a6f 00468a57 00000cbb 00000007 00abe0ff 400004d8 0000001e 00000006
        00000000 00a3e360 00ab49c0 00a3e390 00abfe78 400000a3 e3640000 0001ffff
        ffff00a5 af0c0000 0000ffff ffff0000 0000010a 000000a3 e360ffff ffffffff
        ffff8000 00000001 00abfe04 00000000 00000000 00000008 005d8ef8 005d8c70
        005d8e44 005d8d00 005d97f8 005d99cc 005d9a14 005d99f0 00016bea 00a3e360
        00a3e360 00a3e360 0001b8aa 00a3e360 00a3e390 00000007 00abe000 400004d8
Call Trace: [<0001ffff>] cap_validate_magic+0x5b/0x114
 [<0000ffff>] tblpre+0x28f/0x700
 [<00016bea>] mmput+0x24/0x98
 [<0001b8aa>] do_exit+0x1ea/0x8e8
 [<0001c14e>] do_group_exit+0x1e/0x80
 [<00025e02>] get_signal+0x782/0x7a6
 [<00002010>] initcall_blacklisted+0x8/0x98
 [<000043c4>] do_notify_resume+0x70/0x578
 [<00024a6c>] force_sig_info_to_task+0xc0/0x152
 [<00024d1e>] force_sig_fault+0x36/0x3e
 [<00002738>] do_signal_return+0x10/0x1a
 [<0010c00f>] sys_inotify_add_watch+0x3/0x3cc

With musl:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377699062

Run /sbin/init as init process
System did not boot in time, exiting.

With uClibc:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377699066

Run /sbin/init as init process
EXT4-fs (sda): re-mounted 8565f0ac-7559-4bf5-ad8c-bee4703f59fb r/w. Quota mode: disabled.
Segmentation fault
Segmentation fault
Segmentation fault
Segmentation fault
Segmentation fault
Segmentation fault

arcle-750d
==========

Here we don't have a runtime failure, but a build time failure. I have
already reported it to Synopsys people, who are investigating.

arcle-750d--uclibc--bleeding-edge_build
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7377622441

/builds/buildroot.org/toolchains-builder/build/arcle-750d--uclibc--bleeding-edge-2024.05-1/lib/gcc/arc-buildroot-linux-uclibc/14.1.0/../../../../arc
-buildroot-linux-uclibc/bin/ld: /builds/buildroot.org/toolchains-builder/build/arcle-750d--uclibc--bleeding-edge-2024.05-1/lib/gcc/arc-buildroot-lin
ux-uclibc/14.1.0/../../../../arc-buildroot-linux-uclibc/lib/libstdc++.so: undefined reference to `__atomic_test_and_set'
collect2: error: ld returned 1 exit status

I would definitely appreciate support in investigating/solving some of
those issues. Thanks in advance for your help!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
