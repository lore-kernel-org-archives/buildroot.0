Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4ECC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F1A840924;
	Tue,  4 Jan 2022 17:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qU4wpbaSVpq5; Tue,  4 Jan 2022 17:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A20E040966;
	Tue,  4 Jan 2022 17:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 785091BF27A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 652C2818A1
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZmazY6KbuW0 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:59:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EB10818D0
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:59:38 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id n30so39414252eda.13
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=47a7tFurSgVMHZZPgolBOr0kpLwqNiywKaeSQqpbEHY=;
 b=XT+LemHa8K/O4V0faOjpIeFTjUAMCuUyov9fD4Czvv9vUvDiuhMdT9n8mD85vV5YWa
 LaWEIE/yhAxuwIIpCPJyhmAmGdKnYW73yPTnq8SSPvXkIO5MG/+PVG1IKFjEWX1EWetn
 /UQJifR7bGSFWvYkz2SS7J8H0rjNPBQw3bBAkX+01rwkp8pRAuCaE2nYpPFVdvFh1Iku
 cDoh9xol+uowX2toitLjX6llPi46v7Ikjl8LFw0bJuoJZzb00xb1azFBp8/WFZgV/SEG
 S9iK/OiZsEoBs/2jGUwFVOIkX5EFvV+iS15sFweU0t3c6YguZfBRhMvmBA8t3QwKtkGI
 mqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=47a7tFurSgVMHZZPgolBOr0kpLwqNiywKaeSQqpbEHY=;
 b=tFIQE6EByD9pq95FRARIdWzL2TP3Ob/g1qb8VkEjisBcf/aIN4tjykE8OMeULHmOpS
 8X377nWYR1uiOErobwAkisZwlWqxBkB/AI5R3cIFOn6/XGsWl5D3z7W9Vgoxmq34u+Sg
 FAse2KIvJzJf54Znahl7bBIJoWSMxp2BaWLtK7REz8LmpUsCQ31sz8c/KmfUdwcX0Uz/
 zomjWLxzU/gr5XCtoxih/SAr5cGJRNIhXTjeu3bT7RYMdZgOtfErivMqdaRUhJ2xZT8u
 7YWQRPEnyejbZ/rED4oiafYKkw6YVKteMlp24BJE4fIP7dhP6wfYV17JAbrpdp4osSVj
 ralg==
X-Gm-Message-State: AOAM531peaNlgvM9xiBTJ59YpNIbJBu9PIVJecybSfdWLCZ1BNoHE/e5
 4N4ePNjo8ORcFaqer5lmwUxmdQ==
X-Google-Smtp-Source: ABdhPJw+GpeXeqY9RD3pKkzGI4q98Y9qWylO541sd6hcul/3W3JkRrdmUx1MQjQ+HkB1H1tRNCrpYg==
X-Received: by 2002:a17:907:1c1f:: with SMTP id
 nc31mr38963784ejc.712.1641319176801; 
 Tue, 04 Jan 2022 09:59:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 10sm2200093ejy.174.2022.01.04.09.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:59:36 -0800 (PST)
Message-ID: <f9c18fad-195f-78dd-d9ed-88b8524de515@mind.be>
Date: Tue, 4 Jan 2022 18:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220102174329.2823931-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102174329.2823931-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: set PYTHON_EXECUTABLE
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 18:43, Fabrice Fontaine wrote:
> Set PYTHON_EXECUTABLE to avoid the following build failure when
> BR2_PACKAGE_PYTHON is enabled but libiio finds python3 without
> setuptools on host:
> 
> -- Found Python: /usr/bin/python3.5 (found version "3.5.3") found components: Interpreter
> -- new
> -- Python_EXECUTABLE /usr/bin/python3.5
> 
> [...]
> 
> Traceback (most recent call last):
>    File "/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.23/bindings/python/setup.py", line 15, in <module>
>      from setuptools import setup
> ImportError: No module named 'setuptools'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d80e56e4ad84c8e7f244cf6d1cb96c116e8eb734
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libiio/libiio.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index f706298c22..38b2f83e6e 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -76,8 +76,10 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
>   ifeq ($(BR2_PACKAGE_PYTHON),y)
>   LIBIIO_DEPENDENCIES += host-python-setuptools python
> +LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python
>   else ifeq ($(BR2_PACKAGE_PYTHON3),y)
>   LIBIIO_DEPENDENCIES += host-python3-setuptools python3
> +LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
>   endif
>   LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
>   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
