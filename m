Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96797C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E1861029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1E1861029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 943AA81775;
	Thu, 23 Sep 2021 21:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VL7A5JyC5mm; Thu, 23 Sep 2021 21:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035E681BC5;
	Thu, 23 Sep 2021 21:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B55221BF304
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0626064B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuBMIJ6iE-wt for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:04:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7477C605F2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:04:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g8so27854910edt.7
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y0eyzo6K52N2L8uV27aVc3cnPHpV6LTGM/6AxmUiwEg=;
 b=Ww21cUOTwwBBTowjRxtbu8jMeV8H7wLMD6kL5dfJKFertmbIeAxIEh3UvA+D4X5BDG
 VFKYOcgzKQdg91QqgPUvLe3c32d69pvZjEcAIZUGcMAJ4GNZZhwVSNuuG/dFiSw/hfjM
 1o1RHKf3ZbbE1mY3SSA5OYVBDC1WVMlB9FYdMjJe9GxKSWH7yTI/FIImjpUReyhlO4QA
 zskTp1KT9xBar4bE+VixpA7AFwpwmi9rUGH2XUXbxA9DktKFxfCy2ROrGs/tQBgyPv4u
 vEjG8sV8fn0mmLjwOV3LPUFT90RuksSuhtWso95r7aK7RDOGEpHJV81ySbeIhz0XQEqB
 r3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y0eyzo6K52N2L8uV27aVc3cnPHpV6LTGM/6AxmUiwEg=;
 b=SN29P2k+HAE7OLpty6xQZsDG4Sev9rF+beQYf217ey9UxHeE7j64LI21oseKP83z9B
 xW03ZHAMHYHZKsp1YCa3MPRf0MWWe17H0yNQUjxUCQQXAWucL7NODwa9auDRvy+iuwse
 PWQzw0A4gunsmmv4pmZuqqFtLRrPJOoukFtpXK+pjocf7263WS23LPvFFxqSai5jq5v6
 0cb+II4ba8WMuNJ1Z6V3WFX3uIvA8GtqkDT7RWReu8iDUeuP4dvvNCPz+0ns514D0GVO
 RtZdS4faskd1yoMb6ciifvRy/UEIEhYX7pkKUPPYqBgC3de3QdXYbg2cjNdhkXH/xAeQ
 3sFw==
X-Gm-Message-State: AOAM533a66Eb3NU7z1xt/u4JBLJCQUGtRmtp6upNg2Uh8YJ1SFloy5gj
 CUOFmxgbc9DY0rekAWs6x6W4MQ==
X-Google-Smtp-Source: ABdhPJxO5WFTuSzKyHWx9tBZAZtM9miDO9V8xpVOyPGsvhgtd0cjT6Gw1ZWtgodYkQ6K1thEU1idNg==
X-Received: by 2002:a17:906:12c6:: with SMTP id
 l6mr7151675ejb.373.1632431038595; 
 Thu, 23 Sep 2021 14:03:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d7sm4384507eds.42.2021.09.23.14.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:03:58 -0700 (PDT)
Message-ID: <43927995-4508-ae86-a7f8-9359e21a6bb1@mind.be>
Date: Thu, 23 Sep 2021 23:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Florian La Roche <florian.laroche@googlemail.com>, buildroot@buildroot.org
References: <20210919134047.30135-1-Florian.LaRoche@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919134047.30135-1-Florian.LaRoche@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.2
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
Cc: Florian La Roche <Florian.LaRoche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 15:40, Florian La Roche via buildroot wrote:
> Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rt-tests/rt-tests.hash | 2 +-
>   package/rt-tests/rt-tests.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
> index f56500c26e..c731feaf21 100644
> --- a/package/rt-tests/rt-tests.hash
> +++ b/package/rt-tests/rt-tests.hash
> @@ -1,4 +1,4 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
> -sha256 3740ad97b164a1cd77d9ee32bba23a4a0b2495a76468bcf40ff60b55c2a3a709  rt-tests-1.10.tar.xz
> +sha256 48346ab2b5bf2ffbdb1ed0d4540e9e8e22f6665e6bb3d59c22614f9722b13a91  rt-tests-2.2.tar.xz
>   # locally computed hash
>   sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> index 0d959bda31..a0d7f76e8e 100644
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -6,7 +6,7 @@
>   
>   RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
>   RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
> -RT_TESTS_VERSION = 1.10
> +RT_TESTS_VERSION = 2.2
>   RT_TESTS_LICENSE = GPL-2.0+
>   RT_TESTS_LICENSE_FILES = COPYING
>   
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
