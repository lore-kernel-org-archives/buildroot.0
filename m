Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182C1C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA79F405D7;
	Sun, 24 Mar 2024 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AApQnG1V_BgC; Sun, 24 Mar 2024 14:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7373B405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7373B405D9;
	Sun, 24 Mar 2024 14:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D380D1BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C08D981E04
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULlkaVYjRylC for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:55:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB09281DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB09281DF4
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB09281DF4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:55:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3417a3151c5so2271046f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292136; x=1711896936;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImvdrT97hEGOriNA5LnBee62V7zpy+3CcYuKxjQ9Ud4=;
 b=HyeX+moGoK6dEecUithuA7RgNQp2xtPWcxWTZvnF7CFtBBS7xpdyNZ5Ky0tonWgEWI
 +y8t8fpoPEFWVDWqrEglWTPRFFpB0Szo1ViiTvHKnD84bq1vRuK6nHw+l+vqBAzSqwVU
 XWscp8XF9PppSuy6EjdZZqROuNmhOXvEFjdWGJClgqsTV5xo7T4v+E8VNmQm++pO3k93
 Ih02b64kkUBU0sJ9Pt70bJmsYxWglRwPrBOisICzogjVOqp6WWYA5ykZTEBJC9S5epuK
 JMbiN3n/YN7dNeUnjC/A6hMVw9b4FHbC0c50Jd+WVrv3fM/f/Z/y3g/GNCVdbPiW+Gwn
 wmtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfnRE7kEZGGYCWDOPlSR9IsQ9o5wJ0HmhBljnhuj3wXUZhac9z4ns2Y4NMGeSvqkItr/gYBHAPOT7AW3Cjpg03sv1jPBql/Q==
X-Gm-Message-State: AOJu0YxYvZvfXcDNYHsM7TDm7cjUQ7zeOAPUSExi1pIryhuuBPISk8Kd
 5i56z+0taSesbSBYOLUlgoNxjZs5zR7GAu1SSfaE15vXcOov8JGYsveUaDAirOibmtusS6nerAe
 S
X-Google-Smtp-Source: AGHT+IHLkP7SxBOyXJVkYaQrbHeTIh80LDmfYXy3afYp8GUupgLkal0vGuNg1lZgReW3XOXcuP6ceA==
X-Received: by 2002:adf:9dcd:0:b0:341:c69b:8126 with SMTP id
 q13-20020adf9dcd000000b00341c69b8126mr1923047wre.63.1711292136513; 
 Sun, 24 Mar 2024 07:55:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:55:36 -0700 (PDT)
Message-ID: <bff357a5-4b53-4b69-8548-2bced1c52e90@mind.be>
Date: Sun, 24 Mar 2024 15:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240324140046.3289431-1-bernd@kuhls.net>
In-Reply-To: <20240324140046.3289431-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292136; x=1711896936; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ImvdrT97hEGOriNA5LnBee62V7zpy+3CcYuKxjQ9Ud4=;
 b=Ic1djvmzshALgXeRLCkRvMMahpjGp8b1W0fBRghNfZCvZL5IvtLTSup4yctBaJ4QYg
 ha7JhPfgUvWMaVmdU9snxZgtcUj6KtJEcEPIc4NX8QFpRh12DdOqsw3nI2ZVxewLmH4r
 7ezzkjXHXvHbS7KzLnsYpAuo57k9f6tZxdJyQwSImbF1DqdKOm4nALWFLKwHxo4/ytSf
 IaUOin1cKJ43GJof305n/h9AJ9pVgoVvu6MCXjtzV0hGqjuxALG+QhP4PXACAYk/0mKU
 QcB3l3GdlziHR74uUCnCIBkX7ZJvBsYe7togcb8Au/oKO86iJ9B7Os5XIWDiMEUtuc2s
 G1tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ic1djvmz
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-plutotv: bump version
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 15:00, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
>   package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
> index 0c56c8b6b4..162905218c 100644
> --- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
> +++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  11505556200029a48a293e97f94e0469a5f78580d0e56d5d0a1da05d61f0f5b5  kodi-pvr-plutotv-20.3.1a-Nexus.tar.gz
> +sha256  7bccc0001acb796aa706f8a1bcce2661fcb67a7f346420c691ee0461ab5aace8  kodi-pvr-plutotv-20.3.2-Nexus.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
> index fadb47efaf..8a47d8c265 100644
> --- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
> +++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_PLUTOTV_VERSION = 20.3.1a-Nexus
> +KODI_PVR_PLUTOTV_VERSION = 20.3.2-Nexus
>   KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
>   KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
>   KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
