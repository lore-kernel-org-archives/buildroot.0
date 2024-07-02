Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC059C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81CAC811C4;
	Tue,  2 Jul 2024 07:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fqY9OUeSeki; Tue,  2 Jul 2024 07:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B67812A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B67812A0;
	Tue,  2 Jul 2024 07:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 995EA1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834F5404D7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0RJBZfigpnM for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B46A40460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B46A40460
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B46A40460
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:43:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42564316479so23790445e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906184; x=1720510984;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ad0gNeISAu77nyjvQbALldsnIJW2zniMlqydqmPPPd0=;
 b=njP2dF3cYzeYdLFe650aPwfQSbxY81IrAuyeW8Rc3r3APOheVmfyQnq1XCeDlYq2iT
 uRbEEW1x1AeNDjnm3jH1JoQC0mSFpfcaKxe1IsjDQ1cUcJyKw57/L4owqCcupoBkKNfA
 5LI+0QmBPMGODqZhMC8jMqXZTX4jw0wrWCjaGd9Xw8goyEa70BmataUQ8BviTTIE/zAk
 UaFSGcZYJ2UrDApwqckK1g5o20pnKQGKZPrjLIqaPPGXeIR4ytrmQPu6+cu81QCEUdov
 nPD/vd1XiXGBqT6CZEJH/3MRzo/APKUHP/PnBEAK4GfBwGHTxQKxHhV0HCZ4R6xWZwpZ
 /IWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1zvFykFPPDROTtnk8J4DRX4G8YD3iwawh8F7KvS8xGyqhiZppqEm34j5oAgxFVMy3Oucf+T2R3PxeAMZLUXHUF7oz1RG/w==
X-Gm-Message-State: AOJu0YxmDk4Wrfjp6IRrx2rMz2sPFadzkvnAH0nE3H6me3Md3ZTPYkRE
 1aL5TlXjoF8GjxF9xww2fkgmcq5pMUdYAAdfZHNJM8ZJetr6JQxqwmpp/MX+iiR4Px/ZI3E0DUq
 w
X-Google-Smtp-Source: AGHT+IGDWajTUgmxSAHyC2DhGLzVFsB60CLpaxXeJB/Vgas01McATZxj14/Q4tPXhCRlkF0/hHiymg==
X-Received: by 2002:a05:600c:54c4:b0:424:b3cf:d704 with SMTP id
 5b1f17b1804b1-4257a05edbdmr54243445e9.37.1719906183746; 
 Tue, 02 Jul 2024 00:43:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb92fsm12480064f8f.88.2024.07.02.00.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:43:01 -0700 (PDT)
Message-ID: <75d5e8e5-2ce5-4aac-bf2d-50d48043bb3e@mind.be>
Date: Tue, 2 Jul 2024 09:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701183003.1746036-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701183003.1746036-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906184; x=1720510984; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ad0gNeISAu77nyjvQbALldsnIJW2zniMlqydqmPPPd0=;
 b=VqxnYK+cpiFU8gTBeqMGuqVPuTZxV1RvoYrLGu8cjk8enyLY9j+dUZbajFY+RNmSTQ
 cw6Dm47LyEnly5l82owp5T5zEt/Z7TR3G4UqrhoXsT5pGaiTDKh+WB5vv73rNCKzD43W
 QCqmoXy2Y13vFJ3dH6ErWLFb6hn3DDgt2ASvlREQ4JeUszPT4VwoOX0uVLNaQxZxUEmc
 WZn93/QTfUXFDjKBsSyjgpA6Sq/VmNfAruwvpJjKDwr/Rb5fhGzQs50wq2orlVw8UZxV
 xVTtGYu3RPGxVqZMwR5bsPylC25GYQNDS1IAFBim/Hc8yjd8ryqI/2PNKWZXYNWw8pUr
 s/pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VqxnYK+c
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dateutil: bump to
 version 2.9.0
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



On 01/07/2024 20:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-dateutil/python-dateutil.hash | 4 ++--
>   package/python-dateutil/python-dateutil.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
> index a52fb30a0f..c127582376 100644
> --- a/package/python-dateutil/python-dateutil.hash
> +++ b/package/python-dateutil/python-dateutil.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
> -md5  5970010bb72452344df3d76a10281b65  python-dateutil-2.8.2.tar.gz
> -sha256  0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86  python-dateutil-2.8.2.tar.gz
> +md5  f4888298c0f2d5239c85c6457455a975  python-dateutil-2.9.0.tar.gz
> +sha256  78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709  python-dateutil-2.9.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
> diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
> index b75f510bce..a2f1620b9f 100644
> --- a/package/python-dateutil/python-dateutil.mk
> +++ b/package/python-dateutil/python-dateutil.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_DATEUTIL_VERSION = 2.8.2
> -PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9
> +PYTHON_DATEUTIL_VERSION = 2.9.0
> +PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/d9/77/bd458a2e387e98f71de86dcc2ca2cab64489736004c80bc12b70da8b5488
>   PYTHON_DATEUTIL_SETUP_TYPE = setuptools
>   PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
>   PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
