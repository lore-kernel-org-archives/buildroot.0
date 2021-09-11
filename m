Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64D5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CB561074
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90CB561074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AAA08274D;
	Sat, 11 Sep 2021 18:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2CMNuZRnt9E; Sat, 11 Sep 2021 18:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAF85826B4;
	Sat, 11 Sep 2021 18:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C38EF1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C084940533
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KG5mS5Y_oeMp for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CED1840526
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:57:30 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id j13so7571706edv.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aBSNFxXcYIktuV1/irxPpLCIJVzoWxUgMrS6XDdXb5s=;
 b=eXmLcXtdile8Ul9CJ+I8+cUt6fgcNLqM3A7SMHNC4ePRj4Mf6o3jPFT2icB8HFDqwa
 Xq+1iuiLl9ZSdzDRUFmAVUqEH3s+K6zo0tyUWz2nK28z3z/fIXZsAU7X2r6dqBCit8j2
 WOwaVKtmrgEmZLDudH1UHSeSMjCyeUbmTxjfAFvCt5i+uHUQmHvtUJOwcOCY376gcust
 yjU1VgeGAuG9hA/PjIJv7XzGsflwlF25fPCaeib+tKMV3MwdHZQ7+nSmjnaAnWjvNe7Q
 ERS8fbjRHxUndtd84Lq3Ec2eNyDFYF5WXDOHtccXnYfnkSkP4rPm6C19iLrnCa1fO1kB
 hmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aBSNFxXcYIktuV1/irxPpLCIJVzoWxUgMrS6XDdXb5s=;
 b=wRgX/eirWyFc4akSj5kOqhfWDbTOrhfFr6KpcbKbvoo21FvBtcgki6n83BjJ+bTouQ
 WiWGfW0LTtP4THzMCipaxr8Gfs5KYYbx+h1Psgba+eumm3H6LD3dtX04A90x13JO21UX
 kfIC+9F9SVb/FwlmmPiIB3kPIVVWFrd7GKRi7KUtfmPNC0h4AOtMTj5lk59LB+81x7My
 54FLBQbFoXEF/wtJFXhlKXsgVnEcoY+c/N6e1ZNTwGMteKYgyHaxdaQBn7cKSa24pt2E
 /T1YIl8Uak5yfBCa5D8vugSh4ohTR+IEoVyR1ZC5qB0erX/zSSyslpy5+mqspZDiLMpV
 Df+A==
X-Gm-Message-State: AOAM532kIldlkImfE6WX38/Cmz7uwAACTUBsJBOuTzmZfSeDZ6C9+rXd
 iiMeClbsMi52EpOQ/LRKSBMGjpnKd+cI+Q==
X-Google-Smtp-Source: ABdhPJz6tmw5qn7hpwg8gLGwFmsYFbyg+GUOaFVTjo5TAhKvUnC/kyV+ut9AFo+2RWVD5qXkd352bA==
X-Received: by 2002:a05:6402:2792:: with SMTP id
 b18mr4451151ede.173.1631386648992; 
 Sat, 11 Sep 2021 11:57:28 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q6sm1103489eju.45.2021.09.11.11.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 11:57:28 -0700 (PDT)
To: Ash Charles <ashcharles@gmail.com>, buildroot@buildroot.org
References: <20210901124837.201278-1-ashcharles@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <42eab5b7-7192-88cf-1bf8-739cd9bef871@mind.be>
Date: Sat, 11 Sep 2021 20:57:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901124837.201278-1-ashcharles@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] pru-software-support: bump to latest
 version 5.8.0
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



On 01/09/2021 14:48, Ash Charles wrote:
> Update to the latest version of the PRU software support [1]. The
> license file remains the same.
> 
> [1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package
> 
> Signed-off-by: Ash Charles <ashcharles@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/pru-software-support/pru-software-support.hash | 2 +-
>  package/pru-software-support/pru-software-support.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index cd81488e1b..8345c2724e 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,3 +1,3 @@
>  # Locally-calculated hash
> -sha256  57e47128dc5437c5a64d4ef94f419d9ea38e894c0c31ab10cad99c0da614b296  pru-software-support-package-v5.7.0.tar.gz
> +sha256  e9256533a6901d31cd12b4ca1c1638b795d316a966967783a8d573e75a6f9d77 pru-software-support-package-v5.8.0.tar.gz
>  sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index 91f41bcb91..7c1b520290 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PRU_SOFTWARE_SUPPORT_VERSION = 5.7.0
> +PRU_SOFTWARE_SUPPORT_VERSION = 5.8.0
>  PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
>  PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
>  PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
