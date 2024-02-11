Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46777C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D705940497;
	Sun, 11 Feb 2024 15:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4tobq7nhGh7; Sun, 11 Feb 2024 15:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11D7404C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11D7404C3;
	Sun, 11 Feb 2024 15:28:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D8C21BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD43403AC
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOWCTrbLIvyE for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 881004038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 881004038B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 881004038B
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:27:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A040E1C0003;
 Sun, 11 Feb 2024 15:27:55 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:27:54 +0100
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <20240211162754.68a62dfd@windsurf>
In-Reply-To: <20240211051907.551771-1-kadambini.nema@gmail.com>
References: <20240211051907.551771-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707665275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f98FsjlsO/OmLEv0bIytu/j3qorhS2Fpuizt7Ektd/U=;
 b=b4uV6J2JXqwzvG40IeHV7chdCL5kCF0r7h7ArtS6XTmXaeo4Hx+VkUmftUkXTY/tt3uuKD
 jki2n+TQ9smZnKcDpFwoPtfN+ebHfIqaGeAvhpqObN4RFBQ2DJlx0AdGVVqDVpimcAiojz
 o7Fe8QLoo7IVrqY2hMv7naxxQEXamukqSdPbpKOTkFgVEDrWoY6SkPBYqaLQAS0SBt9183
 PiEaieYYaELZ2yQOSruB/OwMojlBDf+2c9luAbAgJR6UtDTEf+4sgD7keAatJrb1QTLNKr
 QIPMhL5Y5ukqJtuBvBaplWr5fQF1EcFz8nJ2YHvjO8QbkldmlXZLQC1pkG0MYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b4uV6J2J
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Feb 2024 21:19:07 -0800
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> - Updated hash of COPYING (year updated with
>   https://github.com/strace/strace/commit/eba0ac1fc4f8896b938d41081e0643cb06283a9b)
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/strace/strace.hash | 6 +++---
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
