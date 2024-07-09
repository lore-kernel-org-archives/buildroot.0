Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC40DC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 728DA40285;
	Tue,  9 Jul 2024 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odbQdoXtBdWF; Tue,  9 Jul 2024 21:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3063F4079C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3063F4079C;
	Tue,  9 Jul 2024 21:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0F121BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCFEB81EE3
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu3Njk9DsdeX for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:36:31 +0000 (UTC)
X-Greylist: delayed 42436 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 09 Jul 2024 21:36:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB02881ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB02881ECB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB02881ECB
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 21:36:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5855DE0003;
 Tue,  9 Jul 2024 21:36:27 +0000 (UTC)
Date: Tue, 9 Jul 2024 23:36:26 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240709233626.156cc5c8@windsurf>
In-Reply-To: <20240709165421.2685663-1-francois.perrad@gadz.org>
References: <20240709165421.2685663-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720560987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Aa2DlHgxryjED9NikDsDieZBfp1hXFTdOsvlBvY7kI=;
 b=mcJu8ew6k1Dgp+z+WOqWgMWGZ43zV29Y7kWX2PE4tWR8Gz852Gx68ozIXC/m5WDcY3E8O5
 beQDjNI7a+sSs7ALmze35KLQNHmxt9THqMYBxwALpUOifU606J75dCQ5Z3QLLJTKxJmkCV
 woUcOvI//8XMwMoXu6k/K03KDlSp1I3TE9R+uPL5YZZL33wxSfPE6KRTRarSdpogk1eUmW
 Cnm86/ueduS6Wt8di6kgNhaq6d7+hzc0uamAFQ3G/nrC/8vYCqBFK1SrJ+RYoNGwJeIRMu
 H6pl3KHbXXNCz0S52LNm6fIWD4J8K/6uTM40dDjJVT8S6InZeuypShjKg+bNPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mcJu8ew6
Subject: Re: [Buildroot] [PATCH 1/2] configs/olimex_a20_olinuxino_lime*:
 bump Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jul 2024 18:54:19 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
>  configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
