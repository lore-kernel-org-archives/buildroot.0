Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE93C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 20:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9B660FDA
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 20:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA9B660FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD8E80E9B;
	Thu, 26 Aug 2021 20:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9zKtZvKKIVQ; Thu, 26 Aug 2021 20:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F60826C8;
	Thu, 26 Aug 2021 20:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0EC1BF580
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DED1A42634
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fM5Db0v0ziqq for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 20:54:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0782A4263D
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 20:54:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y5so6606357edp.8
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H0kqc9u6DWvqhrauHyKy+Bs8wh2miVA/zd8Ejt5XuP4=;
 b=JVKd0nuSVGTzj/plzUXcBHWk1I+fcevi2d0s6emyYHVtPnXSi2b1sLDKSKbebLPjsk
 TPlTI0EDLk8jU/Y0N9A4OupfSUr+Lht+PTOUvvubu4eNaL2mI8XCv4fICqBpDWeytDzI
 UncjlGHLjOO/ZCqXdIMDzeHt+9BaGTcH1Hq2FOBVuvjlKYPybTU/9qVFT+BQAuM02HuD
 LaQU9+i5ghgYjIYZ9+QR/IATCQbw55typtpLTWxBONDnx7de7+5Qkhp79+G6SqehbIW6
 DZySEWffIBXOq5ccEuhdpu65dOjmnsClrRxdnX0b9Cm/ndNLOnt1B3d0lKDX+EJatbSJ
 6SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H0kqc9u6DWvqhrauHyKy+Bs8wh2miVA/zd8Ejt5XuP4=;
 b=TdojcDHUNsFFsMG/a5n2gx2AWlSruH1fYFTQ28TPwMcZvwAv/MnrpHJ78kpkf4ONxe
 JHp4RnNKe6ORfrHxeBgi0x/x6Zyv7NXQ1B+dz8RrUhplmRubBOWWooWim4FBVwKjSR+7
 RnLmOLe9qYSjnZbqZ2/v/sxHscDIDddJo3oeGbCLq9IWUTmBUAH+9gSU7+Qg1l+qqgBN
 GjtBXaiUipr9gZok+jVC9WZqOW4n3SN3WLWsNtF2fGJYZrEc519PduqjWWXyctVJG7A8
 pmRQzm+Z5xCsDuv8bZJuStUQLmYlBhhgtX1PISUkHXh4IoMj+j6N2+eXp1bZdKh57u6/
 9iig==
X-Gm-Message-State: AOAM5316hZY9cs4QG9kOTgAedpYQ27K0LDFngUpOMmUYTIdQOG4fFNbG
 gDZfOnKlfkS4Mk80imurg9KWdDpKYZdRmA==
X-Google-Smtp-Source: ABdhPJzeqboVTEKVDe6t1thMD4aoi7lCgYSLXAGxnUqRZVAzp/wJuCGrcWAPH+hvPun+PQiDG1bytg==
X-Received: by 2002:a05:6402:2909:: with SMTP id
 ee9mr6197127edb.377.1630011243168; 
 Thu, 26 Aug 2021 13:54:03 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q14sm1880414ejc.93.2021.08.26.13.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 13:54:02 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210825193817.5466-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a6f23108-6cc4-051d-b768-77bdd9ea2ec4@mind.be>
Date: Thu, 26 Aug 2021 22:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825193817.5466-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/cjson: bump to version 1.7.15
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



On 25/08/2021 21:38, Fabrice Fontaine wrote:
> Fixes:
> - Fix potential core dumped for strrchr
> - Fix null pointer crash in cJSON_CreateXxArray
> - Fix several null pointer problems on allocation failure
> - Fix a possible dereference of null pointer
> 
> https://github.com/DaveGamble/cJSON/releases/tag/v1.7.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/cjson/cjson.hash | 2 +-
>  package/cjson/cjson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
> index 5133c15a4f..c39e884cdd 100644
> --- a/package/cjson/cjson.hash
> +++ b/package/cjson/cjson.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  fb50a663eefdc76bafa80c82bc045af13b1363e8f45cec8b442007aef6a41343  cjson-1.7.14.tar.gz
> +sha256  5308fd4bd90cef7aa060558514de6a1a4a0819974a26e6ed13973c5f624c24b2  cjson-1.7.15.tar.gz
>  sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
> diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
> index daa498f9ff..ac8db5701f 100644
> --- a/package/cjson/cjson.mk
> +++ b/package/cjson/cjson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CJSON_VERSION = 1.7.14
> +CJSON_VERSION = 1.7.15
>  CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
>  CJSON_INSTALL_STAGING = YES
>  CJSON_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
