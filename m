Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9DDC3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A9E600CB;
	Sun,  4 Aug 2024 20:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ly1C6CbVM4Qt; Sun,  4 Aug 2024 20:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FB76062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FB76062F;
	Sun,  4 Aug 2024 20:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97DF51BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92F4C80F9F
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWB1rMvYl8Tz for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:37:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FCE480F9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCE480F9E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FCE480F9E
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:37:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3503C0003;
 Sun,  4 Aug 2024 20:37:40 +0000 (UTC)
Date: Sun, 4 Aug 2024 22:37:39 +0200
To: James Knight <james.d.knight@live.com>
Message-ID: <20240804223739.09dc1dcf@windsurf>
In-Reply-To: <CYYP221MB11406664D14900C3AA420AA6A0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
References: <CYYP221MB11406664D14900C3AA420AA6A0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722803861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJ3SfTdKU3+heDYjGAg4PB5dykJkM3N2558+kSilxk4=;
 b=JV4Hbr7GBHMd2YLMr18Xkh6XUEM2jleFAx8ZofU8ujpbLOC8QxDRyRzQ9VgAwc5cCAzbO3
 wEsT/J8y5sb+4USVYhxBdTEPXPwV4wfjAfUWUJeti/MgSi9iyAlkG6jIut6yeKqNyg3KEx
 YW1YYjRBzGmniyop1w9D2r61Gg7c9KWiz9+V77HRpO2BGV4ncCyhCwS3sgfjI5PE4uEtXz
 UZ9086ewS1ebJzy5NSrvDiYD2hgwutRZp1ar5yatINh0Du7EGmos0g31ESP2rXMpIkBq3h
 O8yMJA0PFZWJolYgPoz+paPtmhaLvWiN1lmbeLONbQTBiI0KRx0AXAvS4i1Bjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JV4Hbr7G
Subject: Re: [Buildroot] [PATCH 1/1] package/libpqxx: bump to version 7.9.2
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

On Sat,  3 Aug 2024 19:54:01 -0400
James Knight <james.d.knight@live.com> wrote:

> Requires GCC 8.3 due to the introduction of the charconv header.
> However, as there is no BR2_TOOLCHAIN_GCC_AT_LEAST_8_3, we round up to
> BR2_TOOLCHAIN_GCC_AT_LEAST_9.
> 
> Note the `COPYING` file has changed due to copyright year bumps.
> 
> See also: https://github.com/jtv/libpqxx/blob/master/NEWS
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/libpqxx/Config.in    | 6 +++---
>  package/libpqxx/libpqxx.hash | 4 ++--
>  package/libpqxx/libpqxx.mk   | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)

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
