Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A9BC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD4EA83B93;
	Wed,  7 Feb 2024 16:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOVQr2Ep9wf0; Wed,  7 Feb 2024 16:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D721683C18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D721683C18;
	Wed,  7 Feb 2024 16:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C17501BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEC8841496
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3V5Fwqty_5B for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93CD1413A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93CD1413A3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93CD1413A3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:46:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A425760005;
 Wed,  7 Feb 2024 16:46:56 +0000 (UTC)
Date: Wed, 7 Feb 2024 17:46:55 +0100
To: Sergio Prado <sergio.prado@e-labworks.com>
Message-ID: <20240207174655.283732cb@windsurf>
In-Reply-To: <20240207153532.1199300-1-sergio.prado@e-labworks.com>
References: <20240207153532.1199300-1-sergio.prado@e-labworks.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707324416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5GDpMmrBPL2GJOfI9+EFAIOsVHnUvK7LMLoPHjGh/g=;
 b=nS5+B+SlnG907MJshLn4y3jorcvA6JWJHU9Gcr75AhA2FnxTMN5FP3TpwX8JjWXkSMrKXf
 WQJ/Tts/lqCg5gqQYdNdQBilN+Go07tqX0dVCHZ6zTN+fUZPGtoNZwuEPlDEtJK5l2viLj
 nLedzdW9PiCUIN+suNgm1H563JUQW8Y5eEhjFC6gM87XF4laT9wsutrhWD0ytOgjPXKR+j
 uxlqWS2DSpvmx/4x6Yu3oyzWVY6NMz/P7j+3c8tPC9kjpWBGMr84RdzI6KDSEVq7e0Ykql
 ZXAw2RlLJh+enzvvdNIxGRwNp4bM8TGlOgfEWTNtVmDvnFF+OLuE9jxzh7K9yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nS5+B+Sl
Subject: Re: [Buildroot] [PATCH] package/tio: bump to version 2.7
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

On Wed,  7 Feb 2024 12:35:32 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/tio/tio.hash | 4 ++--
>  package/tio/tio.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
