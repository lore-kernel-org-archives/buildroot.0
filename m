Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B75C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EB940B97;
	Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KktO7sK8fkQ; Fri, 17 Jul 2026 15:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D21B40BA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303263;
	bh=/w5rdItXZkpBX9HrjNoaRxqokPo5AP9V6ishi5uBEwM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FKjIArfCUscOgMdQywfqVzGFCHtWFq6DEm+jH0conda7gPXP4fowA5eAnmzBpqjc1
	 kciXb7+ZjD07mdvs6CDr4ep74T/LhE5dYfRsCuJAoMGpYKbRWh/nauXWfqK+DLIV3M
	 yDSo3YqlJlr6AkvbE9GKxcj4DP2fUQMGqsWACZI8SVW9qBLFKC3BXvEq7ZmEuhM5IX
	 irCeXs0adrufKVrR+MxiCyRT8306HlTeVJrIRxIiq2trl6QX2ut9yOqAvF+nJowmjh
	 rVJ1OgvN2QPX5S7pTpkj3kzLhl5hglAcRQJSqXFDxL/wBMAWC7yf3qNpGRPWk5JfZd
	 Rf5HEoXdbGC4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D21B40BA0;
	Fri, 17 Jul 2026 15:47:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C4036E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFA4240291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3e5VW4N43WI for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB9D740056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9D740056
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB9D740056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso69245055e9.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303257; x=1784908057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GcNB09E2JM7+CRmO3CblTfXBy7Hcy6Hz55A2C9H/0uE=;
 b=Y3I5oT7VA31kvXChzf8yj/YPqAsCmT1NoC+6IZ8Z0ZGPGaAUK8tdsHLGzBci2/pwMp
 zM7i7Z02Au8c0Swk8zzWfxwrQ//qMEMnEu2gx22TyzW0hINI4+l6O0sf2c0bXQ6mnDAs
 K7dKBOO5YJ5sIBTtrhBNVdTQi2Ee06htKPGnGm9Q14YlQEvbYBotUws/M8Tm+7+dOrOL
 PHcM5OwaUpO/+ZpCVxKT6cHI+KyBeRUENPvye/JUS0ZRW0d8LKbCqh+cERUNbqkd98+C
 Ctf1bkoOLLcAoYk1ZLliTzclidyfpPIZh8EM+OUL7QxirymiPgBN3AUXmKKsbT+EX+zA
 85RA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqf7mA3pqmbF2IZY6L1VwOpdhpivmXl+siGP1QEGHSRLb2IgBXgRXQwHMndfaLITCN9i/02nVzUY28=@buildroot.org
X-Gm-Message-State: AOJu0YwzOf/qXrwQKZfplAlTETjb4X3ZP/nVQpoOdJtd/H611nUakmg2
 aF1W23YgVO4csd0O9eDneXp4/S+jmW34ZarZxXhb79KSQWRu+J0VgRYM90qgIAV4k2k=
X-Gm-Gg: AfdE7clFBMhwW9GsjI6BptjJ8BLwBJceUnSyg83lcYu48v9DjSd62lA597VqUZSSwfl
 hpHgOe+Osf5cfAylizpxu9n8F5qKA/hJQmMQkcU5hbuHieAaBokdRnNIlG/uNeN8171HeevvY8U
 nkVFAVZSyiiWxf8i7ZUtQ3Ci6aXHggGMqKyUNPY171MtwMryheF8nW8e4HgTNe9AibpsxlgJL0n
 YAjiZR8ilxzFEsLlHdJXARcwvm1KVqybFgKLnfOE46qQQSr25U5dH+YX8q79rMY6XOvLNiGwMmm
 rdlq17oNUsqqSIqvPmWWhW2C6oYstJImmF8CEzxB4BK09Omn8cNNeM1bPL5cQ2Kp9kdU6szdQHY
 OPdIaQft1nRoOAqhpEFlsd60K/hE6hDvmsVU/MpO/UcTbmeqDWZthFc1KyKtsEthgBPmWPkxOH0
 Keq5VHlw==
X-Received: by 2002:a05:600c:4fc9:b0:493:ad1b:b38d with SMTP id
 5b1f17b1804b1-4954a512d82mr41484605e9.37.1784303256623; 
 Fri, 17 Jul 2026 08:47:36 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e51986sm5339308f8f.11.2026.07.17.08.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:36 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:35 +0200
Message-ID: <20260717154735.192149-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707185207.2387124-1-bernd@kuhls.net>
References: <20260707185207.2387124-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303257; x=1784908057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GcNB09E2JM7+CRmO3CblTfXBy7Hcy6Hz55A2C9H/0uE=;
 b=B7GmJx8egdWJq/DKcvNX4ThlmCd8sAB0vV3CsCWeF8SAH6NzDRLcVf/kcVjCft6Imf
 CuEF6+iBCa4O3qOHMl2jQVuoumRH7/TVRPFDPVrX1qEOi6q3bKNYR6EOT7JKa9Jp0z5O
 iUNsQbfS2liZCwAgX+WaSSOUo4KkpnChNsFCMkv1dIjqPn2XDxj0g1ETlQRJlgu1ScsX
 Kb3l23CRnLZFH6rNhPxBf4QIh8ifXWfjRrgcezAS+NKtmysLRp6KlC6jp95CSKFEszpZ
 dCKOi3OcCDNF0zYBFV1L2jFNAl9iK9ZArlKrXgtZB1/zKQ4ZJ/CJsaXmPpHCdBo+Z+X6
 9TQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B7GmJx8e
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump version
 to 2026.92
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
> https://matt.ucc.asn.au/dropbear/CHANGES
> 
> - Security: server: Don't allow -B (accept blank password) with
>   -t (two factor auth). If run with -t and -B a user configured with a
>   blank password would be allowed to log in without pubkey auth.
>   https://github.com/mkj/dropbear/commit/23ec78285639edf068d86bb96f91cba755039740
>   Reported by nvidia
> 
> - Security: server: Fix parsing of long authorized_keys lines.
>   The remainder of a long line would be handled as the start of a new line.
>   In the case where external programs add semi-trusted public keys to
>   authorized_keys, a crafted key might bypass restrictions such as "command=".
>   https://github.com/mkj/dropbear/commit/8d8e1930b866eb44135ae393a793cbeb03b6b9d6
>   Reported by nvidia
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ac42a98b3278d90a9a5eacd4f4cf6336879b5158
> with the exception of bootlin-m68k-5208-uclibc which was broken before:
> https://gitlab.com/bkuhls/buildroot/-/commits/345fe196c6f81d16429e5d41185e4a08120562d4
> 
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index 31ac153b89..9df81ea4b5 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
> +sha256  91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e  dropbear-2026.92.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index a7de8432af..e7e6703057 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2026.91
> +DROPBEAR_VERSION = 2026.92
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
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
