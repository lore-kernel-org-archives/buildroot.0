Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA0EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16AEB60881;
	Sun, 18 Jun 2023 13:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16AEB60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 418TCuj73brf; Sun, 18 Jun 2023 13:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C32761249;
	Sun, 18 Jun 2023 13:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C32761249
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE1C1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54C1F81E46
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54C1F81E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xjw-GxQAl_Kb for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:18:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5432481E3E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5432481E3E
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:18:20 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-970056276acso352955466b.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094298; x=1689686298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CoshEXtSwtXqObTUyFFalhzlsxJK30kWzkGpUUNlHYE=;
 b=iztn5QKbIsoHR3K8SHuXQRei38maew0k61DWDf3jGgnQEmhKEg1L8pmNqT/N/jRR2W
 ixKMPWBxRLhuEJGn840LxsuFusRglr8qkpXhLqw97pirTTJGlJHmfsIEdL00p64ES5xi
 /jfKrWMOIvRUb0VX3OjbXB+DKOfC3Rpc4A3MZH9QMCLP6MfiYfPXH5ri0XvtNOit/1zt
 00j1vA7ZYop2i/57ocQYUtvZllbbQZ7hyQ0sCqYszPlKmZ9R3e6gE0vtTWo8HHYanKP1
 QCnth2QPzkWz0ZyNA/eF6nhH/aM/U6j58PlJRyW2IsxwkmZi3IOkRDt7Xcd2wT+3A6KI
 EV8w==
X-Gm-Message-State: AC+VfDxvFCLoCbsBzOPXLwohlkK4R7/7VVK5lfa1+1ml5Y43XbwxIADf
 soah/W5ne6b0ha3W8+eBvn89Ew==
X-Google-Smtp-Source: ACHHUZ7fSR0zUg6d3BDyREZRdBpYh8xfjhyVBCKdRuDEwXuNqqppiq6fhu4k367sPMte+CkJMc6gKw==
X-Received: by 2002:a17:907:8687:b0:973:91a5:bff1 with SMTP id
 qa7-20020a170907868700b0097391a5bff1mr6638236ejc.68.1687094298454; 
 Sun, 18 Jun 2023 06:18:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a170906961400b009829d2e892csm4996577ejx.15.2023.06.18.06.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:18:17 -0700 (PDT)
Message-ID: <ce722a7d-026e-426d-273d-510ce94c1f7a@mind.be>
Date: Sun, 18 Jun 2023 15:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605081423.2041317-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605081423.2041317-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094298; x=1689686298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CoshEXtSwtXqObTUyFFalhzlsxJK30kWzkGpUUNlHYE=;
 b=KRpQQPVhNzPi/8TVl0/iFp4GGJdlWEfv4K+HWcpOkbmo310iQkEf1pNMSuwvW19o7i
 60328qoyUsvAF/4spRDv+Zvw1O4i42VkpLlt3M7g3aAC/+FuTe7mJAlY15XcZRKShKhi
 bELt7QlZ5lVLrKSPUb3/uPj5mfraXHubkkVbltSaTOPm8i+/XEhHL7tlaBUlr5DDIfYp
 FjRoeweTfw36ASeYM/CTMHfalKCyHz/9E1m3n2r1Ho4dOeF0GffS8l5WgCI7QHEUbdHg
 Jo8oJ6q6LTjjewz6U7CRhf/O932bNTN2GgjydfTtVG8w9vkGv1zXHI9dqgXoRLYdFod/
 8jEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KRpQQPVh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to
 version 3.9.0
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



On 05/06/2023 10:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-flit-core/python-flit-core.hash | 4 ++--
>   package/python-flit-core/python-flit-core.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
> index f63a64ed1b..4d4907f5dc 100644
> --- a/package/python-flit-core/python-flit-core.hash
> +++ b/package/python-flit-core/python-flit-core.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/flit_core/json
> -md5  7c41da13273f7787709a24f74e0f5a99  flit_core-3.8.0.tar.gz
> -sha256  b305b30c99526df5e63d6022dd2310a0a941a187bd3884f4c8ef0418df6c39f3  flit_core-3.8.0.tar.gz
> +md5  3bc52f1952b9a78361114147da63c35b  flit_core-3.9.0.tar.gz
> +sha256  72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba  flit_core-3.9.0.tar.gz
>   # Locally computed
>   sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> index f96191ade6..ea887a0258 100644
> --- a/package/python-flit-core/python-flit-core.mk
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FLIT_CORE_VERSION = 3.8.0
> +PYTHON_FLIT_CORE_VERSION = 3.9.0
>   PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
> -PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/10/e5/be08751d07b30889af130cec20955c987a74380a10058e6e8856e4010afc
> +PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/c4/e6/c1ac50fe3eebb38a155155711e6e864e254ce4b6e17fe2429b4c4d5b9e80
>   PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
>   PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
>   PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
