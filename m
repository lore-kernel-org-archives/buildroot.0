Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA152C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 08:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E7E40886;
	Mon, 13 Jul 2026 08:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSiSEabnGU3M; Mon, 13 Jul 2026 08:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A89E44086D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783930691;
	bh=LT403XCqiJx2LunYjRUpdhyTONOzvRsDnXl9dqACSaA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M73rwdjjHJzTE//6gjlXXnbhlugBHXrWQphRw98Z/fhaPKBjuV9aaBv58+U9qCpoT
	 pjSyUr+Ak64oDcJ+WWU+QTNUKDeL3r4QyJyjsQfmy8vG48XeZ6t0bMCw4Qyv49GZhO
	 hzC6qluwoUAU1HoY++01e4pXWu6FIxgwuC5BR264oPHXo+PicDlH3A8z0+y57/d4Lo
	 I4OVCOBslrswl10S9Goi2YYA0A6jzHmgT8OhPH4jvG6sSoZYFu7R2dUP39FxlN+WWI
	 WxVHi+KWApKkvKkJ+jBtBRpN3I65WL0FLjcMnGcv+2pyatgQHlDeiYssbDZxdBi63s
	 mJ2oTV0oByt2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89E44086D;
	Mon, 13 Jul 2026 08:18:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8DC4128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ACEB4086D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTDWZwC-98-S for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 08:18:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C5F540821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5F540821
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C5F540821
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:18:05 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 13 Jul
 2026 10:17:59 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Mon, 13 Jul 2026 10:17:59 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Correct approach for supporting multiple SoCs with otherwise
 same board?
Thread-Index: AQHdEqAdLuqpbqLp5USFhR9RG3g2zQ==
Date: Mon, 13 Jul 2026 08:17:59 +0000
Message-ID: <3c4de0c8-dcd8-444d-ad65-a023e782a346@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14556657160
Content-ID: <EF7C5172822ACB4E909C9CCEC3E5CC61@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: [Buildroot] Correct approach for supporting multiple SoCs with
 otherwise same board?
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

We have a board with a few different iMX8X series SoCs,
which we have worked around by having a custom imx-seco package that
installs the different AHAB containers we need.

Now we're introducing a new SoC onto this board that is not compatible
with the iMX8X. However, Linux and userspace will be the same for all
boards as they need to be interchangeable with each other.

The only things we need to generate differently now is the bootloader
and ATF.

The bootflow is bootloader -> ATF -> Linux

What is the correct way to handle this?
Should we separate the firmwares + bootloader + ATF configs from
the Linux + userspace build config?

Separation feels odd though as that means we need to let the 
post-image.sh script we have for producing boot images (ATF + Linux + 
DTBs)  wander into other build directories.

Thanks! // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
