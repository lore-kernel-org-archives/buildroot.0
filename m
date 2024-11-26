Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5975D3B98F
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617C54EBFF;
	Tue, 26 Nov 2024 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KNbYOBbcyV6; Tue, 26 Nov 2024 13:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4248F4D6C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4248F4D6C5;
	Tue, 26 Nov 2024 13:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9568CDB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 839CE85332
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7GjOvhCMIrg for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C6AB85330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C6AB85330
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C6AB85330
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:57:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8895BE000A;
 Tue, 26 Nov 2024 13:57:39 +0000 (UTC)
Date: Tue, 26 Nov 2024 14:57:38 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241126145738.0b2e25cf@windsurf>
In-Reply-To: <CAFkzVZbeK3a-5ze3g9hWod5uhHqq1tbL+eMZ+Bz8nA9noMherA@mail.gmail.com>
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
 <20241124172908.2b4db731@windsurf>
 <CAFkzVZbeK3a-5ze3g9hWod5uhHqq1tbL+eMZ+Bz8nA9noMherA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732629459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhFAWH34rLbMMUn9Hxtqqa73XWicYtZSzUlpgQJKNhk=;
 b=UZfYBQFQHwDuQtuf+AK9Wp3Hy97XTQdTjGwPSIBANX45e+Kngsbo3aMMlbdHw2pTMKvkRV
 G5ftuX5g5R/CG1gojuxTrIAMLU/rvSOzuJ0lZhxr8YUDbZa2VI76iitT98Dg1Cvv+ZL5Mf
 vnAVNp93bWlDiSxL6QV3E4Tndl9y+kU1y6sLm1F7HUeNcVKFZ6sO+SoaX3wrq06jGNoaIb
 hmo2dsLW7lR4NaY68GmLjJlt2e9K2eQgkhoXllhTgprTy5Z8AkcYluzeDSGQuZdToSAzqb
 KHeRo9/wsPyyp5fTJXbqwmnYA60GOgvqkJTC8qev9QCtqZOaDoI8eMxPeT7SDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UZfYBQFQ
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

On Tue, 26 Nov 2024 09:50:12 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Maybe it should be as follows:
> 
> ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3),y)
> PROCPS_NG_CONF_OPTS += --disable-pidwait
> endif

If you write it this way, it will disable pidwait on all configurations
with headers >= 5.3. Don't you want to do exactly the opposite?

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
