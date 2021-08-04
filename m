Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30759C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5BDD61040
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5BDD61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B942A605ED;
	Wed,  4 Aug 2021 21:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ibt4lhOgySmh; Wed,  4 Aug 2021 21:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB1160595;
	Wed,  4 Aug 2021 21:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECB991BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCAF183576
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqehBqrC5bHc for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:27:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9DFC83366
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:27:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id k9so5334678edr.10
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bKv1nyvk5bnmQhjpU3aTLZfloSqYHr21i7/9RgmAYNE=;
 b=hGJQc9i8NMQpaEFSrK7Y/ucm8nWdNfhCywQUqEWH7Dr4p5UhE1tPOeUz9QcJ/gDT0B
 cCK0CEci5fhubVvopAxAScc0G1OPBd9MVmL6PxFWM+EfnH9qkXxkKaeO5cdcjTz3n8yc
 ggHVD9273IJLgj6x1O02pj27KRMs6LNFSxMoIzQN02DNvJpZSQ1/+0i76NEd88aUiw+L
 8in3DFG6ZKqNzDGyJQTWNLzR/E602eFt2dHOAIQeb4d5DTpTul7a9eDo1w40IaiRIVa7
 FGT0p5uSj5T5PQNgjT/DERuB7EFvsQa+7TJ5H9rL7FKDsisN2p6Js69CIRJustDqRw03
 p+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bKv1nyvk5bnmQhjpU3aTLZfloSqYHr21i7/9RgmAYNE=;
 b=peEX2hpZNu69hUFrpLeesgzoIsUvDbRl3YHU8DeLx24M+oorZKnqJdUh6wvBY+TxN4
 WDGFZBxzX+lU+z326dONozmZk6vQ7LRVzJRP9B5Z7wejHkVdBejQZIoo/fmDrEseEv93
 FCMR/J+hvwVo3ZITwcyuB0B+tzc+2dHI3w4cMTMe9y/L6dn8HrlqQxCY+qNhdBPlIU9D
 EsDB2ab9jLNRrcmzpPpp9unJ8hpIcURp3sqD9RFQ9yAdpxWLadjnw2SubtlJ19z2vkD2
 nx8KnsfBT1HnJtIVAQbEAnK4WIImb25XnggeHWOk8/dUDACC+6PSobUHczFiHm+MeDG9
 FQyw==
X-Gm-Message-State: AOAM530ztWQuXXSZI4cfS7F00nc+bvqMgRkqjyyj/rJMwFkWwcZswRBC
 WF5IlO7f/EZJjmJSRvSqD30YTvlmH6VccYXDy7U=
X-Google-Smtp-Source: ABdhPJyOQSUDVYpCVsDYzLWU+LApsRPAilr6KnRVSWCrZ++RweXAEao2PzKoX7/LSb7mDUERRqktIw==
X-Received: by 2002:aa7:d54d:: with SMTP id u13mr2211456edr.138.1628112426860; 
 Wed, 04 Aug 2021 14:27:06 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id cz3sm1399190edb.11.2021.08.04.14.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:27:06 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e39793e8-6e93-656b-3a4f-4d1d7dee810b@mind.be>
Date: Wed, 4 Aug 2021 23:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/3] package/shairport-sync: bump to version
 3.3.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 22:59, Fabrice Fontaine wrote:
> Version 3.3.8 brings many bug fixes and enhancements and is recommended
> for all users.

 Given that, I guess it's OK for master.

 Series applied to master, thanks.

 Regards,
 Arnout

> 
> https://github.com/mikebrady/shairport-sync/releases/tag/3.3.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/shairport-sync/shairport-sync.hash | 2 +-
>  package/shairport-sync/shairport-sync.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
> index c451edb933..ebc81dedc1 100644
> --- a/package/shairport-sync/shairport-sync.hash
> +++ b/package/shairport-sync/shairport-sync.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7f8d4ecec53f2f681a962467bf09205568fc936c8c31a9ee07b1bd72d3d95b12  shairport-sync-3.3.7.tar.gz
> +sha256  c92f9a2d86dd1138673abc66e0010c94412ad6a46da8f36c3d538f4fa6b9faca  shairport-sync-3.3.8.tar.gz
>  sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
> diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> index 1a02186dc1..adc584d554 100644
> --- a/package/shairport-sync/shairport-sync.mk
> +++ b/package/shairport-sync/shairport-sync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SHAIRPORT_SYNC_VERSION = 3.3.7
> +SHAIRPORT_SYNC_VERSION = 3.3.8
>  SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
>  
>  SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
