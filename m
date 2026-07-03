Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2F3C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FCB413CC;
	Fri,  3 Jul 2026 14:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh3_pLiLdhze; Fri,  3 Jul 2026 14:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F6C413CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089222;
	bh=B9qFHpAP6qwaOcHv+++jq9KEgTAJux/JnbS5K5gl1PI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ld9bLHV2g0uxblqRMIjmWfHXjQjvLssrj9NrZ00uTQWBli8eI5LtucFVq7F78WZs8
	 wHeLcOguvs579jq6mBgygZpJJlvPwO1leHrGHuI1/gHm115KhEMFOvUps47DBy7wyL
	 OpEOCWBjIN9udS4rvFhH29dfGEbxVyl//xY5LGSjE7EweQD9xCuiLlH2xhAnajPEjP
	 1xQGJUCAs08hUJtF0PR7AqtZy8tJvVeI6eHHbhlmf6fqi5jqCmB+99TFx8yy+srZR0
	 m6nVsrp3BZfhdT/1GPha7SoOT4cNdhUatdsrRo7u+/B8ZTmDvcaoXNX1SzubWWFIVD
	 4IrjR0O96B3oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F6C413CD;
	Fri,  3 Jul 2026 14:33:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E02E14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6381682CEC
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqBL7XL1QhxH for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF30D82E14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF30D82E14
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF30D82E14
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so465148f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089217; x=1783694017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p0U1El715Pwn3eaE61IpAcSOHFSdRXmAaMFqNfVICQI=;
 b=oeKpWJuS9k12CDVhWg96nuDZSH55efqlwW0SSPqP9BvW6DhcliXGBQW2GG/F8Q1J8L
 dFTGe4w8K59KLceTgugMYDEXZWklRtuPWUDvfCH1ZGlQIKAt0WONzzRUSk+AKEWi4YVc
 pbmiyn1SlxGKKZFZKjrbcyrG7ZSRvDI4jvb7u815OT0Iw+wOyZenUrFUUOlQ58ajpjLD
 26as1NWit+l6EjDoldmMEqOPvnkHkkbOx0zq4H0QOcmF7uz733GUwZd2hJg38KQzDt7M
 I1KhKeX4PIPAlOwlQygQgxO3HgjsxscedTgFdwG4XW+bCCDtJkwJrFXB2p1piTjvoUJ+
 XGRQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoJV5bkLBKqIgrmn8fHy/2M9rKCRdd9xVZq7/bqh/VK/rtFCVhJ3lpBecAJfKMa8ftRVn+MtyC4Cls=@buildroot.org
X-Gm-Message-State: AOJu0YyBrK04sla03KsB54UNypJ/xKxxTIIdOB8+8dTYe/ea4+5wHfLD
 22qIazCFLpJS1C0Cg9jNUTXdoSvfP/Y/IWz8ysP/s6TYKkcOZYILmwZlfvhxFUlbfp0=
X-Gm-Gg: AfdE7cloqMAVuAxVTYp+w/eNnrNroi7h+5X7ybFYj1Do18kPqfjXk4rUWECXZvyOcxt
 eSEerNfITUODB8RoWzwCl8Zz0K4vCn1QipvWlva634RXy2ihHDmfNyts4mkaTFTf1WxA9B8jp9G
 KBX0uvK7g+Adou2WLR0U8QEWwAavwA1yPt7T+SSTQvYY0hIrDxjt/906R/BcyZUKgqhzXG5cUC1
 7bC1MNSavrAOuY1AR2YbsjEeXXPfnEgz19Lzi2F+udCxV+eVEIjIrGY1X4ajPLAmVkfRt/nJ4Bx
 vgoA0ZnTZvZnoKcL+YNpUi9MO128rMe/BKTGTE3KuhhgkMGF8N6yF/8n4qNiXA11yaXKFrx3P24
 sZXeGpLC7Gae6C9s2gG9wHfqigSO+B0/mo8SFu/9Ivfy4Cx99hdoa+7gQDCvIdaFFe/MgV1CUT5
 lBvtbb
X-Received: by 2002:a5d:5f52:0:b0:460:3233:beee with SMTP id
 ffacd0b85a97d-4775a6d21b4mr15594563f8f.42.1783089216928; 
 Fri, 03 Jul 2026 07:33:36 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dc77bsm19063708f8f.33.2026.07.03.07.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:35 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:35 +0200
Message-ID: <20260703143335.276121-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260625123536.3814862-1-giulio.benetti@benettiengineering.com>
References: <20260625123536.3814862-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089217; x=1783694017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0U1El715Pwn3eaE61IpAcSOHFSdRXmAaMFqNfVICQI=;
 b=ZK475saEdVoO9Yd5vU6uxp9KQ1MuTQ7P5QOX5OvIezNxDj1UAyHEVWt2oTVi7DlUHV
 g6EZ/7n0eEjGCssFst5atM9pvs0GLg66mFeQWqUaVBrYZyed8cIny8P/H1FDyt17Bjw9
 IXohJDGHEU5/ylxz8IRDszwD/v6nLw1oJpadlE1k9krmOByI1SVsIuIWMKpVc+vZxa7p
 Z12YODXjJKWw4fQaayxdBCY+Bcie3dZ8ZmkibaS0xhjmJixQrmHp1Ox/++5o5Zk8mKQ5
 qByzpjiqb9QeM3nFR0JR3dbwN2MBHVNL60CP/wzypBxFP+lpVtt8xzMejiFSiPjRXdac
 6xMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZK475saE
Subject: Re: [Buildroot] [PATCH] package/mongoose: security bump to version
 7.22
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
> Release notes:
> https://github.com/cesanta/mongoose/releases/tag/7.22
> 
> Fixes CVE-2026-37635.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2026.05.x. Thanks

> ---
>  package/mongoose/mongoose.hash | 2 +-
>  package/mongoose/mongoose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
> index 556a438880..1a60b0c89c 100644
> --- a/package/mongoose/mongoose.hash
> +++ b/package/mongoose/mongoose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  d4ddbd12c12f223abefcc0a74417a638ae5c118d7cf10ba546553c6b0e0b5ada  mongoose-7.21.tar.gz
> +sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
>  sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 8250751eb8..207d31cdfa 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MONGOOSE_VERSION = 7.21
> +MONGOOSE_VERSION = 7.22
>  MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
>  MONGOOSE_LICENSE = GPL-2.0
>  MONGOOSE_LICENSE_FILES = LICENSE
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
