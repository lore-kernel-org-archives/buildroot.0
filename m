Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18171EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A926081E66;
	Sun, 25 Jun 2023 14:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A926081E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQ-YAA38J6Pz; Sun, 25 Jun 2023 14:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B348124C;
	Sun, 25 Jun 2023 14:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B348124C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA881BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 285EA8124C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285EA8124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRY-OUduCjig for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:04:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118B880DA3
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 118B880DA3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:04:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51d9124e1baso1338698a12.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687701864; x=1690293864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eeA513tk9PvLoFq5/KFeTzapyKpP2jRFSyE1yuF6eqQ=;
 b=F9YNiyNjX9vNqFgBo4LbicE5/Tabm9oS/3BBxNu70L3HdW9hBvrA7HjTDAZQoX/xqh
 cbgpk3iC37ZhFTLktxwAB2o0HY/lrH7G21wlKVQosouOaAZMrAAUgwfOTd7gY//8lMuo
 A9qvy1o18Hk7MmEqIpMkGlEMCNdSyQZBc4NUXXZMHVddJ372ZShxf1I7+Idj/nqWfIi6
 ATC7RjG4z1i7JZJvM/Y9hdKaPL9y7/f9OAMPwhpBeOEnWUzJ5XPmOed6ZX9wxWsHpj9+
 gvh0V0JudH9ASLnSzOOK0w6FFMo8d/ST7goU243WT2kSPQoF8qnUibWtUDxruaE+R03D
 YoqA==
X-Gm-Message-State: AC+VfDyFuTveMS/0IJCbsHv5HmU7pEoRdk/vITF75LDXQ7z9X4eq81PE
 EmCZQFtqSPndUJa85Kkd7dbtbw==
X-Google-Smtp-Source: ACHHUZ7lypbD+T3o3BITaUjULDh0MEw8mXVZpjMcLRlaxnvx1WG9GwHqLwmLMTX1Yb+LFGziKqxEQw==
X-Received: by 2002:a05:6402:10c4:b0:514:9e91:f54 with SMTP id
 p4-20020a05640210c400b005149e910f54mr18284101edu.26.1687701864086; 
 Sun, 25 Jun 2023 07:04:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a056402028900b0051a358a76c9sm1798150edv.72.2023.06.25.07.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 07:04:23 -0700 (PDT)
Message-ID: <c1591ea9-d3d3-70ff-5794-72dd25227656@mind.be>
Date: Sun, 25 Jun 2023 16:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230624222705.606301-1-james.hilliard1@gmail.com>
In-Reply-To: <20230624222705.606301-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687701864; x=1690293864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eeA513tk9PvLoFq5/KFeTzapyKpP2jRFSyE1yuF6eqQ=;
 b=W25jSLX+dcr4kC0qc5ZJhECk25qaUiyhL0s5w9HOHcXSGjKK6bHDt2GGxvT2Y2VYbm
 4g9E5u4rCyf1h6X6TINsYSr2ZYgaSUfH8o1RyOJj/ovMXP3uwPgG2gKLBovj3Dhux/Yv
 c07Wsfbo/+Q7gDAR6TpH40/VZGNKvLK7P9YTC9F5G8OxXEDQanvkubZ7zIGeUR0/Plti
 L+MQwAeNvVLop3B5T+h0MwDpP0uesDDOSSZ5Z6ZTOefoYmB4Az20agGa7pt+xuzK2R1I
 q9Aa9UbAseziLIogTAxKnFEshX8gRGPTNIBVO1y7V8Ro9bXcgFtt1JEm03PWBtXj7Dsc
 u9Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W25jSLX+
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-wheel: new host
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 00:27, James Hilliard wrote:
> This will be required for upcoming setuptools pep517 support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-wheel/python-wheel.hash |  5 +++++
>   package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 package/python-wheel/python-wheel.hash
>   create mode 100644 package/python-wheel/python-wheel.mk
> 
> diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
> new file mode 100644
> index 0000000000..377a85c8fd
> --- /dev/null
> +++ b/package/python-wheel/python-wheel.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/wheel/json
> +md5  ec5004c46d1905da98bb5bc1a10ddd21  wheel-0.40.0.tar.gz

  We actually don't need an md5 if there's already a sha256. But I guess it's 
the scanpypi script that generates this stuff. Would be nice to get rid of it IMHO.

  Anyway, applied to master, thanks.

  Regards,
  Arnout

> +sha256  cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873  wheel-0.40.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
> diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
> new file mode 100644
> index 0000000000..159598fd1e
> --- /dev/null
> +++ b/package/python-wheel/python-wheel.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-wheel
> +#
> +################################################################################
> +
> +PYTHON_WHEEL_VERSION = 0.40.0
> +PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
> +PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8096a9e8383e1d472aa14717878ffe07c4772e68b6e8735
> +PYTHON_WHEEL_SETUP_TYPE = flit
> +PYTHON_WHEEL_LICENSE = MIT
> +PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
