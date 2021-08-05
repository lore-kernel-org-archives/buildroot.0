Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78965C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:27:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58FF60231
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B58FF60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7921583AA4;
	Thu,  5 Aug 2021 20:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGaXFYjrX_fV; Thu,  5 Aug 2021 20:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB08A83A9B;
	Thu,  5 Aug 2021 20:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BFC41BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B2AC83A9B
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRclJj1WYpuz for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 736EC83A99
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:27:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g21so10166229edb.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vzgGbif8H9itXOlJjrVZ2P3RnrOrxPcT4ytrff1PwvM=;
 b=bqJXtGG096/WTayssTHTa7glVQyP/yc9wsnwwZWAQLGdYRaghoEHEOPf2h1AAcZnJF
 reHX4TYgvkjdkAAw0m163pZ5beJyIyNz2FBswWhH5vAccsbaQCNd3NPT502ZFT1zdibc
 xLMxItL4WpfWOnpaT/w0Th701+chnLVAToys/toWRHqw9PJ5p+GZvFlVJFWrPxnuj3Mt
 xP2qo7Om4Q8jM8skcdtL73xAbaGSOsLtOfqGocZGEDQVd8deNjrMrOBMgS8KuRi9RRVv
 mKDOFzbcGdDzmVR+5KjWEF/bcvN5Kh0C66/gewKbY4momiq3O3sYWu/uZhzp0GAZs3+s
 1hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vzgGbif8H9itXOlJjrVZ2P3RnrOrxPcT4ytrff1PwvM=;
 b=Fhd/g1GyIVnxpXAVecgHQMtcI23uft/3FLnUd+rey6Ql2j/Xioei6xP0X/MNbo2Sq4
 pkTqfEgYBImyIBMJNB6Enm921GCUdFu4JwkBcaz04y5tE/iW+cVfNqlg84secUBN/m1H
 jTeqPnUYZHUJwt/LIWUJPwkUHg5jjXS3j6+FFy9lvOadYp8qqHBKU47a425WgedR6M2V
 QEDtsnNLFhi1NqqwMpdKjJrJI29hL0CBrufxMnrBKWTBBz1ubbqIiITALqwSqOLqO+/8
 lywyvZCw4HYcE+T+IJdqflPpVr1Tekwu0B8Ga2RHwudNGY2ObN24Ue5EFuGfWaGVbapw
 cjRA==
X-Gm-Message-State: AOAM530Xuw5TEAkaCNPQUafY7/geLwwFQx3awVtyXt53t9hDfd1/JkUG
 Vn9gj096jlzF5m0V5fHDAP/MsOIvO//EUFvGoNI=
X-Google-Smtp-Source: ABdhPJwfneUKy34QONwqWX6GbI6RzcAYZUkCC7wF9IqKXnxQw8gGEdeTR0GBfmr3bq3Ou55Iq4C11A==
X-Received: by 2002:a05:6402:498:: with SMTP id
 k24mr9166948edv.25.1628195219702; 
 Thu, 05 Aug 2021 13:26:59 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id x42sm2816117edy.86.2021.08.05.13.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:26:59 -0700 (PDT)
To: Robert Hancock <robert.hancock@calian.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <4a27ed904dd80b00498185003c9a7bb26dc9a128.camel@calian.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <202fcb4f-1edb-30bd-806d-e530619d510d@mind.be>
Date: Thu, 5 Aug 2021 22:26:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4a27ed904dd80b00498185003c9a7bb26dc9a128.camel@calian.com>
Content-Language: en-GB
Subject: Re: [Buildroot] Serious time jump bug found in gpsd 3.20+
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
Cc: "bernd.kuhls@t-online.de" <bernd.kuhls@t-online.de>,
 Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 22:09, Robert Hancock via buildroot wrote:
> A heads up to the Buildroot community about a significant bug that has been
> found in versions 3.20 and newer of the gpsd package, and which is fixed in
> version 3.23 (not yet released, supposed to be shortly):
> 
> https://gitlab.com/gpsd/gpsd/-/issues/144
> 
> This will cause the calculated GPS time (and NTP time, if synchronizing to it)
> to jump from 2021 back to 2002 when GPS week 2180 arrives on October 24, 2021,
> with potentially disastrous results for applications depending on accurate time
> keeping.
> 
> A patch has now been added to the gpsd repository to fix it (note that the
> commit message incorrectly refers to 2020 rather than 2021 as pointed out by a
> commenter): 
> https://gitlab.com/gpsd/gpsd/-/commit/7f30d88d04dc62b8bd6265ad1d09d72d220f97f6
> 
> I am not sure if the best solution for Buildroot is to just update the package
> when released, or apply the specific patch to fix the issue? Currently
> Buildroot master is on 3.21 and the 2021.02.x LTS branch is on 3.20, both of
> which are affected.

 For master, I think we can still afford to update to 3.23.

 For 2021.05.x and 2021.02.x, we'll need to backport the patch. Unless if Peter
thinks that in this case (since upstream's policy is "always update to latest")
it's OK to just bump it there as well?

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
