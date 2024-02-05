Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18241C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65C760F83;
	Mon,  5 Feb 2024 13:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C65C760F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esFqv96qLutp; Mon,  5 Feb 2024 13:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037A160F2B;
	Mon,  5 Feb 2024 13:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 037A160F2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6778E1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D2F582664
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D2F582664
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRomINISRltv for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:22:36 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D21C8258A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D21C8258A
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fd55c7f93so13166875e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139354; x=1707744154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UCoy8Tp9QbYjEBdmuH39H1BGPmxR2cwYjQcxiQHDfUM=;
 b=CglyOs8q5OIMN0xcy0DjfY5mol9C/9j4ePfJOGPR2LB2i+e3KtCzJLKpgilRyJvb5W
 neJP3dxsaZ5ww50LdPvc6FWBVMX8oKEQSpMSmlYGbzI40CvMk3xzHZGvdBGPMr6dCyXe
 IIdAWFno8DMiHeMv2sEmaTwejCePRP4NmStW54K41VlARfKPHCz8JOyXBHkGZTyYTaFh
 k4WhJMFhi9P5vBsMdzdOa1nj64F6zNXreudeoXL1dEMt8JKT/GzH6stCUWVSeYISyHBl
 TR+LkmUmtISMhdyRyjcfNveyPBhc9QtoJMtDL4PFwfKdqrc3Se5tVroJiMbe79k49rQs
 OXgA==
X-Gm-Message-State: AOJu0YwktvMX+5FqevKPyFXUCAgcTnMfy0rd78QSt3UubE12btrsqLIl
 bMgfhDpUoTMf98ECe3jX40kUFEba5ZPC+S10VXye0z6RrURQbhIQZlzrZDxKdhq3RopsAUj1Nv8
 3
X-Google-Smtp-Source: AGHT+IE0jQl2+wP+oWqQMf/q3TBwk9FnRkCfd1OpbLB8F92SrBGNFb+O7jxW+Q5qD/dpHuGODT3KNg==
X-Received: by 2002:a05:600c:350f:b0:40f:d42a:9d00 with SMTP id
 h15-20020a05600c350f00b0040fd42a9d00mr4052267wmq.1.1707139353754; 
 Mon, 05 Feb 2024 05:22:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXynP7twcFsgmfj6GvcxqLeWBj4U/Dgbsk8S9oPUzJ7xzBoFzMgKi675StodYeCOgSjSD80R78zYuzSbRvrJgCcfinnFrux+A==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:22:33 -0800 (PST)
Message-ID: <7c162b4a-2bf2-4503-ab96-4d28d3cebc01@mind.be>
Date: Mon, 5 Feb 2024 14:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240107210846.3319912-1-james.hilliard1@gmail.com>
In-Reply-To: <20240107210846.3319912-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139354; x=1707744154; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UCoy8Tp9QbYjEBdmuH39H1BGPmxR2cwYjQcxiQHDfUM=;
 b=e33C60Y/gtjlxfeGI6cMnHyUllgOEqKuFA45KGQ6QVU6t8h4ZS7hlFlZ3aCGItrMq/
 aOLyMYeQeKHhVwEh/Kk7kqq74T5VpCSxjwzepITJ+nSwbLblaP/LpQ8QLCKdvOjFA4tQ
 hyEatM5UMqC/+uEjHnSPiP7NF4V1vdUm0UjBH7icrxo5G4sHo92beVEi/JHCPjFEm4Hj
 9/2e37vHAkzdwUdw5WPXJiEeHDRrxdRlLCFAJqQeVqYBFvXwIN4LW+3h2nHpzB0talRB
 1/H5VWu1V/z+P0oeRhxrCXXgerb41MpUZurrkO0K814UB3ZqvUBSshLceoDA88ZX5lVJ
 sKKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e33C60Y/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-security: bump
 to version 0.5.0
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



On 07/01/2024 22:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiohttp-security/python-aiohttp-security.hash | 4 ++--
>   package/python-aiohttp-security/python-aiohttp-security.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiohttp-security/python-aiohttp-security.hash b/package/python-aiohttp-security/python-aiohttp-security.hash
> index 2c23df14d6..6a76070298 100644
> --- a/package/python-aiohttp-security/python-aiohttp-security.hash
> +++ b/package/python-aiohttp-security/python-aiohttp-security.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiohttp-security/json
> -md5  1624f982d7a779e6ed396ef2ed20acc7  aiohttp-security-0.4.0.tar.gz
> -sha256  40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405  aiohttp-security-0.4.0.tar.gz
> +md5  b34fb62c6f4dd130f3c94f74c3bdc150  aiohttp-security-0.5.0.tar.gz
> +sha256  50cb724d310e1d0289798bb98ae852c3b75b77e8f51ce5159c57b7261d0638bd  aiohttp-security-0.5.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a1cc8ff7210897d55d2552fa0792340f8e59720e0160b6918699d40f9a782b1c  LICENSE
> diff --git a/package/python-aiohttp-security/python-aiohttp-security.mk b/package/python-aiohttp-security/python-aiohttp-security.mk
> index 9ab3b16b30..274f60423f 100644
> --- a/package/python-aiohttp-security/python-aiohttp-security.mk
> +++ b/package/python-aiohttp-security/python-aiohttp-security.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOHTTP_SECURITY_VERSION = 0.4.0
> +PYTHON_AIOHTTP_SECURITY_VERSION = 0.5.0
>   PYTHON_AIOHTTP_SECURITY_SOURCE = aiohttp-security-$(PYTHON_AIOHTTP_SECURITY_VERSION).tar.gz
> -PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/36/01/d85be376b7c1773b3cb7849cd56dc7d38165664df7de2d3e20af507ef5bb
> +PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/31/49/56c131fe3dead875ab5907b154dac7fb6ee727662de80b7da0ff045030d4
>   PYTHON_AIOHTTP_SECURITY_SETUP_TYPE = setuptools
>   PYTHON_AIOHTTP_SECURITY_LICENSE = Apache-2.0
>   PYTHON_AIOHTTP_SECURITY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
