Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8527EC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176AB6124D
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 176AB6124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A4980BD0;
	Sun, 22 Aug 2021 18:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJwPdFCgtuu0; Sun, 22 Aug 2021 18:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1963B80C3D;
	Sun, 22 Aug 2021 18:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE6B51BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD8B280C1E
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofxzS4hhb9gb for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 18:20:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55FC280BD0
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 18:20:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j12-20020a05600c1c0c00b002e6d80c902dso9259564wms.4
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 11:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=pL2XTYpT23ST9Kc6hSHsY0BPjSDf6nb/Qb4+PaiTK5A=;
 b=kvW+eZxg8aH/lqEgGl0TQxbE8doy2I85f9HU02nlX7JCNnnO/ZX8i0A6IDEdvF7a/4
 1Wck+q7ZFK2BvVIheH0+eDNtHt6/aZxRNEs4jx+KRIfn+laqXnECtChaNxwcd/CDpt9o
 V5FOozJkmP7TUDn9Q/p5SdpqA2pLD/dmeBmuVgcsovzE3zLDxEhZg4yldlukFpPy63bc
 1B2d5BWCWfYZTuSBkExAQDfbFIzu8K6EaP4JPjtr7C5dcpcwT8Ht2YhlSGBFcL1HZIIx
 6fWGSWJCV6DGF5nnq6FWqwVV/8FzbAdsoq78xhgg6i7AcvgJK5BQQsbf5XIi7X2wb2dB
 1v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=pL2XTYpT23ST9Kc6hSHsY0BPjSDf6nb/Qb4+PaiTK5A=;
 b=ooEbnKJPLPt2TSXzOAdyP/zZECRGXKeAcuzTPUhoowC+puONoWXtB4f9lsfKIBaML0
 Uh5lEeKt8l4S8HLAdTIiFKQeYjUvPAHPBZpMwG9EAy55IScj7ZxXP1pKtA6aL/r9lDVb
 fX1a+FaYiVkKjx53wM7iU0A5PzWj3QRZk2UtvBmz7IPLTPoVEfLM1qL5WnQgkJCdquaJ
 DLrNI7wageYh/aGL1UswtNawE9U+m14J8UIYrO4lGi7KFB8PV8yOzq0lUBWIkXl47R+O
 S+g66HN2Ust0EUZx2sF9kkoYAc4MCp+DIDL8f7q/ccNrpRlVnfHLVJgcijfDAaZcx1+S
 T3Eg==
X-Gm-Message-State: AOAM530bo6ZJWegh3o3HbNOqwthIy1YOMF/CfRrDKhMG9/zKDj++eTwE
 kMMGDJpo8QfXpgaUo650kkw=
X-Google-Smtp-Source: ABdhPJz/NWmE0V/oi7o1pq9cpiKS8e9qcVBwhRLfcAgqoJCfNNA1vFvQfZpTqV3BvNv5h4DlN43Lww==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr13307393wmk.5.1629656398459;
 Sun, 22 Aug 2021 11:19:58 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id i14sm10814736wmq.40.2021.08.22.11.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 11:19:57 -0700 (PDT)
Date: Sun, 22 Aug 2021 20:19:55 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <YSKVS7nf1jwgoUNa@pevik>
References: <20210804172259.9143-1-petr.vorel@gmail.com>
 <20210804213019.6cf2a25d@windsurf>
 <e85b8610-6f8c-c581-138a-a73d6131f521@gmail.com>
 <YR2Bc4t7UMIDUhgb@pevik>
 <aaae8b0a-4e4f-28bb-f8c6-d74552b4f51c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaae8b0a-4e4f-28bb-f8c6-d74552b4f51c@gmail.com>
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/glibc: bump version to
 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Romain,

> Please upgrade localedef package with the glibc version bump.

> I'll mark your patch "Changes requested".

Sure, I'll send v2. Sorry for overlooking that comment suggesting it.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
