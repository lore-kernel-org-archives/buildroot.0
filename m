Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6265C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9934860F43
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9934860F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 645A940431;
	Wed,  4 Aug 2021 14:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjr0eptl7UHE; Wed,  4 Aug 2021 14:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63FB840159;
	Wed,  4 Aug 2021 14:01:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93AB41BF82C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D2AB40159
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jr46SuCAXGDY for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:01:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7685640100
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:01:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1527788wmb.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=BmXUwWDilPg8OPzpPN+r/6EZzaF/NQTWaMM9yvdtrC4=;
 b=bhHdSzxQXQaETXEIQHDmaAyPWa4vcnVwOyxW3jF3jUFzbVMe8NeQycOkpkmIYHe5/e
 XZUT6IeGmFfuYzKufspmR9J0r7OxpDZht1HF5x1fzZz949rlhKoqZ89SyHKkz29xMSK+
 6lFEFTXyokI70fsAAyahitXFewlm+OSXfbEPoVZO3gZoaViqooIJ2KU2njF65tW5EiHf
 2I6ISVS+pJZNqz7TEuHUhoZXcthi4mx/ztsQvToo3eMrFxLO8GmS4hyV+A5rDvyOcLFY
 BALTZR1JUQDYgszfIENKepbfm1/t+uhDz8Tnr8RHM1S8eeBByqrmdi2J7Masis4Q15cU
 26pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=BmXUwWDilPg8OPzpPN+r/6EZzaF/NQTWaMM9yvdtrC4=;
 b=V4toAwapnGEQcpqN5NhfEqyOCqdhp/WIeQZ5zBSXArE/7bOgQGw8No9Y6/TRBgBRQs
 E/qnLIsT37QTfjrphSn3zjV0M/yg6mmCYQWmMOexmOwmIGsRweFFY0SBWvqEagjGDCxv
 m+IXrIoW7u4IkCqAzEzveyIWlh6NQcthBsVoCj/2ZRBTiFg3geoaiV3PI3ek+mnKt7aA
 PNwvNJrKtMz7yLTWXqognhVOakG7dlBqjFR/GuYsq+VtyYPnCgbAf99Y7V0KmA/MgIF1
 vTrMX/YKcGVg5y+bUV5++ji37IRF4Q+nT5ZGqmsCfyF6Y7Kz+SThKCizZSgguDufdeea
 UCrg==
X-Gm-Message-State: AOAM5307uGQYxTB4P4rJhtYVeugwXnCHMQwOhVBCVzZRaRTkhXeco2Jv
 l2Z4AGjin+PSzC7Uw7bwBcMeWYSJVxY=
X-Google-Smtp-Source: ABdhPJzJg/RPDpAT9t5WZQBFoe1SXSbcCB3wXSCnvDyjaT1NMtm7CJIE71YmNZwudu6Sz8NgkZ9QSA==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr10070149wmq.1.1628085675741; 
 Wed, 04 Aug 2021 07:01:15 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id x9sm6123095wmj.41.2021.08.04.07.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:01:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHSM-0003Gw-EO; Wed, 04 Aug 2021 16:01:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210704172649.69529-1-bernd.kuhls@t-online.de>
Date: Wed, 04 Aug 2021 16:01:14 +0200
In-Reply-To: <20210704172649.69529-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 4 Jul 2021 19:26:49 +0200")
Message-ID: <8735rps40l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/hdparm: bump version to 9.62
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Updated project site (old site was not updated since 2010) and package
 > help text.

 > Removed md5 hash.

 > Switched _SITE to https.

 > Release notes:
 > https://sourceforge.net/p/hdparm/news/2021/04/hdparm-961-is-released/
 > https://sourceforge.net/p/hdparm/news/2021/05/hdparm-962-is-released/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: added release notes

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
