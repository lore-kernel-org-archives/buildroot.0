Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2216F8204F;
	Thu,  1 Aug 2024 21:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plMqvozDeKln; Thu,  1 Aug 2024 21:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD508208A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD508208A;
	Thu,  1 Aug 2024 21:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4971BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9967D4029F
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yYvjnRYIjSQ for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51AD440153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AD440153
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51AD440153
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:40:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 984FDC0005;
 Thu,  1 Aug 2024 21:40:51 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:40:50 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20240801234050.63460668@windsurf>
In-Reply-To: <20240731215546.758381-1-kilian.zinnecker@mail.de>
References: <20240731215546.758381-1-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zfxb6duZOenHZGtPCyG0GKERmoTj8mkX2d03JdjdgNE=;
 b=aegQcihsBaKKBswsjeiQMMyb/xIBUGV3ZjY5qzJCeATj8cpJmgDMVx2zspNa8F+3+PYiZj
 HiVWdlruhYwxU1IEW2R4NbUIES9qu16ttfRDHCf6Sbab7Kfkflib5ehFphzFQeUkF7lI94
 jrztIi5HOZmmBrDUrm4pzRFIxrjRTew7SkQevjV7v2N7dsQxJPJPSWliQDALJFZ6JTPM3k
 miyaCORWWBkTAsWfRx7/WCGiQhhutRphYfAff6JB5SNEZ/vikQ6ENuc34cHwUuquDHSl0N
 /m96kx66oNIfk6MfsJ4C7LeYY1nzC+EOS9iFMF2k54zdW9yJVlMLkFEmL4/mlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aegQcihs
Subject: Re: [Buildroot] [PATCH] configs/rock5b: Remove futile uboot tools
 param
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 23:55:46 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> While switching from a custom to mainline kernel, the uboot tools
> became unneeded and were removed from the rock5b_defconfig.
> However, the FIT support configuration parameter was accidentally
> left inside the defconfig. This patch removes it.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>  configs/rock5b_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied to master with a slightly tweaked commit title, but more
importantly, with a reference in the commit log to the commit
introducing the "issue". Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
