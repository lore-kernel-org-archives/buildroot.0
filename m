Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC53CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47A24224A;
	Fri, 29 May 2026 08:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w58McceEL4DM; Fri, 29 May 2026 08:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6106742238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043361;
	bh=z6t5nacq5FUOfatIh0eU2BpTlfi5rLw/+HSDKmDBqTE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RIHEFTc9ZJG8UpI4hOWu4nbnVD+6RoRaYcFT7ywbbOWZ7BFKTyUfkbskkn5PamJMD
	 xAOFGGWYfMf7iHRJbVET75jpq7pAipjbbR13p20KPNmeU8LSL7HNYHIzXB6JgZgS9+
	 KqM/GCDPUT+6O9hHp8v1MBZrzPLaZ6xPezm+CS6EsFhdLyj0a3vxC/2qswTvrsHnvb
	 YyEcQ4CatA4Ewvdkg5eK0qKtNvYKot5I/DmtG6vlQJNMazk6Xpq0MGfKsCz1DqdfjI
	 Vsc57M2lA0xbkmRyOQHQX4ZhUupzbh7m4Cz/eUA1dXXRVEkKV3izFsNXSOgyehAnjm
	 Nii2m+bBNgviQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6106742238;
	Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 124ED288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E79214221E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9uY3PsRIPFc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4976242209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4976242209
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4976242209
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso51616325e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043353; x=1780648153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v5VcGvfSIkbO8m4Ub/cBfvb4n+jvFEYLzOUVdiJYq0s=;
 b=eOQVmPq/F/wHjrghg1XJNwJDiAjSSCwaVBwgPrGFtNdL2q6pznlusDIOJdmeDxd4CH
 2TPLJ2/ucG01hFmbx/et7Ftj270GIoH5VPcb3H6b8cdrBcoNcZHyL91EqkSvgl7XunZx
 0/sW3/1zGfNhHZ/6Rb01IEEBPNq6mnLIgvvfApLsG6/pJ9RGWolJpVsZ/y+zZsq/BoRG
 A+/zhVOPDks6VPnaB0+ZCFcettFEjjTCmCtj6XUDaMxSj1MeWbL9w7FkZAHMyLRuywNo
 PrhHPLwf6f9kiz8aM8Y7MHiLP1otLn4WVhvrrcZ6EPrIASVCXjGyeVTjAjwDStiMJR0h
 A3ZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2AQM/z98QSbESnLFYHF2PpLlgO15PHYQMap+SVnQ/LNoIAwODPo1VydEydLrer1RY8kv63BTT+w4=@buildroot.org
X-Gm-Message-State: AOJu0YyFa0jtOmMTcq3t96Fwne36f7u0dX2wuRTHayErkMkhzZ39aAmu
 oDYjAXVA511i53wK7HJ96myaxlllTldIeJXjpYeh5A4n63lRjy41QLnsZ7/pEBmtv+s=
X-Gm-Gg: Acq92OG3IIHUgpeh7oKknR6vBpdTO7bnEMwMe+i9mrfmNStjsAztbg7iwWIsF62Bl9F
 p8NzjNhzIFBfWNdunKiKzWPuYgxfpxsQuR2d3VQvL9han73YaZn70WgopXpWLe+89/TVAF6uPBV
 f0l1YIeXL1Qjxepy941aCCGHNsLOLns0ZBOGsLLOi5EHbOOQJwDTM0B0ZCzey3GCg6cWgCpYzkN
 ZrCQVtvtaK/kdfQDb3aTGJqGYnUcDCnnNeRVm1k/yY12RFSCSluxTch8IBtg9oI9/1ZWE3Lk/T0
 QxLKzVDUXTk5I3BwkbdODMIdTsnim+CNy78bsdu3iioUg5OzQThqON5STdNoQ3PnI0i4NTLCwDM
 AsXXt3tQkvmHTPD2wjY93T8Liq/flM39zHhD+lpPBP3K81srGz5ZHowlGDhEmsEsd6PU0/i/+6x
 wZ4br+FvoMSEcvSKfDWwcUILnoTYfFDRSd+ZN22gRv8Mb8o8MSzbCxx00pZQ==
X-Received: by 2002:a05:600c:c059:20b0:490:4f07:6d15 with SMTP id
 5b1f17b1804b1-4909c0a8741mr23764915e9.17.1780043353155; 
 Fri, 29 May 2026 01:29:13 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909caa7faasm29530215e9.11.2026.05.29.01.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:12 -0700 (PDT)
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:12 +0200
Message-ID: <20260529082912.57023-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260205182549.3299927-3-fbstachura@gmail.com>
References: <20260205182549.3299927-3-fbstachura@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043353; x=1780648153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5VcGvfSIkbO8m4Ub/cBfvb4n+jvFEYLzOUVdiJYq0s=;
 b=JD9SgwCexRSMubt1XnCeafqdolcAZiW9s5pdR1mG/TL1KQ6b5+yT9BfVz5MjmB1gfn
 MgqtC+L/mXgzd8xR+8qX31tjqcCGvJVXUqoRTYJyafUOI9W+aC2CJ0T5bs8mDVnhFwyD
 lRaJvrVwkODu+pPAOANlT4UgEytj9DiQSEOAjStRG7BVcoJjSHybXhdk+6ARzW89duWC
 zZGo3dykmbJ4MAdnbUdKXdGGVxTzXtK1UHNdUeFxTNCn5eMgudS/WxPIz4lP7MeCwJsa
 pPU1wuIw2f+gPk/MXzTk1zdftW3lr3cTd+rRnmHUVm/3LQuBMEvk/1oOcMrTmi43ggRB
 yYKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JD9SgwCe
Subject: Re: [Buildroot] [PATCH] package/memcached: bump version to 1.6.40
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
> Release notes are available here:
> https://github.com/memcached/memcached/wiki/ReleaseNotes
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/memcached/memcached.hash | 6 +++---
>  package/memcached/memcached.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
> index 781897b6b7..fc6ad5eb88 100644
> --- a/package/memcached/memcached.hash
> +++ b/package/memcached/memcached.hash
> @@ -1,6 +1,6 @@
> -# From http://www.memcached.org/files/memcached-1.6.29.tar.gz.sha1
> -sha1  a9699aed111d86b6e37b3ce5e6ef4e7539582d5f  memcached-1.6.29.tar.gz
> +# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
> +sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
>  
>  # Locally computed
> -sha256  269643d518b7ba2033c7a1f66fdfc560d72725a2822194d90c8235408c443a49  memcached-1.6.29.tar.gz
> +sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
>  sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index a01d5aa9d6..d3ec9d36d7 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MEMCACHED_VERSION = 1.6.29
> +MEMCACHED_VERSION = 1.6.40
>  MEMCACHED_SITE = http://www.memcached.org/files
>  MEMCACHED_DEPENDENCIES = libevent
>  MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
