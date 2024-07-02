Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781CAC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4063A81F7D;
	Tue,  2 Jul 2024 07:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiql-pMFDoFQ; Tue,  2 Jul 2024 07:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD1881F93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD1881F93;
	Tue,  2 Jul 2024 07:46:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C16AD1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE94C40460
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLitZVQuDGIq for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E9F8404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9F8404D7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E9F8404D7
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:46:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3672aec418cso2020278f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906379; x=1720511179;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fPTGwrn3NSDWuxrKuz/48UwfHR34cR1R9BjGRq9TLiw=;
 b=tNVqy4aF+BQCadkaqlCOE3Cd/qO5GQ2PdmD3q0Ra3RN/9KpMyHFj12RpKUzE02zHDN
 g/Ckm8arw15Zi45hO5BdYCCTkoam4rB984f8xcM8sfUut07pYqaqXa2ZNd8E8XXRn7aU
 kKzySX8nPU736NX3Gv2du5w9HBdVbFpGpCni+X3s15iPJf4ghyrlkqGealSS2E4fsL7l
 VCgytUliLH0NTw3y1MeWFAnBPG/CG/9VWVVYULkis9BScL1fIVPPu4tcO/IdRql7WACx
 JML01QwIR8eotI0n1mYos3RdUZs5VRkF+8sNYgKYGEHS4dfcd8Lpr8QGE4HTqzWtHvgs
 hd/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4vPWhXweskvCT00qOGquj5urPv+bgDIjx3Vzz0c+LGqEWFg9O3f3q7dpDtEXq2jKNhPTVWWIXdZPJ2XSqIAKj8azq8cXWAA==
X-Gm-Message-State: AOJu0YzyUCGrwoAuMFIoWG+ZqwB8c4Id0bnxZ5i57i5T6WnFRVOVj7zI
 iM+cgDQteotB0W7Frw7qJuDyduCfnbx+uGFQvqZZcVAGUV1LgscHAcMGxT47wfg=
X-Google-Smtp-Source: AGHT+IGyhTWVmUH+ezZ2oQwNU5EMuTme+79f1AOi0jlQpGiTndV/wevPP6fgZycXR7sNyqGKJBeEaQ==
X-Received: by 2002:adf:e261:0:b0:367:33b1:e82b with SMTP id
 ffacd0b85a97d-36775728540mr4365285f8f.68.1719906379434; 
 Tue, 02 Jul 2024 00:46:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd6a6sm12549360f8f.24.2024.07.02.00.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:46:19 -0700 (PDT)
Message-ID: <55e2cef2-8ff4-467c-bd7d-c4a0d14698be@mind.be>
Date: Tue, 2 Jul 2024 09:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701192614.1771654-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701192614.1771654-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906379; x=1720511179; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fPTGwrn3NSDWuxrKuz/48UwfHR34cR1R9BjGRq9TLiw=;
 b=heBToE+fGREB+WwXE9YwkWB0BWbFtRauqaWzrFfC0bjRT0BPkPUx0YOBM+HNh35K8f
 lueuPoWuOAl6JTl7ZvBz4jVhShGxx4t2EtJFiyTraHBG92OFEhUoQ8i8ZAoheZiaS/k4
 Qxz6Dz8eiJWtSaldv90o2HTOhq3X2t9GZTZNgUhRq9kiWzc6Krfpnj93Qv0yvZe/vGHb
 MxZ+FlQwM+jWzocDiXAFEz2FEbzexV1b73hHDDlhBb+F/ZOnI6dSh/NjZ5Lj5I3ig5n9
 UxFHxUDW/6aGPNoR+ahJ6qxilgHiuGcfXZtTQCEGVIWv8lF6k7uW+vtQ/poDdQm2Znrm
 Evtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=heBToE+f
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycparser: bump to
 version 2.22
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



On 01/07/2024 21:26, James Hilliard wrote:
> License hash changed due to date update:
> https://github.com/eliben/pycparser/commit/0f6ef1efeee8c5fd5a7d1cde9117edeba2a08b82
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pycparser/python-pycparser.hash | 6 +++---
>   package/python-pycparser/python-pycparser.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
> index 34401a319a..3ec1862b75 100644
> --- a/package/python-pycparser/python-pycparser.hash
> +++ b/package/python-pycparser/python-pycparser.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pycparser/json
> -md5  48f7d743bf018f7bb2ffc5fb976d1492  pycparser-2.21.tar.gz
> -sha256  e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206  pycparser-2.21.tar.gz
> +md5  8922b0b1b53b419e3a38fba4aa43a348  pycparser-2.22.tar.gz
> +sha256  491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6  pycparser-2.22.tar.gz
>   # Locally computed sha256 checksums
> -sha256  3e7df25b8dfb658c9a91501930d4d943b05087a8347c7e2b4325616af535047b  LICENSE
> +sha256  0c846399369ea76ddd7b5c44fe6d16497415fcf015f5cbb508c24bf98b81c5b1  LICENSE
> diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
> index 1737c99a32..6d01844fb3 100644
> --- a/package/python-pycparser/python-pycparser.mk
> +++ b/package/python-pycparser/python-pycparser.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYCPARSER_VERSION = 2.21
> +PYTHON_PYCPARSER_VERSION = 2.22
>   PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
> -PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
> +PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c
>   PYTHON_PYCPARSER_SETUP_TYPE = setuptools
>   PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
>   PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
