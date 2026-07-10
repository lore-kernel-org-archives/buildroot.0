Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373BBC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5D6811F1;
	Fri, 10 Jul 2026 13:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2Wzsbc-sLvl; Fri, 10 Jul 2026 13:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B8B5811DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691541;
	bh=5SkliM2Ft+1884eKJYWuMmd0AtMSknUicHJyensXbQg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IZykiSjBWzD3TYiJDNdForeHwAmjLwiZTn8uUV8N9EmAv1KSmFThWVXYmKUFZkDDG
	 vl6/F5L8mDQwbyIZ4RabiUXUuJZsqpG0dysSLqM38PU/r3SkZGw1m1DGarz/fGomdv
	 pLjqMEfF/OFTd3gClwwAbIsuK1WpPKAUbgEMIkB51bfez9daqQd9Onzk9s6g6nfRea
	 0dEPvgk0qahlkcjJ95PqllhLjXnBQwpL4wfTJYIJjYtVz65E55gwGJs+W/7+SLsZqz
	 z1hag/g1U7XDFB9629CTGzOjXDN134YZV8WdZA8sKCVxrxCsTsKNL07/h4iGHROeq4
	 /851Lk/ma9Qag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B8B5811DB;
	Fri, 10 Jul 2026 13:52:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2182FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E50D606C6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccs7RovsiwOm for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22133606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22133606B4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22133606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so8580235e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691536; x=1784296336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hF3j/FMBP82iQLK/bROM7v4MgU93RW5XVCH4piUjh90=;
 b=fszDR64/K5DadRBb/rgFMApRjIM36Vf8SBZvAJ9l2nWsJQqwls+8/poivZyPnfjYze
 9xmXp0jcdwHrALzjX671gH4tgX4GYH97QMk9PD5YEUjFWc3ZASFA4vlBgqHdJOokIkpp
 rync0qTOchsYABo4mifx2Y+efHb9y208Headx8fEtf+zVWdKtXfPtU+GARIyR54//cjk
 78fSoa96NSOX3GJVX/MWvwgSqVoJlmDu7toljt0DHDvL2s/DvmogXnt3OwX/wblLaIU3
 aTiSOomQ8FKQqvf2+RakerBUJq1im7izWMebcYwxxbnLNocr4uHrX3wWjx6+8LSuDTpy
 sVcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+eW75mpWUkAkRM/EGDGildcdwE04anXlGLRHSLv04unKEP9YvKmHoVY+N3Wf8V2CT/Vnn0jsJ5Vg=@buildroot.org
X-Gm-Message-State: AOJu0Yylj3ix3mHbm4X6rARp5yjZ0MDgrQ6iwf48ucyh11a0p8E98VXH
 YIqpUd3MFyJyRoE6QHv3su3DIvbB94dHYs169LEvgcla/tWyhL20cp7u5t+yFOa0Px8=
X-Gm-Gg: AfdE7ckIRDPt78z0ax93/ti/CvHUGaxSmqSd0IurqDY6aBfhhlhsmctUtCJm0OYsYz/
 4krm2dLui1/50ttLO/asU0J2PR23Sd4FCSXIokQkbhl1Em9m9bHBY2wB8MiH79Cka6EJKCXhnBj
 dl63wTK4MytX+t8VdC5BVm5W890Sas4woYVVeSLHpxHCwRo18JP++lvBUhyWS2AOwNi32iAhOsJ
 fSRA0LeAAZ/iRc/obS6z+8gTLqaSv0pkghxg9J1I0436yCSmg8outoG2WCVJwwAPATl9ENgKe6H
 KY/Ph068s4rWLT30ea96eU3ppablaNh5L+YhPG9aDK0NT6hTCrv4n+QAyUx/t7Z4MOUCNKvPU+a
 7dAN5I8FtqBAWmT6HAm3sBoNTbI+fv9GwmGpSTeeyqVDSa+LNSgsAEcawx0z3NzE4iXBXioAiY4
 hdRAwa0Q==
X-Received: by 2002:a05:600c:8b4b:b0:493:bfad:9d99 with SMTP id
 5b1f17b1804b1-493e68c2777mr119227035e9.13.1783691535840; 
 Fri, 10 Jul 2026 06:52:15 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm62693465e9.1.2026.07.10.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:15 +0200
Message-ID: <20260710135215.760629-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705074630.3245449-1-bernd@kuhls.net>
References: <20260705074630.3245449-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691536; x=1784296336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hF3j/FMBP82iQLK/bROM7v4MgU93RW5XVCH4piUjh90=;
 b=bfq7xK2m/rp0wfeTBBD8RKQffvao1+n8hVXHKyLmxpNTAsxxU1oiIoSvMMciNjTupB
 PM6k878fbYkeWpaZEv5eKOlUDWLzb6RBmmBYHhB/6yxs6gYK3LDdxuiBxMeTnf8KJ/PS
 j4ZQz3xFBpPgV9F4vmIzmH1nTK0+OITwbp/vGgRu4YtQ2dRzlGmw31VLbI4YKdDWwP06
 XL1ibuR5z19adGNvg9iF7DvZP4wn1OatrVVFqX0yuoTH+5KxtFJAU4W+pQ4E4iYai6U/
 itXSz29qvoPiJ+TGs3Mz5tzbDFEvgcwpd/EeC700GLQv13YnP1kd5v4OP9UPGY1NaCrA
 X7kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bfq7xK2m
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: security bump version to
 4.7.2
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
> https://gitlab.com/libtiff/libtiff/-/releases/v4.7.2
> 
> Fixes CVE-2026-36849: https://seclists.org/oss-sec/2026/q2/952
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commit/20f354488e98eda2456f670b45567c02b01e8f23
> with the exception of unrelated build errors with ghostscript.
> 
>  package/tiff/tiff.hash | 4 ++--
>  package/tiff/tiff.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
> index ff0b698345..5c9031bfb4 100644
> --- a/package/tiff/tiff.hash
> +++ b/package/tiff/tiff.hash
> @@ -1,5 +1,5 @@
>  # Locally computed after checking pgp signature
> -# https://download.osgeo.org/libtiff/tiff-4.7.1.tar.xz.sig
> +# https://download.osgeo.org/libtiff/tiff-4.7.2.tar.xz.sig
>  # with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
> -sha256  b92017489bdc1db3a4c97191aa4b75366673cb746de0dce5d7a749d5954681ba  tiff-4.7.1.tar.xz
> +sha256  4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88  tiff-4.7.2.tar.xz
>  sha256  0e27c2382d7b8147972bbb746e04059a1152c8d0fda9d03ef1399d1a433c4ade  LICENSE.md
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index e64a6baf83..b1efa5be5a 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TIFF_VERSION = 4.7.1
> +TIFF_VERSION = 4.7.2
>  TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
>  TIFF_SITE = https://download.osgeo.org/libtiff
>  TIFF_LICENSE = tiff license
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
