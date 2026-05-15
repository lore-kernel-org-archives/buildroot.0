Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FF9CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC34D6159E;
	Fri, 15 May 2026 13:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8ESibdKWxvM; Fri, 15 May 2026 13:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85A76162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852074;
	bh=pF6S3jn1KkPBkm5+ClXvmPMcV2MFF/4Lf3KYRjktlNo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OICh0JqeNW1z1MAMtZkT8ih2RNMnICGYKSfjyMhZGyrBs3kB3ZAJTsEJChCSZJ4Lu
	 yREXz2HUHbdu5bLyI0z+I3FIT2Let9G2fjsrLYrCLdyiXSwED8p/BUUqrynRSCS/7l
	 DpxdAkPzhF7Wwjr8BCFbm8LMzgQhGPn0B6LC5pX/KfVH1yxZvmElGORr6JgAE1euUr
	 M+he1xXdHk5Se6gTVtpLUR8A9GpIq6qhiaosjuRngCYAzeGNFxRRD7imYcfe1j5v5/
	 2am1VabEAvRcjGZxhz2WThAf3SX45ClJBLdZar5P5KoScieHjfARNl3uQYK5091X26
	 Y57Z0QONSl51w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85A76162C;
	Fri, 15 May 2026 13:34:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1494C36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE2AC6165E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOz7I_ETPLC7 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E54DE6164D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54DE6164D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E54DE6164D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so8096339f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852062; x=1779456862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AbgTvrwZxR2ziGVXqhNb511jua83h6+n8n4aW4FNiD0=;
 b=Dgk9jwHU1yUGHW18UFy49C3mAHEXnTiCvj1YGWm0OK0uJetz8Jo0kuK2utMSCbjXfQ
 fE3adITID6rZ8xk1iOrvc2yYyaDOuj53uk+Vbraa1dxP6A99q5EvOd/NWxistVQVRSzj
 UZC+VZeH3OZ8aKqHRR6x+CzyuLWSi2dF/tLLJFQsy5SjLDx8kwbe2Z/0GJldvmwRrAN0
 EchLgytwR+VF7yitu7I1dADRaaVlA8hl6CLRG4Z5S10VcfW8T+6efFaGNZ6XeMX+7X0j
 QFVuBMNNGwayxDoo6dnfubN2Egpqw8Qr5U0ZiO/TvdJ1LLNOkD42xW2aGRwV5EiG1/Qm
 95aw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yF8yqfi7RQ5Mn4S/cId/5MzYZf5/R1GZdCPGqpFjNn1QjKnmCxqNe03rC1Xt1IwcmPmZu1aZyYfE=@buildroot.org
X-Gm-Message-State: AOJu0YxEp2G+FGdp6IgrzSFeIoq7hYtMDya3bvpoDLpGLlLU4K3JGWt1
 X3mZOtAR2HU6Uzx5B5Xcy6Jx8rAU46/4hzY6dAP3ejkuzY+HH8fCLxgo6X8j8Vq8x7U=
X-Gm-Gg: Acq92OH2zeiwHg+mUmGgcZGxR0jAD3G+6+/LDSJpf9AuQ1MftEmNBDLiOhwW68fTpn4
 nXGqRqVTZIGa33Ojsv2EUWbDH4dQh4o9AAeN8q+0mYDln4rW4CzwXPYMdhLVlOY9TMVIp+kZACe
 CCYuN3BatXltPihpEgz41VFmE3l2qpj1m5qqR1xVnKFeyMJPRU1/PBtB7MQK7FSth6LxnOM//kf
 ljZ+vRXVFMzTHJ1wTUA6zRFc3scTAbOD5r6ff2nbm/TwAoVg0Gq+kXoW0J9eCfxKfRE3vMNCP76
 mUcwmnb5PTp09p3fFLO6HBvTNSr5lzkzb2eXx3x7gY/vpg+Yv7opxc64SA7EltwGjxcCkNhOn+7
 Ky+7XSTzY0bdcpC0/gShVQ7fJkwQZWtyhy0fpp/E5Kv7vUOnxMwwsESzo6rhH1/tRGRMsEO8h/E
 vBHrLsMu7UtKRfX4XHJK3waH8mZ7TaQD1bZ8TybMwzqdZhUjULseoYCRs=
X-Received: by 2002:a05:6000:268a:b0:43d:68dc:9ca6 with SMTP id
 ffacd0b85a97d-45e5c367ademr5416122f8f.18.1778852061952; 
 Fri, 15 May 2026 06:34:21 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13263116f8f.36.2026.05.15.06.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:21 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:21 +0200
Message-ID: <20260515133421.317040-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501123100.1918951-41-bernd@kuhls.net>
References: <20260501123100.1918951-41-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852062; x=1779456862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AbgTvrwZxR2ziGVXqhNb511jua83h6+n8n4aW4FNiD0=;
 b=Xpt4JQfu6xUMwPY6PiWDgbx0RtZYyqQRFNrHIclpMt88Kk6Lr66LUhrQChFCM6t561
 BsQXwMvbgDk26HTdsXzpQ1JHyBij8OVq945l8rfOGEt3XbgQRmj/zAuByFESraoou2tL
 BVGcugNwa/mVfQ6GjfhKPxGVpRI2iS/Ax+Xvtd+aintQWplLD8zEXTqvSsnGo/OwjYny
 lRh/FXJaVG7cWA7ItjvpDoAkc5L8gqPBtDibYgjgO32hwCaCZkXrg/w+ODl3PJBSD7Id
 FBfb3vyrpeR/AGfqaVNFqTvHprAqb4yoyeFoUF0Urj9DfNl1/NBtjFCc+3ZCw3Xj5hWm
 3u7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xpt4JQfu
Subject: Re: [Buildroot] [PATCH 41/75] package/python-pyasn1: security bump
 version to 0.6.3
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
> https://github.com/pyasn1/pyasn1/blob/v0.6.3/CHANGES.rst
> 
> Fixes CVE-2026-30922.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-pyasn1/python-pyasn1.hash | 4 ++--
>  package/python-pyasn1/python-pyasn1.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
> index 4977abf4bd..eea1118bee 100644
> --- a/package/python-pyasn1/python-pyasn1.hash
> +++ b/package/python-pyasn1/python-pyasn1.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyasn1/json
> -md5  93dbc09023fbd1b724fd8233ffe2a343  pyasn1-0.6.2.tar.gz
> -sha256  9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b  pyasn1-0.6.2.tar.gz
> +md5  b7a8127ed5fc251943e47dbef51ea6c8  pyasn1-0.6.3.tar.gz
> +sha256  697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf  pyasn1-0.6.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
> diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
> index 2dc9470ef0..7278b3f857 100644
> --- a/package/python-pyasn1/python-pyasn1.mk
> +++ b/package/python-pyasn1/python-pyasn1.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYASN1_VERSION = 0.6.2
> +PYTHON_PYASN1_VERSION = 0.6.3
>  PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
> -PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/fe/b6/6e630dff89739fcd427e3f72b3d905ce0acb85a45d4ec3e2678718a3487f
> +PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/5c/5f/6583902b6f79b399c9c40674ac384fd9cd77805f9e6205075f828ef11fb2
>  PYTHON_PYASN1_SETUP_TYPE = setuptools
>  PYTHON_PYASN1_LICENSE = BSD-2-Clause
>  PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
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
