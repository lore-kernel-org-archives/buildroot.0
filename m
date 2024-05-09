Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA36EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7780B418D2;
	Thu,  9 May 2024 14:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQSi974w49aW; Thu,  9 May 2024 14:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6807941DA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6807941DA5;
	Thu,  9 May 2024 14:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E82291BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4F0783D83
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt3AHoVnsSB5 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5E2B83DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5E2B83DB9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5E2B83DB9
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:34:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A87A640005;
 Thu,  9 May 2024 14:34:42 +0000 (UTC)
Date: Thu, 9 May 2024 16:34:41 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509163441.72550e2e@windsurf>
In-Reply-To: <20240416213958.782150-1-ju.o@free.fr>
References: <20240416213958.782150-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+2Crjmo1F7PpFcvdNZ2aDm6GIFypj+Tkj08RgV6aR8=;
 b=AsrcZ1rwTDoRKmWVjstZz3tHGrcMtQV2X9HupqyeVpKUrMyejx70CFDOzAKTsOU9X1tE24
 tQBHpFpR3o8wG0EpbIErOSi/maIH5wdW0z0KHr/bdTSnse/qLrw19vBOMA1ZHulqxbSaei
 A8gtlWFgH3Dd8VZrq4ERvbM0VPxfcEUV7gak3vxZVHtjIMHjECE0zButXnVd/fY/vYyU4X
 +EGFTEi02oLfD0eSOFol1Al7hncQIpMbt2HspC7qOO262vZdk25KZeCF8NEKZ55uvyehu+
 aVBia+HnkDMFJkG2l39+kPzSHS9JgfBTjfZwVZpBgxVo7mJMGF2q7EnJN510fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AsrcZ1rw
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add ethtool runtime
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

On Tue, 16 Apr 2024 23:39:58 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_ethtool.py | 71 +++++++++++++++++++
>  .../test_ethtool/linux-e1000e.fragment        |  1 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 support/testing/tests/package/test_ethtool.py
>  create mode 100644 support/testing/tests/package/test_ethtool/linux-e1000e.fragment

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
