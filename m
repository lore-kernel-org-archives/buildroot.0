Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E1CD2AB3F
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFAE840530;
	Tue, 29 Oct 2024 13:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQeKEBJzM4Sa; Tue, 29 Oct 2024 13:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E094057F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E094057F;
	Tue, 29 Oct 2024 13:39:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE03112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6805040A03
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hv2zC22jHUA6 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:39:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CA774016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA774016B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CA774016B
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:39:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 440D9E0007;
 Tue, 29 Oct 2024 13:39:13 +0000 (UTC)
Date: Tue, 29 Oct 2024 14:39:12 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241029143912.5835c47b@windsurf>
In-Reply-To: <CAFkzVZbZWYiq5hxx4F748RVc0G-QVk6AEozAAvcjxej8ZkSNtA@mail.gmail.com>
References: <20241029053338.766690-1-fancp2007@gmail.com>
 <20241029122031.60ab547b@windsurf>
 <CAFkzVZbZWYiq5hxx4F748RVc0G-QVk6AEozAAvcjxej8ZkSNtA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730209153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUwEEDfl0Wv1+66SVwKkwbchWMM6u0gYUp3p4hNrfnM=;
 b=XGg6YMQ5rsMwZHwC+t4g3v4C+XvAeeoQJF2p6ISdVMlImMXXkWIUcSb1E8zCGY07l2lIv0
 IAIpY+UHXxs/M36WTSloFtFakE1RLl4pOZzSDdQ8NjCS9AMi1LGd9TqAZT0lrmu7Pkxss+
 hmGplAQ+WESRMdt7SO98VypJdT78MZzdpc3pEBCcELYUHWxzdubbnr7sCjWG7qS6Rv/8LG
 MyOFaDwWqBF9IjIS5qv5fMCixo4PoSg56XXjjafdanMWozNF8sxtiGqQgYwDDARC9I8hK4
 qZgnkaGVfxmQEfNrfh2eK5hm/eLbl9hWqdRyZyf3LRIG1GbaTOl9KC5TWCpG4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XGg6YMQ5
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix build without
 __NR_pidfd_open and pidfd_open() found
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

On Tue, 29 Oct 2024 21:25:58 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Patch from upstream define the next line:
> AC_MSG_ERROR([Neither pidfd_open or __NR_pidfd_open found. Disable
> pidwait with configure option --disable-pidwait])

Then it makes no sense, it (the configure script) should simply disable
this automatically.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
