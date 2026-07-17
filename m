Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BD0C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EED281215;
	Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXvppyAfVsAz; Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF3F8121A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303265;
	bh=36FKfJ6xs3JewfsLJG78EDCe6qoT/ebBppLE8Nh6poo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RcdSVW9uSSI1e+0fsSjYqrf4UsBGthbroGwTTy2WNc670p+BcFmmRkFKctMgS/ZBP
	 G5YX4CqJinKKN5Dd7g1DXJdx5Snd5PmU6LObrkuR4hW6SB28shWULNA2OyZqUPcbqE
	 eydGyVSaWpkjkwizknWZTnlGKX9DAN10l07En9Wz9zmaXS8v1BJCY8DusN4tr+emhP
	 goza6atPRDxiUPf56/0A2A3mzFgTUSyz3aSGECoyQZ74Vsn9jBTMr/t1qNPEh0zTX0
	 yhZ1f82g4iBexJ3Aiiy4FOidho78tOmFwVnR63E4NUiPdnfatQxeCuNNlgP2HL99mX
	 eqwdTdhUrm2oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF3F8121A;
	Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ABB11F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C81840B91
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgi4jD7poy4m for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCCAC40B95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCAC40B95
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCCAC40B95
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47362928f65so7210693f8f.2
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303258; x=1784908058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=T1ChtH2xcHF4eG7efgHYXSXssukS2UMKOME8WpmtiZs=;
 b=MgFbUphkREJkTo0gbZTmUhPIK/6u8fAX0BfM8MXw7sWgecfQVR54lC32OFLKTvaOiA
 OQ9L1xnKDQlZXncyT22cCpaHL5IS2QSyfAxYGHYHjjMDKKxmH6Htlr2ExVcYc7hvqN/y
 Z+zPhUZDgtjnz0CJ9OXxtFM19f/cwlmfb2Gti1389g9gnhAx/JEkOIhxOOEffjs/gE5s
 miRoUPJGczwqTOR0bJQ9R+f5BSNnPkESAy1hbnCvDQIOfltakfoXmsAI3HnSDG2nXop+
 zgqbykk7SGG/8MSb25j+tCKTDacKuN3L31rjo2LfCqYHvKUxi9LMUWSEJ2avvI+RzLH4
 owgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFwNELL3fMDtKY49DlDKHsnsrg29lrofXUGTgGSr69hsPMuFMGMYoJrp6a3WtRFYo5w9QxdZlPIg4=@buildroot.org
X-Gm-Message-State: AOJu0Ywr57mi8xQRPrUWgLl1l6e6fXYlK7GVhbTAmKo43T2jJof31VKj
 c2v1ftTr5B00UeCsVpf1tHfcj+q2j5cbH5M6gzFcqTL43LAmVPBT8Fb6EgclTBO9CbU0Z8PbeNU
 wUfe8
X-Gm-Gg: AfdE7clOxzAqXCZbyLRWvbdyf1kuOfYegOoB/ZjR81EghGkrMbIJlTpu7YUsSiHuKGX
 v7GY9nYBLWBkjuWtDCbCCMJkT4C8tSzJcWGxtw+FpdHyulWoqMzlWhCy/LvkpudlwsF20PtJaqd
 0K3mmrxjASZDTO8PYVT6pp3DVk7tepAns4F6RIYRZ/bfbp0FTXfb/wAzwpY19gG8strtx5ZATeM
 86feR/NRHoZV+Fda9bj7jwZv7w9/aLYvcM0MLj2D7qZQiwH1zBuQgRXypXnJe0490r2LFqKZlEg
 XapDKmwSWu+wwvYFrfXQJ031Kk/1tngKLBXZheWRQkWRrqNfKeoS3zCFQq2dEE5BRv7Uai9uMGi
 UFZ9PFnopUEWxdC3rn/sOF4aJUtObcwxtjA2vhkr/o3dmVawPpeq8bibAYwQlCjG3tHVang0RQ5
 3FlZU7OA==
X-Received: by 2002:a05:6000:4201:b0:472:ec66:274a with SMTP id
 ffacd0b85a97d-47f6230649cmr4370359f8f.7.1784303257660; 
 Fri, 17 Jul 2026 08:47:37 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eeece9sm5011303f8f.37.2026.07.17.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:37 -0700 (PDT)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:36 +0200
Message-ID: <20260717154736.192204-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
References: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303258; x=1784908058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T1ChtH2xcHF4eG7efgHYXSXssukS2UMKOME8WpmtiZs=;
 b=SvBy4dYnhW2CFmIcb27y/61pBc+7qb+jBulp0brYyRtvkagYNHs1eVcrbVSV6TssOO
 50mBDIQqUqCC+8cPycL2+SopM66ccx6KWuksYUEkSOIcUYtlHNskOf2iXGSiJ2TXHlks
 PbD7PFEpmkfxpVrHeG2NAhQaR5OF7qyEEvom070QmQNiV2+5s2ZZMOLReoOv4Ua74Mv2
 ZqKxB5Ng6CTKSiL1q2hhBCDjTfQIw5M21a9WOB1WVmhICauaLBTmUz/Rsh4AEbBBNxe3
 ArV8GU9VQTD3kJHystTBBbynzp1wnqBlwCEcyNxmiZLSbSNsdbr517vJHTM0PuBZyNEW
 neyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SvBy4dYn
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: update source URL
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
> libcamera has moved for a while now to gitlab.freedesktop.org. The
> mirror on git.linuxtv.org is still active, but it isn't the canonical
> repository and has less bandwidth than freedesktop.org. Switch the
> libcamera source URL to gitlab.freedesktop.org.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/libcamera/libcamera.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 945207888bab..ba7510daf8e1 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> +LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git/
>  LIBCAMERA_VERSION = v0.7.1
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
> 
> base-commit: 6854ee9aa3826d5036a7d3cc19056d43c0452320
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
