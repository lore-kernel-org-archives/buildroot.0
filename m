Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF4FFD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0967F607E7;
	Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdZydvcuikiU; Thu, 26 Feb 2026 20:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB505607AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138832;
	bh=v7gYDnS6aSdyT4hTy/HcRF1/xmmYCrZ4xT16Q4CXCpA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C67XBaZCYLJcLGmISLT1qY+nvto0I7+qRTg0unfxrl2XCf5lzY2fgelZtMFsqPw9j
	 34B5009ReZdGqQWyNQ/YmIjHdetyCNUQKJmYI/uoutznPvoPzR0g/M3GDBeCWMhC00
	 YgxXL1GuRBsXG1rlZ7otLsuHiY/uPQla8/FAEzJKaw7wZ2n+tJeI2AULqYI+7euk1s
	 2x1qOHZkshD7H7IPkCVIHjaZQJC228qiu3pqffOvUESmu1k1TPy4M79xFxm1eSO26j
	 hMPFgL6Sg7/flHC9jiZ/W+GzpkpF21XOHivOMrZhHh2pMA6d9pOo0WbcoEVGZYPSDF
	 ZmYFNBu1JMQlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB505607AD;
	Thu, 26 Feb 2026 20:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A1D1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 575E540246
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncvDPaLAosbo for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AA0A40261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA0A40261
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AA0A40261
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so905404f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138824; x=1772743624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6CNl3g1kIT1imYKRbZ3jV7hfISs4VEZIh2xqtBkEJbA=;
 b=u8g1pEO12G7jYvgHpz56902jpg/KYvaFalwqfBzPvVcGLzg4IKXSdN6J0kzazCVqkW
 4vtXU4bI/EaNhhbtyYLmpY5W0fMLhXpHgW7+/xK/4WdyoNAyk/cOvBSFqYyMXRyEC2iP
 rPAaZAM6LaV+/KTVeMAIOeMIWcWaM/Nklx06WPYuEiIAiXjufkwbloRS7du3B5UpOnwq
 FXSXh9lnIxYilRt3uGr/7CvuLjPKrRbbRZcFKLGmGFTQOrK43M3CCMFrpNK7H1Jnt+TG
 PvgkeCiQTny/O+c7noiAURxKhTbkaamICUHOENK8n30V6D3ixvR4OgIHc8xICjcf1pef
 Mn4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgs2INVdn4E+6tkq+F6hNmtmCmMMUe+vwu7bP7ZmZabXRG/80B2nfPHD2eu9ZuJ95VsUORIrRQR78=@buildroot.org
X-Gm-Message-State: AOJu0Yxpy/ZI5gVsSYdrVHLJW7hUQ2STU6VjAMYEXakpXjKiTtcBUO9N
 kkevos6AGinUcF9KbzEb7PFtmMYhy/DlzNVD4YeG1/MI/Lub1IevMsy17Z4HVcbOOUxj7HEUfm7
 SEl5z
X-Gm-Gg: ATEYQzwAvpi7hus/UFTeT+v+WqwJQMrR4Zreo+KqUp0y3Vc59+RfsIpi37N96FVzbBV
 K2mMH1M1K0JjWjxJ5ffMNRdnKUFDDtKVW6RBECRATnpw+mludrm5rWGKBwkIW4u+hZlqCO2AgZ0
 b/x/7PHfXrztBgQSbayf2i6h80Kg6usPtvFLSczNLEz6Eq8BV3X4r2kcR8X5pJ4Ck0eJG2hOG0x
 mAxuPIKjSM3YiK4h1tLi8gOn1cLipAS3RWVNQUfp/HuvWcZyoDS/U7dva5Gxht6LWiZkBPwpuyV
 nOUA4g0sIX/RGs1IwD2nPcFQqE8NKBoLOx/iliG70gPQLvhavk56RNV0vxoF49OQKcz4CRX0d3W
 f7/YTnArhysYrnDoWRPmOtlBzGnz4G9W/1Q6vfWO4FQGDMzvmTpe5cxQKehKMTbWwPKLyNurSYS
 BKS5HEKIopOgpAb3N/j5c/FCwz2g==
X-Received: by 2002:a05:6000:2388:b0:439:7e17:c5f6 with SMTP id
 ffacd0b85a97d-4399de273f8mr295323f8f.33.1772138824165; 
 Thu, 26 Feb 2026 12:47:04 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8dasm1670850f8f.9.2026.02.26.12.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:03 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:03 +0100
Message-ID: <20260226204703.253600-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215105358.2089856-3-peter@korsgaard.com>
References: <20260215105358.2089856-3-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138824; x=1772743624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CNl3g1kIT1imYKRbZ3jV7hfISs4VEZIh2xqtBkEJbA=;
 b=BFNRWy+wFByYJEWvIG7YjkNgXSfcMkEFL/h7OoVK+sPMQVXvI4ZJub6drDJnskKH9n
 ahmP30stXmZHbsn8Kt121X17k8YbytyY9eTD2BrVajgDRwDVsOgzSZR3boluYC/xGFjr
 iDF2c577K1b5GqJhS8kr2Jx49B2Fnjk+nyySA4o4VLAqKGq+5PUKt6VH10Hw4NdPHrQo
 HdrsJD/HeWqdkKkveECuCWIcaiVcOdj2SRuTJzOwbkHU1H3xyoyfI5qjiXhGRTlc32KJ
 qfZIkodecOUO5b1HSQ4zAeVbug5yrxrBqiqIct6nZxr4UUhrE4f65AjHbHxdXX1+yxPn
 frFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BFNRWy+w
Subject: Re: [Buildroot] [PATCH 3/3] openblocks_a6_defconfig: specify Linux
 license file
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
> The used Linux kernel (4.14.336) does not contain the default license files
> as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
> Linux syscall note exception"), so specify the correct license file to fix:
> 
> make legal-info
> ..
> cp: cannot stat '/path/to/output/build/linux-headers-4.14.336/LICENSES/preferred/GPL-2.0': No such file or directory
> 
> And add the sha256sum to the .hash file.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/openblocks/a6/patches/linux/linux.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/openblocks/a6/patches/linux/linux.hash b/board/openblocks/a6/patches/linux/linux.hash
> index b207306a2b..aa432012b0 100644
> --- a/board/openblocks/a6/patches/linux/linux.hash
> +++ b/board/openblocks/a6/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
> +sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
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
