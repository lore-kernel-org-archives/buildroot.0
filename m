Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E11C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 17:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A5DD810CA;
	Sun, 28 Jul 2024 17:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qPocAlqR5S2; Sun, 28 Jul 2024 17:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95676810CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95676810CB;
	Sun, 28 Jul 2024 17:01:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4AD1BF2A7
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 17:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B88402EC
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 17:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JS4oON-abVpx for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 17:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1575402E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1575402E1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1575402E1
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 17:01:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A4A3C0004;
 Sun, 28 Jul 2024 17:01:16 +0000 (UTC)
Date: Sun, 28 Jul 2024 19:01:15 +0200
To: Waldemar Brodkorb <wbx@openadk.org>, Romain Naour <romain.naour@smile.fr>
Message-ID: <20240728190115.2e9fc088@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722186076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i3nvxYd9cPXvbG5FQn9Yo2lOtuAGeX4IzmefhRHAZTo=;
 b=kXJE3sdWWQzHif6Tmu7rWfhVBeU4eWd6UYWt9zK9eyn0Kbpxls519RnQhsASyvjXkeEGuq
 8gs+IAi6rUf+cNk4FvIAXcUPcjGWYK28dQatarlSOUklMjWHPjHpY4eyxwzAFYsOuWUJLj
 2987H9K66NwAUxShG8Tp10dPc/XX3BjQrd9a9DFMWuIKCx9zKuZyzII1sitBQdUYN3MXIW
 8IlhfhnHvA7NS9zw5uVaj3HthMtOdG1qsfsuf6LPZ6ITBO7vEZvMZigg8lHyxSpiTiTAXv
 xVqqLMkSxdFKEBd1suCGKCCe8nyxuXmV6Tx+SRhHFhZQDkGnfYNdqp5BhfokRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kXJE3sdW
Subject: [Buildroot] Weird issue with uClibc RISC-V 32-bit in Qemu
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

I am working on updating the toolchains of toolchains.bootlin.com, and
as part of that rebuilding all toolchains with Buildroot 2024.05 + a
few patches:

  https://github.com/bootlin/buildroot-toolchains/tree/toolchains.bootlin.com-2024.05

On riscv32-ilp32d, I have the uClibc stable toolchain that generates a
system that doesn't boot under Qemu: the kernel boots fine, but when
switching to user-space, nothing happens:

  https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190992

The interesting thing is that the uClibc bleeding-edge toolchain works
fine. The only difference is that GCC is 14.x instead of 13.x, and
binutils is 2.42 instead of 2.41. Bleeding edge toolchain:

  https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190991

I took just the rootfs.ext2 of the "working" build, and put it together
with the firmware+kernel of the "non working" build, and it works fine:
so the problem is in the rootfs.

In the broken build, if I pass init=/bin/sh, then I'm dropped into a
shell, but some things are weird:

 - When I run ls, the first line of output starts right after the
   prompt, not in a newline

 - After ls has finished, it doesn't got back to the shell prompt,
   unless I press Enter again

Using init=/bin/sh with the fully working rootfs does not exhibit this
issue.

You can retrieve the non-working artefacts and defconfig at:

  https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190992/artifacts/browse/test/output/

And the working artefact and defconfig at:

  https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190991/artifacts/browse/test/output/

Do you have any clue at what could be happening here?

Thanks for your support!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
