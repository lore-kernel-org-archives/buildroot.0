Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE06D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4A740C4F;
	Sat, 26 Oct 2024 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIAsOlvgkrSz; Sat, 26 Oct 2024 16:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A9540C8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A9540C8F;
	Sat, 26 Oct 2024 16:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF655C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D5B840C8F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVC2P6sF-Ky5 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:44:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEC2240C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC2240C4F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEC2240C4F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:44:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 219FD20003;
 Sat, 26 Oct 2024 16:44:15 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:44:14 +0200
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>, Vincent Fazio <vfazio@gmail.com>, Christian
 Stewart <christian@aperture.us>
Message-ID: <20241026184414.5924bc56@windsurf>
In-Reply-To: <cover.1699547993.git.yann.morin@orange.com>
References: <cover.1699547993.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729961055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZD7QR44S6K5MtVGMcFloYP/FBUvp+jy0YbXgU9a5sg=;
 b=bS2AvMZ6KQaTs4AFCC0WnG7JUeuuXiLAL6dYxSWU9bwf6tosVA4WtZbw0sc8vqBnpOza7I
 UTctkU69CPNVhGVWuinB3ixwtEnuvKwHmsKUtByUI4cAcbI0vZLynpxQInVlA2ewbP1xMA
 Mg1eA2211WUjcf9TrVofZt2/ul4LJvieLxy21e7lBOGzjNRI2R6BvBIc1MxOdjovLDem6o
 WayM9vtn4tw2iMXcq5q0W8ET3c4D4TLv4harfpEp6KSpS+gD2S7Kp2HlasSROfmtWYRfSq
 ZHqTmuwrYfZcs5v3ctKoHQzdiV5cO0G/36S2XpInmjGlPTaLd7+DD8jM47YQSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bS2AvMZ6
Subject: Re: [Buildroot] [PATCH 0/2] package/filebeat: new package
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

Hello,

+Cc Christian Steward.

On Thu, 9 Nov 2023 17:39:54 +0100
<yann.morin@orange.com> wrote:

> This two-patch series introduces filebeat, an ElasticSearch-related tool
> to grab local log files and send them to a remote ElasticSearch server.
> 
> It is a bit convoluted (see commit log), and requires a little extension
> in our golang-package infrastructure, which we introduce as the first
> patch in the series.

Christian, could you review this patch series, and especially PATCH
1/2, which touches the golang-package infrastructure?

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
