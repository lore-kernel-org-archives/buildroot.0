Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E16D35171
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 10:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 029B3610B6;
	Wed,  1 Apr 2026 10:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vnU6Sdeyx-m; Wed,  1 Apr 2026 10:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3396101B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775039932;
	bh=ggIp3f+82WXrZTqTqM0DM6woUaBuom2OVm4v0vTZCwg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nPApSTKwwfSYddNV0zHuoYm/lHmXPsBpC5mPugN9Rphc8gc2S2U5lVV7USn7IOTiG
	 m+qZKakp+reMf3Sv6K59Bin6pAqJalHr+DfeAPiosys6NA8AmCTtTxX7x6C0Qv0BPp
	 i21hFym658uBFo9Q6HvdtD8ihwlnv7P5M4nD4gvVh6KFgN2nnm4AVCm4Rcxh/l3TxG
	 BXxwCFE6W87pDuIXghuqd6EaHoHsKJQ2lFNtZNrurdwsBa4TLsMbNzNtWGLgYu0FoK
	 RPeFnRcMa5S+Km78gpm5Gb1OAAJ+ck3RyMMKCA5s4fPxA0Psq7W0DKPukLT2r16vk+
	 Wq2i+KdUbxiFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3396101B;
	Wed,  1 Apr 2026 10:38:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C78A12A2
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 10:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8FDE6101B
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 10:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXfX9wnXcVvS for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 10:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B983D61011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B983D61011
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B983D61011
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 10:38:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2C1531A310B
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 10:38:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0B88602BF;
 Wed,  1 Apr 2026 10:38:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CD0010451B2A; 
 Wed,  1 Apr 2026 12:38:41 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 01 Apr 2026 12:38:40 +0200
Message-Id: <DHHR4Y0EW0KM.JOA77D0BMEIC@bootlin.com>
To: "Peter Korsgaard" <peter@korsgaard.com>, "Luca Ceresoli via buildroot"
 <buildroot@buildroot.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260331-fix-tartget-typo-v1-1-4f5ff0ea325a@bootlin.com>
 <87wlyr5911.fsf@dell.be.48ers.dk>
In-Reply-To: <87wlyr5911.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775039923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X9WBrMbxRE909wVkaduKZ1Xnef07AtBOvsMVSZIOHl8=;
 b=hMjNU/qJuTAfxH0phFD2/z0TAkWK5fiLN3Xfm0ELqD+C1/qnt2jCN5564KeiLEBdKXPTnT
 bw/ca0ThLGMTDG3JMGUQtm3yUtSwkTuFZ2HaG3hihGbtIbYFh2l6IBy/J6/cMC4+XY/JXL
 n2uvnsP1x+irhgVu8loB9IJ+foohgbsAfRtqGnB7qwBzM5p6lDaRRfd6Lp1DtcpRgZF9Zw
 OLTid8cEl79/Vcba1qj6C7aFobmFy/s4N0P2Qly04IXGaXrfR3KzwlcEDbyDq90wcg1oRI
 mO/4CWtXUR4+kSTSwgxqOSzZqPu6HMO7DiJeJaaPQ3SVnPXnsJPIeWDp4OHxXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hMjNU/qJ
Subject: Re: [Buildroot] [PATCH] system: fix typo in comment
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Wed Apr 1, 2026 at 11:23 AM CEST, Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli via buildroot <buildroot@buildroot.org> writes:
>
>  > Fix "TARTGET_DIR" -> "TARGET_DIR" typo.
>  > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>  > ---
>  >  system/system.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/system/system.mk b/system/system.mk
>  > index 52e810868a82..3da9d3b2ddd1 100644
>  > --- a/system/system.mk
>  > +++ b/system/system.mk
>  > @@ -60,7 +60,7 @@ endef
>  >  endif
>
>  >  # This function rsyncs the skeleton directory in $(1) to the destination
>  > -# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
>  > +# in $(2), which should be either $(TARGET_DIR) or $(STAGING_DIR)
>
> Heh, who wouldn't like to get some tart? ;)

I would! :-P

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
