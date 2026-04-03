Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96275E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A4FE81A29;
	Fri,  3 Apr 2026 10:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWFDef_jT-fa; Fri,  3 Apr 2026 10:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AFD81D02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212098;
	bh=cCpp2up0FXks7Zk8BBoBRjVzL/XPSz2d9aK9wOucdNM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=biEhDBIJhpa1gE4VxKjBfL/mB/WwjKyaIzXNxKlx9smKrop8cbGssFTHXouJS+4A2
	 smY8OM0LA3vSUcnKsfumTfClmZt87Zd07633vj6NIjVVH/SS9W2nF+YIy3KiLiN1Xz
	 F1OU+zbxwILIPmQC7CpHytsCkDcJXwEz8xqz7paMcElgvmlcNRwxo7sfFHMCQT5GI8
	 uwrd0K3NxZbnvVkAWhCe7RGi7aguGsxH593om8K42LHXzxi1Y6ETq9xWLl8oClQzSR
	 a6irCqdWn8OKgEdXGVmWZ6j2zbA8rk7Q7T2x7zldBdTi7g1GrHPFDHUzQ1uiOWo1RW
	 pqN/Q+dZTjmcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AFD81D02;
	Fri,  3 Apr 2026 10:28:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A51512CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 975FA81B99
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8CLRn8tigTU for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85CE281B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85CE281B58
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85CE281B58
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so955115f8f.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212092; x=1775816892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=czj3ocifZZo66Q57qepqHfbIcMXzKii8lCIcDEsdoXo=;
 b=Fwl+f3oLS5BSmGTjjMrvulpZh8StxaMj3R3NcXFEt6S1Ddww8HJL/Psgsq85qR44Z7
 dpqeqA6uI8c/h+lK2IkySSNGFzTS81d+OU7D4G51RFMOUGz18tGUp2VtaIXOWCtBupX1
 reThtMRyt7s9w1ViqyYxBTpFazZ65exqephFncmRpiSyQQ6+T1CGttIQoQZ4FKXhOZs2
 G9c85Q2M/aA7grabTFjQXC37gLwvzL6a/uL6LGb6uO/7MVWReI/d/p0qxZ8LrFC4XJ3k
 eti0ZeXjxVEvtG5/f1SGRhCWi+3M1CLg+lBJTmAjRY50NaZVAeywtMSsiPWSQbIW9IWP
 Z+mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQlMGMZ8MHLY1IEcpcQjVZ4h3zlI9BBwEsgunYTOkoRG4dY3NUw0X7Pb/2uywt/ChBJ9/mIln1Dts=@buildroot.org
X-Gm-Message-State: AOJu0YxOWYhZNL4X7QK+UpySIQdGjymqXOgfdfKrTKtpIFyktMpthPx6
 qT1cBWlVWRWKZF2uhyKDCEamPJHHw5kbKzoPL/UrTpTGuJdofdOu0hqSmPrpaEmQT14=
X-Gm-Gg: AeBDies+NVsIYAWa6AL9WSenx/Ax99dgduJemxHDkklnojSZ5X40AfC5ajL0FswIZ5q
 hNaRng585BaKpuIHtzMoI/d2BFkImb9XW0DUw4NiiQIss4jcxsQS0QbU3p4gSQsQz76lBtuiXx2
 H8cXJLrUDOAY4CNnVLyjtYIkHI0ky4FeXlHzNUq8omKTBMnV6VHFtONKfQpYl8mPEE/HtWvGJqx
 5NT6lrkvHGKGekcuqeTUctLWW2jVE8DdRkaysjrogOcK5JKKft77+INVyuCHot/PRvC3tA/K9Do
 bNwQRtQRJ4lSJ4Ws7+roZHlseDo7W6ae5ovwLE0NhPacB/preaFFuypZkWokNAz42gd7D5f+9uk
 FntAfpbinWj4mneUsXf5THGP2EtCNuuMSKx9s12DTd49+gx+HWySxTmMsofxc5Fj1lucWzcNxEW
 oz1ur4VGrjr10rJl39
X-Received: by 2002:a05:6000:18a3:b0:43d:1bf6:91b with SMTP id
 ffacd0b85a97d-43d290da62fmr4039253f8f.16.1775212092359; 
 Fri, 03 Apr 2026 03:28:12 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2971sm15312206f8f.22.2026.04.03.03.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:11 +0200
Message-ID: <20260403102811.210464-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326211631.3598817-1-bernd@kuhls.net>
References: <20260326211631.3598817-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212092; x=1775816892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czj3ocifZZo66Q57qepqHfbIcMXzKii8lCIcDEsdoXo=;
 b=Ni8y5ucfoL/zX9qmHoLA0nXznloidNvMWx+mDvmEDLZXzj70EfFncO85WJCHQsdcbV
 6OPL7+V+LN0JDFPR0TzuVb6BpxtWimNjVNeUXbQFKyop+Y0VeshCFEdDAMkhVilFO1ys
 qAC5XpNh9GTJOM32yUZPqBYLt/+NuPLJGcV/6ukiDmdYBlC6cryaZqlV7znCfaYEt2ji
 6AV8uHLiuVgwLWliDqEEA73JgpYccl3/Ak2H/tX+BGLVsiJW0H0gs+jpv6b9hT1av+0L
 +OkP2iOWo5f41SMIqcB9Bo3a41jBSp4OCN2auU4yJNBfVtu6F9KrUnNnb8BpXXN1rQfL
 YO3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ni8y5ucf
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.6
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
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.6/ReleaseNotes
> 
> Fixes TROVE-2026-003 & TROVE-2026-004.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index a4b0af12b5..a70b9e9baf 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
> -sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
> +sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 36be7967bf..f11afcc449 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.5
> +TOR_VERSION = 0.4.9.6
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
