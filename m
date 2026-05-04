Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA129CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4B19845F2;
	Mon,  4 May 2026 14:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDHhpCyZiibf; Mon,  4 May 2026 14:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D145684651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906076;
	bh=JBIOPDhU39KrVbOIZy2TtbFcg7KngWQPWL9R3imym8U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AU+OZ2xXgZp8ZO7prblD2srU5fpyX5Za1WXgV8l0GgwuzvRJRc3P4US5OOzRiVgyw
	 2VBCBBcyvyaD61lfNJB+LHK9Y3LNh8t4UQXTV9Umey/PoSfvG19UWRpQ40KeAX1F+n
	 yzTV6Du8vKwQY2W1FR1ERF4IS2jB5HO1nGwrS4RGoVUctiGPAylwNksIwM7XxYHMEt
	 mPVggbUOoYn1OgsracwCtMwJk7lt/U7oQ0U+5LABwIjAV42jHrES/KwfCm4/OkdGsi
	 uZV2SnLZ8JH+pLSsY+WE8n1AAbutC5Bq7h9IuVqSKJrcXfxKNmIaSEBMJtznQ/lusu
	 kQ42jQxQ6r6Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D145684651;
	Mon,  4 May 2026 14:47:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB4725D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A822C40E08
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeNnduCEQAkw for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95F144079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F144079C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95F144079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso52337655e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906071; x=1778510871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jPBi4dm7PhYMcOM7JGay3QWUHuMn7I/KiESQ/d0zw3U=;
 b=p2gl2dRXd2OD7XDqtd/xofL0v4Qtr30hOqrGNLdLZjwxiDl5hQCJxht+mgF/YsNeVt
 Q6UeiqGWtB2QcPT2mf01zgVcvefy3Y5O+QtQIatH+mQMnQWD3dev5tONdOGOScwz06QN
 KVs/1vhSASlStefVHZTehi49JW8wishSMkJPNF/+MleORzJocvcCk/YzPxsSsJ94BBQ/
 V5Y28VqwjjX68aKuRQzBYp7RptstQqr51z1GFTVm+JhkJ8iLKYgDoj+YUzv3SLFhifXz
 395n/A6OPacJVzznTIhRe6QGrv092UvwN4tu8hD9NB8ells0ju7G36KS143xmEMVSwxc
 LkcQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pKVcWLrMq+yo0PTiANBataqCDpWFFuMK3bHXTjYC93EX4O0WtdIPdAiAWxruVVJRd7t342O/yzJk=@buildroot.org
X-Gm-Message-State: AOJu0YwAzqhpVPe/tGDod+tk2kAdPFhjMBdxtsljN8ZzLjadxooClFW+
 WuL6yB3pHfFTNpZ2JbMC7mv8ri+SNNiNoBoO2t50CTwcu3QnURRjbHYUWZF+Jgxqaac=
X-Gm-Gg: AeBDiets9Lvo/9rxpWRBoUtXJaa3vLyC/Dm41TOxW9YIbWXVKxEqHutjwnxD7NDdAgU
 Byb1n6/j44/L4qMx49UpRI7YTRBxCAc853SuPtWiWRhUfoXckm2uH2gOTrnxWijz4PvfQBv3dv2
 +za7rhEBvbL4KRpVl0/4lIG9UVYVWBSc39DcPYRwELSdnLR2nG/XqwiK3ujuL4yCtuJKzbEebet
 LMGjUfjJ8TrawTdG4fV1SvHCzA/Bi9sR+ivYEtLUsy7tTUWD+OnTGq35AyPsFZR00CfYUUS0cVY
 EOw8i0eueLAr2jbi01P+xKOQHZ/D/4hQNFiasxaexJg+brktJjZeQpt0hpnDw6057F2xRF4U1ap
 q/kJYeXa0UtEpueJrp90g4vlrVXPOM7dSjK7mCOu8vFNxlEa7+FbcoPj+uJ9UCdbRZJnvvZixMR
 p/CWtqzXnKpJHgOdRrfpIcRlmiXQ==
X-Received: by 2002:a05:600c:c0c5:b0:48a:72ab:f88c with SMTP id
 5b1f17b1804b1-48a9865f865mr135056565e9.17.1777906070629; 
 Mon, 04 May 2026 07:47:50 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822c3422sm306233215e9.8.2026.05.04.07.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:50 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:49 +0200
Message-ID: <20260504144749.10550-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426084054.3305901-1-bernd@kuhls.net>
References: <20260426084054.3305901-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906071; x=1778510871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPBi4dm7PhYMcOM7JGay3QWUHuMn7I/KiESQ/d0zw3U=;
 b=cSrhbKY8AjVt43PEXB1+4J7FigF8xidZkJYAWhlLp7upeEXsnDbIeDQwvP8JSXRWlg
 GmtGtS+YUOMbq0DZHuzBQayDxf0zeMV6iIpveZE3TRTFMAA4xnHlVzxzvz5dU0mqJx51
 RX6085u7jRYr2vA6ts2eWlEixgWrFT24XqIl0y7nfrlsVMulU/rDSnYTAWIqOmv8I2HG
 F+0j8a8jkml6P3dmcuj9IcBJtXCg5k6gFpXp/z0mv3pP3OhSvCqfGCsFRfZWP8MkJ1Lw
 /L3bxoNO21pexF2XYuQSZ6Rbvv50mbPaP8wIU5nqOdgac8rlz88FCQz/s6broXruXORf
 T2Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cSrhbKY8
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.0
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
> https://github.com/libexpat/libexpat/blob/R_2_8_0/expat/Changes
> 
> Fixes CVE-2026-41080.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/expat/expat.hash | 4 ++--
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 37a9c2ab9f..a0f8b514a8 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
> -sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
> +# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
> +sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
>  # Locally calculated
>  sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 68af751233..07c209543e 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.7.5
> +EXPAT_VERSION = 2.8.0
>  EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
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
