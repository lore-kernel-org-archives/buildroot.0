Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35890FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 083EF84E6F;
	Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzGcXxEIzUuE; Fri, 24 Apr 2026 16:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5678184E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048048;
	bh=e+bFSr5zZNZ8jXko8YBm1Q6olANK/BswAAFSmuOCLJc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ban+P3usr+U26LNsLm9vfbOdt4tW6fzjCS6yF+hFxFaaMujbCvwJZNKn9XyD6C+Uo
	 By13oA8f16hVDjeiG6X5OzCiCSCeNj7FLBIPWTXAeWO+4+0RQ7csCBU9U2OBcdKUmd
	 5ZRjZJsHftPBMUJ969ps/23idRJhE2nh9vmHsuHNckbZTyDGOcfTEsjG62DG44Ik3f
	 xalDrsbkSQYPfdeKPO1dm473MmygqS7jDorVBfEOOONgAcAXs+BA5cW3/6S80hFrjl
	 4AcjB40p3IcVsaHEfVaTCvbJMDIiEVBbaCrzdBbXlJiPMvXVt8Hl7OSXXTkSAMmOAN
	 wZhO+MIUnFpvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5678184E98;
	Fri, 24 Apr 2026 16:27:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9C5194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CFAB61C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoA1wY_qKyCe for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DC0A61C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC0A61C30
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC0A61C30
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso51781295e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048041; x=1777652841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cBZdrOAlbn3+mjE0BCW66PEOKsEFWiG5xwzzdXO/Zi0=;
 b=sJr5hlcfbMnzvl/7s7k/hwl85RdbBQ3Xyhwy2HcmppLYET8mTQ5/bE3u6zKCp/FYFZ
 rbgFwCu/xL5JjLSX1ptHLVwDbzyBd2SWnD8eS0j4cHjjSkzC2lPsbGURioUkokg+/OaH
 oNAxESFs8JrMSRaukXr4HX6gQJryr3YXPCRXlvXvJTx4gNE1nlhdjjkWlVuEo48CMjY8
 fQgezVpo+g8vyuDuSau/QJ0BquAS3oXyt8ZbzLSXEv+7EYolooG3oRMcZeaxhZ/GTyFG
 NaRsKBbSXQLoKprdr/uNQFJtUQk6Mr1OQofrL66iZ0sUxIvGkQu4K6SM//0pmURzXvuT
 ygeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+vvKnTLqsoCcAliXWdArgfU5Ue+955WfuiqupCVcsie3qsCTqrRmZuo1XA4yM+fpSgEtKcHtL1bOo=@buildroot.org
X-Gm-Message-State: AOJu0YzmGW5IYDnFfOOayM5LLYrcK28yjyl+6fpO0seZVHnGBomfN47z
 /AjIw5cdnuhtvnUqSh5ot2j6ZUxjgs/mJw5rVNaIPgMRyJxyWZir8Jq7w1McdefWRcw=
X-Gm-Gg: AeBDiesptk/InUhyulax4p2P3bgGR6Xu3RXsAa2Wp24S+t+mIbCfrjWHmU79D1jjpA/
 Y3kV2Qfz9ZMoeu7IIffbhxFN5bLZ50AwAvnQdBUN1JNNrMCWAM5yqp5pPSofXTk1XOnI7CpCeC7
 oo+yr74XixQhOD1xbDG5t5sIaGCQUD04R+1S3aHsLSOv9RLoxQWDRJKK8Rc62tD7RNEDJgR43tE
 kpS9Es6yPIhdot7mvmBrpNnZWzpK6boxPi3aRV0841fgMiEAOlaNh+gFRRNdwrNM1wrDww8ew7Z
 0pPOSdmM/23VmZMG2mIu/BxQrW3Rn1Sge9G4cndmiNenKfLIW54wD3IiGk+JTIYIWjd2+dNxaAv
 bf4BUVFZPAbxqmTrPjdYOsqWz92j1D2iXb59t0mYmkxd2MExnXGCGIe0V0ttqO3f/6DcAO3OWYP
 d8JHW/LtohY2mQQ2+ezVRE8X2+mQ==
X-Received: by 2002:a05:600c:3150:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-488fb7930famr469026465e9.24.1777048040630; 
 Fri, 24 Apr 2026 09:27:20 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7b2634sm189111855e9.28.2026.04.24.09.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:19 +0200
Message-ID: <20260424162719.161890-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414160708.2041081-3-bernd@kuhls.net>
References: <20260414160708.2041081-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048041; x=1777652841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBZdrOAlbn3+mjE0BCW66PEOKsEFWiG5xwzzdXO/Zi0=;
 b=MtLa/KZ9+mNZnLa0Zxc5C/ofd5HX3muInsAAfDWHCgOUWfbtN0BWX+LMubTNBMgZ/T
 KDPAvpKWYm28yX4knQOZhZhR8CkHQ0+XfVEa70rHfbnZXQnNF1GLMVwn+R0waESW8jCO
 MelMFKf2dzLA9vN9uJH3xu599NI0bBN6y8nsw4PW9xvMIeic4cqv/hpolzebQQFd7bDV
 MegCLqWtAxRprmHmUoSsEUPFuJJ4hz/ab/U18QmR+gnriZHUfFZLeRvee5+SNL6kuJOO
 X4wl9XorejJlAn+Lak3WzpbHuPtDx5RR/y+cd+rr/4wxXoBufai3vcPBlglDWmHKPZmK
 Gs6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MtLa/KZ9
Subject: Re: [Buildroot] [PATCH 3/5] package/wolftpm: security bump version
 to 3.10.0
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
> https://github.com/wolfSSL/wolfTPM/blob/v3.10.0/ChangeLog.md
> 
> Version 3.9.2 fixes CVE-2025-7844:
> https://github.com/wolfSSL/wolfTPM/pull/427
> 
> Upstream switched from GPL-2.0+ to GPL-3.0+ with version 3.9.2:
> https://github.com/wolfSSL/wolfTPM/commit/1402d0d132aef7d52569ee17d19fb6b04b57074e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/wolftpm/wolftpm.hash | 4 ++--
>  package/wolftpm/wolftpm.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
> index 33d0aa2414..1875a11666 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b4f6c090cad7fdbd4fd976f1bd8f271694669459b240fa14bec60a89b749dc1b  wolftpm-3.1.0.tar.gz
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> +sha256  b77ebfdf66dfa5e8881056c9512a6ab7d4ff8d0a920c36fc1eb311bd7f1882df  wolftpm-3.10.0.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index 4d1d459801..f1b0891277 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -WOLFTPM_VERSION = 3.1.0
> +WOLFTPM_VERSION = 3.10.0
>  WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>  WOLFTPM_INSTALL_STAGING = YES
> -WOLFTPM_LICENSE = GPL-2.0+
> +WOLFTPM_LICENSE = GPL-3.0+
>  WOLFTPM_LICENSE_FILES = LICENSE
>  WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
>  
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
