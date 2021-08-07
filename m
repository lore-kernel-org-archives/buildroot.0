Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75DCC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8645160EE1
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8645160EE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46DBC837CE;
	Sat,  7 Aug 2021 17:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsjuqTC1NeRc; Sat,  7 Aug 2021 17:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ACCE837AC;
	Sat,  7 Aug 2021 17:18:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B22091BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF06A607F0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uEzwNvc3EM0 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E08AB605E3
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:18:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y7so17944795eda.5
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=kt2jzpXFTLEEa0g94P9bkaFj5CJ46BvQQdvApl5MwwM=;
 b=uKN8h1ro0r5B6cVyTvgVvW1zJFiq9MZOY05qrqszHX4Ws3o1eM1BmeZydRx9p3rNhp
 Ky0me28jydtYj8wWHDwylC+dgyvl9iMAnJeXFzZ4yP3I7jRzu3Put+w2EMRUPMpavI44
 UA9iCtokpkt6eJupvvbwSh5pt5gQyiVwgnVBlMtAquAZdY5p3jHtjLftzs9DsWDOn59b
 y9Kii8wvPn9R729gNq5FZrY+CHG6IOtmBKvcgT0PKGwTBr6XgWDdYPoGjChcAdatSCr/
 7mduXesUd4H+VQ8GK4Jo2fx9TFxAK872YkYr5Ml4pOabuHRuG21BM3gu0JT9C9rdLQjZ
 5bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=kt2jzpXFTLEEa0g94P9bkaFj5CJ46BvQQdvApl5MwwM=;
 b=Rjl6zJSK3aEQ2pdLkalELajJNXlB/wAzjKvlEkI4qz2lNC6OFBWB0GV2t7/1DRr5Fz
 x6IBDVaF03hu1QaNvAnt0lhyFin09fPwyC9cwPpsMwrB9M1/s/rwx/fb7BjCqK+IGqxU
 MUYzqCqVOrPb3sX3jEc2wgwR9AZrgNOsecvajF1gL5Uggtbj29aNd0HKLnCRqmcXbOxK
 acDiR0s7aqbWGZTeXa29gRZtMnW7hxVsy2BjmZh5tcmzOw20KwaE3//24jinsni1dQoU
 SIpUF93YTtXgYle8WawNGlJWHoVEhc8Rdq5ifPA7FDiWAV7mMKUbpGX7IhLVnA+J/OTS
 Z2Sg==
X-Gm-Message-State: AOAM532EKuz+tkNT+f1QYOTA5tmDo4L6KaFF6XYPL/PrmIyQt01d7fNU
 cmMPbZAFSVWgeo81vC9vk3U=
X-Google-Smtp-Source: ABdhPJzSd8G/6VpfW5XS88DrnJ7UmDNEEn8DDJGqABM9ncj38uhi5wWS/YaskXTmhQ40rzcLl+mn1w==
X-Received: by 2002:aa7:d547:: with SMTP id u7mr19785822edr.28.1628356702180; 
 Sat, 07 Aug 2021 10:18:22 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id ha26sm3982312ejb.87.2021.08.07.10.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:18:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCPxk-0003pg-Qx; Sat, 07 Aug 2021 19:18:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210801063844.14313-1-bernd.kuhls@t-online.de>
Date: Sat, 07 Aug 2021 19:18:20 +0200
In-Reply-To: <20210801063844.14313-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 1 Aug 2021 08:38:44 +0200")
Message-ID: <87lf5dfa1v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: security bump
 version to 6.4.20
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

 > Fixes CVE-2021-36386:
 > https://sourceforge.net/p/fetchmail/mailman/message/37327393/

 > Release notes:
 > https://sourceforge.net/p/fetchmail/mailman/message/37327392/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
