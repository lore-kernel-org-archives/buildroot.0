Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEEAC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 18:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987A64017A;
	Fri, 25 Nov 2022 18:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987A64017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9z4CUBC5UehR; Fri, 25 Nov 2022 18:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605D9400C4;
	Fri, 25 Nov 2022 18:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605D9400C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D36551BF280
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 18:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C9040289
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 18:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C9040289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUzyWeORDclx for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 18:11:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 693B740199
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 693B740199
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 18:11:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4774E0009;
 Fri, 25 Nov 2022 18:11:56 +0000 (UTC)
Date: Fri, 25 Nov 2022 19:11:55 +0100
To: Max Filippov <jcmvbkbc@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <20221125191155.111c4ddc@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669399917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p+f9ZwmHk8gq6Kn393WSDRZQPlxqvnRb/IZ8UrG8/LY=;
 b=N/Kh7SYmDbcnlfJex7/dIgRh5cITsMKLV/GqlRrOlyKIkPh3Nw6w+T2EcXIMUPbJkiSs1d
 9P1iegoLri9nPIWaOKlSATUx/9SOlp0O3HV80Kue7yck3NMISFMtkPDwLg3ySLMhLYAEnD
 W/l19ebZPBtJx/GlwWVTGyjsutME40ffLEvxUbUY7E8ztxS92FQOj2rNBxAyeShR5KLVNn
 JeBISAo/75Vi02wdQpO5KeVXdB27ErE1ZfCT84/oaOYS2MyrPaslX0otY0JQiVaolCAU7A
 2HOKe48cvTuLXpSZf2uEYB9Qmg1L/qmoD8XHnIKRq+8n4Q3UUCSU+BgJEneRTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N/Kh7SYm
Subject: [Buildroot] Xtensa qemu nommu defconfig not working
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The configs/qemu_xtensa_lx60_nommu_defconfig builds correctly, but
fails to boot under Qemu:

[    1.158675] Freeing unused kernel image (initmem) memory: 460K
[    1.159475] This architecture does not have kernel memory protection.
[    1.160806] Run /init as init process
[    1.186746] binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20), killing init!
[    1.190881] Failed to execute /init (error -8)
[    1.191529] Run /sbin/init as init process
[    1.204778] binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20), killing init!
[    1.206216] Starting init: /sbin/init exists but couldn't execute it (error -8)
[    1.207229] Run /etc/init as init process
[    1.209332] Run /bin/init as init process
[    1.210517] Run /bin/sh as init process
[    1.220290] binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20), killing sh!
[    1.221658] Starting init: /bin/sh exists but couldn't execute it (error -8)
[    1.223403] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
[    1.226218] ---[ end Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance. ]---

There were some changes in elf2flt:

9dd179d43ffe9be98035f921a0db2bf051b632fb package/elf2flt: fix fatal error regression on m68k, xtensa, riscv64
95402089c314fbc03b934f5fcf9c29db043d758c package/elf2flt: remove broken patch
b07210b272c6e8810b038190cf5c1fd1f7b48397 package/gcc: remove BR2_GCC_ENABLE_LTO
9db5eb258cf492567bac33a33cb606f14045639d package/elf2flt: Remove Config.in.host
3e50b5fe2632a3081fd3f6574a5e9525fa897fdb package/elf2flt: update AUTORECONF comment
32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33 package/elf2flt: update RISC-V 64-bits support
65d78dcfeb8b2eafaebe2d0c3c8c42e7e85f46ac package/elf2flt: update to version 2021.08
6d49446ebdbd32c1b4591c0aa8cacb189a69e318 package/elf2flt: add RISC-V 64-bits support

However, in commit 9dd179d43ffe9be98035f921a0db2bf051b632fb, Niklas
said about the qemu_xtensa_lx60_nommu_defconfig configuration: "xtensa
crashes when loading init, the same behavior as when reverting the bad
upstream elf2flt commit completely."

Max, do you think you could have a look at what is happening?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
