Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4D5C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0267041717;
	Wed,  2 Nov 2022 20:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0267041717
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOq5WuxkYOmW; Wed,  2 Nov 2022 20:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9C3416E3;
	Wed,  2 Nov 2022 20:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9C3416E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D92D61BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C36605BE
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C36605BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5Exc58c_l6O for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:10:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89FC6605E8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89FC6605E8
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:10:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47AF124000B;
 Wed,  2 Nov 2022 20:10:20 +0000 (UTC)
Date: Wed, 2 Nov 2022 21:10:19 +0100
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20221102211019.71376854@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667419821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w+cMQQEWo1Iuq9IO58iU0ZcJkZNSDke1EosHCLhSZfQ=;
 b=IVX+SJ2/ERPRO0eguAFvhte/5XckAFUFmHcK6JugFICymMhl6nzTk7FIURuKJHp4twzIyd
 IKNIoSvOL43MStew0eXQdPP7/Bjw/IUS3lh5sAps6wYHsb/kSxGNPkyAH7H8zhbUZJmuEa
 gKWvzCPXxA4lDHLy2fa1R1r/5px54pT78oFksE7pGHL24bahEE3XLyBofBH6Lv9HjAfQMw
 xrdeA5V9p0RJzPgAQN/LOS3ezlKNRk2xJ2ouPPv0HkVODOAa7Q0UtqUKyNeBGtfrv6rhNj
 kcbrr6SwkkeCcLM9EMDcmPD50BWq6GFFuBfNDOysEJdDiIjpgzhDlFOaX/uJKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IVX+SJ2/
Subject: [Buildroot] snps_arc700_axs101_defconfig fails to build
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

Hello Alexey,

According to
https://gitlab.com/buildroot.org/buildroot/-/jobs/3259666747,
snps_arc700_axs101_defconfig fails to build with:

msort.c: Assembler messages:
msort.c:200: Error: opcode 'dmb' not supported for target arc700
make[4]: *** [../o-iterator.mk:9: /builds/buildroot.org/buildroot/output/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/stdlib/msort.o] Error 1

During the glibc build. Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
