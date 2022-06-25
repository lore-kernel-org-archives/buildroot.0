Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F30DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 16:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D043384188;
	Sat, 25 Jun 2022 16:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D043384188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaLFaQEtTQIr; Sat, 25 Jun 2022 16:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC8B883689;
	Sat, 25 Jun 2022 16:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC8B883689
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB39F1BF39F
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B468B60F57
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 16:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B468B60F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mrUPO6SpXs2 for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 16:45:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E060460F53
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E060460F53
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 16:45:02 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B9B4D5C24F0;
 Sat, 25 Jun 2022 18:44:58 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 25 Jun 2022 09:44:58 -0700
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Message-ID: <82b5bbe664c06c5864debb660850e0cf@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1656175498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=rcJEl8ClIjVR+bsLiT8kXWQcQuEWZrTjqEFNG9lPTHA=;
 b=eZkvgDbN91AGkFvp3KQj1X9eZ32a2ts04tvl+xT1ZK7IhH5an+PSBImiShwLx2Ad+w6Vjp
 Q8J22dKzOKtIBEv/JuQEvNiZUPpk7usIxpQPAlt+x2EtKVsluncOwPe3FyvA5wAMzALFv8
 82QK7IgmWZ9yTCevoH/qnS8WQmWG+Ec=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=eZkvgDbN
Subject: [Buildroot] Build error when building two GRUB2 configurations
 (race condition)
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
Cc: kory.maincent@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

In Home Assistant OS we use the capability to build two GRUB2 binaries
by enabling these two configurations:

BR2_TARGET_GRUB2_I386_EFI=y  
BR2_TARGET_GRUB2_X86_64_EFI=y

Every now and then a from scratch build seems to fail with the following
error:

config.status: creating config-util.h
In file included from ../include/grub/disk.h:***,
                 from ../include/grub/file.h:26,
                 from ../grub-core/kern/emu/hostfs.c:23:
./config.h:38:10: fatal error: ./config-util.h: No such file or
directory
   38 | #include <config-util.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.

At least in this instance it seems to be the second configuration
x86_64-efi which fails (as the previous >>> grub2 2.04 Building i386-efi
succeeds).

The full build log can be found here:
https://pipelines.actions.githubusercontent.com/serviceHosts/dff1d65b-5367-4f4f-a0ee-c2bf0f874fbd/_apis/pipelines/1/runs/8778/signedlogcontent/14?urlExpires=2022-06-25T16%3A32%3A02.7601449Z&urlSigningMethod=HMACV1&urlSignature=c9ayjKpOOIoTexbMMXYB8A1G6UwmGfhBwTdtxTE3wmI%3D

I haven't dig into it really, maybe someone with some familiarity of the
GRUB2 (multi-platform) build system has some idea?

Best regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
