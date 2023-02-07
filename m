Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC9C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0626D81BD4;
	Tue,  7 Feb 2023 13:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0626D81BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chCUpfzfgROI; Tue,  7 Feb 2023 13:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327D881BC6;
	Tue,  7 Feb 2023 13:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 327D881BC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39FAA1BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC6360F47
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC6360F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVMZqoH6rOJP for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:33:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5358060E8B
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5358060E8B
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:33:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so13545329wrb.11
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 05:33:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzpx5uSIJQ3U0+aGPWglIbk1Orm7joSFFgW37RgP2V0=;
 b=GoQ4OtAveuoDGPffOD55ZKfFqaKGuQI23Hzde96Ztrn7qVPOQISyEiM60TIv2+tx2/
 YClHpV+Itq+HlTew0qwiafkyyKDxI10QtUx+HKPhHOAorrWIlzeRlYkM2tDin6uv2Fxq
 PnkVDxL4xPP4h3lzTHKvIGqUUT+0TFKZbqrJ38KOW/sU21IG+0zu1e/erWrO2FJgomwO
 Vx2QUwk3rC6Q2T4LjkzK5bIGqyldUseQKWiCaHInuzkwXNGaW1oBL/j0LLbOVWzGxHyW
 2ltxd/P0WJz4ByFpGIOCCNw0fxJVDLavN6bgH7MII59nmqUihmg4EQi9osKTUo+9+SVN
 /CLw==
X-Gm-Message-State: AO0yUKUlFm0RBJAlmPfslFKEB1tJcqSkSnpBcKnwKB6YdhCr9oqUXiLI
 e+MEriaawXb0arsxTb9jWpVw33gCHfFUqeg3
X-Google-Smtp-Source: AK7set+IyNemP2/T2dufVr9nOjp5of3nk9Gb3dsW/wd2+xYEoxRaphGmxPNVDTyq7nGNGqjgeQPoAg==
X-Received: by 2002:adf:f78d:0:b0:2bf:ac2c:4489 with SMTP id
 q13-20020adff78d000000b002bfac2c4489mr3124921wrp.54.1675776792567; 
 Tue, 07 Feb 2023 05:33:12 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm8562188wrq.91.2023.02.07.05.33.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:33:12 -0800 (PST)
Message-ID: <5b84c64e-bfb9-cd95-63fa-8571cd430e5e@mind.be>
Date: Tue, 7 Feb 2023 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: buildroot@buildroot.org
References: <20230207115344.440172-1-arnout@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230207115344.440172-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzpx5uSIJQ3U0+aGPWglIbk1Orm7joSFFgW37RgP2V0=;
 b=Dxpaz7valvTYVHJUSWOwsFC12m5yby8dwUg5D6EyvNDHYpV2mF/ClqepW7tsf8pXEd
 S2TDnAEs3ZsJta2ftROtpF6akJdzoorQaLGXJBd4QI/0/WxDp3sFaNV97vDB8ZdaJEdD
 N9gB6gxZHGGmy5MSP2UZ+w0by2EdX9bw1AmStRU4oZahxGKeIZsed5wjjD2UwqP4jiQV
 fzvNgPq5OWcMvXVDNhe53pH48UyAPw4MhdvE/cE2i/4+HW+MN+XRT6C7HxOHavXwtkV8
 f9/uRu8Mx11nT6pnFw4zLGPp49rU78TMJR3jkxZSQOwFbcG5VZdBaK59KNSN+srQfE/a
 5eCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dxpaz7va
Subject: Re: [Buildroot] [PATCH] package/busybox: update to 1.36.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2023 12:53, Arnout Vandecappelle wrote:
> Remove upstream patch 0003-awk-fix-use-after-free-CVE-2022-30065.patch
> and update _IGNORE_CVES accordingly.
> 
> The two other CVE fixes are still needed.
> 
> Refresh busybox.config. All configs are set to the new defaults, except
> for CONFIG_UDHCPC_DEFAULT_SCRIPT: for this one, reuse the script we also
> use for DHCPv4. This is matches the behaviour previous to the bump,
> where we had a single script handling both.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

  Applied to master after a quick review by Thomas, thanks.

  Regards,
  Arnout

> ---
>   ...wk-fix-use-after-free-CVE-2022-30065.patch | 52 -------------------
>   package/busybox/busybox.config                | 23 +++++---
>   package/busybox/busybox.hash                  |  2 +-
>   package/busybox/busybox.mk                    |  4 +-
>   4 files changed, 19 insertions(+), 62 deletions(-)
>   delete mode 100644 package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
