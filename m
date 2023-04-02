Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C7FC76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 20:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B7460B0F;
	Sun,  2 Apr 2023 20:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B7460B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bh3baX97nufR; Sun,  2 Apr 2023 20:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F10160B10;
	Sun,  2 Apr 2023 20:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F10160B10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5368B1BF36C
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381EF410D6
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 381EF410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Brd7yYt2kdg for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 20:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB1E40988
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DB1E40988
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 20:44:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i9so27343342wrp.3
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 13:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680468256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fZThSRtm6qiippUfaLSMXD1zoQTH3VgFQFAi+zV04H8=;
 b=5tvS2ny/o4b/hRKh+6H8K/RU85O8SFHxsinwlNObp3IKKqn0DDl6V96brtzd6EN5PA
 DwqQMPda/h0HWAe3SRDogfsmeIKJDpeo0JPef/+Cw8UssDHDNpFp6ZSoqCI2Uqfxfmzk
 tU8LCviqJIpyLb2XN2VgZAA091JQMGI1TzYF9W/2EEnTqCcVlE9rtzxoTe5tjYHU/+AX
 /3JC76D6kpLPYJZFLwJYJqoEgKJq4yksO1/WgTOqgr2XQI733jDtj+LfS8HSFcd3mHHi
 caBAyjJixTQfadEQDkiXPMuckNZw7Ko+G8F7W3U+7BVOoLzuRdCY21D1i/Y1s0u6FVsK
 ubIQ==
X-Gm-Message-State: AAQBX9fI4kYDoq2YRsOwLCYFblqj1UcJ7IILEODdAVuKouCIdpdxbeYy
 uenZyLsveSciL18HIOeoL9NP1A==
X-Google-Smtp-Source: AKy350bVQovSVe9atNiKcSe2KLmfdIBNkEMF3J6iSpaRa3IN66/PoEFT4jkDcdx6CrSwqztyBTQ8+A==
X-Received: by 2002:a5d:58f0:0:b0:2e3:99d3:7a5 with SMTP id
 f16-20020a5d58f0000000b002e399d307a5mr12535186wrd.24.1680468256201; 
 Sun, 02 Apr 2023 13:44:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a056000010b00b002de9a0b0a20sm7965576wrx.113.2023.04.02.13.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 13:44:15 -0700 (PDT)
Message-ID: <ee49904f-0e7e-000c-851f-740257c43be9@mind.be>
Date: Sun, 2 Apr 2023 22:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230206120400.3188421-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230206120400.3188421-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680468256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fZThSRtm6qiippUfaLSMXD1zoQTH3VgFQFAi+zV04H8=;
 b=d8DRpdSJ/k8ZJvtzwssogj4Gdu/NQ0hD0rNVBwmD7DzZv9ZQWgw4frq5rh+xk8y9xg
 awdFX2Dgxt8orvafWWvJQlQVQdwkV3V8cTDPIEaK4orlRHpESx00qsJy/dUGTq4mKNl/
 zZC3Uv1eo0VNJdtfC997kCkeRnf6rwcdDxA7V4p2dLzkV/izyp1/O7QKGsavn2Vm7Bph
 L0a5zTZBIDnJOINIjFvK4c19l7qR0YLnUxcY183knVHZcMADMmtnh7ZPakD2Sid4RZqv
 njVASD3zcAfOd7DIOXMt7nIiKO2YLwmCmLTQjygJz+eKBqubvAdGD9GpqoQAqBu0qwC4
 EQJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d8DRpdSJ
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pyproject-hooks: new
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2023 13:03, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   .../python-pyproject-hooks.hash                    |  5 +++++
>   .../python-pyproject-hooks.mk                      | 14 ++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 package/python-pyproject-hooks/python-pyproject-hooks.hash
>   create mode 100644 package/python-pyproject-hooks/python-pyproject-hooks.mk

  I also added you to DEVELOPERS for this package.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
> new file mode 100644
> index 0000000000..9fdcd33596
> --- /dev/null
> +++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pyproject_hooks/json
> +md5  69b0b6de189bc04c3f9e304281765741  pyproject_hooks-1.0.0.tar.gz
> +sha256  f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5  pyproject_hooks-1.0.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
> diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
> new file mode 100644
> index 0000000000..a42dbb0ab1
> --- /dev/null
> +++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pyproject-hooks
> +#
> +################################################################################
> +
> +PYTHON_PYPROJECT_HOOKS_VERSION = 1.0.0
> +PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
> +PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/25/c1/374304b8407d3818f7025457b7366c8e07768377ce12edfe2aa58aa0f64c
> +PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
> +PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
> +PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
