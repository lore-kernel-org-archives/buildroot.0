Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8A109C02F
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 14:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863136102A;
	Wed, 25 Mar 2026 14:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTsvzJNixYON; Wed, 25 Mar 2026 14:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 388A860ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774450767;
	bh=epXaSkG396wg0CEfj5KLhB5QV8Xf9K/qG5OUVvn9Lj8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gjFqCt3/2SDJfj5CpDPy2nzO/1b32BIw4GLNTwODGyDTNFxq05et2YUxvmLTCqNXL
	 kP25tAiKo0kqx2UJ4oOgF4n6EJZ8mEgGJv5Q2cMKiXo2tsuuXaihI1W52TrrkQfmC9
	 m3mmMuN0rOyHNXDPdskL2UIFbHxwM+AM4LrqaQeV+CZru/ey89YwRa75A5U5uE4WE/
	 iH/ux0jp+W9PFJxTaVSI062ZLONG6Unjm5nCz5GkduyvIMxbC5WAhYFLlwz6Na6YyD
	 6lPHl0T8AZE4+FE/KyzLZmS9Hh2BTc5adcWeEG3DNJJEmS6BNM2pxvUmS9lFfFtubF
	 RAfLT2C8YEopg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388A860ECB;
	Wed, 25 Mar 2026 14:59:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 084D5353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1E3860ECB
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9DIYwZmKmcM for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 14:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2C39600C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C39600C4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2C39600C4
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:59:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so56404405e9.3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 07:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774450762; x=1775055562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OKr1Gv6mlEvUL2Oc6E0sqjMUF5KrIrtUryn23u5tK0Q=;
 b=dBZExwomAvy6JBOAFNtsyt5F+WZRLyJvYnwHzAX7CSfurldG9jhPwFG77twMe+Xnhi
 Uo9hM3V6Sk/GHwmYMKUbDRAiie7LczsLm/HpMdDjCL/fwqJNpnkFpuLLVQqwsiRgs8xA
 ztGaXQrV1hX3LkaMjzulLZICPiQrOLGKF8D2fP3x7IRaoE46jRLsnTHAIdyY5DVLAZbd
 KfeXpAo4tY4NLp65/LIGM8ub+gcNK6v6ryh9ehKlmbYETBgKebWCZ2kxp/hrNLehg594
 h/icsURWQROrVPU6S+pBrlNIVXA5Jl9T/O7waIKLPZRnEs6nkj4Mgkw+OSWupSG00/Ue
 o46w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf7Ub+7BK2KmOgVwrGF1H3RJqe1iPs1MMWwLq524v1vvC3hZQYx8ycSAouYH4DFAhUqWMCkqyI+XU=@buildroot.org
X-Gm-Message-State: AOJu0YwIlnHIkjqhNWMZ+vffawGxx50ZAd7huOjcEt0POJW43j4PcBiQ
 H9XSzo7NY8aoJfuasci/4GtLv7Q0Uo7MflCF95rOVCc5uZl9VikG8MUNQrT4xmtBV8c=
X-Gm-Gg: ATEYQzzjt7ExgquW7M+iassPu2nyv4dd8lTS7FdWscNNukuuv/NW4TneLGuHP4r/ybV
 W1yGYLGtY7WI9GFCglNvddQc41HW+9TNrpKpF9EPr6tThjKsaa+9sgjJkGOoew9stN7Qanw7EXq
 8JpjEH3UiS53AI9Jb/lr6NrdkPVYeXw8cJ5js7vwDoWyMiBTweXc1PT2KwSeMTaI86LRQ301Luk
 lU5gmsfts4mls6+MSBArUJET/2ZzUYsgUGaSL+7Bjm8jz/y2eszk2KzIjVrjQZSJTZ1KDZ9RtCd
 seV1NCAgb1NeBeL81k0a79GCv/8ALY/VjLRLBSeEHrkKB2huffnPXRR9n0taJzKvzypy3A672Hy
 NxVkpEyIHGtlXtn5e2XEo7bjIOaIhaB3AIpr7DUinkNuAImWfMR5TGKPnRDit9CjjwZygnYG9j7
 eyw2WmzIM3pAsYX8o2
X-Received: by 2002:a05:600d:1c:b0:483:badb:618e with SMTP id
 5b1f17b1804b1-48715fd4787mr48228495e9.8.1774450762545; 
 Wed, 25 Mar 2026 07:59:22 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871e6aee91sm332365e9.11.2026.03.25.07.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 07:59:22 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 15:59:21 +0100
Message-ID: <20260325145921.388379-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325133343.1008245-5-martin@strongswan.org>
References: <20260325133343.1008245-5-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774450762; x=1775055562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKr1Gv6mlEvUL2Oc6E0sqjMUF5KrIrtUryn23u5tK0Q=;
 b=NhTZ+p5evzXb6hp2g5WrBkl8Kuo0C+ND9ZzmrFmJzyvlvr5NTP0VhIweNjVX1pa+aj
 a6dzoc48vN656O/upYZ6eU86r1Sxfy0F0GlQBny8tinDOHFGbH36Oe7rRw0btshhJBQo
 isEXrbm8szHCdZYeLSnKG4iY5PMSORnHlSixULyyoITg2/IIcr0GUpb3M4pH0I6aAtR4
 L2wiEenjR1Hw/HEvaPYZLCKEWk4Cxcv64cAb0qRJK6JXDMa7J0uGsTSElwrjiz9VrOfB
 beBxSOuMNVTrdD2tT6Z5Azv8EN+tK+cjwUZrnny4Woic33h12ah/sJ1+dK1NoHvZFOgg
 D9AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NhTZ+p5e
Subject: Re: [Buildroot] [PATCH v3 4/5] package/pkg-utils: add 'hashes' to
 show-info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Acked-By: Thomas Perale <thomas.perale@mind.be>

In reply of:
> Finding the hash file for a package is non-trivial, as they can be in a
> <version> sub-directory or under GLOBAL_PATCH_DIR. To allow other tools
> such as utils/generate-cyclonedx to find hash files, expose this information
> from show-info. If a package does not provide a hash file, create an
> empty hashes array.
> 
> Suggested-by: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  package/pkg-utils.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 211e681e8f5c..17b0aa176045 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -197,6 +197,13 @@ define _json-info-pkg-details
>  		},
>  	)
>  	],
> +	"hashes": [
> +		$(call make-comma-list, \
> +			$(foreach hash,$(wildcard $($(1)_HASH_FILES)),
> +				$(call mk-json-str,$(hash)) \
> +			) \
> +		)
> +	],
>  	"patches": [
>  		$(foreach patch, \
>  			$(call pkg-patches-list,$(1)), \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
