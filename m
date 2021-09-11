Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1DCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1FD60E76
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF1FD60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA059605CB;
	Sat, 11 Sep 2021 14:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNwV0Ed4kcFR; Sat, 11 Sep 2021 14:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1175760629;
	Sat, 11 Sep 2021 14:11:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80A031BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FCBF60629
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VyIojputLWU8 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88F80605CB
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:11:32 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i6so6919231edu.1
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x4wCNW2Ge4THbHWUrQqsouwGGqULBJlIKKFURqWJWlY=;
 b=BuHT+9PkYoTq5Gh2aZXntvcFDgt3nzPHYdwNpyP/n13bGXPwn9XuAFGMHlfzmtYkgX
 Iuzax7EFBEy6E+1KvWNlTfZRhRRV/htkoQI0zc9BnvVqO3OtnxCdoy+JiMy2yNz2OpXu
 7PfXC/PTTwc1RWpLeIqK7Re+Z98hE+fWP+9gZW1Z4LkaTJVPVTvdY8/mHLFRnsYV1kKV
 xfXSp6HrxjLax1YNopfq6BnMweeUvHMWLbwzZuoGkNj1VMGZiEvIWqt4sf8m6kgK6XdL
 e3hl7g+wyB7PlJaKI+9/JuJkIXABmDVQXxalzPYi4mjrXwQZYoIsCBdrj0X6CBblMqBU
 MhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=x4wCNW2Ge4THbHWUrQqsouwGGqULBJlIKKFURqWJWlY=;
 b=xB3UGwCmCH+gJrIVCKnwl/J2ecbHoG9ycpWf4TDnUjXQaQbu7IVLLBa1142LP9Emzm
 /fsueCh1VwH/ZVE901zetvD7FYihYlKfUcZwblFdLTNvfef/zSMg+5TbZNodaQf1gAxJ
 /msN7F5yzQxK8c72mEr2zN56/rAamObVB2tjGjfX3p3nqEAAspSfAzpoj5gvWpWbJIFJ
 uBNuqcv3Odi54hZQlHjQaS9jdTovaJSL1e8M4UeOsm+sK5ZHRiB9QI2zBV2difhB7NCu
 tTjetJvb5xptGWi0L39qXEi1wyfwOHzVxykO7b5X+qXH9RRe01EC3hn9W5zBZI7nLN3R
 YODg==
X-Gm-Message-State: AOAM53088OK2F0Nl65+vSeyXmNjDfzmXUwxFfTU74IUDwA4e1eaGugWt
 IRdXi5iufNf7Dc/y+A1QVkNhECYbm6Cr5A==
X-Google-Smtp-Source: ABdhPJyW8fY+MSeon5i4Y9P6uCrG1t+Ys4UaeJxelyUQimwazxVSR3XzKnckVuodaJky/TA1elYCQw==
X-Received: by 2002:a05:6402:b23:: with SMTP id
 bo3mr107341edb.145.1631369490478; 
 Sat, 11 Sep 2021 07:11:30 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o23sm997707eds.75.2021.09.11.07.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:11:30 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <345a0ffa-9499-0ca7-2b9a-239ecb17780a@mind.be>
Date: Sat, 11 Sep 2021 16:11:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/8] package/swupdate: let buildroot
 handle stripping
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

 Hi James,

On 29/08/2021 04:46, James Hilliard wrote:
> In buildroot, stripping for the target is configured and implemented
> with the global `BR2_STRIP_strip` option that drive the stripping in
> the target-finalize step.
> 
> So, we explicitly disable stripping at build time for swupdate.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 Series applied to master, thanks.

 I first had some misgivings about some of the patches, but after investigating
more and trying things out in qemu it turns out to be all perfect!

 Regards,
 Arnout

> ---
>  package/swupdate/swupdate.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 402aa0a91f..42008cddd7 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -22,7 +22,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>  # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>  # available in all external toolchains, and use CC for linking. Ensure
>  # TARGET_CC is used for both.
> -SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
> +SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
>  
>  # swupdate bundles its own version of mongoose (version 6.16)
>  
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
