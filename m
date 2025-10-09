Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B994CCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D347E410EC;
	Thu,  9 Oct 2025 14:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfNycVmrtnhv; Thu,  9 Oct 2025 14:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9CF64111A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9CF64111A;
	Thu,  9 Oct 2025 14:55:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2869821B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5837410BB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX153ZTV2bPs for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 807B8410D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807B8410D2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 807B8410D2
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-41174604d88so517125f8f.2
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021693; x=1760626493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYHQKETblVEiPzeagTnV/OVDba3crgIVAG2WuTZltPg=;
 b=AW6pd3x4VcoBMoqWuEIk5HXZ1+S5Rngvx6gBBKv96czyIVmBKRgah3poDZPgFA9BMY
 Gdvsy4E9Yu2ZlKB1+zEB8+OcC1H8yf31C2TcM5Yu4fkM2hZbYTZFBOYPpDTFz0JT6/VY
 atlaYuu7A+FBS86QhH868acA6DxLZjTc7x+ySvLXhQzRIoV5wsy2EVrMWiM+TwhSjmHL
 s7ZFieE3pgByf/IMEQC3bq3yetVtGYy0+xz8Xisfh/ywMul/N6Shk3U3iTxYcnU8+Wqe
 4cZYfyBpFoqU2JuXIfxFe2pCds0hIFgN0OM0TetDy/VLj+TRmLG5fpByXCTjvwgCm3Qq
 +R9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbStPU+lWvSEjMnAxrhJrEuI9WTqCCPAkbXWPLrMu5yJggJPzkdP0A/sUBEVTilZ1/Vr/Upf3E64c=@buildroot.org
X-Gm-Message-State: AOJu0YxCncmlhb1sS/UBalTysgwsdYMIhiaTM0HzwbzORmv1xFEGZ9fm
 uUOXPtPVeIAflgDyDIMbKsSjLU6gNnrBkQsqx6L2BEgxygQLGAJRLznUUvcyl/FVzMk=
X-Gm-Gg: ASbGncuXo7SDO5osjhK7noSbhPbY7BjQvP1XkZDAaE00F0GY4HUvMxEMqp/WI/iz84u
 p1G2kysQg4bb2baEaeM9tc1J1WGqRhUN1x5FCxMU3paakCvNPLkBHk6fpsXWTcpAMFJsWdCjAqn
 R411zJ+Adgw1rj6HNhNgqihsBSx6XPhVWJ/0u51fmcW+jtXmeZhwwp53EKYkJtY/i+CEtdYwyvO
 paSk28HlXK1implc2kKGlGdnGDeWHcLPEvzub1QBt3W9Jojyu5FTlHdCTliq0abVPvZyfFDAkVb
 LLeTNtHobI6x+UybeEe/Ll3Jc2F8rtNggaOsZSdLnxDflcHhk+f/2bgZCIY8WpDIRHLSod746HI
 dpUsa9IoaHJS0A0S3fgZMI/wUZ6Uh8TBrbVhyZ0CterVNVgoYkg4=
X-Google-Smtp-Source: AGHT+IHmuqRh7iEbrEfuBwoFSwJM9CSxG6tt++yvHMG6U9UE1dMKfe5tnvTu7x4jOejKRakpU8zI+w==
X-Received: by 2002:a05:6000:230e:b0:3ee:1294:4780 with SMTP id
 ffacd0b85a97d-4266e7e00ccmr4478246f8f.30.1760021693306; 
 Thu, 09 Oct 2025 07:54:53 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4bdcsm35190996f8f.54.2025.10.09.07.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:52 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:52 +0200
Message-ID: <20251009145452.482902-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251005113846.3940440-2-peter@korsgaard.com>
References: <20251005113846.3940440-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021693; x=1760626493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYHQKETblVEiPzeagTnV/OVDba3crgIVAG2WuTZltPg=;
 b=gMgYFGikX51p6j48I1wt+5deUYGSjR93AMEruEuo4HIf8bUH/AvutE9pzVf/E8xTb4
 3/mT+4d/nzByoMDnLmLLApiYun5oj5jkZ7B8FpDHVJB/OAg0quYlP0ILDQIXDUcZXt/+
 HzHzQLutG8g96ROEVHnUJYgdm4Up57ory2LJKWk1uiyfmZICk4D4e2eNfoeF+bQlOn1W
 nIyh1cH2eJJxu0KgMEGpSZUx1zldw02jcLE5Z0IoQLb4xkwRRGR0zRkDZbpNYepV94bw
 WnSgAYDFKCV4ZBQT/qMi6J4+757TQaRkwyEaLYuKKahZDtuN0TUWKym9rNV1kqxWr9Pi
 52HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gMgYFGik
Subject: Re: [Buildroot] [PATCH 2/2] configs/beagleboneai: move to Linux
 6.12.50
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
> And adjust the dtb path to the new subdir after commit 724ba6751532 ("ARM:
> dts: Move .dts files to vendor sub-directories") in v6.5.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  board/beagleboard/beagleboneai/patches/linux/linux.hash | 2 +-
>  configs/beagleboneai_defconfig                          | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/beagleboard/beagleboneai/patches/linux/linux.hash b/board/beagleboard/beagleboneai/patches/linux/linux.hash
> index ec1a3601b7..4ae61c9e4f 100644
> --- a/board/beagleboard/beagleboneai/patches/linux/linux.hash
> +++ b/board/beagleboard/beagleboneai/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  c52bc1ffc396c11bce335c9ee5cd55fe4213cbc1fb4026ff62bb90c864c61f62  linux-5.10.217.tar.xz
> +sha256  c435bd74d1c21fc5a950781a50d78bae2b93944144694843359948ad3afc72a5  linux-6.12.50.tar.xz
> diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
> index 5d269a1825..bf6d73a525 100644
> --- a/configs/beagleboneai_defconfig
> +++ b/configs/beagleboneai_defconfig
> @@ -1,6 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a15=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
> @@ -9,10 +9,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am5729-beagleboneai"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am5729-beagleboneai"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
