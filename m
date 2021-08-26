Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D6EC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:08:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981C8600EF
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 981C8600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C8C403BF;
	Thu, 26 Aug 2021 21:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQzrwe6DX4xN; Thu, 26 Aug 2021 21:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50BF403ED;
	Thu, 26 Aug 2021 21:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3381BF2A6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AF4F8100A
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVymx9937npn for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:08:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 438BB80F1B
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 21:08:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id q3so6668982edt.5
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m0bpWGwHFibFTv5kQ/6OHe4puIWhyJp7tP9oenY3H5E=;
 b=GAK1Nju+L5t0lRDfGGm37RzSQQTkzoS+Vybnzwx1I+r8rYMVgpwEpO85TenxoAhdHC
 TMJ0W9nvasnu2+nDktJQatOMRvKjgQUwLY2kyoVmQvEb7agzbeDwBz42osLMR4YhAwBN
 /wIC49kPKwQr2dodpHCxyJ7M6MggVqDUKSq1GRafzXASj1jzFyV2NHPL3memcWZjbv7k
 Evu4fjUKaapHvitxUh8zJXdLVpuLrIVnm0iAXFzHgo4f4jbQsEMxD51EuJkORDpQ6u29
 3zGf8rSHKkeAUZOaEeD2w810lJTti1TM7mPdiH7WdtIdb2ZEgEnDAP+p2scCs5LZszUP
 BhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m0bpWGwHFibFTv5kQ/6OHe4puIWhyJp7tP9oenY3H5E=;
 b=URXIgSeTiBbp/kq4hXoZfHFUfWxi3Ish3WJeTwIwx54mqwhkDHC0r/S3J4TeTr9zYx
 6e2vd3Sf8FpZOZIcVdENEYVzZ8bngEo8BXsqh3Q4Rx1GAZBPuUI3WK8mBo++YX6qeAtg
 jPs5I0m16k55fCQtMvwVyprdJZC8C2krXrXHM9uGhiMIo1c3qz5RUpGN/nqvblPyaQL5
 BTDulvw0tCA+LEg1NtUTdROw6YN2KjOA2eNC99YHy8ikbXIMshlAwvGigL+EQbFLli9k
 MWdSfwtQ5LuxlXBAXXJsseW0JrH8sCrBq8JIuNvOYvcXIotrgvnoYjVR8cWLmVSwuOCm
 mLmQ==
X-Gm-Message-State: AOAM533Xz2swYmKfTb9VhAp7nmvZ1nETx5ZwxCb65hnUVEUw4aknoPiA
 tMw3EhOcPjgRFKt7q/WI6y97IhbQi548cQ==
X-Google-Smtp-Source: ABdhPJwXoxpPFunlIqrprSO3FpCgWt3mNmpZJokz2T9WPbyrir01VOjXb2KEPrRhcql13LGkW2uTJQ==
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr6385227edr.64.1630012114532; 
 Thu, 26 Aug 2021 14:08:34 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id og4sm1896750ejc.120.2021.08.26.14.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:08:34 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <916c37d1fe52b9fd6b14eed9b68e4edb5801234e.1629958236.git.baruch@tkos.co.il>
 <5293a67121d1cc996d6cd48bc15e2fc29d45e1a7.1629958236.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1ef8c93b-7a01-eb12-d558-d97c81a77be2@mind.be>
Date: Thu, 26 Aug 2021 23:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5293a67121d1cc996d6cd48bc15e2fc29d45e1a7.1629958236.git.baruch@tkos.co.il>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/2] package/mtd: ubihealthd needs kernel
 3.17+
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 08:10, Baruch Siach wrote:
> ubihealthd requires getrandom(2) that was introduced in kernel version
> 3.17. ubihealthd does not build when getrandom(2) is not detected, so
> the following installation step fails.
> 
> Technically the dependency should also be on glibc version 2.25+. But we
> have no way to depend on glibc versions of external toolchains.
> Toolchain built with kernel headers older than 3.17 can build
> ubihealthd, but it will fail at run-time. So this is a pretty close
> approximation of the actual dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2d42b0a626367e4051d0e2aadcce39e974fe09d4/
> http://autobuild.buildroot.net/results/a2b6dbf707275e3f8262479c0650cfc7cb9abc8d/
> 
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>


 Applied to master, thanks (after fixup because I didn't apply 1/2).

 Regards,
 Arnout

> ---
>  package/mtd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index 1bd143d47e7d..4bd9118aecc1 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -147,6 +147,7 @@ config BR2_PACKAGE_MTD_UBIHEALTHD
>  	bool "ubihealthd"
>  	default y
>  	select BR2_PACKAGE_MTD_UBIFS_UTILS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
>  
>  config BR2_PACKAGE_MTD_UBIMKVOL
>  	bool "ubimkvol"
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
