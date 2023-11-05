Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC15C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86519418D3;
	Sun,  5 Nov 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86519418D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzQvX_KcoUNZ; Sun,  5 Nov 2023 20:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C566418C0;
	Sun,  5 Nov 2023 20:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C566418C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE8D51BF21A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE89B40A71
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE89B40A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7rt0GWEvk_w for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:59:32 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DE9740A68
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DE9740A68
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9d10f94f70bso550162266b.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699217970; x=1699822770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+HA/Vq/j19d+I2VlSWlyGkht7oMfnZZxx+2+mOtF5cg=;
 b=Je+O63IghgNzrdi50dEGpRCP6hv3pUz1B47V5sd8TAT4+A8IU0r2evZ8OD+6vaZuQA
 eKN02Mf2L+rb0MSLJbjFnIkDRlEk9bY5w2UpCxunQK+TWFldx75wM4Phdd1AEcJd4NTy
 34VArpIuIj3KtaXlAdxB/7P30nEVY76PAQuA+m7sFWvEyf8s/1oucb3w/iGCtlm/SF11
 Kd37QdgiGAx3f4nGFuX83x2foLffD41W83YQscWwJM7UjjidkPO3w+sVvKTSGTMrgo5f
 tgYWFfuV/ycrslMAtN1mzngHM29PcVKfA7VjK2MA5/qY0c90hWhBtynJgKZZDQ20/V5a
 2H2g==
X-Gm-Message-State: AOJu0YxN3aqsmCoPhGUuaQ79twsGGDGPnoaG4koklal8sdZXigUBwgJD
 wPl4lkKFsjzthZ8A6xMeCxE35w==
X-Google-Smtp-Source: AGHT+IECwsQ/jPPi9dq1BrVU03hrg8vKNX/d88db1Jwy0yoev02QeeIrivhMYJ2KR2RJq5QuSArKPA==
X-Received: by 2002:a17:906:c107:b0:9bf:b022:dc7 with SMTP id
 do7-20020a170906c10700b009bfb0220dc7mr11160240ejc.48.1699217970188; 
 Sun, 05 Nov 2023 12:59:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170906378400b009c764341f74sm3373090ejc.71.2023.11.05.12.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 12:59:29 -0800 (PST)
Message-ID: <1bd07169-cd46-4a6b-8dab-5083208f32ff@mind.be>
Date: Sun, 5 Nov 2023 21:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104231506.2669884-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104231506.2669884-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699217970; x=1699822770; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+HA/Vq/j19d+I2VlSWlyGkht7oMfnZZxx+2+mOtF5cg=;
 b=VEpEs2HBiDAqu4YmwwVVMW/C+aPQwK0Uhxg4lz1cRpKqfKV8MHEDJ2hEBjeCVcTDWt
 3e+RmpgeoB927RXFp+9h/9Y2RQMMJj0YLoGWh16h3i/KBxEoWfY42MtIlF6l03foySgA
 bSH6VK0S8GaRt+BbRr8sRdjQkjtjKFTgCQAa2I2E6SxUD1up4rKW1T8rcQ/NLzSjf9za
 9qZz2v+f7w8Qr9Jmpm8D0+GVbJaUs/U792sf36d4dux/SpqNxzq/tJkV3j65CW+U9kCN
 8HJwatBJy055RIthUWceH5qe3dzvsXqb9ROYfR0XNk0SOhKJkWJc8o451cTNwguqS8bS
 7ERQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VEpEs2HB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.7
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



On 05/11/2023 00:15, James Hilliard wrote:
> License file moved:
> https://github.com/chrysn/aiocoap/commit/8f2e96d76bcf1f6f8d7b8065b5c5865afa50d20f
> https://github.com/chrysn/aiocoap/commit/065945fb7f34db33f641199aceb527527c1a3431
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-aiocoap/python-aiocoap.hash | 6 +++---
>   package/python-aiocoap/python-aiocoap.mk   | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
> index ab50ff0958..c9d73cda26 100644
> --- a/package/python-aiocoap/python-aiocoap.hash
> +++ b/package/python-aiocoap/python-aiocoap.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiocoap/json
> -md5  03ca0411b7401bfd6e9bdaefe09bd88a  aiocoap-0.4.5.tar.gz
> -sha256  906c927822185c8acf04fdcc1dd98fd845f31dabf5d5e395c39137dcbd6ba1e3  aiocoap-0.4.5.tar.gz
> +md5  baebbc38bc8db31472c438521f7121e3  aiocoap-0.4.7.tar.gz
> +sha256  90f3bcaffd454f5421d3ad55ddbe3fe10a686d4b9f3c4445d427b130493a96a4  aiocoap-0.4.7.tar.gz
>   # Locally computed sha256 checksums
> -sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
> +sha256  0ad39132b3529369998eb7493b950dc7452b07ba9d8cca7619766b6c6d8270fa  doc/LICENSE.rst
> diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
> index 92f47b7a4f..73a0d61eba 100644
> --- a/package/python-aiocoap/python-aiocoap.mk
> +++ b/package/python-aiocoap/python-aiocoap.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOCOAP_VERSION = 0.4.5
> +PYTHON_AIOCOAP_VERSION = 0.4.7
>   PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
> -PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/65/63/9051af6a2fc498f50b71f23bdbde0cc1d1f0a69eb767776dbf6d1411e240
> +PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/de/14/843232b56c0f09b2ceddae3da37598d9109c4b1d9383b1ab72232018e9e8
>   PYTHON_AIOCOAP_SETUP_TYPE = setuptools
>   PYTHON_AIOCOAP_LICENSE = MIT
> -PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
> +PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst

  That file just contains:

.. include:: ../LICENSES/MIT.txt

so we should instead use LICENSES/MIT.txt as the license file. Unfortunately, 
that file doesn't seem to exist. Can you check with upstream?

  Regards,
  Arnout

>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
