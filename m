Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D0ECD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429D2842A2;
	Fri, 29 May 2026 08:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBctdvhI5L48; Fri, 29 May 2026 08:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 373888429D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043397;
	bh=FarGK3Oup9QwzmUdMLrdjU2x/65elon3vV69eU7SLTA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KbJ0SYfx0NbzwhMGMDeA6BN+OM50V9opxsQMCEwGXBzZY/ZmKxPNO1HQXjKXl6PPT
	 WhVzI7iHiLbb/3a8iauxSm1h4RIO4t5bFYucJzIiW5WkaGNJwMfcdEdlWHDDgKPWIB
	 piv0yRS86AXqw+yy13a23zYtq8ZuAqD1vDmZwRLtaRGPGvdskWhJ0zUbixKvmohHVV
	 RFZQBdXxZ3Mtme4Y2S2WophbhQZcVIz2z10Lch4iqoq4PI7bBGMOqgCgpanx0Oc0hE
	 t+oB3rKKgEhMI7MEdoSCxEO6CICJVJ/x8IL8H1eQjsU3R20T0f5X0ls3LyLeQUG2od
	 nEJ8JNgg2W3VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 373888429D;
	Fri, 29 May 2026 08:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22F64288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29ECB422B2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBEAcaC6eiHL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2DB2422A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DB2422A7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2DB2422A7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so167460f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043386; x=1780648186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PIGwcr5kdhfeN2GcVeU3gK+xKoudd/PTK7AAF0ZvuVI=;
 b=TcT4AeU/hUIYBRjexChx/4KlXz2Y6rolaGE/8fG/THFl4d22YVc29C+1wliOrgfaea
 weBJsJHCtJlbpLJuGQ5l+wsVeG7GVtCKqpqiwM6uYRh3Afz+C0+lNpotzz2zoMKz5nfA
 ccUMam3LZXTmgYe62pBMg6izppFvN7MNgccMwEvXv7ev0ub6URbLZIZP7UVKHogoclhC
 5pTdFJSZpCz8ELevBUR0Us5aIQ6kYBik2JgiRVAMEAlGqDepz/aNRygRexVna4nmLlsC
 cI14/vYDnVNWM+L53fFWJuOg6a4NlWmcN5g3uGwYzuyrCCmD2SB8afiBvXzunvdXLTd9
 uuMA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+PzN+v9wpTmU672fQfmOSLFlAoAN58mMBUlLk4m3ltLzKw/n1l0++oT+IHzqHtzPaYXayyXoEv1b8=@buildroot.org
X-Gm-Message-State: AOJu0Yzgzsrc4YYyoAfA0v7NbdebM7ZdztpNPxV8ciKy19IemWifhjI+
 m26dVyAp0MvukILpkIxrmCx4yt3qCpAxKyWpLzKaB2gBU7yNdhMXzJM+QitSsPoKyl4VvQ30TQB
 PmqbM
X-Gm-Gg: Acq92OELlJsj4+p8oUlEbF7JqinnW69H8H+fpOfBaysP+8daTmidOcHh1CTIRen0MuK
 q5hNOpR8DvADPnwyCpcPaH3Lcdq2ke0CMXwMSYGOz6En12ceuAEwHRnUz9LDScTeUxp09KVmzKd
 bzH2/cTztkNIVtpCfjCsrlrKqaGOLoWqtSbvPzRaD3iRVYkWe7gyv1beYXt+IXkJpgYSk0Ftkds
 imV1luJYrDaw9kRmax4igxdqdNaCO6T2uPpr0kbLQ2cltyRi5JXfiVwYQpXpMuGzh//00TO5lqQ
 WlOzEM1MIhFvbwUwuDjwxTeAqEkY3eTl5irwMzsckMGgv+3tUWf/3hiANcXbPuh4IGaMfRLkq9A
 fvI+Fdax3E/kpW+hzLRM4XohR66VH/7TLBWg0nHjooFbC4V3ZgbzCa/P5LaIjit1HHVXWBkt73T
 Y0pD26Lh2E6rE7IpLBycw8Vx/k7TjQISR7tgqkcS/AawCEHa96G2ToBCuxRA==
X-Received: by 2002:a05:600c:c0d1:10b0:490:5e2a:f924 with SMTP id
 5b1f17b1804b1-4909c07755dmr24438175e9.7.1780043385591; 
 Fri, 29 May 2026 01:29:45 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm48808305e9.4.2026.05.29.01.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:45 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:45 +0200
Message-ID: <20260529082945.58145-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180436.101380-1-bernd@kuhls.net>
References: <20260518180436.101380-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043386; x=1780648186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIGwcr5kdhfeN2GcVeU3gK+xKoudd/PTK7AAF0ZvuVI=;
 b=MEirBwgm8WDdZ0tHOvkEmrGcFCsL0ZsNu3kMdhQUIK+eA8lH39i15wiYGy/EemJh1R
 Cgq9qxmQVl7EzNtUNT3hUKmZUb7NhRbXnOWUjypfyfxN3+338z9oKwB0csWSrA4rYsXv
 gVVxAGpYOlY6LuxxMcXoUxoWQ0FO9Fijbsffw6/hg/LNaB9nqW5Aurqi+gns9PvhKZQK
 t/3IIOjqOpB18+hfbitfTM8BQTRHZ1q1/RAZfe8CSF3Omvh8bg6biz85WT6A/f5d2wgo
 Z4nPNLxZ86PS4qMHaDfNMjk8os+/uwZNxy4l52Mhu727BTVFKKIxV4zKn5NOO79EoVPV
 sbDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MEirBwgm
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: security bump version
 to 2.5.20
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
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000505.html
> "This release adds two features to gpgsm and fixes a some minor security
>  bugs."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index 2aab6111b4..f69b7c6eac 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  dbe9ce2aca9d553ed4367692575cee15204a95a6  gnupg-2.5.19.tar.bz2
> -sha256  722aa8a426dd9b44e0d194b73bfee3a3e617d65674cd4d1d062e6df29f1788c6  gnupg-2.5.19.tar.bz2
> +sha1  96371ec0260da5a22edbf8e4d3bf0e54b3ea5b8e  gnupg-2.5.20.tar.bz2
> +sha256  6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6  gnupg-2.5.20.tar.bz2
>  # Locally calculated
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 499532c551..7756023798 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.5.19
> +GNUPG2_VERSION = 2.5.20
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
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
