Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E9ACDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE301406D0;
	Tue, 22 Oct 2024 21:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3QiGrj8CF5G; Tue, 22 Oct 2024 21:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B987406D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B987406D3;
	Tue, 22 Oct 2024 21:17:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E16259F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF834406D1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcrfL8XOmnDv for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B78D2406D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78D2406D0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B78D2406D0
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:17:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5F98E0002;
 Tue, 22 Oct 2024 21:17:37 +0000 (UTC)
Date: Tue, 22 Oct 2024 23:17:36 +0200
To: Bryce Johnson <bryce@redpinelabs.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Message-ID: <20241022231736.7e5626ef@windsurf>
In-Reply-To: <20241022210334.261117-1-bryce@redpinelabs.com>
References: <20241022210334.261117-1-bryce@redpinelabs.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729631858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=My6/LxyNRucwAwbh9MbL5o9axNMhPlWqEqdzLkuCySU=;
 b=bhv8qHqmVrpv5EHlL1d+A9SP5zQvml15v0+yImahd5pFsmTCXQe1aE5fLZ4YwK9NB+0g5o
 S9c0pS8CJOfUUYFmZp3ls4bv7ILfeZvo2J5w+t48A8c580O/+JuBXNeNKYTeo/rhod1lsQ
 OIv4SSRt02yUHV83w7DyTxW7gkqIom/FrqhNo/zXSihKCvRVhvDbvx1baGrpxZ4rVAwtn5
 Bl3UoHwlfc3kDuEuuc1cfQfF31F0M+5MSvlIsP+xI/Mxbjz10syXKIERmReb3yp9iGetDi
 q2JS/6ixTmEYvB7AvQKfW3iMdBivX9xFSiNNQjFMYRC9Av/Evz3LE4RKjsUpRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bhv8qHqm
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so can be built with aarch64
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

On Tue, 22 Oct 2024 15:03:34 -0600
Bryce Johnson <bryce@redpinelabs.com> wrote:

> Was testing building with arm64 build server and failed because it
> was downloading the x86_64 version.
> 
> Use $(HOSTARCH) instead so it can also downloaded
> 
> Tested with building configs/ti_am62x_sk_defconfig on arm64 that it
> uses to build the 32bit R5 MCU.
> 
> Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
> ---
>  package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 2 ++
>  package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to master with an improved commit log. Though I believe making
this dependency more explicit would be useful, as suggested on my
review to your v1. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
