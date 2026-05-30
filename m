Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0802CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9BE85143;
	Sat, 30 May 2026 12:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmOJvSt5lkOc; Sat, 30 May 2026 12:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512FA8510B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780144573;
	bh=40fF2kBs06I2kPzRS58GDRTc0+28iP1FHEOHa6WePqM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=e4JB+VJuL34vCTjXOvfKOV0knRttAzgEVJWlgP4VYtWw/tbor1KJ2PUQusBO7YiDH
	 SubwG+2b9P+AbL+60m93oWLXx3qtyBT7vYrtG720uzrKUQ10jB886LoqJxol4L8CrT
	 2LUong8MwMOGc4rNmOtp4pX4RODj9qar7Snp7q/vthrueY0eU4UP8nm8WkXnqOX7q+
	 j8N0Mb5DCSHJZ/ui+N51gi0LAaEinhSdMeIupHmL2XpmPSN/g+R9ukCkbEi3CUN3db
	 7AwOAdNHeaica7vptz/8tdJghT1inSsrjE135YMISWpglcaHFG7IRLRuzkqlKzEnrh
	 5ydxbmBhi9eJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512FA8510B;
	Sat, 30 May 2026 12:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 451B1F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AFEC6F4CE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iy1wGs17dytZ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64CC56F4A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64CC56F4A7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64CC56F4A7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:36:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8AA3B97C718; Sat, 30 May 2026 11:59:50 +0200 (CEST)
Message-ID: <4cb3957f-af1d-4298-818e-58ed560b05d1@rnout.be>
Date: Sat, 30 May 2026 11:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260530090906.1130247-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260530090906.1130247-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780135191; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vRjj8d+6mGz0c4EOnHCNM3Wkflj2ZX2rSzAJYLdCpjc=;
 b=S0HWJhsXxEedziSKnBDNEke1UVKg2R/oMOei7KyLnuqSKUss3ijz1HOcz/nW9cHvwCMjXn
 wJ9//FZWhq7un7kOwJLvDAZQCi41UcfKSA2WlkfQsgb1Fg2sTxRkTSiD5TbEmLdbKd1MTo
 wOYcvd92ke6iK8k3s1ENDsN3JicTOpaMgRdhYDljPmiWECaAx3je6eRO6GrhuvI79CQAKp
 bqJ7/gc0FaJPfwRqGqECYQI0cErdywzJ7PyL8x3k5NTfASW7Leu1mRVDI+IUwTW8TFZJbx
 L4MKuC5yKSSQXXvskdJoJ/T0DHk4JPF9Qzme7l50jxq8sFbcyb5HhYdTngZtAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=S0HWJhsX
Subject: Re: [Buildroot] [PATCH] package/icu: drop outdated comment about
 git tags format
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/05/2026 11:09, Peter Korsgaard wrote:
> Commit 5bf0db998b ("package/icu: bump version to 78.1") dropped the
> dash-to-dot conversion logic as upstream now uses dots in the tags names
> (E.G.  release-78.1), but forgot to drop the comment explaining why we were
> doing the conversion - So drop the now outdated comment.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/icu/icu.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index ee1ede6f2c..9b97011f55 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -4,9 +4,6 @@
>   #
>   ################################################################################
>   
> -# Git tags (and therefore versions on release-monitoring.org) use the
> -# XX-Y format, but the tarballs are named XX_Y and the containing
> -# directories XX.Y.
>   ICU_VERSION = 78.2
>   ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
>   ICU_SITE = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
