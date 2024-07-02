Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31468C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED73E81F5B;
	Tue,  2 Jul 2024 06:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNLuO1vKOV0J; Tue,  2 Jul 2024 06:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 017A381F63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 017A381F63;
	Tue,  2 Jul 2024 06:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 643C71BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EAF4061E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7daqtD2f-0qe for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F403C40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F403C40571
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F403C40571
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:56:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42578fe58a6so18257505e9.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903388; x=1720508188;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0BmuEhoxO40hI/aWb8U/gilzmyJAB/FmaSH8hOx9etM=;
 b=F7HHPknSDCmnmWHiSmSXEtDonsizG4kH2jfbIFXZUE2NRGHXHloVUdZYQU9x9RNEKq
 FTAriRKOhvrSdsTGhgvhKC5WYbSNLFE+jlimAi4WSMiVBKH65Tz/MsN55ZcW/jrrnCuS
 nuJCI2P9IDWDR8puRzTUAMATiSOiPfSMjyCF9TTkk+Pua8+f08yF3zMJW+3wt4uu5jkc
 vbND00ZwxfO0PyWWZ/4vVN992aLEE5+uUtMK5Im46GRqn9fi+o1gTPK4/NwIiLWl16/V
 Z48Kanj//pT5pZeTBH1s+/IJqi6llVsHJ/27QdKA4GhJx28JpSmLwcsbRCrYPvolK9PP
 nYWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8vKor6cSwHYVs3xyH52F1O5E0vyIffCBx/cnGFa28OF7NUcc48sidX7ek48l/rNUWn1eU9B904u1CveTrQwIzk2w0NoxoTw==
X-Gm-Message-State: AOJu0YxNYuyErkYx7Yu2CfV/ur1soDlfp57sgn2NX5uuHX2SZhHefOa1
 Hxj2zSUVazsf95KQd7A6semCIuxp+zbICiUXuGcaV0hUTVagqRyPrPhCUX5ihN4zUOtl0guKKZw
 Q
X-Google-Smtp-Source: AGHT+IFVtTq/EGL4p+/2/lb3ATXAFdb5O9hCmOrclcTvCEIhpkXlPzq3nJ1nM3AED9SU3pKw+JIHJQ==
X-Received: by 2002:a05:600c:4487:b0:425:70b9:7324 with SMTP id
 5b1f17b1804b1-4257a088f96mr51930675e9.38.1719903388115; 
 Mon, 01 Jul 2024 23:56:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a104727sm12225266f8f.111.2024.07.01.23.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:56:27 -0700 (PDT)
Message-ID: <8e1aee8e-4556-434d-bcda-f35bd49c7528@mind.be>
Date: Tue, 2 Jul 2024 08:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701180146.1732897-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701180146.1732897-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903388; x=1720508188; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0BmuEhoxO40hI/aWb8U/gilzmyJAB/FmaSH8hOx9etM=;
 b=Q4tyUrsxLEFVv4n4e3JWN71yLgzXPBTNrHKAWlnaSwQoNJ+Y5JyGa6Ouuv1On2zPuL
 64QV6G4JRpCpsy9z/ZL+iDuHKimZpi0uAAH5ZdfkM5gS02IR1EVO+cHgpYObUvL/4igK
 0JE+IOxLoF3uBoj2NQ+olBYycdS/J3t4CMp1KKSHxhYb/TDgr0bEdlUUG6ImocgYpiGq
 VoN+O6astqiWmy/rFasCjFYydEl/YvQN4om+qyqNeunFiWNaJqmBH6HgQv/wSXisQvpj
 cxwtCsHvexIrwChHYZo7TfKc7w4bbEzQPQqK/20vM7dmhv74eK1JUKIQAWEGf1e+ztqU
 6f9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q4tyUrsx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version
 0.27.0
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



On 01/07/2024 20:01, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-httpx/python-httpx.hash | 4 ++--
>   package/python-httpx/python-httpx.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
> index 26e39fcc6d..381439f464 100644
> --- a/package/python-httpx/python-httpx.hash
> +++ b/package/python-httpx/python-httpx.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/httpx/json
> -md5  3785c8a8930a7c7280206f79c170658f  httpx-0.26.0.tar.gz
> -sha256  451b55c30d5185ea6b23c2c793abf9bb237d2a7dfb901ced6ff69ad37ec1dfaf  httpx-0.26.0.tar.gz
> +md5  d6035d561136590900678ec6c78698cb  httpx-0.27.0.tar.gz
> +sha256  a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5  httpx-0.27.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
> diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
> index cbc9c9298b..edba2dbb04 100644
> --- a/package/python-httpx/python-httpx.mk
> +++ b/package/python-httpx/python-httpx.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_HTTPX_VERSION = 0.26.0
> +PYTHON_HTTPX_VERSION = 0.27.0
>   PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
> -PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/bd/26/2dc654950920f499bd062a211071925533f821ccdca04fa0c2fd914d5d06
> +PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/5c/2d/3da5bdf4408b8b2800061c339f240c1802f2e82d55e50bd39c5a881f47f0
>   PYTHON_HTTPX_SETUP_TYPE = pep517
>   PYTHON_HTTPX_LICENSE = BSD-3-Clause
>   PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
