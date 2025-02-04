Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F1C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 10:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 531C440279;
	Tue,  4 Feb 2025 10:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4zgeWjoeLW4; Tue,  4 Feb 2025 10:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DDD2402A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DDD2402A1;
	Tue,  4 Feb 2025 10:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B11712A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F94A60742
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UpNvI-d3lWJ for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 10:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAEEC6071C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEEC6071C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAEEC6071C
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:47:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436202dd730so38318155e9.2
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 02:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738666049; x=1739270849;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=df9BeikXmYRPTV+/0FOgiYXiPufal+nHqOgCHYF252A=;
 b=cF/cXYp+lKVsCbRd7aFzH8fy3cX2oezi0H5kIn4KA6nBzjWRqdHHZdFHQ6GrFIhfCI
 9NHfZaepKCjJOCIeBslqd6neOPNtESC7fgG2OqaEnoqYnl5EIXgMfFJ6idBvYNkxnZxb
 rZ05UHgqzMqCJMmMgIqQEIxdsELeJ2+xLVTNcLJz/1dqYn/TuDZUpGWjCznlwJupOJaM
 ZW2fVkC+M6oP6BDSbEIMI7PvtTpUeVyyiIC67u/xzo4AX/0pftNlTfvkNrnc7bBDtyv2
 /IGr+XkqOJSl70+4rc3U5uXicIRUdwpIbM7grGJcGmyqf0FTu11c6YREUKRdo4WxlpZO
 y5oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9W5BvgUiKpXMXe7HpSlaz7er1XlK5McXyR7QGC5YkNXWZJkwFTHLlwFaMRGmgkvMO1/AkEBSUlkA=@buildroot.org
X-Gm-Message-State: AOJu0Yxtq/Yzl2duV1YAtVE61ZyuQ7re9lmpsoeB0eX5+8+HuJ4vRZw8
 nKsJp9EnJB1GzKm8aWrq2w2TyoywlbI8VnaGSYQyE+PNVks9BUpQx8tgs6YCv8w=
X-Gm-Gg: ASbGncukjbng1LUNHFI0WmAEjfM2QDk8gClan9+yRhspV9HFU12E/KpahnLFebJ/mIJ
 uqpBx1Iev4rsvdTbMCyawHQvBz6WwV5I/Qd0IJmyWf4TcUxXuCtna6L/4IWxAQSGBj/9tdg3bQd
 7NIDayOjuEZis57sU3plxLuquWDkdglgUsV3wUAtchfmc7hZiFz45FfUEwqZTPNckJYB0jGKhvj
 kQNFokPeNxJntTQoonQUn/Zvr/HL6hUhPMklbuvWaSKA62TdaBMWvyY03spHHCOFriJLbuYbwoG
 izE/3dAsYzCe1F50rnS617CdUHz4CYwhabB/WKdPs/gruBM=
X-Google-Smtp-Source: AGHT+IH8BOOGJCfVbY21Bg6tmmkfCNvwcgtPLHFSPWEkuAeNvsbd2s/A3X90UIYRpJmfxIy0hQ6fTA==
X-Received: by 2002:a05:6000:1fa4:b0:385:dc45:ea26 with SMTP id
 ffacd0b85a97d-38c5195e85cmr19352784f8f.12.1738666047753; 
 Tue, 04 Feb 2025 02:47:27 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57ccsm15495754f8f.79.2025.02.04.02.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 02:47:27 -0800 (PST)
Message-ID: <571a50c4-2f1e-4a26-8887-37a4fdc8f2aa@mind.be>
Date: Tue, 4 Feb 2025 11:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250128171338.2444939-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250128171338.2444939-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738666049; x=1739270849; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=df9BeikXmYRPTV+/0FOgiYXiPufal+nHqOgCHYF252A=;
 b=e504qaF26LMBLQbYwIzY/4MkRdGPhOLb1gPdKhbqfhRbRkVfc91BeljGyUu7qK+uu7
 ZzNWRD4hsnnvAw5nLXnh8jilPj+oyiyQONdfiWu0b93ekntOUV+qJdfbGvKPVb4BZxoJ
 KtSniRLSDYl1UralhO/pudmz+9HSGeNSN6ZxjbITKKy+U51rThS+ZkDd6rXxHVawoY/T
 wVVIvW4vNzffySJA1XfQYcIMvFuMvfTjmROCSr6gIqwmNLRBkkNYhQtjK0hTAs3MEXTZ
 iqoLCraOcJ/dmw2ILDWFVxQ1RvG94XzXSP1xZq5t5jGLwf9D0jeaF/f3kF85FebjsvvU
 vplg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e504qaF2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 25.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/01/2025 18:13, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pip/python-pip.hash | 4 ++--
>   package/python-pip/python-pip.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
> index 9ecdcbace4..f6b11ee26a 100644
> --- a/package/python-pip/python-pip.hash
> +++ b/package/python-pip/python-pip.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pip/json
> -md5  ddc01fbcc66b449a9c8dc78d9c13e4df  pip-24.3.1.tar.gz
> -sha256  ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99  pip-24.3.1.tar.gz
> +md5  c698f55e2015dc7dbb5b77c6df1cc88a  pip-25.0.tar.gz
> +sha256  8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b  pip-25.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index 7fe70c9bc1..9ffc0b66ea 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PIP_VERSION = 24.3.1
> +PYTHON_PIP_VERSION = 25.0
>   PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> -PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/f4/b1/b422acd212ad7eedddaf7981eee6e5de085154ff726459cf2da7c5a184c1
> +PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af
>   PYTHON_PIP_SETUP_TYPE = setuptools
>   PYTHON_PIP_LICENSE = MIT
>   PYTHON_PIP_LICENSE_FILES = LICENSE.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
