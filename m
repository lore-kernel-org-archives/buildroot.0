Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F33C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 17:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6DF83366;
	Mon, 25 Jul 2022 17:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6DF83366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OoGRFzxikLuk; Mon, 25 Jul 2022 17:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6162C83337;
	Mon, 25 Jul 2022 17:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6162C83337
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 023B61BF396
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D5D83337
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D5D83337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_etRp3ddq8w for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 17:54:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ED4883300
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ED4883300
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 17:54:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l15so13022944wro.11
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Sw4yjhQHYKS2QiFNDxYY6JfLc4ll3Sh3Jfh/pR2SCY8=;
 b=wH75PrSKrLgQcjig3gLeY1JE9kzCRl91+MowazD63/XNURkN8ASZ3HqqDYRnQrwU/i
 5QeQs/dhYWAPSaunZMVV+zsNGn64tJhrKbowgpeGW+e9PUSMLMQ/DZ6RkJz0k9E125h7
 oYnwZJXf+txzaUhqQGV5FD1tYpmSOeqMryOTaUILaAMpjGFatyZ3xBniAYTyqt9BJZFA
 kGl4FAnP533MXC1DV+HuW/x0zp5qiRG+2sxArSbUVAm+j3E8yxIMR6Uk7vk419+iObTL
 3Ndbmt7/1Ze39g2yH6F3Onp3C6RExuUATMN1pqzI9tl28jQQZvVCeARmr0mu2BiZn6Yf
 oopg==
X-Gm-Message-State: AJIora+3ONixusKUSLeq+XpbXKTStzdpHvx0dpsdMsZF/ZAMB+maXqcZ
 FJTu0oHE3855DssWuUxYiVuEKOvN+zoWbA==
X-Google-Smtp-Source: AGRyM1vKeywjjbl/ZZPSrb4BZTxpDAGpQPqu1O/bMfFoyU9Rpa/JSocWYMfCRvknbe+VJoi63lsQrg==
X-Received: by 2002:a05:6000:1a41:b0:20e:687f:1c3 with SMTP id
 t1-20020a0560001a4100b0020e687f01c3mr8151015wry.415.1658771693488; 
 Mon, 25 Jul 2022 10:54:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0039db31f6372sm17738255wmq.2.2022.07.25.10.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 10:54:53 -0700 (PDT)
Message-ID: <681acd80-5d7f-a481-65e8-13ba95904572@mind.be>
Date: Mon, 25 Jul 2022 19:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: buildroot@buildroot.org, =?UTF-8?Q?Adrien_Gallou=c3=abt?=
 <adrien@gallouet.fr>
References: <20220725175052.3417144-1-arnout@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725175052.3417144-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Sw4yjhQHYKS2QiFNDxYY6JfLc4ll3Sh3Jfh/pR2SCY8=;
 b=RSTqGHXvJnJpKb6pcJEKpg8qB+s6Z2Eq10YVXriYSWjsA6C8VVy/V+dATsU0+dvZo1
 +EPLUnXAheYcjlsiJhyjxMhngRqwMnNtFDvkDUcJbYMAp+kVelqeM9XjnplQSJIKgSQq
 +GP1O09UC9XEwBGx0XN7vbdW5gY54u0Ol26+Gv3iw6aBJPn9gDS4d4EK0RWvk6aGhvv8
 f8S0b05ZWYIUqDC0wobWRm+SShG97WcQDcnXN8xScYU4hA93kEhi9rWD0BGim64xp/b3
 hS6X8tFcQVFSd3N9p99gNJG0nH4FiUQmroKeXS75riY0I/HbjfFpebP5/sMONN0VHpf6
 eFpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RSTqGHXv
Subject: Re: [Buildroot] [PATCH] package/bird: bump to 2.0.10
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



On 25/07/2022 19:50, Arnout Vandecappelle (Essensium/Mind) wrote:
> While we're at it, update URL to https instead of ftp.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Sorry, I forgot to put Adrien in Cc.

  Regards,
  Arnout

> ---
>   package/bird/bird.hash | 2 +-
>   package/bird/bird.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bird/bird.hash b/package/bird/bird.hash
> index 2d20491dd6..6ccacd8d58 100644
> --- a/package/bird/bird.hash
> +++ b/package/bird/bird.hash
> @@ -1,2 +1,2 @@
> -sha256  19d2de83ee25a307b9e5b9e58797dd68766d439bcee33e3ac617ed502370e7f6  bird-2.0.8.tar.gz
> +sha256  7ed341ddd8dc87fa9736586b3515447a8436fec442d65f4022155ab9de1ffd5a  bird-2.0.10.tar.gz
>   sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
> diff --git a/package/bird/bird.mk b/package/bird/bird.mk
> index 7d7002d5f2..a039023764 100644
> --- a/package/bird/bird.mk
> +++ b/package/bird/bird.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -BIRD_VERSION = 2.0.8
> -BIRD_SITE = ftp://bird.network.cz/pub/bird
> +BIRD_VERSION = 2.0.10
> +BIRD_SITE = https://bird.network.cz/download
>   BIRD_LICENSE = GPL-2.0+
>   BIRD_LICENSE_FILES = README
>   BIRD_CPE_ID_VENDOR = nic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
