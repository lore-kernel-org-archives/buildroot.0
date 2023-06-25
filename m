Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9AFEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE706125C;
	Sun, 25 Jun 2023 19:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE706125C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJqj9rkboKzA; Sun, 25 Jun 2023 19:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C456D6112A;
	Sun, 25 Jun 2023 19:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C456D6112A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F215A1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C60409AB
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C60409AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlCIydICYm_1 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:22:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E46E4099C
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E46E4099C
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:22:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9883123260fso238470466b.0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687720925; x=1690312925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNQ/4Dc/7TRLMkqWO9HbATo7UxO//bnGjHVC7yIuS5Y=;
 b=i8YfV76zH2eEAX2c9uLQKckWyn5ArKSCqChfJfZrZAIVwRYcJ2uFIeTpwqYlaCaSC5
 nE0bzxv9pANf+qnT2AQTOwDP4vYRJYVRfeyZhKmFeFsIsFilyqq88bh8OEohuxJ5/VAO
 6XV5i++jOvmuhdvk86RrDBDnEU6nsZr8P7g+Lg4GrmyenIBuy1E3eVl+FIrMIa12TN9R
 NrIvDB9jnMoYHVVbACaPBj82XPtbvcQ1ApLvnzl8DgZErW3qYBiIDEGck5ef7NKqe/fp
 hO6UhXkAfXvGyrSOrfxWlDBAcJETCdOV6lwmzf61vPgc07/NslBYbheWJ+tjMB3k2HQA
 EvKA==
X-Gm-Message-State: AC+VfDw9PU6ouDLIumP65zx5Eq8OoCVvU4+Z3gJ5QWRMAZT9A/nrZLpt
 F2C1YClYvLsJCxwEJrTUSdhbLg==
X-Google-Smtp-Source: ACHHUZ5aqFYPFO8UgB28RotAAcjbWtDE2uY2/CXx1iWW4c4RFfJlFaiq0mfJKgCDLwY4g/iqIJIgdw==
X-Received: by 2002:a17:906:4793:b0:96a:861:a2ac with SMTP id
 cw19-20020a170906479300b0096a0861a2acmr21928779ejc.0.1687720924744; 
 Sun, 25 Jun 2023 12:22:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gg18-20020a170906e29200b0098d2d219649sm2405781ejb.174.2023.06.25.12.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:22:04 -0700 (PDT)
Message-ID: <3615467b-1f3d-5378-932c-571e044b476b@mind.be>
Date: Sun, 25 Jun 2023 21:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622053618.3230837-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622053618.3230837-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687720925; x=1690312925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BNQ/4Dc/7TRLMkqWO9HbATo7UxO//bnGjHVC7yIuS5Y=;
 b=ZWr80LZqxtTOrWtWUlKWvqogzHtvKvknHk0k6odSUkOzuXRoFz8KMiyNvNSYmhSCAZ
 ycpjsCFOvod3YQ1PzRQUiMVQm13g6MDREO6k2+TpL6a1ZsjBmhnNUS76lq/WbayH/Z/E
 oKeiWMyGu6R2YJjm8j+nIMhyUU9pWaxldusAQ8UroMemGUBT5upp3rJVQ+XVGH18Aynj
 CfJBlsnj0H8C/jZXFGJZuP/LlXrp1I5K13F/8PCw+KczPv+59VI0kU64eCrRPrvOjlXM
 jxDOEmJAOzA7zBg7uGhVVTnz6OdwxlzD6fzf+uJ3VZAk0qOkOC+aoj+rbCPr3WuDx7f6
 6frA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZWr80LZq
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: drop
 python-async-timeout dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2023 07:36, Marcin Niestroj wrote:
> async-timeout dependency was dropped upstream for Python 3.11 (see [1]).
> 
> [1] https://github.com/Bluetooth-Devices/dbus-fast/commit/1b5c9e1cb94d19925776d91196cf1b657264c494
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-dbus-fast/Config.in | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
> index c9562fecfa..b7168106d7 100644
> --- a/package/python-dbus-fast/Config.in
> +++ b/package/python-dbus-fast/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_DBUS_FAST
>   	bool "python-dbus-fast"
>   	select BR2_PACKAGE_HOST_PYTHON_CYTHON
>   	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
> -	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
>   	help
>   	  A faster version of dbus-next, a DBus library for Python with
>   	  asyncio support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
