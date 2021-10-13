Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC44061175
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC44061175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EB28295A;
	Wed, 13 Oct 2021 18:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhqC2PZUG6cl; Wed, 13 Oct 2021 18:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA94782430;
	Wed, 13 Oct 2021 18:25:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5D91BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21C860BA7
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWl75YqT0YNJ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19CAB60AE8
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:25:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i20so13464561edj.10
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n9jJVIbwWxFGSJA0aLyJpjjfts1oiKWk98ZuwmlvHGU=;
 b=hT4MDMoF0GPnHFVDfDKrng/dWq9U8RwP/TcPo6vBPJyjwLGIImlBJ/a0YtngY7x8YB
 hrKulDZzbgabA7X91jj7d1M2thhhKgLd1dho1Ar1JADRqbbYnrzsyVk5AJLguQPKhFGJ
 /h1kG2YeFPYuOwd1dNtlRN5R0jKGuSq4dY0IBv06mEo3ohJlZGD2JX4HVRofKauIv6f0
 R0hj+XynrPYpUrInsAOiDhs5/StLOmZY+e0CCrdYI8BIObx1EwxUeD7+HPmMbPI1TmSP
 nTl7sqOObKyVGTMFttRAGBiI3av8cKO8pe6my2n0RbGBEh7s8vanXv9yqsme0euCzQR2
 JAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n9jJVIbwWxFGSJA0aLyJpjjfts1oiKWk98ZuwmlvHGU=;
 b=hWZmrdvwP4tMinXKQnrQxOUghQXTLqvhk4U7nghzrb1MsEmqDHmlerl4/BX94U9y1X
 D9uu4Zjg11IhrPzzybRNw5DCK1HmB+YqqHSBIemNxdh4wgzw/+MUdHDNm6aRSjN0zg3z
 NXDgn6bMmRVcWMO/5oUvKotOXsN9fTdTxp7jm1gAUzEb0mqWMgz/l2zewBqtchj996vB
 21YNNTjYN+zqjEi9+OrfLRuOeu22KfgSLFfYupgoYkTSpAiIa1POz4Om4WuLySzLr/Ep
 bjK77WdqVwwA8cuXGT3xwcTv5oCSEMAvNJCvzl5qcAYEOSZ48cKzkzbeizjM3B0ne3z2
 Ugrw==
X-Gm-Message-State: AOAM533gp56lGEEupCCBk9kTf3bVLdbkrlmbRDdXlKpIxWpSGXn6PIjw
 lnmy6IWRq+/tHdaEvEBzUipJBg==
X-Google-Smtp-Source: ABdhPJwAptRfBWJylKwVM3xUbjcgYwzG5uLBgnbakqkKMnwVEMZJcIUUZA2X4TACHbY8r6qSwGN5aw==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr942550ejc.275.1634149547416; 
 Wed, 13 Oct 2021 11:25:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h11sm218381eji.96.2021.10.13.11.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:25:46 -0700 (PDT)
Message-ID: <da918d4c-38f9-b915-4a27-f4e7ab0df9c5@mind.be>
Date: Wed, 13 Oct 2021 20:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006065758.1639585-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006065758.1639585-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pathvalidate: fix typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 08:57, Fabrice Fontaine wrote:
> Fix the following error raised since bump to version 2.5.0 in commit
> 036185d87ef7f77463dbdcefb13d071c58c13c41:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PATHVALIDATE
>    Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYHON3
>    Selected by [y]:
>    - BR2_PACKAGE_PYTHON_SIMPLESQLITE [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]
> 
> Fixes:
>   - No autobuilder failures
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pathvalidate/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
> index 564c3a0913..f8658e6165 100644
> --- a/package/python-pathvalidate/Config.in
> +++ b/package/python-pathvalidate/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_PATHVALIDATE
>   	bool "python-pathvalidate"
> -	depends on BR2_PACKAGE_PYHON3
> +	depends on BR2_PACKAGE_PYTHON3
>   	help
>   	  pathvalidate is a python library to validate/sanitize a string
>   	  such as filename/variable-name.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
