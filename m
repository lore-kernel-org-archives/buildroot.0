Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD67C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DDA460F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DDA460F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04144402F5;
	Sun, 25 Jul 2021 21:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKRqvjnngZeX; Sun, 25 Jul 2021 21:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41DF7402A9;
	Sun, 25 Jul 2021 21:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B00571BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F80B402A9
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlJ_OMs2hjpv for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:11:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F831401E9
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:11:24 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x14so3094659edr.12
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=nw2p0L7sumupCLCzVdbZB0ns5M8mgZDU/hvDQQ2Uo4k=;
 b=LqFAsUkxg9Jt4zJJZXSKo+QPOc4Nnbx+YmxKtSPS3bBVfQbASNM0ossLKJpme9U0bO
 da3oCPlsESGb6krz6wVtcMg7Pg83VUsWBg1wAfyF3/V1RVAfVLUQ58oo08P6hLYGEfVz
 b6PsJmaXDCWXlMwzaXE03cIMhKfLOG5l5v6jn0r5r9TrxEv2qgpPcM156Z8jPs5oIi3x
 R4vNTgzq08kcPc/N0OP0NtyeAsjtRCPmmDbzJ2uXRVY3ak4RXmGg44ff8fpsZRz+KqU4
 QGiNaeVulVOSDXp5fTYmvtEWaOUIr56Y02ZznLRAl2OYZphYVIfD/xRvzkszZWMZLnJg
 tROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=nw2p0L7sumupCLCzVdbZB0ns5M8mgZDU/hvDQQ2Uo4k=;
 b=bnlqHp36E2BVotx/3lDw9XvnKdtU3cjbXHYKy1XeCngujplEGq09lLYUfYBeaWlgPW
 UyK5nMS0+H3HndHQGLXEg5MwCHEeR80wmsKWwfBrZ3BBPzZEIMGG/GMeipNIVLHUOjQV
 lbbmZ6Kd+8La8pcsVL17vAQHqGfcL43nq6Hz9jSt2NeirSWY36Ra/IZgAgxIBdBwUR0Z
 69U2UZSiEI6AalbLQTz6c3lf6G1A/8gOPPqcISKc3RKpOKnXb4Ud7oHYhXzuY7tK2lpn
 Pk0jZQ3IYsl3brU2naaw6EWeVV9s1X3wqqa/z3VVPkznPR4qw+tTU8YM8TjWXorKr2Gm
 2low==
X-Gm-Message-State: AOAM532dgp2YMkd0Uzt7y1qYrImS6uvnPj7OdD3j8d7gh3B6an9+DkYA
 IfHQwjTe+1o6cNWlEQm5TgPoSqsbCuHTHQ==
X-Google-Smtp-Source: ABdhPJxhXfbpTFs+euxoP6akAQBbamTlPbyCYWxQK6fTpROgWK3NjDGqeVUpquS500zmaJTM8X7NvA==
X-Received: by 2002:a05:6402:37a:: with SMTP id
 s26mr18288497edw.114.1627247482834; 
 Sun, 25 Jul 2021 14:11:22 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id g19sm9696414edu.75.2021.07.25.14.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:11:22 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:11:19 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YP3Td024jBRWDVsH@pevik>
References: <20210725210054.1534823-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725210054.1534823-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix printfs format build
 failure on 64-bits platforms
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Giulio,

> Add 2 pending upstream patches that have been pointed to nfs-utils
> maintainer to be committed soon. They both fix the build failure on 64-bits
> where time_t is assumed to be a long long when passed to printf("%ld"), but
> that is not always true, so in these patches the author(Petr) uses PRIu64
> tag.

> Fixes:
> http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Petr Vorel <petr.vorel@gmail.com>

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Although I'd wait till Monday, when Steve merges them and then add
upstream commit hashes.

Or at least add links from lore.
https://lore.kernel.org/linux-nfs/20210722161545.26923-1-petr.vorel@gmail.com/
https://lore.kernel.org/linux-nfs/20210722161545.26923-2-petr.vorel@gmail.com/

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
