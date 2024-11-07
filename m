Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119F1D5AE72
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D281F423A2;
	Thu,  7 Nov 2024 08:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdEIRSjOEdsw; Thu,  7 Nov 2024 08:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D9D41EA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D9D41EA7;
	Thu,  7 Nov 2024 08:04:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B020C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED6FE8407E
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbpHEpA4B3M6 for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CA168405E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA168405E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CA168405E
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8A0060010;
 Thu,  7 Nov 2024 08:03:44 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:03:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Martin =?UTF-8?B?SHVuZGViw7hsbA==?=
 <martin@geanix.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241107090309.1c2ec721@windsurf>
In-Reply-To: <20241105185250.1536270-1-james.hilliard1@gmail.com>
References: <20241105185250.1536270-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9l46AL/F+0F3Rv/o1i0Pa3wzrgAfvPEFVsMxEeB6A/k=;
 b=HPWPqlzZHWOgRcCdzZSr7qZQOFv0l3rbocHXrAOlqwj2PmaJMQccYjAK1Rigd4xeNXC8uD
 7qE4W6XH/e6SpP0r5kI1vwVXe1s6dFFCdsZiStMnYEEDvSo3kQhrOEkzi85coTNzhcMDoU
 qzx5fDQvaPPdHI0V12jwwu9Usll+1s4Se/uQweiDWn7ipRDS/TTZBjdSgK+BGHy+8BbFQ9
 chlIimlm/geaimqdkH5ZY2FWxk0S++j8a2TsRJK8HZkN0SgEeH5/RLyX746HwZNxn7Zn9p
 ShRyhqJGk0T9QgCwOhRBdHEn8m5Y3zvfIDOZgSAoFUMWnDDBt77DlhD7YwomRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HPWPqlzZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to
 version 3.23.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Nov 2024 11:52:50 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-marshmallow/python-marshmallow.hash | 4 ++--
>  package/python-marshmallow/python-marshmallow.mk   | 4 ++--
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
