Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF6C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BCB81F7E;
	Tue,  2 Jul 2024 06:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VK9r0bxRP8u; Tue,  2 Jul 2024 06:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AAB881F89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAB881F89;
	Tue,  2 Jul 2024 06:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46C5E1BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40886413E0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzzcyNBemQGS for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07AEA400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07AEA400C6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07AEA400C6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:56:36 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec6635aa43so38118921fa.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903395; x=1720508195;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dW7rVkDahEnTuKCnI1HQ7ts29j8EfuO6jZBjzDiPQ/8=;
 b=RfQ9JvMoRM4dBhA+seBQ3FwEQwSvzW5ivhAIeS1fo/jAcRDub4uFdjAMZLMjVTWwxr
 MfRlHGprgXMAGeGunnBUJpJJ/1iu6a1eW2bKKFQdjv3r3Nm4+COIiSkXjsVu2qhKlrB3
 OwjxIYEsV/AxSRfWCaqvSX9jfnatU319JsTCbXtUPBpRfwfSjB+tO9aflDfJkr8vO7YD
 BNhHT983qWZ9RY3/jU2G91Pzc/e4rt9Hi/pTBXhWeACj/Fi3oL13u6Ljys7tugwABXVW
 dg5XqUouCuNh044KWuHDL7Lvxrh6rjwQPjiyrMonSw9x79mKEqsaTP+HLdpn04uxYjoy
 k5dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU37cRB5Nsbod1DtRYuGN9Dx+2Rlyjhs7stSXGPRpLKNtFxgue/WbY7omn/TMVe4H+DJSxcUbOvG16fYbGAkOCuYkC1EqO3ng==
X-Gm-Message-State: AOJu0YyRtu0918E1I+GLhxlAVcTayuuMqcEPrb12kARQAtaMHn0UUgR5
 PEnUz62KZWK79AQXMdKJz8FqZy3/NVl4NJFPAx4ayuEvSVusbaDlEmJ2qx7LXbY=
X-Google-Smtp-Source: AGHT+IEvh71pt78kSCpE0K/ztS8Za4Sx8P6A06YskeWJOnoWPvP3uXOfDKN8ReRHdCBx+Z47lBmbcw==
X-Received: by 2002:a2e:a9a4:0:b0:2ec:3fb8:6a91 with SMTP id
 38308e7fff4ca-2ee5e39e5edmr57033061fa.19.1719903394913; 
 Mon, 01 Jul 2024 23:56:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba67sm183528085e9.19.2024.07.01.23.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:56:34 -0700 (PDT)
Message-ID: <19addf8f-5093-4590-a146-9c56eb1fc650@mind.be>
Date: Tue, 2 Jul 2024 08:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701180746.1734676-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701180746.1734676-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903395; x=1720508195; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dW7rVkDahEnTuKCnI1HQ7ts29j8EfuO6jZBjzDiPQ/8=;
 b=hJuzFW15J+dfbOfre0JnPya7JDwpnn07PodvPkXZ1jY6lohKpFlbKfpFR3p/D7+8R4
 MWXjW1XoUSTRTAWxzOclAp4faEeQjzOD57znNQGh/dvozzOGBlmJm7rnyYbuVHRQc1TK
 aVahenGWhRvsUvpIid+Gr8Yje78oEd+u4dy+gJATfOjFV28a9eEv5kejYvsaY0DsA9ij
 i1QPTypuOZLMEpw8AQ9eDTropxTQO5RtuXADMX2iGVaJU+c9AHRbWQIiPJibvc697mC5
 qaaV0wKHuwbg/mgKsat9Ds7H0X+DT17E0M47T1Ip8Yal2OXoy067E+LuCfFKoYdivIHy
 Fnpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hJuzFW15
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to
 version 24.1.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiofiles/python-aiofiles.hash | 4 ++--
>   package/python-aiofiles/python-aiofiles.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
> index 3dc9281de7..f68b0b55b5 100644
> --- a/package/python-aiofiles/python-aiofiles.hash
> +++ b/package/python-aiofiles/python-aiofiles.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiofiles/json
> -md5  ab5dfab3180f56a21b46e1e90b16c6e6  aiofiles-23.2.1.tar.gz
> -sha256  84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a  aiofiles-23.2.1.tar.gz
> +md5  530273426ff7ee50283e52186e185c81  aiofiles-24.1.0.tar.gz
> +sha256  22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c  aiofiles-24.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
> index 954647bf76..9eae73d3c1 100644
> --- a/package/python-aiofiles/python-aiofiles.mk
> +++ b/package/python-aiofiles/python-aiofiles.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOFILES_VERSION = 23.2.1
> +PYTHON_AIOFILES_VERSION = 24.1.0
>   PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
> -PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
> +PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237
>   PYTHON_AIOFILES_SETUP_TYPE = pep517
>   PYTHON_AIOFILES_LICENSE = Apache-2.0
>   PYTHON_AIOFILES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
