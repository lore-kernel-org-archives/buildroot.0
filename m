Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432DACD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1735084669;
	Mon,  4 May 2026 14:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb27vEKTTTvd; Mon,  4 May 2026 14:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B92084676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906079;
	bh=+K6KhuLOuYg9IAIPfd2YFg6584dom4NToFpk7ZL7dOQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qC2PCfT6R042/LOyF+Cb4c6mi2ZIZZLpjug9Pj35z88eiVOF2dKGoVpTnC1cqCSNc
	 2PDqX5ftNNDc1uAILau/inBCnuglJ985JQ4DyI+RWI6/anAX5yBIKsRFge9Z1LvaVS
	 Hd4v3IxF4/7IO6udcdSXCcc8uqsRQSfGdtDCMfysKigIrXRrkDX962VYZzuGTAVtAF
	 ClAbRzMu57pkVL6X/in6YaCmQz8gGA7NFxnk4+Z+rvuI4VnYTqLFWeJyNR29y4B9MS
	 JSED1sjLTWJow6EBEoYgj6JmnZxR5YpnVZ4lMne5vlSZVF5sd43FFIeDhEbpQQCxkQ
	 oN0uaHNjM0mUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B92084676;
	Mon,  4 May 2026 14:47:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BDB190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 084B841BF5
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eK0L7G0V1fTP for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C49B841C02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C49B841C02
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C49B841C02
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48374014a77so48501435e9.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906073; x=1778510873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4tOQ1FMyLXt09XWSOHV1OshT21en5KDnm635g2+UgSs=;
 b=ZU/zDXYERHmLjyTSsGtNIg6qQ8BghSJyA+TDKeS0drts6f14fky51EDgCgDLROdO7H
 PlIiZ2Ti1U2FnYC5868qr82AGRbTgdBgRXwJbRs2RqRSM/Qi3qRqWGNDv73bT9zxeS09
 98rx3wpne9q9qndLUSEObJUz2//BlFAclQLJc6TQ6A0slL0PzFXpajJrmLP+qCneTuDC
 Ny5mhtQDxO3LpAgV4kREk7vzgx0Bu2fDbe4b49CUFT0NzdYtgyQj3x0/ccYyd4MmeovX
 1qQezYTOaz7aJAkyXzBVQiqP5Ca/h8w8DajZmOul5aMEcasHuX1hpCDdUoJf9Izns+53
 6ysQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DdkQUeGkKdW4VM2KVeKuHMb4Akb7FbQBaS41nGK6ggm/P9Hg55sP22OsOFKCi0Z9HOgr5eJgexdY=@buildroot.org
X-Gm-Message-State: AOJu0YwbuVmZUp4uzhLXIe/9wManjOSh4QT7m/CtGQJ1RE9/lsTiCEiQ
 GHtQyGw4YVFKzPV72ispAykVwapK+7+hrFvr12L/u5bbjJD5Qd5ya78N8p5z+GDshA+D4Uu+BVS
 /M+QQ
X-Gm-Gg: AeBDievhOCUG28aumebHvQPJdSUR80odX0V4l19RKpHhVf9sdfhi/HSBbUYeTmFtVho
 Hs6M942EMxc/0Gx170Riu1AY9JFmPDXuJwn59lcArvCXoLjJ3/fakfEWeNdCU8V/K18J3Gs+VIp
 D3n/aQYz2grDr0IMTpDU2yt7GVwZJADHXhiyv+5a4eENrDyzVNqDaTTPD1kU35lHmBUcbazyQ4O
 lZ2OSWzJqtEYFH/M5yaSJLitKpvCUAwfWmywyajubYyf1mNRU6gXcTlUZAAYr9FbGTIKRZzzYZH
 nexdDa30QLGn874yKYXVT65UZjq7elLzBDhsC3VwaZpMNuvVfnnx+Vf5Kvzt2g16nnFWMkbc5Pa
 mx85E7kdxGR7OyO7ly3oo9UOMgdM+GQOAiPm2m6QQvmVqWtyHem5zOT/Nq4bI88W0SE4I7+mYza
 q9y+gUKl9l6fTSRcVqGtBEPWJ7ZvC+patZEp78
X-Received: by 2002:a05:600c:4445:b0:48a:52ee:5776 with SMTP id
 5b1f17b1804b1-48a986380ecmr161552575e9.11.1777906072678; 
 Mon, 04 May 2026 07:47:52 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fed8ea0sm139198975e9.5.2026.05.04.07.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:52 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:51 +0200
Message-ID: <20260504144751.10659-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426071936.391076-1-bernd@kuhls.net>
References: <20260426071936.391076-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906073; x=1778510873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tOQ1FMyLXt09XWSOHV1OshT21en5KDnm635g2+UgSs=;
 b=E71YJkIIMxfb+ma1RgZviLYV77PoUUcrBrxlGyFH6EUhxW19Z3S/F/wnZ6rdik1sMY
 0LS2iPiRYbJOpsi1SsIWlasd6k8IQc7FMOpxJSXz59QzoFEklxsrRkoLJFYtE0C9P2c+
 jDEnfog3JW5pnZMO3856Vzo8qDJXEf2mUOpQhVK6fyBFZmNb2ibgzKxuf7SuiaUl7lU+
 9JTTgBvz2BoHvCETnUC660+4/sgGmQAN3TjzyAXoVp78SoLmmC2jrnlmSUmFYcyJ3pKi
 PyZzVhgpSizxMwlMfJmCL3sbgKAzovFs0MU408h3kUw96V4Eu9QSAtWBPi6l+LAiIz87
 IrGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E71YJkII
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: security bump version
 to 2.15.3
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
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.news
> 
> - parser: Pass userData to SAX text callbacks in xmlParseReference (type-confusion)
> - entities: copy children in xmlCopyEntity
> - c14n: Fix Type confusion in xmlC14NProcessAttrsAxis
> - python: Do not decref string after adding to the list (double-free / use-after-free)
> - c14n: Reuse tmp_str, xmlStrcat reallocates *cur (double-free)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libxml2/libxml2.hash | 4 ++--
>  package/libxml2/libxml2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 35c8810ed9..849d70cbb5 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.sha256sum
> -sha256  c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d  libxml2-2.15.2.tar.xz
> +# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.sha256sum
> +sha256  78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07  libxml2-2.15.3.tar.xz
>  # License files, locally calculated
>  sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 0a365fa689..c1b5c4033c 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBXML2_VERSION_MAJOR = 2.15
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
>  LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>  LIBXML2_SITE = \
>  	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
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
