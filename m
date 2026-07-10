Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E04C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C45F40DC0;
	Fri, 10 Jul 2026 13:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVay_7JTsRVv; Fri, 10 Jul 2026 13:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334C740DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691577;
	bh=d1yXUmVCFvS8LzRFkgG6O9uO82PvPxcC9I/EJt3gVxQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EODMVjdnDsYcpI4xbCWpoxnmnkfRxEyJGX53AEjnoNV1oZeqe8475FGHGrbrlWe+V
	 r3pCH8stD/izSMVMVHwv++ferEsJ69etfCyRBp1EWHUppUDxai0XIFYC1McfEglbBp
	 ZEvuJ+QAvvolcUmZKHNiExQLGaBoMu9LeaCMi4s916TZIjkeDco+E8zlUzHCSHOqpA
	 jFM50j9spyOZuzfFLaQsRT9Zt/2Rr3Dea3u+7qufuHkv2rkDxmA9GsxUFl+a0kk9hw
	 fYKcKcnYoSM/FD4szpba2QaIviBHhcxVTDRfxvs9kZGx51zxuPOCwEID3u4vInKC+V
	 /hZRsJlAXBSZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334C740DF2;
	Fri, 10 Jul 2026 13:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7308A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADA9681180
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gut2ylmXK48J for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1B488112A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B488112A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1B488112A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493ece78b0cso7538805e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691570; x=1784296370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GXoX5M5rKk1J+YX5QQBNU9FzWa9NeYO7a9odgjW5qac=;
 b=j/kf/8EieTG4P9lxThT0ZH7SvDDZKyavKEEHm2WexNOsOgJNqBRxvieCaz8SC5b35L
 MIMX1LDjNabll0SbhBuEP7UHxRzq6jE9SbIwCY1c7j7o8cH9Zk8DmcQXP33JbY0VD2IR
 XEhpo4a8WQjKSC3WVaHtk4J1guCje2cuxB7gbL1B7IiHFhqOZQR1f/+fE84DIyb+nTMC
 r2dEoxzLOKUfoI5yd3NMe/+P0e5WufQe3+5LcP4yYCaMjwZgQg1q7M20TfeyUCNaXGnU
 yGBAnx7cgwNcSd1o6yGYfl7rExHdIT7ftLVacsqsetBC1ZoCEW1oyukOHafFlk+BOb+h
 mMbQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoFIcVLfwf5iOwC+SegJwyD1AvWh1dcuiQ9sEvd2v6t+JgR9VuGXxAvfwnq1mFR6YCpQOSLpeIXApw=@buildroot.org
X-Gm-Message-State: AOJu0YyA8tUhZizPkUJpTuHYkUiik3lvMVINP7DlbM1H8Bp68uc0BQig
 DZUknS8j2xuaVXweeQIrrQ06jaPTlg5qpBlM0IT40I1r+dA0KC4/KxDsabJ4O4KP3jY=
X-Gm-Gg: AfdE7ckD/yt7NbMMvgczY/GpzJ8Aj9rKUeqo1wY+lIs0moJeTsY3zgX1yI70Yy55SkD
 Id+CsjY9pbsj0djUaokw9zXpAJhizHDVbi6rjxSrRyvgJyI9PMOpkpIQHHXXl7uZRadQDkFFfxW
 wEAFxSQY41EaEm5UA7+Sq3l5zxrkMcDWJkYqrEh02tqHH2rQopxEo8lnkaizbtZI9IUbeDIDxkY
 SVuCuvCGZjaotiZaABaThG6K2ZcfMvZN5jQfh6O5Jrrcbqzv1iNNatrqqANcaeNZ8zl0cdWkL4n
 nyzy3hy6HBX/ljEEerm47Jv6tLEF36AW8kbaKh8HKTEwtTU8wVaI/0jdTtSQxzuMYeUINXI3t9t
 lSvGaoAambm12BNhoC706/LKorqcKThW9zv8qTkQxK7fUGQ9p8/o1Iek2I6DkSAwvgr6n3zrldp
 hMyAzt0g==
X-Received: by 2002:a05:600c:1d15:b0:493:f762:45d4 with SMTP id
 5b1f17b1804b1-493f76245d8mr5995525e9.2.1783691569582; 
 Fri, 10 Jul 2026 06:52:49 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccaf1sm248631875e9.2.2026.07.10.06.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:49 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:48 +0200
Message-ID: <20260710135248.761085-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703195000.3703134-1-bernd@kuhls.net>
References: <20260703195000.3703134-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691570; x=1784296370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GXoX5M5rKk1J+YX5QQBNU9FzWa9NeYO7a9odgjW5qac=;
 b=bElXf/jHjN1cRz1eea/OJjCg12LQnxWhiVC5kgrlM+/PQWD+m/WSjNbRrWj6aYmVvE
 pMW5HU71RKjuMYh2cZVuRJ5S9PJPexVH81eAvqtiNv4rJ7vaiMQHAGNOx7cED4VuKmMD
 GCOYhE3f+vYGs3F5FMNoh/0qrDEDxVxKuWmnzo2TE5olnKJl5QLEXZI1Gq92abY9QFK+
 mnKTTk1m+V/2rJJAhvVGxbM+O9IM3fD3eurWoc44TM0d9sTLVc55VyXG7XbRjB4Fkw3i
 4hP5/ttt8T4T1gMGgJUaO2id58g8t+yyHN+CfjkAgcfTngzBmvdnWLT5xxfT7tP/hsqV
 u6BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bElXf/jH
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.7.5
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
> https://github.com/OpenVPN/openvpn/blob/v2.7.5/Changes.rst
> 
> Fixes CVE-2026-11771, CVE-2026-12932, CVE-2026-12996, CVE-2026-13117,
> CVE-2026-13122, CVE-2026-13379 & CVE-2026-13698.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/03d2baa5c943ea74a3fb5ec4220efa52b52084bb
> 
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 438212a4bb..651f430534 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking signature
> -sha256  18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce  openvpn-2.7.4.tar.gz
> +sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 68f0d30e4c..d5fd308e63 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENVPN_VERSION = 2.7.4
> +OPENVPN_VERSION = 2.7.5
>  OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>  OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>  OPENVPN_LICENSE = GPL-2.0
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
