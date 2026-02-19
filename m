Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A9E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD3FD61133;
	Thu, 19 Feb 2026 17:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mk97XD4fT1g9; Thu, 19 Feb 2026 17:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1145E61107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521907;
	bh=AEXXe8M/Xr7lgO2elhBq3aLdeMF1GLYMjzhxX3uxTV4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S2Tud86YwMmnE7mVsbqh3iaYTEBgMXYwoxwUe0bbb+X2Ue5sY/i2UQ5GkHeQoDXjm
	 rvHDF4+9vd+AOyCqLRN+0JaV6h+b8Ihg7hmQZ6dFewOrO1Ki5hifCDYhgjzTMhBZFc
	 1vPcEEdmnhM31UGWhT7r5lQmt3CAW4Tt/L/ooM8pp2Wxd/452T3/JBLBSqsF57AIH/
	 gO5CT5jP/gMimZJufCGC7GgyRDGx/QnJq2DcUmNc+4w1Zo+oNMSZtYznvq06NX0e29
	 WDGSm/OpP/l5euqUYWlhPABGOwiB4OF3dRQ2ncX7593nsYyBMScfJabGKUBrqL74+8
	 2Oy7Z+wYjQAIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1145E61107;
	Thu, 19 Feb 2026 17:25:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE49206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1E52814BB
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kf5bKxkPS4Q6 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECDC98131F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECDC98131F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECDC98131F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so7874405e9.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521901; x=1772126701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/UhF+pslPTCRVXYlbzZO3WnVY5MY39+anaMaqU8kFnA=;
 b=ehEykJ3tjMlPEC9olFUK1/iH2mbbBbxRAyL//o8TXpwGqAOe4wh9lm7HICYcgjBRPP
 RbTGm9+pr64r5nzh0E4xYpHsIe+mtRr41M013ySrwt9d0qxri2lqp5zeFWtYXXTCDTIB
 CF8jaPg2xnw4Y8a2PC3dxLmJ4SXOUQEU5GCHXf1mfJE+VjRyGPQjJDgPf9NrqW9Jt1uR
 IB7bqPk9o2Yl6rSW8VBDGQ3y/lZyu3Sr7RfHUoojEQu1cCv8ck2WqsoerXDzNEhOFu8P
 ZRWfiJnW1BQKU1caHWIeRiH7oC1tcWBsfILUUAJr4y2ABuBkf27HbFKBsCwWI7j8mWAy
 hOKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPXRrSGhj4P2vF04ztgvgpSb8HsTw4OfrSNEvIzqsfVhWRd72lJkPsdRQ9gN6ZffGiH9osrNu5e64=@buildroot.org
X-Gm-Message-State: AOJu0Ywm/SWIJayqByMy7VSu5puzPMlpbx/lyIdgwfNMOJrFTWDREu8O
 SnsaF41t0VRPzzeSETwZXJ54mnu6ZHTTfkE9qp9vuiF+zc5Id6jKhmNODbN/rwvJm8U=
X-Gm-Gg: AZuq6aJJzRuSQLQKpIqLxuJkzt8nmB2otTfIJT05YiPpzkVTrjetfTp0M7YTvL2Fj+3
 phxIEoD2Ur6g7pSPVVEA3f6kS9dDxX+YdcxIJK3d1yXBAngfg+pCg5DVVe8KZqGIoSUVjHYws/l
 vSUBXQ80QniWKMe+wKyvgE3aymGtd5a0VWoROI5N5ilYuBLKHdRnED7RFQVgp05vraqF6vD7Pbi
 /wJmfjF7UkMRdfbV6DDr27U7gVM72zEyxnCkjNRWyyWe1i1oyr3wrqAuoTj06zmzp9kSGMCwd5r
 ljrHSHEuJF6ZM4NgkURcSyr05DALeLCVGyyprKAt1AizdX/Q/TGpj1bdme+9b5dsD/44Ao/7qAq
 IoU1imJyWU/eOsl6/sUEpj9jnPDs/lQh4R1bnoK6W5LAnZOFnzqADVfUt9ryjpqjiSpro2pX7hi
 u5aI9TYRjId1Z+KEg=
X-Received: by 2002:a05:600c:c4a5:b0:47e:e71a:e13a with SMTP id
 5b1f17b1804b1-48379bedc20mr258019685e9.32.1771521901416; 
 Thu, 19 Feb 2026 09:25:01 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm51017477f8f.13.2026.02.19.09.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:00 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:00 +0100
Message-ID: <20260219172500.339758-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251115103347.3462638-1-bernd@kuhls.net>
References: <20251115103347.3462638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521901; x=1772126701; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UhF+pslPTCRVXYlbzZO3WnVY5MY39+anaMaqU8kFnA=;
 b=JxyjiKiXgYiHw+RnvoErRKeGErt04xwYwUkeGswSbeFIpBbpVl63a8R6nakjo3N8sI
 QsJ9yoaV4VFniF0DwqGHrKFSlT831GkYIDtTzrXYDTtxIq5M9clWLZVP8nm0edhwFuoA
 cMumIu6rwV5eadYS8cf9DeY2E3KtZPpNmVrFT/5EArkCErk1/vCGneuNZjbFR4XOBWVG
 77kJcDcZw59Yi93ZMMQRqsjuzSU0MHLlsfwmmIyRRnOEnPPw9Bahg8jCZDGOnT+guutL
 Qnrhj52YHuSjYA4wSSpXKlcEuPFsYGzD16tXd6+U/bUyqgrTpT/cSbwy8WRu84pkqkkP
 jO1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JxyjiKiX
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version
 to 20251111
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
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20251111
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index 735b352d1f..4c6676dfb0 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  a8358422c68cc4d15c26db1ef682fbce332c3f46c4e087a79c132c437ec5f407  intel-microcode-20250812.tar.gz
> +sha256  5a9a0d17240f486461bc101ef74f2b8c10675cdd02d0ba0bd6168b061c62e970  intel-microcode-20251111.tar.gz
>  sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 2850dd01e4..e8bbf15a81 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20250812
> +INTEL_MICROCODE_VERSION = 20251111
>  INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
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
