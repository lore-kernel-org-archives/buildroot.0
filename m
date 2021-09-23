Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720ECC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA326124C
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAA326124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED0183E6B;
	Thu, 23 Sep 2021 20:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QN1H-0EnPJ6A; Thu, 23 Sep 2021 20:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6AE681DB2;
	Thu, 23 Sep 2021 20:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 883741BF304
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7831640718
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hvg5e3rq9WiC for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:54:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F683406F1
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:54:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w17so20772065wrv.10
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RpwwCupsjez6npwD+BHYu3BeJXF8M+8xaE9gvkHaaW8=;
 b=UWG6AI4EZAQAuBSUdevU9dCHAGSS3+0YrH60iE/Selt5vQfXBqNrbGjG1m0esDg1tg
 7glckz46GNe+U8sJ/cJC6hxigzbFWNNAdajbWU/9eclNV/MGOTTs07cdJfHffaYuejWY
 Nqhp3SquwioAqA48xJPgixiXbQJi1sgIztG9DjnB2Eg5Jt1pJlXKVE+15kc0U0T1659a
 MrIhYLTMMDOx6ENHMZ3Icqv8LfjgfqEWtl13WoURHQzAYAi+1oJvOGN7mwIbExxy4qvp
 ZNSgAOwyGAOiMCDO7mmvyvSIuoIHmPjRqjHqc4GdM4+eb6TwKjs/rljtn482wzY/ZydB
 P/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RpwwCupsjez6npwD+BHYu3BeJXF8M+8xaE9gvkHaaW8=;
 b=q0uoQRPmaqaYvYTQbAkG96Tk5ZYXfDYGPfYL7cdX+u9KHKcGMeb5xbhOyFAZQAyh9k
 cwmSlOWJ20w3udPITroNnmMh0wi0uEjFa6pP/4UwQ+Bv4wBv7oG7UjGlg033oelnH5XQ
 zMeiPFC0OnYLllgjpteNDD2LlVAiimI+Hnaa3Ry1kzotvwYIy7cGmwoeFWUlkPopVPew
 2fMjz1ImFO/SyUfUZG5hUB/ztcYeHtXHJJd7PtPraoiRhH27WtlBQRX3Olvwjelhhkhp
 +urZR4FqGZwdptx0uWwJg2QuSfusaN5lk6OY6zsjbWaiJHvgI152Fe61RqyNzH86eRYl
 WVIA==
X-Gm-Message-State: AOAM532TDNjMjyWOIgrbc01M8A3F+EbTHJp67AdAHfNU+AgryT6eFJ8I
 7us70W9jTgnQAaBVPuMqjRdJ2O/oESo=
X-Google-Smtp-Source: ABdhPJzLuuIAnhiJdXw9W+cc/xOPQs87zzkykvqTSbX7tuD2YvbOQfBXoSMgR3pNfqi8f6BjM4XJiQ==
X-Received: by 2002:adf:d209:: with SMTP id j9mr7578620wrh.97.1632430478671;
 Thu, 23 Sep 2021 13:54:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id i9sm10787947wmi.44.2021.09.23.13.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 13:54:38 -0700 (PDT)
Message-ID: <13ab667e-7f6d-5904-895d-42f1359398a7@gmail.com>
Date: Thu, 23 Sep 2021 22:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210923183751.361386-1-asafka7@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20210923183751.361386-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: remove
 _next_gen.py on python2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Asaf,

On 23/09/2021 20:37, Asaf Kahlon wrote:
> The _next_gen.py file contains python 3.6+ API and it's not
> useable with python 2.
> In addition, this file is imported on __init__.py only after
> checking the version of python is above 3.6, so we can safely
> remove it.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5774c6237b72b6f5e005bb5b229c078235ff2741/
> 

It fixes tests.package.test_python_attrs.TestPythonPy2Attrs
https://gitlab.com/kubu93/buildroot/-/jobs/1614446939

Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-attrs/python-attrs.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
> index b99a98501c..f23cabd998 100644
> --- a/package/python-attrs/python-attrs.mk
> +++ b/package/python-attrs/python-attrs.mk
> @@ -11,4 +11,13 @@ PYTHON_ATTRS_SETUP_TYPE = setuptools
>  PYTHON_ATTRS_LICENSE = MIT
>  PYTHON_ATTRS_LICENSE_FILES = LICENSE
>  
> +# _next_gen is usable only on python 3.6+ and it's not imported
> +# on __init__.py in case lower version of python is used.
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +define PYTHON_ATTRS_REMOVE_NEXT_GEN
> +        $(RM) $(@D)/src/attr/_next_gen.py
> +endef
> +PYTHON_ATTRS_POST_PATCH_HOOKS += PYTHON_ATTRS_REMOVE_NEXT_GEN
> +endif
> +
>  $(eval $(python-package))
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
