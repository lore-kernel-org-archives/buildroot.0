Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D1E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3207A82315;
	Thu, 21 Sep 2023 18:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3207A82315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA1Bn7RWqSrZ; Thu, 21 Sep 2023 18:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80ECB822AB;
	Thu, 21 Sep 2023 18:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80ECB822AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55F661BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E0224195F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0224195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xb4oHTX067p4 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:25:18 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDA004192B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA004192B
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so282487866b.0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695320716; x=1695925516;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QVytjVldE+1HYU1+vJl7MEDaOR0k2hqJniMr3l5pRpc=;
 b=drGvYOrxZEY814yVPfFy4KfefJBUj3oNZnCzuyl6z4PNWz1Ozq7agplq7jioNGkO2F
 nxrgqCFtN+BaxiuT86cX6tFvyaiqUWt+FibHyer2dAyuTFONFIteHs/HHa1+QAKs7goW
 BJvwASk1oQi9WUY4rM3E1nGph6pDty7RKl6AKn1p13974ZQALZhhO5Ln0H3LUAlT3hVA
 dNTuJaV5Zem9NU01NeghR6SfO6PjDB92xEo/F7X+h54ZjJnn8GfKd4NhuI7a0IawnhhZ
 m7scYBmXYLcZI0KrTb3kQgz2oiKFrS4r3mATuJ+K8CxxHFY2LRUFrkZeaVew4y5QBpIY
 4mcg==
X-Gm-Message-State: AOJu0YxNluJg2/4a5ndHiuuIqZSfvTxHC93Jj6yl/piVQDB0z5rbazzv
 08Iqoob8wpKnJVsdzgYMPyl1SSsY2eJDzPjlt2Q=
X-Google-Smtp-Source: AGHT+IHveIG8o7hq1q7GbSXXe3n/l6fcmi6q9FEHrpAxp4S3PEyHfadvf+KsABSg2bCcdgrydTTh3Q==
X-Received: by 2002:a17:906:5357:b0:9ae:614e:4560 with SMTP id
 j23-20020a170906535700b009ae614e4560mr587512ejo.29.1695320715914; 
 Thu, 21 Sep 2023 11:25:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170906230900b00993004239a4sm1403212eja.215.2023.09.21.11.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:25:15 -0700 (PDT)
Message-ID: <8642cadc-7cea-f0c3-c3c8-8877f2dd3127@mind.be>
Date: Thu, 21 Sep 2023 20:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20230921111016.1041614-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230921111016.1041614-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695320716; x=1695925516; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QVytjVldE+1HYU1+vJl7MEDaOR0k2hqJniMr3l5pRpc=;
 b=DlEQzicilSQkS6oCwYH3RFR8AXPeI1c6WxkW3P/b8DAEo0bi9KCGL4xrF7ch+0e9AI
 uUsI2Zo37vX6WTozQR4pfV+sZgJsX2NMuMU/A9L9AzTW1XJfeH8kcegnklHpbMCXgkM+
 WTkH8s1xNKgmE0yW15Ap66Lzovcj5B8w3fhut4150/MGE2xgkyy+o6zurBn+FzX4lk+l
 fNyYEQm5NZCrCYeGxB+szRB0uefUYBY6pVDzpWi5kfT1z3XjhtY6a7RmlK6WrOqMueIE
 vI/8Ob0F7BKVViTIJf9gxHhdKLsotpbV4Q3POIsq1+Vl19b1+G0evzk6Qckx35fJ8JqH
 T9/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DlEQzici
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure on
 s390x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2023 13:10, Giulio Benetti wrote:
> s390x doesn't support Wi-Fi on Linux so let's disable the package for such
> architecture.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f52e8a14330ff281a7096baa47f387f8c1859345
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/esp-hosted/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
> index 43c802fa44..42e1afa8c5 100644
> --- a/package/esp-hosted/Config.in
> +++ b/package/esp-hosted/Config.in
> @@ -1,8 +1,10 @@
>   comment "esp-hosted needs a Linux kernel to be built"
> +	depends on !BR2_s390x
>   	depends on !BR2_LINUX_KERNEL
>   
>   config BR2_PACKAGE_ESP_HOSTED
>   	bool "esp-hosted"
> +	depends on !BR2_s390x
>   	depends on BR2_LINUX_KERNEL
>   	help
>   	  This package builds and installs the Linux kernel driver for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
