Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7F1E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B0460EF5;
	Thu, 19 Feb 2026 17:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yMzsdvodopK; Thu, 19 Feb 2026 17:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C334610DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521940;
	bh=PcDAKFj0Kye/WsHhz+siztmFdfE0a1P0XG8YvlR8MvE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VXJBF9/g1WPZG9VhimRX2eyd/Asv5MxMdqj9jQk8OOEdHRst5Q53KTQRA/QSQ6MGk
	 KUyZXeO6/bdgzumNYEnOzZRZAsBV46bVH0MTUCvPXtg/xCwsGWgRfx/DIs8MJbYgNC
	 acw1oZ0Nm7of2JR+oNXgksBqR7hv4mBU0qU7hvJGY+ii+1rgn8h7eQv0oV5a40LFvE
	 hFaQYAK7YFOebYVHScr8gRbIbR1aZorOtFqxbXv6k87OLbZP6SgO88uIBQYH5YxKEp
	 2GxC0nkp8DIAM/WwIqzNnNoHh/s3mUsiBVuKWZa5rZkik7XQSbWoBEFQ2aIc2nOARA
	 2vQaG/Tv6uDuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C334610DC;
	Thu, 19 Feb 2026 17:25:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26ABD206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1846E40CE9
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2K8n9olOsc7I for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A81940C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A81940C6F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A81940C6F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43767807da6so943634f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521935; x=1772126735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xanus/s1IR9bJ1qrkxrfNJIeHbQ/WAqH9Wa3DHdpcUk=;
 b=Pux7eQylWDavS6UVKETlBRmGW6Ce12ztjFh5L5i+QHNtMyLG4J26jnKynzHwtOVsUB
 EEKJD8tg2ts3k76sKrNG0uN1fs8cB/lvBSm0JIj9Nw8mEWES5NnUQzeOnonMzlSB4flQ
 EPi5NTjrejD9d8UMYshgZG2tm5W/xa5bbO1wLsKoZjBCWAPP0uWjh6z8RDc59qxV3u2e
 qN5lRjCb8o2re7+dvMM1OjwoK6fYFrCIcjnw0E3zBkl8BQGiDBiOyGT06O303ba/Ywxq
 9vDOEMOeTZ6WCmjNsG/Tc2eBhekAdj+OCfIWK2Lq0rqYXHtKUS1ajUjNjtsJSS4tzkma
 F5JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2liOMC0i/6GNjbSnpdTenFxOjJyaAeXgE+8GX6isjxRs8moAEuUiI4vVvOR87zgAy8BOzkz6CtqM=@buildroot.org
X-Gm-Message-State: AOJu0Yw3JahKRdaR2BxTeGB6P7QOq5DVd0S2aLLsAlQJltFTiBhZJtYr
 WCO7JgvwU+BELsNRcT6q2BqLn0qoDkWOIuRkHm7nk7VXf6/ASBBlvpEmqx9Q+23EZGY=
X-Gm-Gg: AZuq6aLAZsGSZhPQnBeXNhFVa1zaVtOcpNRS5cvw3QBzuSGZM0bN6eOCJfevvNIXSEz
 FD6Ir9qcMRogE/kLCYvAXH6aHq/u6HSNA7D7/GPc0xJWaDMrFo8GCIZlw1o3gOxr0yp1VGJ/v6e
 LOb6Fq7Xl7ZkPppkFn8gY4T/SQpspqwk5ymFCGNgZXWl+ne12280FTYPcIFW3oMh2BzoArVdksS
 OgLtHe4gOPz1JhNC1UrKxzGZYW2+ZJbVaG8Sxj6Q2baAg5YnD2m5wZmOkmj74pt0PM+34kSfsGO
 a5kjn/X1OQAJajHMcPB7h7xEHx9JIhWWn/LgtfwqhMYtgbuY/TL26DV6v7buLJpZejRVCtJKLL+
 WwlqQn8o7AOyWZbhMmHgv6Hhn4PEqUUwdQrX6GT3bZ6XxMXMqnQ+V+ZQO6wIGdzDJlvb9Uak+a8
 BYRFrAr2A4TI7mUD0=
X-Received: by 2002:a05:6000:184e:b0:436:1a4b:de36 with SMTP id
 ffacd0b85a97d-43958e0314amr10416904f8f.22.1771521934980; 
 Thu, 19 Feb 2026 09:25:34 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac7csm48263470f8f.7.2026.02.19.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:34 -0800 (PST)
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:34 +0100
Message-ID: <20260219172534.340170-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251217081817.3779661-1-pkerbrat@free.fr>
References: <20251217081817.3779661-1-pkerbrat@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521935; x=1772126735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xanus/s1IR9bJ1qrkxrfNJIeHbQ/WAqH9Wa3DHdpcUk=;
 b=FVw6lHIS/a8AsjXSiAWRTcMTyUw/pQyufyOqNnQF8zDoMaZsuRWqkEu4r7lQtCCeJd
 Y+sM+3kwo0jxt+ATTm37ikWxZ3QV+t8RinMQapls9H5uYEBCIdJJdyz9ibMroxMayD6D
 UjeGuxqVfor0oDC40NiXTk+ieCngVJM/rDytC8tNtvSTO1AV+zt8MKSrNMR8bHQwTR+O
 VSOAA2bu8SXQ1gMWDiYJehIAQ4AdTLKrn4a1TpRZREdWkpclq7ivLIRIzRw7cPfC02AR
 1bSs+jBqY3Vz5rvMeiGkOkh9jYiQeSqLLWwYzynlD75iEc38/NT/sUUn0gxhFPINc0RB
 IN9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FVw6lHIS
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: bump package to version
 9.1.1989
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
> Changelog:
> https://github.com/vim/vim/compare/v9.1.1684...v9.1.1989
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index ae909aaeacbc..95c44234feca 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
> +sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
>  sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
>  sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 4297bdd198b2..2ecab0652f6f 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 9.1.1684
> +VIM_VERSION = 9.1.1989
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
