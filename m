Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5B3C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C738B4025D;
	Sun, 11 Feb 2024 15:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AM3dUfDCOpcR; Sun, 11 Feb 2024 15:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9947540339
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9947540339;
	Sun, 11 Feb 2024 15:11:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6705D1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FB4820F9
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeD_waFk9WR4 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D328820F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D328820F5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D328820F5
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:11:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 450161C0005;
 Sun, 11 Feb 2024 15:11:26 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:11:25 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240211161125.419a1bcf@windsurf>
In-Reply-To: <20240211101212.171127-1-ju.o@free.fr>
References: <20240211101212.171127-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707664286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Y6J95cvzDvD0x53sdXlOBg7boBWfLMGgdxrc+nEunc=;
 b=E3CusvJAKzttBrl1+2q//P8i6iJw4LM6BJDQPX65E+ee8pMzU9LLp2Sff2JqpRaJEcIlb0
 nrZLn1oApFJ71x/5+cPN8IWXl99MTM0mSXJxE2JYMjeeiQr6uBp/JiR/oPVxkaw3/dkp76
 xfBvKo8a2f6ww8LDjPk3H5qMdMDiccKNbkGctSoxw0umXGgkko/OgoAIZ2Br2kehT08m2U
 1pq95LeqjV4WVmXtRADrtJlzq0zQ0qpQVQoXXx7EbhVLSemT+sEHKhaxxR8inyBO0dq4fh
 NSOq0xFrDkEubJ1hku/t0zMWJhLKtvC4fPReOzAJV2TrkKiYkJQdyMWun8FM6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E3CusvJA
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add jailhouse runtime
 test
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

On Sun, 11 Feb 2024 11:12:12 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |   1 +
>  .../testing/tests/package/test_jailhouse.py   | 103 ++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 support/testing/tests/package/test_jailhouse.py

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
