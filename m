Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B5310987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26758487E;
	Fri, 20 Mar 2026 15:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s6LoPWZu2op; Fri, 20 Mar 2026 15:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AB584878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022083;
	bh=zK45L5KvELCY+EvJWUNHY3Ztc9B84GzUTbNx4ixWAJo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g1fWkh3C887UWpE1l26BELSVmheL9S9dudbytO7K3TAMd99HTYKw5C9u+MbWURTAB
	 G9JR1UGYs0fK+M4MXJMGTIWN6I2cS/avH0YRCgkI1cAMjt/QFS0quQE/R0qEi/Rn6z
	 TWy7TYNRJqXu12YrVQIWxY2Gik0+Vj01zYf6qb/BnPDUZpJkM4Hc5DuQbS1nbUcKa+
	 IwVqkz3nZkR2QtsGcik8zbfhjuqn+h34eT1jvv5pXL8X6ezjnWCKIaCZyOYGuzd2q2
	 eAh6VlRukcJ49gbrp73dfGDiJZomLcNnobo5WvxNBa6pFAn+Kiqyo56HwbPI/Am56L
	 9U0ybUI5WBkmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5AB584878;
	Fri, 20 Mar 2026 15:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B53381B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B37A41CDB
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeJwFW45wClZ for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FD8241CF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FD8241CF3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FD8241CF3
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so20721105e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022076; x=1774626876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=voCKdQvD/pxribFc0qzIx2mnPNy4YCkaF3ybU6FJozg=;
 b=Gpqgq8zzuh+la6sKyxhpu/X3qscse83gJrrcc5vPHCOthLJwpRdkr362lbV54zKKGv
 Idl3fTiWDEy3GpXeBibYHRoIQMjsA53OvZSFPqrmGywA8aQ2MQqiW5GYIINsERbejfbb
 sJEvLHVaINKpWFMC1ZyaOmR49bxldCzX1HYYYPncSz6k1fY3C+MlnXuLwh4mTQ4MCmAN
 NW2LpdreyDjLUik13V9GIQXxmPuBM2Ixo7TXFi5HaU+xdBPLU4RicBYer6dcwClCJr8Y
 cu05DTXSpfw1jN/0vHyHmMqaV8P3+5YBpAmteOaXBqSXNzZdZ73++gRdafvOaSJTeaj2
 JYeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkB2V0dd/4AyxtQJuJHooYl/C9pEqYBJX8TDcul1eB8WeLCm83uju/MOcdXDnpvyx5dEtOGOIn+LE=@buildroot.org
X-Gm-Message-State: AOJu0YxkYANlgqGMWdlt+3yAFzBGiWGNwCu4HIX1O++6qUrQjECevcZu
 aGOqcBsq+3sOkqi8jFTmo5u3+MfqnBzBcXI4Lg6U3YsGkjch1a0D2mwNlv1rvUJZwTOHOUsbuUw
 P6YvooRc=
X-Gm-Gg: ATEYQzzD0nMJ0611UlG/kcOCHfbtUCuvJmY2+3j/Uo6fm2qRQOHUolQyfjE8jO/eQC4
 FunYWWMddUSApiAC9MQ7ne22g3D4w2+oyT+D7cuDr+jD1cGkhZ9vrqqE4rCyprANdvb+E3dt+UE
 aAn6s2Smi1cjnPEV/RBJmX4H7qTh5yOqrv9NZxcSgEN0m4l/8FxB0DT82pE+YXwwJDE1WcVLvPb
 GKtL3RRNmpi+yaCPckKh0RcD/K+iryUOQB6xDS4ALzj7r3mafsqnWRCDdd2sSvUiXI16CJ3ieYL
 xhYv6cV/3F+U6UMzPpJ+kUciJ7gHgv+BIVPlKqTEcOdWAh3+yV4l9gc0YBm2xMPAYUbyl1g0YzA
 zQnq96xJzXHxpV46f6n+5ZUOLl6L7DqKnoJChjfiGPQ/WFt4qmG5z5K6EnrgJD/oA4xMA5aCX+j
 sAXBsBQXzMci6NBSHaqjSVVbDKCCk=
X-Received: by 2002:a05:600d:8401:b0:485:35a4:939f with SMTP id
 5b1f17b1804b1-486fee297bcmr39689925e9.28.1774022076114; 
 Fri, 20 Mar 2026 08:54:36 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff109b95sm53019555e9.1.2026.03.20.08.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:35 +0100
Message-ID: <20260320155435.175794-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251211195527.3276900-12-bernd@kuhls.net>
References: <20251211195527.3276900-12-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022076; x=1774626876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voCKdQvD/pxribFc0qzIx2mnPNy4YCkaF3ybU6FJozg=;
 b=LpBw5RptyMPM4b/lWJBZL42kOzVuWvC0dtwBogPn0PQ6s58O/chtZ3alYkKgCDTAkv
 OfXPFQjn3fXBlwOW0t8oHjB23Zaoj5u3Jf+LtLyLguESQuVF2GwEBRTWbCyhikmMKMqW
 e0jkAj6rJliI+KnO32KaGWjLpPPS2wwMtR60vpcrwzMjhKVDRGNhfRLWG3yUrqj6KRa6
 ok2TMswHwdu+p8x1T1hnHtjOxj512wB4qiVPcJQs2ohAej8A5xbl1mZepQwLf2VOQQsx
 BOZgcl5JjqqHpMWEF+VQDQw1DcKbmlMcFIOroQfbN1Z1JZeiIusfUgkBkxEixbAw1mqS
 RL6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LpBw5Rpt
Subject: Re: [Buildroot] [PATCH/next 12/21] package/python-flask: bump
 version to 3.1.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/pallets/flask/releases/tag/3.1.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-flask/python-flask.hash | 4 ++--
>  package/python-flask/python-flask.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
> index 17564e8587..ec2e5d39f9 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/flask/json
> -md5  59dc1b0772bab098aff83e8008e97af6  flask-3.1.1.tar.gz
> -sha256  284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e  flask-3.1.1.tar.gz
> +md5  62ae81cf2e91a376af909a2bc8939e15  flask-3.1.2.tar.gz
> +sha256  bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87  flask-3.1.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
>  sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
> diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
> index 2269b05d29..8000489366 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FLASK_VERSION = 3.1.1
> +PYTHON_FLASK_VERSION = 3.1.2
>  PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/c0/de/e47735752347f4128bcf354e0da07ef311a78244eba9e3dc1d4a5ab21a98
> +PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/dc/6d/cfe3c0fcc5e477df242b98bfe186a4c34357b4847e87ecaef04507332dab
>  PYTHON_FLASK_SETUP_TYPE = flit
>  PYTHON_FLASK_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
