Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCDC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0B281F7D;
	Tue,  2 Jul 2024 07:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJZPkSXofeC7; Tue,  2 Jul 2024 07:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABECE81FB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABECE81FB7;
	Tue,  2 Jul 2024 07:46:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2DC1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 055276078C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YWnxIhc7W_X for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8A3D60670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A3D60670
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8A3D60670
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:46:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52e7693c369so5114661e87.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906390; x=1720511190;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QpYzHNksq5enUqH+NsmkIwUTG8VmEE20GjWLhHZV7lw=;
 b=jF++fGQ6BvScrT8pkT+zRS6mQ/fOBjbDt6anWVJf3uYZsHRpwCj4h6vzA0laYHOmtf
 V2ebUvzIlNal0g3/aVvzMdbJhD9TxxZ19Xen1Fh9IG1guYUIG2ZTnuv96PMvAWEgMjfi
 /tKPhn6WHM0SMF1u014Il+TMOsvl5R2E4UDE+26BA7OwoMFpE2dnSZqw02zBGHu0FR9o
 adyC7ZFbbiy+s6v2idGenE9zNjZ/IEy0shauQRGxi1GNi0HjvD7joQFiymFsdYNJwyyN
 ylGPByzsmAEs6AnLk3fX9ycpseIayxICQgJQnd+MvgKF32jodfJ6Z0mVEY6v1UlHaSof
 pVrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOgWVRgCZitHniXetVgMtaeagVJ0QhAJ24Tub8CbzUEKxdtcxXm/EZpcjKHHXLvIhTVQJkdsZbe3/rCutJeUjhs24YV2CbuQ==
X-Gm-Message-State: AOJu0YyHrz5u5jdLEr/yZvo5nMsggGsL2SG+3kZYEMWEcPnLwuxkuYf8
 kruKYweefcPfKGx/f66wLmnGfc2Qux62d5ZzaMvhq3gYRT80VUvrKBQWJ3YTl6TYXYgGeE+fUj8
 5
X-Google-Smtp-Source: AGHT+IGkiMbshBTW+rAzoFWgzHNpeh3EjvEiXr+XxLVBm6ipV+CVqQZtsqRCX9dcAgZeC1j+AfttYA==
X-Received: by 2002:a05:6512:3b22:b0:52c:e054:4149 with SMTP id
 2adb3069b0e04-52e8266126bmr5594165e87.15.1719906390641; 
 Tue, 02 Jul 2024 00:46:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b91bsm187218945e9.20.2024.07.02.00.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:46:30 -0700 (PDT)
Message-ID: <61409c12-a7c7-46cc-a234-56c6f466b890@mind.be>
Date: Tue, 2 Jul 2024 09:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701193622.1786979-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701193622.1786979-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906390; x=1720511190; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QpYzHNksq5enUqH+NsmkIwUTG8VmEE20GjWLhHZV7lw=;
 b=gCKtUI9imtaZ8VJ9J8D8yTNH1eZcix4lSQ0UEYwVWxIVdwekxMCPvf2zrLphRr7qm/
 jSiS8iWIBL1nrIphhJkkYaLpNkizcEwEooygrpK6zoAaMYr4omVGaTxqUi2JEYxgH2Qi
 suwiKShbl2suBSGueHNsPXCMvtsoGe6cHjrdlFA4lnMK5fblJLGe4nt+dI5M6sn34qFm
 3Ud64gmZSEBML0auQDez0PEnva4vv6ZIwGlhoCDg6N2/YQkxcibOjuhYUnu+EgMKRnmW
 ZzwTXhb+x2hej4pbRzMEIvzfXJMaTdZVYvik8WFX6xbPsQ8KSodikyeuxn71I9rDvhVk
 g/tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gCKtUI9i
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.20.0
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



On 01/07/2024 21:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>   package/python-pydantic-core/python-pydantic-core.mk   | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
> index d11b3bfbb4..1703fcff3d 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  3359b437ca74c8f7e1b8ec477b1ff1e39f0fff08abb0eb171953f9bc3e8773c6  python-pydantic-core-v2.19.0-git4-cargo2.tar.gz
> +sha256  a3597bcb7a6c9aabee543ba5797ba4997eb5a91b36bc6c596be4640bccf98daf  pydantic_core-2.20.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
> index 79d06deab2..2e37c37004 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_CORE_VERSION = v2.19.0
> -PYTHON_PYDANTIC_CORE_SITE = https://github.com/pydantic/pydantic-core
> -PYTHON_PYDANTIC_CORE_SITE_METHOD = git
> +PYTHON_PYDANTIC_CORE_VERSION = 2.20.0
> +PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> +PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/7d/fa/9802d053f33dbcf110d46e3f28667b06cd764b164f1e3f4189848cdd6e78
>   PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
>   PYTHON_PYDANTIC_CORE_LICENSE = MIT
>   PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
