Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72045D10BFA
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E53B40D4B;
	Sat, 26 Oct 2024 14:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMfNUcufhWLk; Sat, 26 Oct 2024 14:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC06F40D6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC06F40D6B;
	Sat, 26 Oct 2024 14:00:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1C55C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97A840175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOhkYyJ8aAP9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:00:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88B91400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B91400D7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88B91400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:00:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74847C0007;
 Sat, 26 Oct 2024 14:00:09 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:00:08 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>, Joachim Wiberg
 <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241026160008.7cb4b0db@windsurf>
In-Reply-To: <20241026051057.52178-1-christian@aperture.us>
References: <20241026051057.52178-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729951210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tp7cQ06seav1l+isQ+5Q+S0Wj2XZDUK05OhszbxOsLk=;
 b=JDm6vTLunB28glojjSIPhxwAXGh1/v2c9wSBE2oHQLm9g4sFGnyosQB4pHPpfXKyUM1Ij6
 diHVL/hO/Mx/znS/y+1iKX79YMXIb2Nj5sj1Ao/p9pMGVZ74t5/Ktd/Dwh0VgtNgOivO0+
 bhBciCp601PlH4LOYS5Wj3BimMSpYpVmQXBgEA9UO3EIws66goeb5KEZz/sjCnhcXfdMhR
 3fb+OtPavaU2Qn/HGe5EXvegbjAKqVdtNnIADymHA3OmX0cCSzfy2tWIvvcwGJMJYbzj1M
 Qstzrwic3hENweGDwcw+CukL6kShHRFNRu7ugcrgehZsc6x9wP1XlQSprs99hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JDm6vTLu
Subject: Re: [Buildroot] [PATCH v1 1/1] package/runc: bump version to v1.2.0
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

On Fri, 25 Oct 2024 22:10:57 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/opencontainers/runc/releases/tag/v1.2.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
